use crate::auth::authenticate_request;
use crate::models::*;
use axum::{
    extract::{Json, Path, Query, State},
    http::{HeaderMap, StatusCode},
    response::IntoResponse,
};
use axum_extra::extract::CookieJar;
use chrono::Utc;
use serde_json::json;

pub async fn get_collections(
    State(state): State<AppState>,
    Query(params): Query<PaginationParams>,
) -> impl IntoResponse {
    let page_number = params.page_number.unwrap_or(1).max(1);
    let per_page = params.per_page.unwrap_or(10).clamp(1, 100);
    let offset = (page_number - 1) * per_page;

    let total_collections_row = state
        .db_client
        .query_one("SELECT COUNT(*) FROM collections WHERE is_deleted = FALSE", &[])
        .await;

    let total_collections: i64 = match total_collections_row {
        Ok(row) => row.get(0),
        Err(err) => {
            eprintln!("Database error: {}", err);
            return (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json("Internal Server Error"),
            )
                .into_response();
        }
    };

    let total_pages = (total_collections + per_page as i64 - 1) / per_page as i64;

    let collections_rows = state
        .db_client
        .query(
            "SELECT collection_id FROM collections WHERE is_deleted = FALSE LIMIT $1 OFFSET $2",
            &[&per_page, &offset],
        )
        .await;

    let collections = match collections_rows {
        Ok(rows) => rows.into_iter().map(|row| row.get("collection_id")).collect(),
        Err(err) => {
            eprintln!("Database error: {}", err);
            return (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json("Internal Server Error"),
            )
                .into_response();
        }
    };

    let mut headers = HeaderMap::new();
    headers.insert(
        "pagination-current-page",
        page_number.to_string().parse().unwrap(),
    );
    headers.insert(
        "pagination-total-elements",
        total_collections.to_string().parse().unwrap(),
    );
    headers.insert("pagination-per-page", per_page.to_string().parse().unwrap());
    headers.insert(
        "pagination-total-pages",
        total_pages.to_string().parse().unwrap(),
    );

    let response_body = CollectionIdsResponse { collections };

    (headers, Json(response_body)).into_response()
}

pub async fn get_collection(
    State(state): State<AppState>,
    Path(collection_id): Path<i32>,
) -> impl IntoResponse {
    let collection_row = state
        .db_client
        .query_opt(
            "SELECT c.collection_id, c.user_id, c.name, c.url, c.description, c.tags, 
                    c.rating, c.created_at, u.name AS user_name, u.avatar_url AS image_url
             FROM collections c
             JOIN users u ON c.user_id = u.user_id
             WHERE c.collection_id = $1 AND c.is_deleted = FALSE",
            &[&collection_id],
        )
        .await;

    let collection_data = match collection_row {
        Ok(Some(row)) => row,
        Ok(None) => {
            return (
                StatusCode::NOT_FOUND,
                Json("Collection not found"),
            )
            .into_response();
        }
        Err(err) => {
            eprintln!("Database error: {}", err);
            return (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json("Internal Server Error"),
            )
            .into_response();
        }
    };

    let user = User {
        user_id: collection_data.get("user_id"),
        name: collection_data.get("user_name"),
        image_url: collection_data.get::<_, Option<String>>("image_url"),
    };

    let tags: Option<Vec<TagType>> = collection_data.get("tags");

    let routes_rows = state
        .db_client
        .query(
            "SELECT route_id FROM collection_routes WHERE collection_id = $1",
            &[&collection_id],
        )
        .await;

    let routes_ids: Vec<i32> = match routes_rows {
        Ok(rows) => rows.into_iter().map(|row| row.get("route_id")).collect(),
        Err(err) => {
            eprintln!("Database error: {}", err);
            return (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json("Internal Server Error"),
            )
            .into_response();
        }
    };

    let imgs: Vec<String> = if routes_ids.is_empty() {
        Vec::new()
    } else {
        match state.db_client
            .query("SELECT images FROM routes WHERE route_id = ANY($1)", &[&routes_ids])
            .await
        {
            Ok(rows) => {
                let mut images_all = Vec::new();
                for row in rows {
                    let maybe_images: Option<Vec<String>> = row.get("images");
                    if let Some(imgs) = maybe_images {
                        images_all.extend(imgs);
                    }
                }
                images_all
            }
            Err(err) => {
                eprintln!("Database error retrieving images: {}", err);
                Vec::new()
            }
        }
    };

    let collection = Collection {
        collection_id: collection_data.get("collection_id"),
        user_id: collection_data.get("user_id"),
        name: collection_data.get("name"),
        url: collection_data.get("url"),
        description: collection_data.get("description"),
        tags,
        rating: collection_data.get("rating"),
        created_at: collection_data.get("created_at"),
        routes: CollectionRoutes {
            amount: routes_ids.len() as i32,
            ids: routes_ids,
        },
        imgs,
    };

    let response = CollectionResponse { user, collection };

    Json(response).into_response()
}

pub async fn create_collection(
    State(state): State<AppState>,
    cookies: CookieJar,
    Json(payload): Json<CreateCollectionRequest>,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };
    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let created_at = Utc::now().timestamp();
    let url = format!("collection/{}", payload.name.replace(" ", "_"));

    let result = state.db_client.execute(
        "INSERT INTO collections (user_id, name, url, description, tags, created_at, is_deleted)
         VALUES ($1, $2, $3, $4, $5, $6, FALSE)",
        &[&user_id, &payload.name, &url, &payload.description, &payload.tags, &created_at],
    ).await;

    match result {
        Ok(_) => StatusCode::CREATED.into_response(),
        Err(err) => {
            eprintln!("Database error: {}", err);
            (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response()
        }
    }
}

pub async fn update_collection(
    State(state): State<AppState>,
    cookies: CookieJar,
    Query(query): Query<CollectionIdQuery>,
    Json(payload): Json<UpdateCollectionRequest>,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };
    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    if payload.name.as_ref().map(|s| s.trim().is_empty()).unwrap_or(true)
       && payload.description.as_ref().map(|s| s.trim().is_empty()).unwrap_or(true)
       && payload.tags.as_ref().map(|tags| tags.is_empty()).unwrap_or(true) {
        return (StatusCode::BAD_REQUEST, Json("Request body is empty")).into_response();
    }

    let collection_id = query.collection_id;

    let collection_existence = state.db_client.query_one(
        "SELECT COUNT(*) FROM collections WHERE collection_id = $1",
        &[&collection_id],
    ).await;
    let collection_count: i64 = match collection_existence {
        Ok(row) => row.get(0),
        Err(_) => return (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response(),
    };

    if collection_count == 0 {
        return (StatusCode::NOT_FOUND, Json("Not found")).into_response();
    }

    let mut query_str = String::from("UPDATE collections SET ");
    let mut params: Vec<&(dyn tokio_postgres::types::ToSql + Sync)> = Vec::new();
    let mut idx = 1;

    if let Some(ref name) = payload.name {
        query_str.push_str(&format!("name = ${}, ", idx));
        params.push(name);
        idx += 1;
    }
    if let Some(ref description) = payload.description {
        query_str.push_str(&format!("description = ${}, ", idx));
        params.push(description);
        idx += 1;
    }
    if let Some(ref tags) = payload.tags {
        query_str.push_str(&format!("tags = ${}, ", idx));
        params.push(tags);
        idx += 1;
    }

    if params.is_empty() {
        return (StatusCode::BAD_REQUEST, Json("No fields to update")).into_response();
    }

    query_str.truncate(query_str.len() - 2);
    query_str.push_str(&format!(" WHERE collection_id = ${} AND user_id = ${}", idx, idx + 1));
    params.push(&collection_id);
    params.push(&user_id);

    let result = state.db_client.execute(&query_str, &params).await;
    match result {
        Ok(_) => StatusCode::OK.into_response(),
        Err(err) => {
            eprintln!("Database error: {}", err);
            (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response()
        }
    }
}

pub async fn delete_collection(
    State(state): State<AppState>,
    cookies: CookieJar,
    Query(query): Query<CollectionIdQuery>,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };
    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let collection_id = query.collection_id;

    let collection_existence = state.db_client.query_one(
        "SELECT COUNT(*) FROM collections WHERE collection_id = $1",
        &[&collection_id],
    ).await;
    let collection_count: i64 = match collection_existence {
        Ok(row) => row.get(0),
        Err(_) => return (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response(),
    };

    if collection_count == 0 {
        return (StatusCode::NOT_FOUND, Json("Not found")).into_response();
    }

    let result = state.db_client.execute(
        "UPDATE collections SET is_deleted = TRUE WHERE collection_id = $1 AND user_id = $2",
        &[&collection_id, &user_id],
    ).await;

    match result {
        Ok(_) => StatusCode::OK.into_response(),
        Err(err) => {
            eprintln!("Database error: {}", err);
            (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response()
        }
    }
}

pub async fn add_route_to_collection(
    State(state): State<AppState>,
    Path((collection_id, route_id)): Path<(i32, i32)>,
    cookies: CookieJar,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };
    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let route_existence = state.db_client.query_one(
        "SELECT COUNT(*) FROM routes WHERE route_id = $1",
        &[&route_id],
    ).await;
    let route_count: i64 = match route_existence {
        Ok(row) => row.get(0),
        Err(_) => return (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response(),
    };

    if route_count == 0 {
        return (StatusCode::NOT_FOUND, Json("Not found")).into_response();
    }

    let ownership_check = state.db_client.query_opt(
        "SELECT 1 FROM collections WHERE collection_id = $1 AND user_id = $2 AND is_deleted = FALSE",
        &[&collection_id, &user_id],
    ).await;

    match ownership_check {
        Ok(Some(_)) => (),
        Ok(None) => {
            return (StatusCode::FORBIDDEN, Json("Вы не владеете этой подборкой или она не существует")).into_response();
        },
        Err(err) => {
            eprintln!("Database error: {}", err);
            return (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response();
        }
    }

    let result = state.db_client.execute(
        "INSERT INTO collection_routes (collection_id, route_id) VALUES ($1, $2) ON CONFLICT DO NOTHING",
        &[&collection_id, &route_id],
    ).await;

    match result {
        Ok(_) => (StatusCode::OK, Json("Маршрут успешно добавлен в подборку")).into_response(),
        Err(err) => {
            eprintln!("Database error: {}", err);
            (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response()
        }
    }
}

pub async fn remove_route_from_collection(
    State(state): State<AppState>,
    Path((collection_id, route_id)): Path<(i32, i32)>,
    cookies: CookieJar,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };
    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let route_existence = state.db_client.query_one(
        "SELECT COUNT(*) FROM routes WHERE route_id = $1",
        &[&route_id],
    ).await;
    let route_count: i64 = match route_existence {
        Ok(row) => row.get(0),
        Err(_) => return (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response(),
    };

    if route_count == 0 {
        return (StatusCode::NOT_FOUND, Json("Not found")).into_response();
    }

    let ownership_check = state.db_client.query_opt(
        "SELECT 1 FROM collections WHERE collection_id = $1 AND user_id = $2 AND is_deleted = FALSE",
        &[&collection_id, &user_id],
    ).await;

    match ownership_check {
        Ok(Some(_)) => (),
        Ok(None) => {
            return (StatusCode::FORBIDDEN, Json("Вы не владеете этой подборкой или она не существует")).into_response();
        },
        Err(err) => {
            eprintln!("Database error: {}", err);
            return (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response();
        }
    }

    let result = state.db_client.execute(
        "DELETE FROM collection_routes WHERE collection_id = $1 AND route_id = $2",
        &[&collection_id, &route_id],
    ).await;

    match result {
        Ok(_) => (StatusCode::OK, Json("Маршрут успешно удален из подборки")).into_response(),
        Err(err) => {
            eprintln!("Database error: {}", err);
            (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response()
        }
    }
}

pub async fn add_route_to_saved(
    State(state): State<AppState>,
    Path(route_id): Path<i32>,
    cookies: CookieJar,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };
    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let route_existence = state.db_client.query_one(
        "SELECT COUNT(*) FROM routes WHERE route_id = $1 AND is_deleted = FALSE",
        &[&route_id],
    ).await;
    let route_count: i64 = match route_existence {
        Ok(row) => row.get(0),
        Err(_) => return (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response(),
    };

    if route_count == 0 {
        return (StatusCode::NOT_FOUND, Json("Route not found")).into_response();
    }

    let result = state.db_client.execute(
        "INSERT INTO saved_routes (user_id, route_id) VALUES ($1, $2) ON CONFLICT DO NOTHING",
        &[&user_id, &route_id],
    ).await;

    match result {
        Ok(_) => (StatusCode::OK, Json("Маршрут успешно сохранен")).into_response(),
        Err(err) => {
            eprintln!("Database error: {}", err);
            (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response()
        }
    }
}

pub async fn remove_route_from_saved(
    State(state): State<AppState>,
    Path(route_id): Path<i32>,
    cookies: CookieJar,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };
    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let route_existence = state.db_client.query_one(
        "SELECT COUNT(*) FROM routes WHERE route_id = $1 AND is_deleted = FALSE",
        &[&route_id],
    ).await;
    let route_count: i64 = match route_existence {
        Ok(row) => row.get(0),
        Err(_) => return (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response(),
    };

    if route_count == 0 {
        return (StatusCode::NOT_FOUND, Json("Route not found")).into_response();
    }

    let result = state.db_client.execute(
        "DELETE FROM saved_routes WHERE user_id = $1 AND route_id = $2",
        &[&user_id, &route_id],
    ).await;

    match result {
        Ok(_) => (StatusCode::OK, Json("Маршрут успешно удален из сохраненных")).into_response(),
        Err(err) => {
            eprintln!("Database error: {}", err);
            (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response()
        }
    }
}

pub async fn get_saved_routes(
    State(state): State<AppState>,
    cookies: CookieJar,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };
    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let saved_routes_rows = state
        .db_client
        .query(
            "SELECT route_id FROM saved_routes WHERE user_id = $1 ORDER BY route_id",
            &[&user_id],
        )
        .await;

    match saved_routes_rows {
        Ok(rows) => {
            let routes_ids: Vec<i32> = rows.into_iter().map(|row| row.get("route_id")).collect();
            Json(SavedRoutesResponse { routes: routes_ids }).into_response()
        },
        Err(err) => {
            eprintln!("Database error: {}", err);
            (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json("Internal Server Error"),
            )
                .into_response()
        }
    }
}

pub async fn add_route_to_completed(
    State(state): State<AppState>,
    Path(route_id): Path<i32>,
    cookies: CookieJar,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };
    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let route_existence = state.db_client.query_one(
        "SELECT COUNT(*) FROM routes WHERE route_id = $1 AND is_deleted = FALSE",
        &[&route_id],
    ).await;
    let route_count: i64 = match route_existence {
        Ok(row) => row.get(0),
        Err(_) => return (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response(),
    };

    if route_count == 0 {
        return (StatusCode::NOT_FOUND, Json("Route not found")).into_response();
    }

    let now = Utc::now().timestamp();

    let result = state.db_client.execute(
        "INSERT INTO completed_routes (user_id, route_id, completed_at) VALUES ($1, $2, $3) ON CONFLICT DO NOTHING",
        &[&user_id, &route_id, &now],
    ).await;

    match result {
        Ok(_) => (StatusCode::OK, Json("Маршрут добавлен как пройденный")).into_response(),
        Err(err) => {
            eprintln!("Database error: {}", err);
            (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response()
        }
    }
}

pub async fn remove_route_from_completed(
    State(state): State<AppState>,
    Path(route_id): Path<i32>,
    cookies: CookieJar,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };
    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let route_existence = state.db_client.query_one(
        "SELECT COUNT(*) FROM routes WHERE route_id = $1 AND is_deleted = FALSE",
        &[&route_id],
    ).await;
    let route_count: i64 = match route_existence {
        Ok(row) => row.get(0),
        Err(_) => return (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response(),
    };

    if route_count == 0 {
        return (StatusCode::NOT_FOUND, Json("Route not found")).into_response();
    }

    let result = state.db_client.execute(
        "DELETE FROM completed_routes WHERE user_id = $1 AND route_id = $2",
        &[&user_id, &route_id],
    ).await;

    match result {
        Ok(_) => (StatusCode::OK, Json("Маршрут успешно удален из пройденных")).into_response(),
        Err(err) => {
            eprintln!("Database error: {}", err);
            (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response()
        }
    }
}

pub async fn get_completed_routes(
    State(state): State<AppState>,
    cookies: CookieJar,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };
    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let completed_routes_rows = state
        .db_client
        .query(
            "SELECT route_id FROM completed_routes WHERE user_id = $1 ORDER BY route_id",
            &[&user_id],
        )
        .await;

    match completed_routes_rows {
        Ok(rows) => {
            let routes_ids: Vec<i32> = rows.into_iter().map(|row| row.get("route_id")).collect();
            Json(CompletedRoutesResponse { routes: routes_ids }).into_response()
        },
        Err(err) => {
            eprintln!("Database error: {}", err);
            (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json("Internal Server Error"),
            )
                .into_response()
        }
    }
}


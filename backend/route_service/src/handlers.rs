use crate::models::*;
use crate::auth::authenticate_request;
use crate::image::upload_image;
use axum::{
    extract::{Path, Query, State},
    http::{HeaderMap, StatusCode},
    response::IntoResponse,
    Json,
};
use axum_extra::extract::CookieJar;
use serde_json::json;
use serde::Deserialize;
use chrono::Utc;
use tokio_postgres::Client;
use std::error::Error;

#[derive(Deserialize)]
pub struct PaginationParams {
    #[serde(rename = "pagination-page-number")]
    page_number: Option<i64>,
    #[serde(rename = "pagination-per-page")]
    per_page: Option<i64>,
}

pub async fn get_routes(
    State(state): State<AppState>,
    Query(params): Query<PaginationParams>,
) -> impl IntoResponse {
    let requested_page = params.page_number.unwrap_or(1);
    let per_page = match params.per_page.unwrap_or(10) {
        n if n < 1 => 1,
        n if n > 100 => 100,
        n => n,
    };

    let total_elements_row = match state.db_client.query_one(
        "SELECT COUNT(*) FROM routes WHERE is_deleted = FALSE",
        &[],
    ).await {
        Ok(row) => row,
        Err(e) => {
            eprintln!("Error counting routes: {}", e);
            return StatusCode::INTERNAL_SERVER_ERROR.into_response();
        }
    };
    let total_elements: i64 = total_elements_row.get(0);
    let total_pages = if total_elements == 0 {
        0
    } else {
        ((total_elements as f64) / (per_page as f64)).ceil() as i64
    };
    let page_number = if total_pages > 0 && requested_page > total_pages {
        total_pages
    } else if requested_page < 1 {
        1
    } else {
        requested_page
    };
    let offset = (page_number - 1) * per_page;

    let rows = match state.db_client.query(
        "SELECT route_id FROM routes WHERE is_deleted = FALSE LIMIT $1 OFFSET $2",
        &[&per_page, &offset],
    ).await {
        Ok(rows) => rows,
        Err(e) => {
            eprintln!("Error fetching routes: {}", e);
            return StatusCode::INTERNAL_SERVER_ERROR.into_response();
        }
    };

    let routes = rows.into_iter().map(|row| row.get(0)).collect::<Vec<i32>>();
    let mut headers = HeaderMap::new();
    headers.insert("pagination-current-page", page_number.to_string().parse().unwrap());
    headers.insert("pagination-total-elements", total_elements.to_string().parse().unwrap());
    headers.insert("pagination-per-page", per_page.to_string().parse().unwrap());
    headers.insert("pagination-total-pages", total_pages.to_string().parse().unwrap());

    let response_body = RoutesResponse { routes };
    (headers, Json(response_body)).into_response()
}

pub async fn get_route_by_id(
    State(state): State<AppState>,
    Path(route_id): Path<String>,
) -> impl IntoResponse {
    if route_id.is_empty() {
        let error_body = json!({ "error": "Route ID cannot be empty" });
        return (StatusCode::NOT_FOUND, Json(error_body)).into_response();
    }
    let route_id: i32 = match route_id.parse() {
        Ok(id) => id,
        Err(_) => {
            let error_body = json!({ "error": "Invalid route ID format" });
            return (StatusCode::BAD_REQUEST, Json(error_body)).into_response();
        }
    };

    let result = get_route_details(&state.db_client, route_id).await;
    match result {
        Ok(route_details) => Json(route_details).into_response(),
        Err(MyError::NotFound) => {
            let error_body = json!({ "error": "Route not found" });
            (StatusCode::NOT_FOUND, Json(error_body)).into_response()
        }
        Err(MyError::DbError(e)) => {
            eprintln!("Error fetching route details: {}", e);
            let error_body = json!({ "error": "Internal server error" });
            (StatusCode::INTERNAL_SERVER_ERROR, Json(error_body)).into_response()
        }
    }
}

#[derive(Debug)]
enum MyError {
    NotFound,
    DbError(tokio_postgres::Error),
}

async fn get_route_details(
    db_client: &Client,
    route_id: i32,
) -> Result<RouteDetails, MyError> {
    let route_row_opt = db_client
        .query_opt(
            "SELECT route_id, user_id, name, url, description, length, duration, tags::TEXT[], category::TEXT, created_at, status::TEXT, is_deleted, rating, images 
             FROM routes 
             WHERE route_id = $1 
             LIMIT 1",
            &[&route_id],
        )
        .await
        .map_err(MyError::DbError)?;
    let route_row = match route_row_opt {
        Some(row) => row,
        None => return Err(MyError::NotFound),
    };

    let route = RouteInfo {
        route_id: route_row.get("route_id"),
        name: route_row.get("name"),
        url: route_row.get("url"),
        description: route_row.get("description"),
        length: route_row.get("length"),
        duration: route_row.get("duration"),
        tags: route_row.get("tags"),
        category: route_row.get("category"),
        created_at: route_row.get("created_at"),
        status: route_row.get("status"),
        is_deleted: route_row.get("is_deleted"),
        rating: route_row.get("rating"),
        images: route_row.get("images"),
    };
    let user_id: i32 = route_row.get("user_id");

    let user_row_opt = db_client
        .query_opt(
            "SELECT user_id, name, avatar_url FROM users WHERE user_id = $1 LIMIT 1",
            &[&user_id],
        )
        .await
        .map_err(MyError::DbError)?;
    let user_row = match user_row_opt {
        Some(row) => row,
        None => return Err(MyError::NotFound),
    };
    let user = UserDetails {
        user_id: user_row.get("user_id"),
        name: user_row.get("name"),
        image_url: user_row.get("avatar_url"),
    };

    let point_rows = db_client
        .query(
            "SELECT rp.point_id, ST_Y(rp.coordinate::geometry) as latitude, ST_X(rp.coordinate::geometry) as longitude, rp.time_offset, rp.elevation, rp.speed, rpi.point_description, rpi.images
             FROM route_points rp
             LEFT JOIN route_points_info rpi ON rp.point_id = rpi.point_id
             WHERE rp.route_id = $1",
            &[&route_id],
        )
        .await
        .map_err(MyError::DbError)?;
    let points = point_rows
        .into_iter()
        .map(|row| PointInfo {
            point_id: row.get("point_id"),
            coordinate: {
                let latitude: f64 = row.get("latitude");
                let longitude: f64 = row.get("longitude");
                Coordinate { latitude, longitude }
            },
            time_offset: row.get("time_offset"),
            elevation: row.get("elevation"),
            speed: row.get("speed"),
            point_description: row.get("point_description"),
            images: row.get("images"),
        })
        .collect();

    Ok(RouteDetails { user, route, points })
}

pub async fn create_route(
    cookies: CookieJar,
    State(state): State<AppState>,
    Json(payload): Json<CreateRouteRequest>,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };
    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let route_images = if let Some(image_list) = &payload.images {
        let mut uploaded = Vec::new();
        for image in image_list {
            match upload_image(image).await {
                Ok(url) => uploaded.push(url),
                Err(e) => {
                    eprintln!("Ошибка загрузки изображения маршрута: {}", e);
                    return (
                        StatusCode::INTERNAL_SERVER_ERROR,
                        Json(json!({"error": "Failed to upload route image"})),
                    )
                    .into_response();
                }
            }
        }
        Some(uploaded)
    } else {
        None
    };

    let url = payload
        .name
        .to_lowercase()
        .chars()
        .filter(|c| c.is_alphanumeric() || c.is_whitespace())
        .collect::<String>()
        .replace(" ", "-");

    let route_row = match state.db_client
        .query_one(
            "INSERT INTO routes (user_id, name, url, description, length, duration, tags, category, created_at, images) 
             VALUES ($1, $2, $3, $4, $5, $6, $7::tag_type[], $8::category_type, $9, $10) 
             RETURNING route_id",
            &[
                &user_id,
                &payload.name,
                &url,
                &payload.description,
                &payload.length,
                &payload.duration,
                &payload.tags,
                &payload.category,
                &Utc::now().timestamp_millis(),
                &route_images,
            ],
        )
        .await {
            Ok(row) => row,
            Err(e) => {
                eprintln!("Ошибка вставки маршрута: {}", e);
                return (
                    StatusCode::INTERNAL_SERVER_ERROR,
                    Json(json!({"error": "Failed to create route"})),
                )
                .into_response();
            }
        };

    let route_id: i32 = route_row.get("route_id");

    for point in payload.points {
        let point_images = if let Some(image_list) = &point.images {
            let mut uploaded = Vec::new();
            for image in image_list {
                match upload_image(image).await {
                    Ok(url) => uploaded.push(url),
                    Err(e) => {
                        eprintln!("Ошибка загрузки изображения точки: {}", e);
                        return (
                            StatusCode::INTERNAL_SERVER_ERROR,
                            Json(json!({"error": "Failed to upload point image"})),
                        )
                        .into_response();
                    }
                }
            }
            Some(uploaded)
        } else {
            None
        };

        if let Err(e) = state.db_client.query_one(
            "INSERT INTO route_points (route_id, coordinate, time_offset, elevation, speed, images) 
             VALUES ($1, ST_SetSRID(ST_MakePoint($3, $2), 4326), $4, $5, $6, $7)
             RETURNING point_id",
            &[
                &route_id,
                &point.latitude,
                &point.longitude,
                &point.time_offset,
                &point.elevation,
                &point.speed,
                &point_images,
            ],
        ).await {
            eprintln!("Ошибка вставки точки маршрута: {}", e);
            return (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(json!({"error": "Failed to create route point"})),
            )
            .into_response();
        }
    }

    match state.db_client.execute(
        "UPDATE routes SET is_deleted = FALSE WHERE route_id = $1", &[&route_id],
    ).await {
        Ok(_) => StatusCode::CREATED.into_response(),
        Err(e) => {
            eprintln!("Ошибка коммита транзакции: {}", e);
            (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(json!({"error": "Failed to commit route creation"})),
            )
            .into_response()
        }
    }
}

pub async fn update_route(
    cookies: CookieJar,
    State(state): State<AppState>,
    Path(route_id): Path<i32>,
    Json(payload): Json<UpdateRouteRequest>,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };
    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let route_exists = match state.db_client.query_one(
        "SELECT user_id FROM routes WHERE route_id = $1 AND NOT is_deleted",
        &[&route_id],
    ).await {
        Ok(row) => {
            let route_user_id: i32 = row.get("user_id");
            if route_user_id != user_id {
                return (
                    StatusCode::FORBIDDEN,
                    Json(json!({"error": "Not authorized to update this route"})),
                )
                .into_response();
            }
            true
        },
        Err(_) => false,
    };

    if !route_exists {
        return (
            StatusCode::NOT_FOUND,
            Json(json!({"error": "Route not found"})),
        )
        .into_response();
    }

    let mut update_fields = Vec::new();
    let mut params: Vec<&(dyn tokio_postgres::types::ToSql + Sync)> = vec![&route_id];

    if let Some(name) = &payload.name {
        update_fields.push(format!("name = ${}", params.len() + 1));
        params.push(name);
    }
    if let Some(description) = &payload.description {
        update_fields.push(format!("description = ${}", params.len() + 1));
        params.push(description);
    }
    if let Some(length) = &payload.length {
        update_fields.push(format!("length = ${}", params.len() + 1));
        params.push(length);
    }
    if let Some(duration) = &payload.duration {
        update_fields.push(format!("duration = ${}", params.len() + 1));
        params.push(duration);
    }
    if let Some(tags) = &payload.tags {
        update_fields.push(format!("tags = ${}::tag_type[]", params.len() + 1));
        params.push(tags);
    }
    if let Some(category) = &payload.category {
        update_fields.push(format!("category = ${}::category_type", params.len() + 1));
        params.push(category);
    }

    let mut images_param: Option<Vec<String>> = None;
    if let Some(images) = &payload.images {
        let mut uploaded = Vec::new();
        for image in images {
            match upload_image(image).await {
                Ok(url) => uploaded.push(url),
                Err(e) => {
                    eprintln!("Ошибка загрузки изображения маршрута: {}", e);
                    return (
                        StatusCode::INTERNAL_SERVER_ERROR,
                        Json(json!({"error": "Failed to upload route image"})),
                    )
                    .into_response();
                }
            }
        }
        images_param = Some(uploaded);
        update_fields.push(format!("images = ${}", params.len() + 1));
        params.push(images_param.as_ref().unwrap());
    }

    if !update_fields.is_empty() {
        let query = format!(
            "UPDATE routes SET {} WHERE route_id = $1",
            update_fields.join(", ")
        );
        if let Err(e) = state.db_client.execute(&query, &params[..]).await {
            eprintln!("Ошибка обновления маршрута: {}", e);
            return (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(json!({"error": "Failed to update route"})),
            )
            .into_response();
        }
    }

    if let Some(points) = &payload.points {
        if let Err(e) = state.db_client.execute("DELETE FROM route_points WHERE route_id = $1", &[&route_id]).await {
            eprintln!("Ошибка удаления точек маршрута: {}", e);
            return (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(json!({"error": "Failed to update route points"})),
            )
            .into_response();
        }
        for point in points {
            let point_images = if let Some(image_list) = &point.images {
                let mut uploaded = Vec::new();
                for image in image_list {
                    match upload_image(image).await {
                        Ok(url) => uploaded.push(url),
                        Err(e) => {
                            eprintln!("Ошибка загрузки изображения точки: {}", e);
                            return (
                                StatusCode::INTERNAL_SERVER_ERROR,
                                Json(json!({"error": "Failed to upload point image"})),
                            )
                            .into_response();
                        }
                    }
                }
                Some(uploaded)
            } else {
                None
            };
            if let Err(e) = state.db_client.execute(
                "INSERT INTO route_points (route_id, coordinate, time_offset, elevation, speed, images) 
                 VALUES ($1, ST_SetSRID(ST_MakePoint($3, $2), 4326), $4, $5, $6, $7)",
                &[
                    &route_id,
                    &point.latitude,
                    &point.longitude,
                    &point.time_offset,
                    &point.elevation,
                    &point.speed,
                    &point_images,
                ],
            ).await {
                eprintln!("Ошибка вставки точки маршрута: {}", e);
                return (
                    StatusCode::INTERNAL_SERVER_ERROR,
                    Json(json!({"error": "Failed to update route points"})),
                )
                .into_response();
            }
        }
    }

    match state.db_client.execute(
        "UPDATE routes SET is_deleted = FALSE WHERE route_id = $1",
        &[&route_id],
    ).await {
        Ok(updated) => {
            if updated == 1 {
                StatusCode::OK.into_response()
            } else {
                (
                    StatusCode::NOT_FOUND,
                    Json(json!({"error": "Route not found"})),
                )
                .into_response()
            }
        },
        Err(e) => {
            eprintln!("Error deleting route: {}", e);
            StatusCode::INTERNAL_SERVER_ERROR.into_response()
        }
    }
}

pub async fn delete_route(
    cookies: CookieJar,
    State(state): State<AppState>,
    Path(route_id): Path<i32>,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };
    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let route_exists = match state.db_client.query_opt(
        "SELECT user_id FROM routes WHERE route_id = $1 AND NOT is_deleted",
        &[&route_id],
    ).await {
        Ok(Some(row)) => {
            let route_user_id: i32 = row.get("user_id");
            if route_user_id != user_id {
                return (
                    StatusCode::FORBIDDEN,
                    Json(json!({"error": "Not authorized to delete this route"})),
                )
                .into_response();
            }
            true
        },
        _ => false,
    };

    if !route_exists {
        return (
            StatusCode::NOT_FOUND,
            Json(json!({"error": "Route not found"})),
        )
        .into_response();
    }

    match state.db_client.execute(
        "UPDATE routes SET is_deleted = TRUE WHERE route_id = $1",
        &[&route_id],
    ).await {
        Ok(updated) => {
            if updated == 1 {
                StatusCode::OK.into_response()
            } else {
                (
                    StatusCode::NOT_FOUND,
                    Json(json!({"error": "Route not found"})),
                )
                .into_response()
            }
        },
        Err(e) => {
            eprintln!("Error deleting route: {}", e);
            StatusCode::INTERNAL_SERVER_ERROR.into_response()
        }
    }
}

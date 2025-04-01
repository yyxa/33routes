use crate::auth::*;
use crate::image::upload_image;
use crate::models::*;
use axum::{
    extract::{Json, Path, State, Query},
    http::{HeaderMap, StatusCode},
    response::IntoResponse,
};
use chrono::Utc;
use serde_json::json;
use serde::Deserialize;
use axum_extra::extract::CookieJar;

async fn check_route_existence(state: &AppState, route_id: &i32) -> bool {
    let route_existence = state
        .db_client
        .query_one(
            "SELECT COUNT(*)
            FROM routes
            WHERE route_id = $1",
            &[route_id],
        )
        .await;
    
    match route_existence {
        Ok(row) => {
            let route_count: i64 = row.get(0);
            route_count > 0
        }
        Err(err) => {
            false
        }
    }
}

async fn check_review_existence(state: &AppState, review_id: &i32) -> bool {
    let review_existence = state
        .db_client
        .query_one(
            "SELECT COUNT(*)
            FROM reviews
            WHERE review_id = $1",
            &[review_id],
        )
        .await;
    
    match review_existence {
        Ok(row) => {
            let review_count: i64 = row.get(0);
            review_count > 0
        }
        Err(err) => {
            false
        }
    }
}

pub async fn get_route_reviews(
    State(state): State<AppState>,
    Path(route_id): Path<i32>,
    Query(params): Query<PaginationParams>,
) -> impl IntoResponse {
    if !check_route_existence(&state, &route_id).await {
        return (
            StatusCode::NOT_FOUND,
            "Route doesn't exist",
        )
            .into_response();
    }

    let page_number = params.page_number.unwrap_or(1).max(1);
    let per_page = params.per_page.unwrap_or(10).clamp(1, 100);
    let offset = (page_number - 1) * per_page;

    let total_reviews_row = state.db_client
        .query_one(
            "SELECT COUNT(*) FROM reviews WHERE route_id = $1 AND is_deleted = false",
            &[&route_id],
        )
        .await;

    let total_reviews: i64 = match total_reviews_row {
        Ok(row) => row.get(0),
        Err(err) => {
            eprintln!("Database error: {}", err);
            return (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error"))
                .into_response();
        }
    };

    let total_pages = (total_reviews + per_page as i64 - 1) / per_page as i64;

    let reviews_rows = state.db_client
        .query(
            "SELECT review_id, user_id, rating, comment, created_at, images
            FROM reviews
            WHERE route_id = $1 AND is_deleted = false
            ORDER BY created_at DESC
            LIMIT $2 OFFSET $3",
            &[&route_id, &per_page, &offset],
        )
        .await;

    let reviews = match reviews_rows {
        Ok(rows) => rows
            .into_iter()
            .map(|row| crate::models::Review {
                review_id: row.get("review_id"),
                user_id: row.get("user_id"),
                rating: row.get("rating"),
                comment: row.get("comment"),
                created_at: row.get("created_at"),
                images: row.get::<_, Option<Vec<String>>>("images").unwrap_or_default(),
            })
            .collect(),
        Err(err) => {
            eprintln!("Database error: {}", err);
            return (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error"))
                .into_response();
        }
    };

    let mut headers = HeaderMap::new();
    headers.insert("pagination-current-page", page_number.to_string().parse().unwrap());
    headers.insert("pagination-total-elements", total_reviews.to_string().parse().unwrap());
    headers.insert("pagination-per-page", per_page.to_string().parse().unwrap());
    headers.insert("pagination-total-pages", total_pages.to_string().parse().unwrap());

    let response_body = crate::models::ReviewListResponse { reviews };

    (headers, Json(response_body)).into_response()
}

pub async fn add_review(
    cookies: CookieJar,
    State(state): State<AppState>,
    Path(route_id): Path<i32>,
    Json(mut payload): Json<AddReviewRequest>,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    if !check_route_existence(&state, &route_id).await {
        return (StatusCode::NOT_FOUND, "Route doesn't exist").into_response();
    }

    let images = if let Some(image_list) = payload.images.take() {
        let mut uploaded = Vec::new();
        for image in image_list {
            match upload_image(&image).await {
                Ok(url) => uploaded.push(url),
                Err(e) => {
                    eprintln!("Ошибка загрузки изображения: {}", e);
                    return (StatusCode::INTERNAL_SERVER_ERROR, "Failed to upload image").into_response();
                }
            }
        }
        uploaded
    } else {
        Vec::new()
    };

    if payload.comment.as_deref().map_or(true, |text| text.trim().is_empty()) && images.is_empty() {
        return (StatusCode::BAD_REQUEST, "Either text or images must be provided").into_response();
    }

    let created_at = Utc::now().timestamp();

    let result = state.db_client.execute(
        "INSERT INTO reviews (user_id, route_id, rating, comment, created_at, images, is_deleted)
         VALUES ($1, $2, $3, $4, $5, $6, FALSE)",
        &[&user_id, &route_id, &payload.rating, &payload.comment, &created_at, &images],
    ).await;

    match result {
        Ok(_) => StatusCode::OK.into_response(),
        Err(err) => {
            eprintln!("Database error: {}", err);
            (StatusCode::INTERNAL_SERVER_ERROR, "Internal Server Error").into_response()
        }
    }
}

pub async fn delete_review(
    cookies: CookieJar,
    State(state): State<AppState>,
    Path(route_id): Path<i32>,
    Json(payload): Json<DeleteReviewRequest>,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    if !check_review_existence(&state, &payload.review_id).await {
        return (StatusCode::NOT_FOUND, "Review doesn't exist").into_response();
    }

    let result = state.db_client.execute(
        "UPDATE reviews SET is_deleted = TRUE WHERE review_id = $1 AND user_id = $2 AND route_id = $3",
        &[&payload.review_id, &user_id, &route_id],
    ).await;

    match result {
        Ok(_) => StatusCode::OK.into_response(),
        Err(err) => {
            eprintln!("Database error: {}", err);
            (StatusCode::INTERNAL_SERVER_ERROR, "Internal Server Error").into_response()
        }
    }
}
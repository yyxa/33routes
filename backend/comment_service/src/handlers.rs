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

#[derive(Debug, Deserialize)]
pub struct PaginationParams {
    #[serde(rename = "pagination-page-number")]
    pub page_number: Option<i64>,
    #[serde(rename = "pagination-per-page")]
    pub per_page: Option<i64>,
}

pub async fn add_comment(
    cookies: CookieJar,
    State(state): State<AppState>,
    Path(review_id): Path<i32>,
    Json(mut payload): Json<AddCommentRequest>,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };
    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let review_existence = state
    .db_client
    .query_one(
        "SELECT COUNT(*) FROM review_comments WHERE review_id = $1",
        &[&review_id],
    )
    .await;

    let review_count: i64 = match review_existence {
        Ok(row) => row.get(0),
        Err(err) => {
            eprintln!("Database error: {}", err);
            return (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response();
        }
    };

    if review_count == 0 {
        return (StatusCode::BAD_REQUEST, Json("Bad request")).into_response();
    }

    let images = if let Some(image_list) = payload.images.take() {
        let mut uploaded = Vec::new();
        for image in image_list {
            match upload_image(&image).await {
                Ok(url) => uploaded.push(url),
                Err(e) => {
                    eprintln!("Ошибка загрузки изображения: {}", e);
                    return (StatusCode::INTERNAL_SERVER_ERROR, Json("Failed to upload image")).into_response();
                }
            }
        }
        Some(uploaded)
    } else {
        None
    };

    if payload.text.trim().is_empty() && images.as_ref().map_or(true, |imgs| imgs.is_empty()) {
        return (StatusCode::BAD_REQUEST, Json("Either text or images must be provided")).into_response();
    }

    let created_at = Utc::now().timestamp();

    let result = state
        .db_client
        .execute(
            "INSERT INTO review_comments (review_id, user_id, comment, created_at, reply_to, is_deleted, images)
             VALUES ($1, $2, $3, $4, $5, FALSE, $6)",
            &[
                &review_id,
                &user_id,
                &payload.text,
                &created_at,
                &payload.reply_to,
                &images,
            ],
        )
        .await;

    match result {
        Ok(_) => (StatusCode::OK).into_response(),
        Err(err) => {
            eprintln!("Database error: {}", err);
            (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response()
        }
    }
}

pub async fn delete_comment(
    cookies: CookieJar,
    State(state): State<AppState>,
    Path(review_id): Path<i32>,
    Json(payload): Json<DeleteCommentRequest>,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };
    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let review_existence = state
        .db_client
        .query_one(
            "SELECT COUNT(*) FROM review_comments WHERE review_id = $1",
            &[&review_id],
        )
        .await;

    let review_count: i64 = match review_existence {
        Ok(row) => row.get(0),
        Err(err) => {
            eprintln!("Database error: {}", err);
            return (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response();
        }
    };

    if review_count == 0 {
        return (StatusCode::NOT_FOUND, Json("Not found")).into_response();
    }

    let comment_existence = state
        .db_client
        .query_one(
            "SELECT COUNT(*) FROM review_comments WHERE comment_id = $1 AND is_deleted = false",
            &[&payload.comment_id],
        )
        .await;

    let comment_count: i64 = match comment_existence {
        Ok(row) => row.get(0),
        Err(err) => {
            eprintln!("Database error: {}", err);
            return (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response();
        }
    };

    if comment_count == 0 {
        return (StatusCode::NOT_FOUND, Json("Not found")).into_response();
    }

    let result = state
        .db_client
        .execute(
            "UPDATE review_comments SET is_deleted = TRUE WHERE comment_id = $1 AND user_id = $2 AND review_id = $3",
            &[&payload.comment_id, &user_id, &review_id],
        )
        .await;

    match result {
        Ok(_) => (StatusCode::OK).into_response(),
        Err(err) => {
            eprintln!("Database error: {}", err);
            (StatusCode::INTERNAL_SERVER_ERROR, Json("Internal Server Error")).into_response()
        }
    }
}

pub async fn get_comments(
    State(state): State<AppState>,
    Path(review_id): Path<i32>,
    Query(params): Query<PaginationParams>,
) -> impl IntoResponse {
    let page_number = params.page_number.unwrap_or(1).max(1);
    let per_page = params.per_page.unwrap_or(10).clamp(1, 100);
    let offset = (page_number - 1) * per_page;

    let total_comments_row = state
        .db_client
        .query_one(
            "SELECT COUNT(*) FROM review_comments WHERE review_id = $1 AND is_deleted = FALSE",
            &[&review_id],
        )
        .await;

    let total_comments: i64 = match total_comments_row {
        Ok(row) => row.get(0),
        Err(err) => {
            eprintln!("Database error: {}", err);
            return (StatusCode::INTERNAL_SERVER_ERROR, axum::Json("Internal Server Error")).into_response();
        }
    };

    if total_comments == 0 {
        return (StatusCode::NOT_FOUND, axum::Json("Not found")).into_response();
    }

    let total_pages = (total_comments + per_page as i64 - 1) / per_page as i64;

    let comments_rows = state
        .db_client
        .query(
            "SELECT comment_id, user_id, comment AS text, created_at, images, reply_to
             FROM review_comments
             WHERE review_id = $1 AND is_deleted = FALSE
             ORDER BY created_at DESC
             LIMIT $2 OFFSET $3",
            &[&review_id, &per_page, &offset],
        )
        .await;

    let comments = match comments_rows {
        Ok(rows) => rows
            .into_iter()
            .map(|row| Comment {
                comment_id: row.get("comment_id"),
                user_id: row.get("user_id"),
                text: row.get("text"),
                created_at: row.get("created_at"),
                images: row.get::<_, Option<Vec<String>>>("images").unwrap_or_default(),
                reply_to: row.get("reply_to"),
            })
            .collect(),
        Err(err) => {
            eprintln!("Database error: {}", err);
            return (StatusCode::INTERNAL_SERVER_ERROR, axum::Json("Internal Server Error")).into_response();
        }
    };

    let mut headers = HeaderMap::new();
    headers.insert("pagination-current-page", page_number.to_string().parse().unwrap());
    headers.insert("pagination-total-elements", total_comments.to_string().parse().unwrap());
    headers.insert("pagination-per-page", per_page.to_string().parse().unwrap());
    headers.insert("pagination-total-pages", total_pages.to_string().parse().unwrap());

    let response_body = CommentListResponse { comments };

    (headers, axum::Json(response_body)).into_response()
}

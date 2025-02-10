use crate::models::{AddCommentRequest, AppState, Comment, CommentListResponse, DeleteCommentRequest};
use axum::{
    extract::{Json, Path, Query, State},
    http::{HeaderMap, StatusCode},
    response::IntoResponse,
};
use chrono::Utc;
use serde::Deserialize;

#[derive(Debug, Deserialize)]
pub struct PaginationParams {
    #[serde(rename = "pagination-page-number")]
    pub page_number: Option<i64>,
    #[serde(rename = "pagination-per-page")]
    pub per_page: Option<i64>,
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
            return (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json("Internal Server Error"),
            )
                .into_response();
        }
    };

    let total_pages = (total_comments + per_page as i64 - 1) / per_page as i64;

    let comments_rows = state
        .db_client
        .query(
            "SELECT comment_id, user_id, comment AS text, created_at, images
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
            })
            .collect(),
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
        total_comments.to_string().parse().unwrap(),
    );
    headers.insert("pagination-per-page", per_page.to_string().parse().unwrap());
    headers.insert(
        "pagination-total-pages",
        total_pages.to_string().parse().unwrap(),
    );

    let response_body = CommentListResponse { comments };

    (headers, Json(response_body)).into_response()
}

pub async fn add_comment(
    State(state): State<AppState>,
    Path(review_id): Path<i32>,
    headers: HeaderMap,
    Json(payload): Json<AddCommentRequest>,
) -> impl IntoResponse {
    let _session_token = match headers.get("session-token") {
        Some(value) => match value.to_str() {
            Ok(v) => v,
            Err(_) => {
                return (
                    StatusCode::BAD_REQUEST,
                    Json("Invalid session-token header"),
                )
                    .into_response();
            }
        },
        None => {
            return (
                StatusCode::BAD_REQUEST,
                Json("Missing session-token header"),
            )
                .into_response();
        }
    };

    let created_at = Utc::now().timestamp();
    let images = payload.images.clone().unwrap_or_default();

    let result = state
        .db_client
        .execute(
            "INSERT INTO review_comments (review_id, user_id, comment, created_at, is_deleted, images)
            VALUES ($1, $2, $3, $4, FALSE, $5)",
            &[
                &review_id,
                &payload.user_id,
                &payload.text,
                &created_at,
                &images,
            ],
        )
        .await;

    match result {
        Ok(_) => (StatusCode::OK).into_response(),
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

pub async fn delete_comment(
    State(state): State<AppState>,
    Path(review_id): Path<i32>,
    headers: HeaderMap,
    Json(payload): Json<DeleteCommentRequest>,
) -> impl IntoResponse {
    let _session_token = match headers.get("session-token") {
        Some(value) => match value.to_str() {
            Ok(v) => v,
            Err(_) => {
                return (
                    StatusCode::BAD_REQUEST,
                    Json("Invalid session-token header"),
                )
                    .into_response();
            }
        },
        None => {
            return (
                StatusCode::BAD_REQUEST,
                Json("Missing session-token header"),
            )
                .into_response();
        }
    };

    let result = state
        .db_client
        .execute(
            "UPDATE review_comments SET is_deleted = TRUE WHERE comment_id = $1 AND user_id = $2 AND review_id = $3",
            &[&payload.comment_id, &payload.user_id, &review_id],
        )
        .await;

    match result {
        Ok(_) => (StatusCode::OK).into_response(),
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

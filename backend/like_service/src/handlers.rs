use axum::{
    extract::{Path, State, Json},
    http::StatusCode,
    response::IntoResponse,
};
use axum_extra::extract::CookieJar;
use crate::{
    models::*,
    auth::*,
};

pub async fn like_comment_add(
    cookies: CookieJar,
    State(state): State<AppState>,
    Path(comment_id): Path<i32>,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };
    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let query = "INSERT INTO comment_likes (user_id, comment_id) VALUES ($1, $2) ON CONFLICT DO NOTHING";
    let result = state.db_client.execute(query, &[&user_id, &comment_id]).await;
    match result {
        Ok(_) => (StatusCode::OK, "Like successfully added").into_response(),
        Err(e) => {
            eprintln!("Ошибка базы данных: {}", e);
            (StatusCode::INTERNAL_SERVER_ERROR, "Internal Server Error").into_response()
        }
    }
}

pub async fn like_comment_remove(
    cookies: CookieJar,
    State(state): State<AppState>,
    Path(comment_id): Path<i32>,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };
    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let query = "DELETE FROM comment_likes WHERE user_id = $1 AND comment_id = $2";
    let result = state.db_client.execute(query, &[&user_id, &comment_id]).await;
    match result {
        Ok(_) => (StatusCode::OK, "Like successfully removed").into_response(),
        Err(e) => {
            eprintln!("Ошибка базы данных: {}", e);
            (StatusCode::INTERNAL_SERVER_ERROR, "Internal Server Error").into_response()
        }
    }
}

pub async fn like_review_add(
    cookies: CookieJar,
    State(state): State<AppState>,
    Path(review_id): Path<i32>,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };
    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let query = "INSERT INTO review_likes (user_id, review_id) VALUES ($1, $2) ON CONFLICT DO NOTHING";
    let result = state.db_client.execute(query, &[&user_id, &review_id]).await;
    match result {
        Ok(_) => (StatusCode::OK, "Like successfully added").into_response(),
        Err(e) => {
            eprintln!("Ошибка базы данных: {}", e);
            (StatusCode::INTERNAL_SERVER_ERROR, "Internal Server Error").into_response()
        }
    }
}

pub async fn like_review_remove(
    cookies: CookieJar,
    State(state): State<AppState>,
    Path(review_id): Path<i32>,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return StatusCode::UNAUTHORIZED.into_response(),
    };
    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return StatusCode::UNAUTHORIZED.into_response(),
    };

    let query = "DELETE FROM review_likes WHERE user_id = $1 AND review_id = $2";
    let result = state.db_client.execute(query, &[&user_id, &review_id]).await;
    match result {
        Ok(_) => (StatusCode::OK, "Like successfully removed").into_response(),
        Err(e) => {
            eprintln!("Ошибка базы данных: {}", e);
            (StatusCode::INTERNAL_SERVER_ERROR, "Internal Server Error").into_response()
        }
    }
}

use reqwest;
use serde_json::json;
use serde_json::Value;
use std::env;
use axum::http::StatusCode;
use axum::response::{IntoResponse, Response};
use axum_extra::extract::CookieJar;

#[derive(Debug)]
pub enum AuthError {
    RequestError(reqwest::Error),
    InvalidToken,
}

pub async fn authenticate_request(session_token: &str) -> Result<i32, AuthError> {
    let backend_session_token =
        env::var("BACKEND_SESSION_TOKEN").expect("BACKEND_SESSION_TOKEN не установлен");
    let auth_service_host =
        env::var("AUTH_SERVICE_HOST").unwrap_or_else(|_| "localhost".to_string());
    let auth_service_port =
        env::var("AUTH_SERVICE_PORT").unwrap_or_else(|_| "8100".to_string());
    let url = format!("http://{}:{}/api/auth/check_token", auth_service_host, auth_service_port);

    let client = reqwest::Client::new();
    let res = client
        .post(&url)
        .header("Content-Type", "application/json")
        .header("Cookie", format!("session_token={}", session_token))
        .json(&json!({
            "backend_session_token": backend_session_token,
        }))
        .send()
        .await
        .map_err(AuthError::RequestError)?;

    if res.status().is_success() {
        let json: Value = res.json().await.map_err(AuthError::RequestError)?;
        if let Some(user_id) = json.get("user_id").and_then(|v| v.as_i64()) {
            Ok(user_id as i32)
        } else {
            Err(AuthError::InvalidToken)
        }
    } else {
        Err(AuthError::InvalidToken)
    }
}
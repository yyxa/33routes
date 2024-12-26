use std::sync::Arc;
use tokio_postgres::Client;
use redis::Client as RedisClient;
use serde::{Deserialize, Serialize};

#[derive(Clone)]
pub struct AppState {
    pub db_client: Arc<Client>,
    pub redis_client: Arc<RedisClient>,
}

#[derive(Debug, Deserialize)]
pub struct RegisterRequest {
    pub username: String,
    pub email: String,
    pub password: String,
    pub name: String,
    pub surname: String,
    pub phone: String,
}

#[derive(Debug, Serialize)]
pub struct RegisterResponse {
    pub user_id: i32,
    pub token: String,
}

#[derive(Debug, Deserialize)]
pub struct LoginRequest {
    pub email: String,
    pub password: String,
}

#[derive(Debug, Serialize)]
pub struct LoginResponse {
    pub token: String,
    pub refresh_token: String,
}

#[derive(Debug, Deserialize)]
pub struct VkAuthParams {
    pub code: String,
}

#[derive(Debug, Deserialize)]
pub struct VkTokenResponse {
    pub access_token: String,
    pub expires_in: i64,
    pub user_id: i64,
    pub email: Option<String>,
}

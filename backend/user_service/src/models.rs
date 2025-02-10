use serde::Serialize;
use std::sync::Arc;
use tokio_postgres::Client;
use chrono::NaiveDateTime;

#[derive(Clone)]
pub struct AppState {
    pub db_client: Arc<Client>,
}

#[derive(Debug, Serialize)]
pub struct UserProfileResponse {
    pub user_id: i32,
    pub username: String,
    pub fullname: Option<String>,
    pub country: Option<String>,
    pub city: Option<String>,
    pub instagram: Option<String>,
    pub facebook: Option<String>,
    pub x: Option<String>,
    pub vkontakte: Option<String>,
    pub telegram: Option<String>,
    pub youtube: Option<String>,
    pub user_site: Option<String>,
    pub avatar_url: Option<String>,
    pub bio: Option<String>,
    pub created_at: chrono::NaiveDateTime, 
}
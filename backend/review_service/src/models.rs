use serde::{Deserialize, Serialize};
use std::sync::Arc;
use tokio_postgres::Client;

#[derive(Clone)]
pub struct AppState {
    pub db_client: Arc<Client>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Review {
    pub review_id: i32,
    pub user_id: i32,
    pub rating: f64,
    pub comment: Option<String>,
    pub created_at: i64,
    pub images: Vec<String>,
}

#[derive(Debug, Serialize)]
pub struct ReviewListResponse {
    pub reviews: Vec<Review>,
}
use serde::{Deserialize, Serialize};
use std::sync::Arc;
use tokio_postgres::Client;

#[derive(Clone)]
pub struct AppState {
    pub db_client: Arc<Client>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Comment {
    pub comment_id: i32,
    pub user_id: i32,
    pub text: String,
    pub created_at: i64,
    pub images: Vec<String>,
    pub reply_to: Option<i32>,
}

#[derive(Debug, Serialize)]
pub struct CommentListResponse {
    pub comments: Vec<Comment>,
}

#[derive(Debug, Deserialize)]
pub struct AddCommentRequest {
    pub reply_to: Option<i32>,
    pub text: String,
    pub images: Option<Vec<String>>,
}

#[derive(Debug, Deserialize)]
pub struct DeleteCommentRequest {
    pub comment_id: i32,
}

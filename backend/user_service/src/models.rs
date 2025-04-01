use serde::{Serialize, Deserialize};
use std::sync::Arc;
use tokio_postgres::Client;
use chrono::NaiveDateTime;
use redis::Client as RedisClient;
use postgres_types::{ToSql, FromSql};

#[derive(Debug, Serialize, Deserialize, ToSql, FromSql)]
#[postgres(name = "tag_type")]
#[serde(rename_all = "lowercase")]
pub enum TagType {
    #[postgres(name = "forest")]
    Forest,
    #[postgres(name = "park")]
    Park,
    #[postgres(name = "near_water")]
    NearWater,
}

#[derive(Debug, Serialize, Deserialize, ToSql, FromSql)]
#[postgres(name = "category_type")]
#[serde(rename_all = "lowercase")]
pub enum CategoryType {
    #[postgres(name = "walking")]
    Walking,
}

#[derive(Debug, Serialize, Deserialize, ToSql, FromSql)]
#[postgres(name = "route_status_type")]
#[serde(rename_all = "lowercase")]
pub enum RouteStatus {
    #[postgres(name = "pending")]
    Pending,
    #[postgres(name = "approved")]
    Approved,
    #[postgres(name = "rejected")]
    Rejected,
}

#[derive(Clone)]
pub struct AppState {
    pub db_client: Arc<Client>,
    pub redis_client: RedisClient,
}

#[derive(Debug, Serialize)]
pub struct PublicUserProfileResponse {
    pub username: String,
    pub name: String,
    pub surname: Option<String>,
    pub country: Option<String>,
    pub city: Option<String>,
    pub avatar_url: Option<String>,
    pub bio: Option<String>,
    pub phone: Option<String>,
    pub created_at: NaiveDateTime,
    pub instagram: Option<String>,
    pub facebook: Option<String>,
    pub x: Option<String>,
    pub vkontakte: Option<String>,
    pub telegram: Option<String>,
    pub youtube: Option<String>,
    pub user_site: Option<String>,
    pub routes: Vec<Route>,
    pub collections: Vec<Collection>,
    pub reviews: Vec<Review>,
    pub completed_routes: Vec<CompletedRoute>,
}

#[derive(Debug, Serialize)]
pub struct Route {
    pub route_id: i32,
    pub name: String,
    pub url: String,
    pub description: Option<String>,
    pub length: i32,
    pub duration: i64,
    pub tags: Option<Vec<TagType>>,
    pub category: CategoryType,
    pub created_at: NaiveDateTime,
    pub status: RouteStatus,
    pub rating: f64,
    pub images: Option<Vec<String>>,
}

#[derive(Debug, Serialize)]
pub struct Collection {
    pub collection_id: i32,
    pub name: String,
    pub rating: Option<f64>,
    pub url: String,
    pub description: Option<String>,
    pub tags: Option<Vec<TagType>>,
    pub created_at: NaiveDateTime,
}

#[derive(Debug, Serialize)]
pub struct Review {
    pub review_id: i32,
    pub route_id: i32,
    pub rating: Option<f64>,
    pub comment: Option<String>,
    pub created_at: NaiveDateTime,
    pub images: Option<Vec<String>>,
}

#[derive(Debug, Serialize)]
pub struct CompletedRoute {
    pub route_id: i32,
    pub completed_at: NaiveDateTime,
}

#[derive(Debug, Serialize)]
pub struct UserSettings {
    pub show_phone: bool,
    pub show_planned: bool,
    pub show_visited: bool,
}

#[derive(Debug, Deserialize)]
pub struct UserSettingsUpdate {
    pub show_phone: Option<bool>,
    pub show_planned: Option<bool>,
    pub show_visited: Option<bool>,
}

#[derive(Debug, Deserialize)]
pub struct DeleteUserProfileRequest {
    pub username: String,
}

#[derive(Debug, Serialize)]
pub struct UserBriefResponse {
    pub user_id: i32,
    pub username: String,
    pub name: String,
    pub surname: Option<String>,
    pub avatar_url: Option<String>,
}

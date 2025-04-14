use serde::{Deserialize, Serialize};
use std::sync::Arc;
use tokio_postgres::Client;
use postgres_types::{ToSql, FromSql};

#[derive(Debug, ToSql, FromSql, Serialize, Deserialize)]
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

#[derive(Clone)]
pub struct AppState {
    pub db_client: Arc<Client>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Collection {
    pub collection_id: i32,
    pub user_id: i32,
    pub name: String,
    pub url: String,
    pub description: Option<String>,
    pub tags: Option<Vec<TagType>>,
    pub rating: Option<f64>,
    pub created_at: i64,
    pub routes: CollectionRoutes,
    pub imgs: Vec<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct CollectionRoutes {
    pub amount: i32,
    pub ids: Vec<i32>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct User {
    pub user_id: i32,
    pub name: String,
    pub image_url: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct CollectionResponse {
    pub user: User,
    pub collection: Collection,
}

#[derive(Debug, Serialize)]
pub struct CollectionIdsResponse {
    pub collections: Vec<i32>,
}

#[derive(Debug, Deserialize)]
pub struct PaginationParams {
    #[serde(rename = "pagination-page-number")]
    pub page_number: Option<i64>,
    #[serde(rename = "pagination-per-page")]
    pub per_page: Option<i64>,
}

#[derive(Debug, Deserialize)]
pub struct CreateCollectionRequest {
    pub name: String,
    pub description: String,
    pub tags: Option<Vec<TagType>>,
}

#[derive(Debug, Deserialize)]
pub struct UpdateCollectionRequest {
    pub name: Option<String>,
    pub description: Option<String>,
    pub tags: Option<Vec<TagType>>,
}

#[derive(Debug, Deserialize)]
pub struct CollectionIdQuery {
    pub collection_id: i32,
}

#[derive(Debug, Serialize)]
pub struct SavedRoutesResponse {
    pub routes: Vec<i32>,
}
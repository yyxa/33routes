use serde::Serialize;
use std::sync::Arc;
use tokio_postgres::Client;

#[derive(Clone)]
pub struct AppState {
    pub db_client: Arc<Client>,
}

#[derive(Serialize)]
pub struct RoutesResponse {
    pub routes: Vec<i32>,
}

#[derive(Serialize)]
pub struct RouteDetails {
    pub user: UserDetails,
    pub route: RouteInfo,
    pub points: Vec<PointInfo>,
}

#[derive(Serialize)]
pub struct UserDetails {
    pub user_id: i32,
    pub name: String,
    pub image_url: Option<String>,
}

#[derive(Serialize)]
pub struct RouteInfo {
    pub route_id: i32,
    pub name: String,
    pub url: String,
    pub description: Option<String>,
    pub length: i32,
    pub duration: i64,
    pub tags: Option<Vec<String>>,
    pub category: String,
    pub created_at: i64,
    pub status: String,
    pub is_deleted: bool,
    pub rating: f64,
    pub images: Option<Vec<String>>,
}

#[derive(Serialize)]
pub struct PointInfo {
    pub point_id: i32,
    pub coordinate: Coordinate,
    pub time_offset: Option<i64>,
    pub elevation: Option<i32>,
    pub speed: Option<f64>,
    pub point_description: Option<String>,
    pub images: Option<Vec<String>>,
}

#[derive(Serialize)]
pub struct Coordinate {
    pub latitude: f64,
    pub longitude: f64,
}

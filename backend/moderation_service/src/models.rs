use serde::{Deserialize, Serialize};
use std::sync::Arc;
use tokio_postgres::Client;
use postgres_types::{ToSql, FromSql};

#[derive(Clone)]
pub struct AppState {
    pub db_client: Arc<Client>,
}

#[derive(Debug, PartialEq, ToSql, FromSql, Serialize, Deserialize)]
#[postgres(name = "entity_type")]
#[serde(rename_all = "lowercase")]
pub enum EntityType {
    Route,
    Review,
    Collection,
    User,
    Comment,
}

#[derive(Debug, PartialEq, ToSql, FromSql, Serialize, Deserialize)]
#[postgres(name = "report_type")]
#[serde(rename_all = "snake_case")]
pub enum ReportType {
    #[serde(rename = "spam or advertising")]
    #[postgres(name = "spam or advertising")]
    SpamOrAdvertising,
    #[serde(rename = "inappropriate content")]
    #[postgres(name = "inappropriate content")]
    InappropriateContent,
    #[serde(rename = "violation of community rules")]
    #[postgres(name = "violation of community rules")]
    ViolationOfCommunityRules,
    #[serde(rename = "offensive content")]
    #[postgres(name = "offensive content")]
    OffensiveContent,
}

#[derive(Debug, PartialEq, ToSql, FromSql, Serialize, Deserialize)]
#[postgres(name = "report_status")]
#[serde(rename_all = "lowercase")]
pub enum ReportStatus {
    Opened,
    Closed,
}

#[derive(Debug, Deserialize)]
pub struct ReportEntityRequest {
    pub user_id: i32,
    pub object_type: EntityType,
    pub object_id: i32,
    pub reason: ReportType,
    pub details: String,
}

#[derive(Debug, Serialize)]
pub struct ReportEntityResponse {
    pub reports: Vec<EntityReport>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct EntityReport {
    pub report_id: i32,
    pub user_id: i32,
    #[serde(rename = "object_type")]
    pub reported_entity: EntityType,
    #[serde(rename = "object_id")]
    pub entity_id: i32,
    pub reason: ReportType,
    pub details: String,
    pub status: ReportStatus,
    pub created_at: i64,
    pub closed_at: Option<i64>,
    pub resolution: Option<String>,
}

#[derive(Debug, Deserialize)]
#[allow(dead_code)]
pub struct ResolveEntityReportRequest {
    pub user_id: i32,
    pub report_id: i32,
    pub resolution: String,
}

#[derive(Debug, Deserialize)]
pub struct ReportBugRequest {
    pub user_id: i32,
    pub description: String,
}

#[derive(Debug, Serialize)]
pub struct BugReportResponse {
    pub bug_reports: Vec<BugReport>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct BugReport {
    pub bug_report_id: i32,
    pub user_id: i32,
    pub details: String,
    pub status: ReportStatus,
    pub created_at: i64,
    pub closed_at: Option<i64>,
    pub resolution: Option<String>,
}

#[derive(Debug, Deserialize)]
#[allow(dead_code)]
pub struct ResolveBugReportRequest {
    pub user_id: i32,
    pub report_id: i32,
    pub resolution: String,
}

#[derive(Debug, Deserialize)]
pub struct GetReportsParams {
    pub status: Option<String>,
    #[serde(rename = "pagination-page-number")]
    pub page_number: Option<i64>,
    #[serde(rename = "pagination-per-page")]
    pub per_page: Option<i64>,
}

#[derive(Debug, PartialEq, ToSql, FromSql, Serialize, Deserialize)]
#[postgres(name = "route_status_type")]
#[serde(rename_all = "lowercase")]
pub enum RouteStatusType {
    Pending,
    Approved,
    Rejected,
}

#[derive(Debug, Deserialize)]
pub struct GetRoutesParams {
    pub status: Option<String>,
    #[serde(rename = "pagination-page-number")]
    pub page_number: Option<i64>,
    #[serde(rename = "pagination-per-page")]
    pub per_page: Option<i64>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct User {
    pub user_id: i32,
    pub name: String,
    pub image_url: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Route {
    pub route_id: i32,
    pub user_id: i32,
    pub name: String,
    pub url: String,
    pub description: Option<String>,
    pub length: i32,
    pub duration: i64,
    pub tags: Option<Vec<String>>,
    pub category: String,
    pub created_at: i64,
    pub status: RouteStatusType,
    pub is_deleted: bool,
    pub rating: f64,
    pub images: Option<Vec<String>>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct PointCoordinate {
    pub latitude: f64,
    pub longitude: f64,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct RoutePoint {
    pub point_id: i32,
    pub coordinate: PointCoordinate,
    pub time_offset: Option<i64>,
    pub elevation: Option<i32>,
    pub speed: Option<f64>,
    pub point_description: Option<String>,
    pub images: Option<Vec<String>>,
}

#[derive(Debug, Serialize)]
pub struct RouteForModeration {
    pub user: User,
    pub route: Route,
    pub points: Vec<RoutePoint>,
}

#[derive(Debug, Serialize)]
pub struct RoutesForModerationResponse {
    pub routes: Vec<RouteForModeration>,
}

#[derive(Debug, Deserialize)]
#[allow(dead_code)]
pub struct ApproveRouteRequest {
    pub user_id: i32,
    pub object_type: EntityType,
    pub object_id: i32,
}

#[derive(Debug, Deserialize)]
#[allow(dead_code)]
pub struct RejectRouteRequest {
    pub user_id: i32,
    pub object_type: EntityType,
    pub object_id: i32,
    pub reason: String,
}

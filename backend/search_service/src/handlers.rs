use axum::{
    extract::{Query, State},
    http::{HeaderMap, HeaderValue, StatusCode},
    response::IntoResponse,
    Json,
};
use serde::Deserialize;
use serde::de::{self, Deserializer};
use serde_json::json;
use std::collections::HashMap;
use crate::models::{AppState, TagType};

fn deserialize_number_from_string<'de, D, T>(deserializer: D) -> Result<Option<T>, D::Error>
where
    D: Deserializer<'de>,
    T: std::str::FromStr,
    T::Err: std::fmt::Display,
{
    let opt: Option<String> = Option::deserialize(deserializer)?;
    if let Some(s) = opt {
        let trimmed = s.trim();
        if trimmed.is_empty() {
            Ok(None)
        } else {
            trimmed.parse::<T>().map(Some).map_err(de::Error::custom)
        }
    } else {
        Ok(None)
    }
}

#[derive(Deserialize, Default)]
pub struct PaginationParams {
    #[serde(rename = "pagination-page-number", default, deserialize_with = "deserialize_number_from_string")]
    pub page_number: Option<i64>,
    #[serde(rename = "pagination-per-page", default, deserialize_with = "deserialize_number_from_string")]
    pub per_page: Option<i64>,
}

#[derive(Deserialize, Default)]
pub struct UserSearchParams {
    #[serde(default)]
    pub q: Option<String>,
    #[serde(flatten)]
    pub pagination: PaginationParams,
    #[serde(flatten, default)]
    pub _extra: HashMap<String, String>,
}

pub async fn search_users(
    State(state): State<AppState>,
    Query(params): Query<UserSearchParams>,
) -> impl IntoResponse {
    let requested_page = params.pagination.page_number.unwrap_or(1).max(1);
    let per_page = params.pagination.per_page.unwrap_or(10).clamp(1, 100);

    let count_query = "
        SELECT COUNT(*) FROM users 
        WHERE is_deleted = FALSE 
          AND (($1::text IS NULL) OR 
               (name ILIKE '%' || $1 || '%' OR surname ILIKE '%' || $1 || '%' OR username ILIKE '%' || $1 || '%'))
    ";
    let total_elements: i64 = match state.db_client.query_one(count_query, &[&params.q]).await {
        Ok(row) => row.get(0),
        Err(e) => {
            eprintln!("Error counting users: {}", e);
            return (StatusCode::INTERNAL_SERVER_ERROR,
                    Json(json!({ "error": "Search failed" })))
                .into_response();
        }
    };

    let total_pages = if total_elements == 0 {
        0
    } else {
        ((total_elements as f64) / (per_page as f64)).ceil() as i64
    };
    let page_number = if requested_page > total_pages && total_pages > 0 {
        total_pages
    } else {
        requested_page
    };
    let offset = (page_number - 1) * per_page;

    let query = "
        SELECT user_id FROM users 
        WHERE is_deleted = FALSE 
          AND (($1::text IS NULL) OR 
               (name ILIKE '%' || $1 || '%' OR surname ILIKE '%' || $1 || '%' OR username ILIKE '%' || $1 || '%'))
        ORDER BY user_id
        LIMIT $2 OFFSET $3
    ";
    match state.db_client.query(query, &[&params.q, &per_page, &offset]).await {
        Ok(rows) => {
            let results: Vec<i32> = rows.iter().map(|row| row.get("user_id")).collect();
            let mut headers = HeaderMap::new();
            headers.insert("pagination-current-page", HeaderValue::from_str(&page_number.to_string()).unwrap());
            headers.insert("pagination-total-elements", HeaderValue::from_str(&total_elements.to_string()).unwrap());
            headers.insert("pagination-per-page", HeaderValue::from_str(&per_page.to_string()).unwrap());
            headers.insert("pagination-total-pages", HeaderValue::from_str(&total_pages.to_string()).unwrap());
            (headers, Json(json!({ "results": results }))).into_response()
        },
        Err(e) => {
            eprintln!("Error searching users: {}", e);
            (StatusCode::INTERNAL_SERVER_ERROR, Json(json!({ "error": "Search failed" }))).into_response()
        }
    }
}

#[derive(Deserialize, Default)]
pub struct RouteSearchParams {
    #[serde(default)]
    pub q: Option<String>,
    #[serde(default, deserialize_with = "deserialize_number_from_string")]
    pub min_length: Option<i32>,
    #[serde(default, deserialize_with = "deserialize_number_from_string")]
    pub max_length: Option<i32>,
    #[serde(default, deserialize_with = "deserialize_number_from_string")]
    pub min_duration: Option<i64>,
    #[serde(default, deserialize_with = "deserialize_number_from_string")]
    pub max_duration: Option<i64>,
    #[serde(default)]
    pub tags: Option<String>,
    #[serde(default)]
    pub category: Option<String>,
    #[serde(default, deserialize_with = "deserialize_number_from_string")]
    pub min_rating: Option<f32>,
    #[serde(default, deserialize_with = "deserialize_number_from_string")]
    pub max_rating: Option<f32>,
    #[serde(flatten)]
    pub pagination: PaginationParams,
}

#[derive(Deserialize, Default)]
pub struct ExtendedRouteSearchParams {
    #[serde(flatten)]
    pub base: RouteSearchParams,
    #[serde(default)]
    pub order: Option<String>, // "rating_desc", "rating_asc", "created_desc", "created_asc", "distance", "between"
    #[serde(default, deserialize_with = "deserialize_number_from_string")]
    pub lat: Option<f64>,
    #[serde(default, deserialize_with = "deserialize_number_from_string")]
    pub lon: Option<f64>,
    #[serde(default, deserialize_with = "deserialize_number_from_string")]
    pub start_lat: Option<f64>,
    #[serde(default, deserialize_with = "deserialize_number_from_string")]
    pub start_lon: Option<f64>,
    #[serde(default, deserialize_with = "deserialize_number_from_string")]
    pub end_lat: Option<f64>,
    #[serde(default, deserialize_with = "deserialize_number_from_string")]
    pub end_lon: Option<f64>,
    #[serde(flatten, default)]
    pub _extra: HashMap<String, String>,
}

fn parse_tags(s: &str) -> Result<Vec<TagType>, String> {
    s.split(',')
        .map(|s| {
            let t = s.trim().to_lowercase();
            match t.as_str() {
                "forest" => Ok(TagType::Forest),
                "park" => Ok(TagType::Park),
                "near_water" => Ok(TagType::NearWater),
                other => Err(format!("unknown tag: {}", other)),
            }
        })
        .collect()
}

fn route_default_order() -> &'static str {
    "ORDER BY route_id"
}

fn route_order_clause(order: Option<&str>) -> &'static str {
    match order {
        Some("rating_desc") => "ORDER BY rating DESC",
        Some("rating_asc")  => "ORDER BY rating ASC",
        Some("created_desc") => "ORDER BY created_at DESC",
        Some("created_asc")  => "ORDER BY created_at ASC",
        _ => route_default_order(),
    }
}

pub async fn search_routes(
    State(state): State<AppState>,
    Query(params): Query<ExtendedRouteSearchParams>,
) -> impl IntoResponse {
    let base = &params.base;
    let requested_page = base.pagination.page_number.unwrap_or(1).max(1);
    let per_page = base.pagination.per_page.unwrap_or(10).clamp(1, 100);
    let page_number = requested_page;

    let mut conditions: Vec<String> = Vec::new();
    let mut args: Vec<&(dyn tokio_postgres::types::ToSql + Sync)> = Vec::new();

    args.push(&base.q);
    conditions.push("(($1::text IS NULL) OR (name ILIKE '%' || $1 || '%'))".to_string());

    args.push(&base.min_length);
    conditions.push("(($2::int IS NULL) OR (length >= $2))".to_string());

    args.push(&base.max_length);
    conditions.push("(($3::int IS NULL) OR (length <= $3))".to_string());

    args.push(&base.min_duration);
    conditions.push("(($4::bigint IS NULL) OR (duration >= $4))".to_string());

    args.push(&base.max_duration);
    conditions.push("(($5::bigint IS NULL) OR (duration <= $5))".to_string());

    let tags_parsed: Option<Vec<TagType>> = match &base.tags {
        Some(s) if !s.trim().is_empty() => match parse_tags(s) {
            Ok(vec) => Some(vec),
            Err(err_msg) => return (StatusCode::BAD_REQUEST, Json(json!({ "error": err_msg }))).into_response(),
        },
        _ => None,
    };
    let tags_deref = tags_parsed.as_deref();
    args.push(&tags_deref);
    conditions.push("(($6::tag_type[] IS NULL) OR (tags @> $6::tag_type[]))".to_string());

    args.push(&base.category);
    conditions.push("(($7::text IS NULL) OR (category = $7::category_type))".to_string());

    let min_rating_f64 = base.min_rating.map(|r| r as f64);
    args.push(&min_rating_f64);
    conditions.push("(($8::float IS NULL) OR (rating >= $8))".to_string());

    let max_rating_f64 = base.max_rating.map(|r| r as f64);
    args.push(&max_rating_f64);
    conditions.push("(($9::float IS NULL) OR (rating <= $9))".to_string());

    let mut between_values: Vec<f64> = Vec::new();
    if params.order.as_deref() == Some("between") {
        if let (Some(s_lat), Some(s_lon), Some(e_lat), Some(e_lon)) =
            (params.start_lat, params.start_lon, params.end_lat, params.end_lon)
        {
            let next_index = args.len() + 1;
            let cond1 = format!(
                "EXISTS (SELECT 1 FROM route_points rp WHERE rp.route_id = routes.route_id AND ST_DWithin(rp.coordinate, ST_SetSRID(ST_MakePoint(${0}, ${1}),4326), 5000))",
                next_index, next_index + 1
            );
            conditions.push(cond1);
            between_values.push(s_lon);
            between_values.push(s_lat);
            let next_index2 = next_index + 2;
            let cond2 = format!(
                "EXISTS (SELECT 1 FROM route_points rp WHERE rp.route_id = routes.route_id AND ST_DWithin(rp.coordinate, ST_SetSRID(ST_MakePoint(${0}, ${1}),4326), 5000))",
                next_index2, next_index2 + 1
            );
            conditions.push(cond2);
            between_values.push(e_lon);
            between_values.push(e_lat);
        }
    }
    for val in &between_values {
        args.push(val);
    }

    let where_clause = conditions.join(" AND ");
    let order_clause = if let Some(ref order) = params.order {
        match order.as_str() {
            "distance" => {
                if let (Some(lat), Some(lon)) = (params.lat, params.lon) {
                    format!(
                        "ORDER BY (SELECT ST_Distance(rp.coordinate, ST_SetSRID(ST_MakePoint({}, {}),4326)) FROM route_points rp WHERE rp.route_id = routes.route_id ORDER BY time_offset LIMIT 1)",
                        lon, lat
                    )
                } else {
                    route_order_clause(None).to_string()
                }
            },
            "between" => route_default_order().to_string(),
            other => route_order_clause(Some(other)).to_string(),
        }
    } else {
        route_default_order().to_string()
    };

    let limit_param_index = args.len() + 1;
    let offset_param_index = args.len() + 2;
    let final_query = format!(
        "SELECT route_id FROM routes WHERE {} {} LIMIT ${} OFFSET ${}",
        where_clause,
        order_clause,
        limit_param_index,
        offset_param_index
    );
    let limit_val = per_page;
    let offset_val = (page_number - 1) * per_page;
    args.push(&limit_val);
    args.push(&offset_val);

    match state.db_client.query(&final_query, &args).await {
        Ok(rows) => {
            let results: Vec<i32> = rows.iter().map(|row| row.get("route_id")).collect();
            let total_found = results.len() as i64;
            let total_pages = if total_found == 0 { 0 } else { ((total_found as f64)/(per_page as f64)).ceil() as i64 };
            let mut headers = HeaderMap::new();
            headers.insert("pagination-current-page", HeaderValue::from_str(&page_number.to_string()).unwrap());
            headers.insert("pagination-total-elements", HeaderValue::from_str(&total_found.to_string()).unwrap());
            headers.insert("pagination-per-page", HeaderValue::from_str(&per_page.to_string()).unwrap());
            headers.insert("pagination-total-pages", HeaderValue::from_str(&total_pages.to_string()).unwrap());
            (headers, Json(json!({ "results": results }))).into_response()
        },
        Err(e) => {
            eprintln!("Error searching routes: {}", e);
            (StatusCode::INTERNAL_SERVER_ERROR, Json(json!({ "error": "Search failed" }))).into_response()
        }
    }
}

#[derive(Deserialize, Default)]
pub struct CollectionSearchParams {
    #[serde(default)]
    pub q: Option<String>,
    #[serde(default, deserialize_with = "deserialize_number_from_string")]
    pub min_rating: Option<f32>,
    #[serde(default, deserialize_with = "deserialize_number_from_string")]
    pub max_rating: Option<f32>,
    #[serde(default)]
    pub tags: Option<String>,
    #[serde(flatten)]
    pub pagination: PaginationParams,
}

#[derive(Deserialize, Default)]
pub struct ExtendedCollectionSearchParams {
    #[serde(flatten)]
    pub base: CollectionSearchParams,
    #[serde(default)]
    pub order: Option<String>, // "rating_desc", "rating_asc", "created_desc", "created_asc"
    #[serde(flatten, default)]
    pub _extra: HashMap<String, String>,
}

fn collection_order_clause(order: Option<&str>) -> &'static str {
    match order {
        Some("rating_desc") => "ORDER BY rating DESC",
        Some("rating_asc")  => "ORDER BY rating ASC",
        Some("created_desc") => "ORDER BY created_at DESC",
        Some("created_asc")  => "ORDER BY created_at ASC",
        _ => "ORDER BY collection_id",
    }
}

pub async fn search_collections(
    State(state): State<AppState>,
    Query(params): Query<ExtendedCollectionSearchParams>,
) -> impl IntoResponse {
    let base = &params.base;
    let requested_page = base.pagination.page_number.unwrap_or(1).max(1);
    let per_page = base.pagination.per_page.unwrap_or(10).clamp(1, 100);

    let mut conditions = Vec::new();
    let mut args: Vec<&(dyn tokio_postgres::types::ToSql + Sync)> = Vec::new();
    
    args.push(&base.q);
    conditions.push("(($1::text IS NULL) OR (name ILIKE '%' || $1 || '%'))".to_string());
    
    let min_rating_f64 = base.min_rating.map(|r| r as f64);
    args.push(&min_rating_f64);
    conditions.push("(($2::float IS NULL) OR (rating >= $2))".to_string());
    
    let max_rating_f64 = base.max_rating.map(|r| r as f64);
    args.push(&max_rating_f64);
    conditions.push("(($3::float IS NULL) OR (rating <= $3))".to_string());
    
    let tags_parsed: Option<Vec<TagType>> = match &base.tags {
        Some(s) if !s.trim().is_empty() => match parse_tags(s) {
            Ok(vec) => Some(vec),
            Err(err_msg) => return (StatusCode::BAD_REQUEST, Json(json!({ "error": err_msg }))).into_response(),
        },
        _ => None,
    };
    let tags_deref = tags_parsed.as_deref();
    args.push(&tags_deref);
    conditions.push("(($4::tag_type[] IS NULL) OR (tags @> $4::tag_type[]))".to_string());
    
    let where_clause = conditions.join(" AND ");
    let order_clause = collection_order_clause(params.order.as_deref());
    let limit_param_index = args.len() + 1;
    let offset_param_index = args.len() + 2;
    let final_query = format!(
        "SELECT collection_id FROM collections WHERE {} {} LIMIT ${} OFFSET ${}",
        where_clause,
        order_clause,
        limit_param_index,
        offset_param_index
    );
    let limit_val = per_page;
    let offset_val = (requested_page - 1) * per_page;
    args.push(&limit_val);
    args.push(&offset_val);

    match state.db_client.query(&final_query, &args).await {
        Ok(rows) => {
            let results: Vec<i32> = rows.iter().map(|row| row.get("collection_id")).collect();
            let total_found = results.len() as i64;
            let total_pages = if total_found == 0 { 0 } else { ((total_found as f64)/(per_page as f64)).ceil() as i64 };
            let mut headers = HeaderMap::new();
            headers.insert("pagination-current-page", HeaderValue::from_str(&requested_page.to_string()).unwrap());
            headers.insert("pagination-total-elements", HeaderValue::from_str(&total_found.to_string()).unwrap());
            headers.insert("pagination-per-page", HeaderValue::from_str(&per_page.to_string()).unwrap());
            headers.insert("pagination-total-pages", HeaderValue::from_str(&total_pages.to_string()).unwrap());
            (headers, Json(json!({ "results": results }))).into_response()
        },
        Err(e) => {
            eprintln!("Error searching collections: {}", e);
            (StatusCode::INTERNAL_SERVER_ERROR, Json(json!({ "error": "Search failed" }))).into_response()
        }
    }
}

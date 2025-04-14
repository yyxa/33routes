use axum::{
    extract::{Query, State},
    http::{HeaderMap, HeaderValue, StatusCode},
    response::IntoResponse,
    Json,
};
use serde::Deserialize;
use serde::de::{self, Deserializer};
use serde_json::json;
use crate::models::*;

pub fn deserialize_number_from_string<'de, D, T>(deserializer: D) -> Result<Option<T>, D::Error>
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

fn extract_query_components(q: &Option<String>) -> (&str, Option<&str>) {
    let query = q.as_deref().unwrap_or("");
    if query.starts_with('@') {
        let parts: Vec<&str> = query.splitn(2, ' ').collect();
        let username = parts[0].trim_start_matches('@');
        let extra = if parts.len() > 1 { Some(parts[1].trim()) } else { None };
        (username, extra)
    } else {
        (query, None)
    }
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

fn collection_order_clause(order: Option<&str>) -> &'static str {
    match order {
        Some("rating_desc") => "ORDER BY rating DESC",
        Some("rating_asc") => "ORDER BY rating ASC",
        Some("created_desc") => "ORDER BY created_at DESC",
        Some("created_asc") => "ORDER BY created_at ASC",
        _ => "ORDER BY collection_id",
    }
}

pub async fn search_routes(
    State(state): State<AppState>,
    Query(params): Query<ExtendedRouteSearchParams>,
) -> impl IntoResponse {
    let base = &params.base;
    let query_text = base.q.clone().unwrap_or_default();
    let mut user_filter: Option<String> = None;
    let q: String = if query_text.starts_with('@') {
        let trimmed = query_text.trim();
        let without_at = &trimmed[1..];
        let mut parts = without_at.splitn(2, ' ');
        user_filter = parts.next().map(|s| s.to_string());
        parts.next().unwrap_or("").to_string()
    } else {
        query_text
    };
    let requested_page = base.pagination.page_number.unwrap_or(1).max(1);
    let per_page = base.pagination.per_page.unwrap_or(10).clamp(1, 100);
    let page_number = requested_page;
    let mut conditions: Vec<String> = Vec::new();
    let mut args: Vec<&(dyn tokio_postgres::types::ToSql + Sync)> = Vec::new();
    args.push(&q);
    conditions.push("(($1::text IS NULL) OR (name ILIKE '%' || $1 || '%'))".to_string());
    args.push(&base.min_length);
    conditions.push("(($2::int IS NULL) OR (length >= $2))".to_string());
    args.push(&base.max_length);
    conditions.push("(($3::int IS NULL) OR (length <= $3))".to_string());
    args.push(&base.min_duration);
    conditions.push("(($4::bigint IS NULL) OR (duration >= $4))".to_string());
    args.push(&base.max_duration);
    conditions.push("(($5::bigint IS NULL) OR (duration <= $5))".to_string());
    let tags_parsed = match &base.tags {
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
    if let Some(ref user) = user_filter {
        args.push(user);
        conditions.push(format!("user_id = (SELECT user_id FROM users WHERE username = ${})", args.len()));
    }
    let where_clause = conditions.join(" AND ");
    let order_clause = match build_routes_order_clause(params.order.as_deref()) {
        Ok(clause) => clause,
        Err(err) => return (StatusCode::BAD_REQUEST, Json(json!({ "error": err }))).into_response(),
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
            let total_pages = if total_found == 0 { 0 } else { ((total_found as f64) / (per_page as f64)).ceil() as i64 };
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

pub async fn search_collections(
    State(state): State<AppState>,
    Query(params): Query<ExtendedCollectionSearchParams>,
) -> impl IntoResponse {
    let base = &params.base;
    let query_text = base.q.clone().unwrap_or_default();
    let mut user_filter: Option<String> = None;
    let q: String = if query_text.starts_with('@') {
        let trimmed = query_text.trim();
        let without_at = &trimmed[1..];
        let mut parts = without_at.splitn(2, ' ');
        user_filter = parts.next().map(|s| s.to_string());
        parts.next().unwrap_or("").to_string()
    } else {
        query_text
    };
    let requested_page = base.pagination.page_number.unwrap_or(1).max(1);
    let per_page = base.pagination.per_page.unwrap_or(10).clamp(1, 100);
    let mut conditions = Vec::new();
    let mut args: Vec<&(dyn tokio_postgres::types::ToSql + Sync)> = Vec::new();
    args.push(&q);
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
    if let Some(ref user) = user_filter {
        args.push(user);
        conditions.push(format!("user_id = (SELECT user_id FROM users WHERE username = ${})", args.len()));
    }
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
            let total_pages = if total_found == 0 { 0 } else { ((total_found as f64) / (per_page as f64)).ceil() as i64 };
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

pub async fn search_borders(
    State(state): State<AppState>,
) -> impl IntoResponse {
    let query = "
        SELECT MIN(length) as min_length, MAX(length) as max_length,
               MIN(duration) as min_duration, MAX(duration) as max_duration
        FROM routes
        WHERE is_deleted = FALSE
    ";
    match state.db_client.query_one(query, &[]).await {
        Ok(row) => {
            let min_length: Option<i32> = row.get("min_length");
            let max_length: Option<i32> = row.get("max_length");
            let min_duration: Option<i64> = row.get("min_duration");
            let max_duration: Option<i64> = row.get("max_duration");
            Json(json!({
                "min_length": min_length,
                "max_length": max_length,
                "min_duration": min_duration,
                "max_duration": max_duration
            })).into_response()
        },
        Err(e) => {
            eprintln!("Error fetching borders: {}", e);
            (StatusCode::INTERNAL_SERVER_ERROR, Json(json!({ "error": "Failed to fetch borders" }))).into_response()
        }
    }
}

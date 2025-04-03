use serde::{Deserialize, Serialize};
use std::sync::Arc;
use tokio_postgres::Client;
use postgres_types::{ToSql, FromSql};
use std::collections::{HashMap, HashSet};

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

#[derive(Deserialize, Default)]
pub struct PaginationParams {
    #[serde(rename = "pagination-page-number", default, deserialize_with = "crate::handlers::deserialize_number_from_string")]
    pub page_number: Option<i64>,
    #[serde(rename = "pagination-per-page", default, deserialize_with = "crate::handlers::deserialize_number_from_string")]
    pub per_page: Option<i64>,
}

#[derive(Deserialize, Default)]
pub struct UserSearchParams {
    pub q: Option<String>,
    #[serde(flatten)]
    pub pagination: PaginationParams,
    #[serde(flatten, default)]
    pub _extra: HashMap<String, String>,
}

#[derive(Deserialize, Default)]
pub struct RouteSearchParams {
    pub q: Option<String>,
    #[serde(default, deserialize_with = "crate::handlers::deserialize_number_from_string")]
    pub min_length: Option<i32>,
    #[serde(default, deserialize_with = "crate::handlers::deserialize_number_from_string")]
    pub max_length: Option<i32>,
    #[serde(default, deserialize_with = "crate::handlers::deserialize_number_from_string")]
    pub min_duration: Option<i64>,
    #[serde(default, deserialize_with = "crate::handlers::deserialize_number_from_string")]
    pub max_duration: Option<i64>,
    pub tags: Option<String>,
    pub category: Option<String>,
    #[serde(default, deserialize_with = "crate::handlers::deserialize_number_from_string")]
    pub min_rating: Option<f32>,
    #[serde(default, deserialize_with = "crate::handlers::deserialize_number_from_string")]
    pub max_rating: Option<f32>,
    #[serde(flatten)]
    pub pagination: PaginationParams,
}

#[derive(Deserialize, Default)]
pub struct ExtendedRouteSearchParams {
    #[serde(flatten)]
    pub base: RouteSearchParams,
    pub order: Option<String>,
    #[serde(default, deserialize_with = "crate::handlers::deserialize_number_from_string")]
    pub lat: Option<f64>,
    #[serde(default, deserialize_with = "crate::handlers::deserialize_number_from_string")]
    pub lon: Option<f64>,
    #[serde(default, deserialize_with = "crate::handlers::deserialize_number_from_string")]
    pub start_lat: Option<f64>,
    #[serde(default, deserialize_with = "crate::handlers::deserialize_number_from_string")]
    pub start_lon: Option<f64>,
    #[serde(default, deserialize_with = "crate::handlers::deserialize_number_from_string")]
    pub end_lat: Option<f64>,
    #[serde(default, deserialize_with = "crate::handlers::deserialize_number_from_string")]
    pub end_lon: Option<f64>,
    #[serde(flatten, default)]
    pub _extra: HashMap<String, String>,
}

#[derive(Deserialize, Default)]
pub struct CollectionSearchParams {
    pub q: Option<String>,
    #[serde(default, deserialize_with = "crate::handlers::deserialize_number_from_string")]
    pub min_rating: Option<f32>,
    #[serde(default, deserialize_with = "crate::handlers::deserialize_number_from_string")]
    pub max_rating: Option<f32>,
    pub tags: Option<String>,
    #[serde(flatten)]
    pub pagination: PaginationParams,
}

#[derive(Deserialize, Default)]
pub struct ExtendedCollectionSearchParams {
    #[serde(flatten)]
    pub base: CollectionSearchParams,
    pub order: Option<String>,
    #[serde(flatten, default)]
    pub _extra: HashMap<String, String>,
}

pub fn build_routes_order_clause(order: Option<&str>) -> Result<String, String> {
    if order.is_none() {
        return Ok("ORDER BY route_id".to_string());
    }
    let orders: Vec<&str> = order.unwrap()
        .split(',')
        .map(|s| s.trim())
        .filter(|s| !s.is_empty())
        .collect();
    let mut seen_fields = HashSet::new();
    let mut clauses = Vec::new();
    for ord in orders {
        let (field, clause) = match ord {
            "rating_desc" => ("rating", "rating DESC"),
            "rating_asc"  => ("rating", "rating ASC"),
            "created_desc" => ("created", "created_at DESC"),
            "created_asc"  => ("created", "created_at ASC"),
            "length_asc" => ("length", "length ASC"),
            "length_desc" => ("length", "length DESC"),
            _ => return Err(format!("Invalid sort order: {}", ord)),
        };
        if seen_fields.contains(field) {
            return Err(format!("Conflicting sort orders for field: {}", field));
        }
        seen_fields.insert(field);
        clauses.push(clause);
    }
    if clauses.is_empty() {
        Ok("ORDER BY route_id".to_string())
    } else {
        Ok(format!("ORDER BY {}", clauses.join(", ")))
    }
}

pub fn build_collections_order_clause(order: Option<&str>) -> Result<String, String> {
    if order.is_none() {
        return Ok("ORDER BY collection_id".to_string());
    }
    let orders: Vec<&str> = order.unwrap()
        .split(',')
        .map(|s| s.trim())
        .filter(|s| !s.is_empty())
        .collect();
    let mut seen_fields = HashSet::new();
    let mut clauses = Vec::new();
    for ord in orders {
        let (field, clause) = match ord {
            "rating_desc" => ("rating", "rating DESC"),
            "rating_asc"  => ("rating", "rating ASC"),
            "created_desc" => ("created", "created_at DESC"),
            "created_asc"  => ("created", "created_at ASC"),
            _ => return Err(format!("Invalid sort order: {}", ord)),
        };
        if seen_fields.contains(field) {
            return Err(format!("Conflicting sort orders for field: {}", field));
        }
        seen_fields.insert(field);
        clauses.push(clause);
    }
    if clauses.is_empty() {
        Ok("ORDER BY collection_id".to_string())
    } else {
        Ok(format!("ORDER BY {}", clauses.join(", ")))
    }
}

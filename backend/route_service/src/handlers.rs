use crate::models::*;
use axum::{
    extract::{Path, Query, State},
    http::{HeaderMap, StatusCode},
    response::IntoResponse,
    Json
};
use serde_json::json;
use serde::Deserialize;
use tokio_postgres::Client;

#[derive(Deserialize)]
pub struct PaginationParams {
    #[serde(rename = "pagination-page-number")]
    page_number: Option<i64>,
    #[serde(rename = "pagination-per-page")]
    per_page: Option<i64>,
}

pub async fn get_routes(
    State(state): State<AppState>,
    Query(params): Query<PaginationParams>,
) -> impl IntoResponse {
    let requested_page = params.page_number.unwrap_or(1);
    let per_page = match params.per_page.unwrap_or(10) {
        n if n < 1 => 1,
        n if n > 100 => 100,
        n => n,
    };

    let total_elements_row = match state
        .db_client
        .query_one("SELECT COUNT(*) FROM routes WHERE is_deleted = FALSE", &[])
        .await
    {
        Ok(row) => row,
        Err(e) => {
            eprintln!("Error counting routes: {}", e);
            return StatusCode::INTERNAL_SERVER_ERROR.into_response();
        }
    };
    let total_elements: i64 = total_elements_row.get(0);

    let total_pages = if total_elements == 0 {
        0
    } else {
        ((total_elements as f64) / (per_page as f64)).ceil() as i64
    };

    let page_number = if total_pages > 0 && requested_page > total_pages {
        total_pages
    } else if requested_page < 1 {
        1
    } else {
        requested_page
    };

    let offset = (page_number - 1) * per_page;

    let rows = match state.db_client.query(
            "SELECT route_id FROM routes WHERE is_deleted = FALSE LIMIT $1 OFFSET $2",
            &[&per_page, &offset],
        )
        .await
    {
        Ok(rows) => rows,
        Err(e) => {
            eprintln!("Error fetching routes: {}", e);
            return StatusCode::INTERNAL_SERVER_ERROR.into_response();
        }
    };

    let routes = rows.into_iter().map(|row| row.get(0)).collect::<Vec<i32>>();

    let mut headers = HeaderMap::new();
    headers.insert("pagination-current-page", page_number.to_string().parse().unwrap());
    headers.insert("pagination-total-elements", total_elements.to_string().parse().unwrap());
    headers.insert("pagination-per-page", per_page.to_string().parse().unwrap());
    headers.insert("pagination-total-pages", total_pages.to_string().parse().unwrap());

    let response_body = RoutesResponse { routes };

    (headers, Json(response_body)).into_response()
}

pub async fn get_route_by_id(
    State(state): State<AppState>,
    Path(route_id): Path<String>,
) -> impl IntoResponse {
    if route_id.is_empty() {
        let error_body = json!({ "error": "Route ID cannot be empty" });
        return (StatusCode::NOT_FOUND, Json(error_body)).into_response();
    }

    let route_id: i32 = match route_id.parse() {
        Ok(id) => id,
        Err(_) => {
            let error_body = json!({ "error": "Invalid route ID format" });
            return (StatusCode::BAD_REQUEST, Json(error_body)).into_response();
        }
    };

    match get_route_details(&state.db_client, route_id).await {
        Ok(route_details) => Json(route_details).into_response(),
        Err(MyError::NotFound) => {
            let error_body = json!({ "error": "Route not found" });
            (StatusCode::NOT_FOUND, Json(error_body)).into_response()
        }
        Err(MyError::DbError(e)) => {
            eprintln!("Error fetching route details: {}", e);
            let error_body = json!({ "error": "Internal server error" });
            (StatusCode::INTERNAL_SERVER_ERROR, Json(error_body)).into_response()
        }
    }
}

#[derive(Debug)]
enum MyError {
    NotFound,
    DbError(tokio_postgres::Error),
}

async fn get_route_details(
    db_client: &Client,
    route_id: i32,
) -> Result<RouteDetails, MyError> {
    let route_row_opt = db_client
        .query_opt(
            "SELECT route_id, user_id, name, url, description, length, duration, tags::TEXT[], category::TEXT, created_at, status::TEXT, is_deleted, rating, images 
             FROM routes 
             WHERE route_id = $1 
             LIMIT 1",
            &[&route_id],
        )
        .await
        .map_err(MyError::DbError)?;

    let route_row = match route_row_opt {
        Some(row) => row,
        None => return Err(MyError::NotFound),
    };

    let route = RouteInfo {
        route_id: route_row.get("route_id"),
        name: route_row.get("name"),
        url: route_row.get("url"),
        description: route_row.get("description"),
        length: route_row.get("length"),
        duration: route_row.get("duration"),
        tags: route_row.get("tags"),
        category: route_row.get("category"),
        created_at: route_row.get("created_at"),
        status: route_row.get("status"),
        is_deleted: route_row.get("is_deleted"),
        rating: route_row.get("rating"),
        images: route_row.get("images"),
    };

    let user_id: i32 = route_row.get("user_id");

    let user_row_opt = db_client
        .query_opt(
            "SELECT user_id, name, avatar_url FROM users WHERE user_id = $1 LIMIT 1",
            &[&user_id],
        )
        .await
        .map_err(MyError::DbError)?;

    let user_row = match user_row_opt {
        Some(row) => row,
        None => return Err(MyError::NotFound),
    };

    let user = UserDetails {
        user_id: user_row.get("user_id"),
        name: user_row.get("name"),
        image_url: user_row.get("avatar_url"),
    };

    let point_rows = db_client
        .query(
            "SELECT rp.point_id, ST_Y(rp.coordinate::geometry) as latitude, ST_X(rp.coordinate::geometry) as longitude, rp.time_offset, rp.elevation, rp.speed, rpi.point_description, rpi.images
             FROM route_points rp
             LEFT JOIN route_points_info rpi ON rp.point_id = rpi.point_id
             WHERE rp.route_id = $1",
            &[&route_id],
        )
        .await
        .map_err(MyError::DbError)?;

    let points = point_rows
        .into_iter()
        .map(|row| PointInfo {
            point_id: row.get("point_id"),
            coordinate: Coordinate {
                latitude: row.get("latitude"),
                longitude: row.get("longitude"),
            },
            time_offset: row.get("time_offset"),
            elevation: row.get("elevation"),
            speed: row.get("speed"),
            point_description: row.get("point_description"),
            images: row.get("images"),
        })
        .collect();

    Ok(RouteDetails { user, route, points })
}

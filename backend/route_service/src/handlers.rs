use crate::models::*;
use axum::{
    extract::{Path, Query, State},
    http::{HeaderMap, StatusCode},
    response::IntoResponse,
    Json,
};
use serde::Deserialize;
use tokio_postgres::{error::SqlState, Client};

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
    let page_number = params.page_number.unwrap_or(1);
    let per_page = params.per_page.unwrap_or(10);

    if page_number < 1 || per_page < 1 || per_page > 100 {
        return (StatusCode::BAD_REQUEST, "Invalid pagination parameters").into_response();
    }

    let (routes, total_elements) =
        match get_routes_list(&state.db_client, page_number, per_page).await {
            Ok(data) => data,
            Err(e) => {
                eprintln!("Error fetching routes: {}", e);
                return StatusCode::INTERNAL_SERVER_ERROR.into_response();
            }
        };

    let total_pages = if total_elements == 0 {
        0
    } else {
        ((total_elements as f64) / (per_page as f64)).ceil() as i64
    };

    let mut headers = HeaderMap::new();
    headers.insert(
        "pagination-current-page",
        page_number.to_string().parse().unwrap(),
    );
    headers.insert(
        "pagination-total-elements",
        total_elements.to_string().parse().unwrap(),
    );
    headers.insert(
        "pagination-per-page",
        per_page.to_string().parse().unwrap(),
    );
    headers.insert(
        "pagination-total-pages",
        total_pages.to_string().parse().unwrap(),
    );

    let response_body = RoutesResponse { routes };

    let mut response = Json(response_body).into_response();
    response.headers_mut().extend(headers);

    response
}

pub async fn get_route_by_id(
    State(state): State<AppState>,
    Path(route_id): Path<i32>,
) -> impl IntoResponse {
    match get_route_details(&state.db_client, route_id).await {
        Ok(route_details) => Json(route_details).into_response(),
        Err(MyError::NotFound) => StatusCode::NOT_FOUND.into_response(),
        Err(MyError::DbError(e)) => {
            eprintln!("Error fetching route details: {}", e);
            StatusCode::INTERNAL_SERVER_ERROR.into_response()
        }
    }
}

async fn get_routes_list(
    db_client: &Client,
    page_number: i64,
    per_page: i64,
) -> Result<(Vec<i32>, i64), tokio_postgres::Error> {
    let offset = (page_number - 1) * per_page;

    let rows = db_client
        .query(
            "SELECT route_id FROM routes WHERE is_deleted = FALSE LIMIT $1 OFFSET $2",
            &[&per_page, &offset],
        )
        .await?;

    let total_elements_row = db_client
        .query_one("SELECT COUNT(*) FROM routes WHERE is_deleted = FALSE", &[])
        .await?;

    let total_elements: i64 = total_elements_row.get(0);

    let routes = rows.into_iter().map(|row| row.get(0)).collect();

    Ok((routes, total_elements))
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
    let route_row = db_client
        .query_one(
            "SELECT route_id, user_id, name, url, description, length, duration, tags::TEXT[], category::TEXT, created_at, status::TEXT, is_deleted, rating, images FROM routes WHERE route_id = $1",
            &[&route_id],
        )
        .await
        .map_err(|e| {
            if let Some(code) = e.code() {
                if code == &SqlState::NO_DATA_FOUND {
                    MyError::NotFound
                } else {
                    MyError::DbError(e)
                }
            } else if e.to_string().contains("query returned zero rows") {
                MyError::NotFound
            } else {
                MyError::DbError(e)
            }
        })?;

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

    let user_row = db_client
        .query_one(
            "SELECT user_id, name, avatar_url FROM users WHERE user_id = $1",
            &[&user_id],
        )
        .await
        .map_err(|e| {
            if let Some(code) = e.code() {
                if code == &SqlState::NO_DATA_FOUND {
                    MyError::NotFound
                } else {
                    MyError::DbError(e)
                }
            } else if e.to_string().contains("query returned zero rows") {
                MyError::NotFound
            } else {
                MyError::DbError(e)
            }
        })?;

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

use crate::models::*;
use axum::{
    extract::{Json, Query, State},
    http::{HeaderMap, StatusCode},
    response::IntoResponse,
};
use chrono::Utc;

async fn check_user_exists(state: &AppState, user_id: &i32) -> bool {
    let user_existence = state
        .db_client
        .query_one(
            "SELECT COUNT(*) FROM users WHERE id = $1",
            &[user_id],
        )
        .await;

    match user_existence {
        Ok(row) => {
            let user_count: i64 = row.get(0);
            eprintln!("User count: {}", user_count);
            user_count > 0
        }
        Err(err) => {
            eprintln!("Database error: {:?}", err);
            false
        }
    }
}

pub async fn report_entity(
    State(state): State<AppState>,
    headers: HeaderMap,
    Json(payload): Json<ReportEntityRequest>, // Axum сам обработает ошибку JSON
) -> impl IntoResponse {
    if headers.get("session-token").is_none() {
        return (
            StatusCode::UNAUTHORIZED,
            "Missing session-token header",
        )
            .into_response();
    }

    let Some(user_id) = payload.user_id else {
        return (
            StatusCode::BAD_REQUEST,
            "Missing user_id field",
        )
            .into_response();
    };

    if !check_user_exists(&state, &user_id).await {
        return (
            StatusCode::BAD_REQUEST,
            "User doesn't exist",
        )
            .into_response();
    }

    let created_at = Utc::now().timestamp();

    let result = state
        .db_client
        .execute(
            "INSERT INTO reports (user_id, reported_entity, entity_id, reason, details, created_at)
             VALUES ($1, $2, $3, $4, $5, $6)",
            &[
                &user_id,
                &payload.object_type,
                &payload.object_id,
                &payload.reason,
                &payload.details,
                &created_at,
            ],
        )
        .await;

    match result {
        Ok(_) => (StatusCode::OK, "Жалоба успешно отправлена").into_response(),
        Err(_) => (
            StatusCode::INTERNAL_SERVER_ERROR,
            "Internal Server Error",
        )
            .into_response(),
    }
}


pub async fn get_entity_reports(
    State(state): State<AppState>,
    headers: HeaderMap,
    Query(params): Query<GetReportsParams>,
) -> impl IntoResponse {
    if headers.get("session-token").is_none() {
        return (
            StatusCode::UNAUTHORIZED,
            "Missing session-token header",
        )
            .into_response();
    }

    let page_number = params.page_number.unwrap_or(1).max(1);
    let per_page = params.per_page.unwrap_or(10).clamp(1, 100);
    let offset = (page_number - 1) * per_page;

    let status = match params.status.as_deref() {
        Some("opened") => ReportStatus::Opened,
        Some("closed") => ReportStatus::Closed,
        _ => {
            return (
                StatusCode::BAD_REQUEST,
                "Invalid or missing status parameter",
            )
                .into_response();
        }
    };

    let total_reports_row = state
        .db_client
        .query_one(
            "SELECT COUNT(*) FROM reports WHERE status = $1",
            &[&status],
        )
        .await;

    let total_reports: i64 = match total_reports_row {
        Ok(row) => row.get(0),
        Err(_) => {
            return (
                StatusCode::INTERNAL_SERVER_ERROR,
                "Internal Server Error",
            )
                .into_response();
        }
    };

    let total_pages = (total_reports + per_page - 1) / per_page;

    let reports_rows = state
        .db_client
        .query(
            "SELECT report_id, user_id, reported_entity, entity_id, reason, details, created_at, closed_at, status, resolution
             FROM reports WHERE status = $1 ORDER BY created_at DESC LIMIT $2 OFFSET $3",
            &[&status, &per_page, &offset],
        )
        .await;

    let reports = match reports_rows {
        Ok(rows) => rows
            .into_iter()
            .map(|row| EntityReport {
                report_id: row.get("report_id"),
                user_id: row.get("user_id"),
                reported_entity: row.get("reported_entity"),
                entity_id: row.get("entity_id"),
                reason: row.get("reason"),
                details: row.get("details"),
                created_at: row.get("created_at"),
                closed_at: row.get("closed_at"),
                status: row.get("status"),
                resolution: row.get("resolution"),
            })
            .collect(),
        Err(_) => {
            return (
                StatusCode::INTERNAL_SERVER_ERROR,
                "Internal Server Error",
            )
                .into_response();
        }
    };

    let mut response_headers = HeaderMap::new();
    response_headers.insert(
        "pagination-current-page",
        page_number.to_string().parse().unwrap(),
    );
    response_headers.insert(
        "pagination-total-elements",
        total_reports.to_string().parse().unwrap(),
    );
    response_headers.insert(
        "pagination-per-page",
        per_page.to_string().parse().unwrap(),
    );
    response_headers.insert(
        "pagination-total-pages",
        total_pages.to_string().parse().unwrap(),
    );

    let response_body = ReportEntityResponse { reports };

    (response_headers, Json(response_body)).into_response()
}

pub async fn resolve_entity_report(
    State(state): State<AppState>,
    headers: HeaderMap,
    Json(payload): Json<ResolveEntityReportRequest>,
) -> impl IntoResponse {
    if headers.get("session-token").is_none() {
        return (
            StatusCode::UNAUTHORIZED,
            "Missing session-token header",
        )
            .into_response();
    }

    let closed_at = Utc::now().timestamp();

    let result = state
        .db_client
        .execute(
            "UPDATE reports SET status = 'closed', resolution = $1, closed_at = $2 WHERE report_id = $3",
            &[&payload.resolution, &closed_at, &payload.report_id],
        )
        .await;

    match result {
        Ok(_) => (StatusCode::OK, "Жалоба успешно закрыта").into_response(),
        Err(_) => (
            StatusCode::INTERNAL_SERVER_ERROR,
            "Internal Server Error",
        )
            .into_response(),
    }
}

pub async fn report_bug(
    State(state): State<AppState>,
    headers: HeaderMap,
    Json(payload): Json<ReportBugRequest>,
) -> impl IntoResponse {
    if headers.get("session-token").is_none() {
        return (
            StatusCode::UNAUTHORIZED,
            "Missing session-token header",
        )
            .into_response();
    }

    let created_at = Utc::now().timestamp();

    let result = state
        .db_client
        .execute(
            "INSERT INTO bug_reports (user_id, details, created_at)
             VALUES ($1, $2, $3)",
            &[&payload.user_id, &payload.description, &created_at],
        )
        .await;

    match result {
        Ok(_) => (StatusCode::OK, "Отчёт об ошибке успешно отправлен").into_response(),
        Err(_) => (
            StatusCode::INTERNAL_SERVER_ERROR,
            "Internal Server Error",
        )
            .into_response(),
    }
}

pub async fn get_bug_reports(
    State(state): State<AppState>,
    headers: HeaderMap,
    Query(params): Query<GetReportsParams>,
) -> impl IntoResponse {
    if headers.get("session-token").is_none() {
        return (
            StatusCode::UNAUTHORIZED,
            "Missing session-token header",
        )
            .into_response();
    }

    let page_number = params.page_number.unwrap_or(1).max(1);
    let per_page = params.per_page.unwrap_or(10).clamp(1, 100);
    let offset = (page_number - 1) * per_page;

    let total_reports_row = state
        .db_client
        .query_one("SELECT COUNT(*) FROM bug_reports", &[])
        .await;

    let total_reports: i64 = match total_reports_row {
        Ok(row) => row.get(0),
        Err(_) => {
            return (
                StatusCode::INTERNAL_SERVER_ERROR,
                "Internal Server Error",
            )
                .into_response();
        }
    };

    let total_pages = (total_reports + per_page - 1) / per_page;

    let reports_rows = state
        .db_client
        .query(
            "SELECT bug_report_id, user_id, details, status, created_at, closed_at, resolution
             FROM bug_reports ORDER BY created_at DESC LIMIT $1 OFFSET $2",
            &[&per_page, &offset],
        )
        .await;

    let bug_reports = match reports_rows {
        Ok(rows) => rows
            .into_iter()
            .map(|row| BugReport {
                bug_report_id: row.get("bug_report_id"),
                user_id: row.get("user_id"),
                details: row.get("details"),
                status: row.get("status"),
                created_at: row.get("created_at"),
                closed_at: row.get("closed_at"),
                resolution: row.get("resolution"),
            })
            .collect(),
        Err(_) => {
            return (
                StatusCode::INTERNAL_SERVER_ERROR,
                "Internal Server Error",
            )
                .into_response();
        }
    };

    let mut response_headers = HeaderMap::new();
    response_headers.insert(
        "pagination-current-page",
        page_number.to_string().parse().unwrap(),
    );
    response_headers.insert(
        "pagination-total-elements",
        total_reports.to_string().parse().unwrap(),
    );
    response_headers.insert(
        "pagination-per-page",
        per_page.to_string().parse().unwrap(),
    );
    response_headers.insert(
        "pagination-total-pages",
        total_pages.to_string().parse().unwrap(),
    );

    let response_body = BugReportResponse { bug_reports };

    (response_headers, Json(response_body)).into_response()
}

pub async fn resolve_bug_report(
    State(state): State<AppState>,
    headers: HeaderMap,
    Json(payload): Json<ResolveBugReportRequest>,
) -> impl IntoResponse {
    if headers.get("session-token").is_none() {
        return (
            StatusCode::UNAUTHORIZED,
            "Missing session-token header",
        )
            .into_response();
    }

    let closed_at = Utc::now().timestamp();

    let result = state
        .db_client
        .execute(
            "UPDATE bug_reports SET status = 'closed', resolution = $1, closed_at = $2 WHERE bug_report_id = $3",
            &[&payload.resolution, &closed_at, &payload.report_id],
        )
        .await;

    match result {
        Ok(_) => (StatusCode::OK, "Баг-репорт успешно закрыт").into_response(),
        Err(_) => (
            StatusCode::INTERNAL_SERVER_ERROR,
            "Internal Server Error",
        )
            .into_response(),
    }
}

pub async fn get_routes_for_moderation(
    State(state): State<AppState>,
    headers: HeaderMap,
    Query(params): Query<GetRoutesParams>,
) -> impl IntoResponse {
    if headers.get("session-token").is_none() {
        return (
            StatusCode::UNAUTHORIZED,
            "Missing session-token header",
        )
            .into_response();
    }

    let page_number = params.page_number.unwrap_or(1).max(1);
    let per_page = params.per_page.unwrap_or(10).clamp(1, 100);
    let offset = (page_number - 1) * per_page;

    // Изменяем сопоставление статуса на строку
    let status_str = match params.status.as_deref() {
        Some("pending") => "pending",
        Some("approved") => "approved",
        Some("rejected") => "rejected",
        _ => {
            return (
                StatusCode::BAD_REQUEST,
                "Invalid or missing status parameter",
            )
                .into_response();
        }
    };

    let total_routes_row = state
        .db_client
        .query_one(
            "SELECT COUNT(*) FROM routes WHERE status::text = $1",
            &[&status_str],
        )
        .await;

    let total_routes: i64 = match total_routes_row {
        Ok(row) => row.get(0),
        Err(_) => {
            return (
                StatusCode::INTERNAL_SERVER_ERROR,
                "Internal Server Error",
            )
                .into_response();
        }
    };

    let total_pages = (total_routes + per_page - 1) / per_page;

    let routes_rows = state
        .db_client
        .query(
            "SELECT route_id, user_id, name, url, description, length, duration, tags::text[] AS tags, category::text AS category, created_at, status::text AS status, is_deleted, rating, images 
             FROM routes 
             WHERE status::text = $1 
             ORDER BY created_at DESC 
             LIMIT $2 OFFSET $3",
            &[&status_str, &per_page, &offset],
        )
        .await;

    let mut routes_for_moderation = Vec::new();

    match routes_rows {
        Ok(rows) => {
            for route_row in rows {
                let route = Route {
                    route_id: route_row.get("route_id"),
                    user_id: route_row.get("user_id"),
                    name: route_row.get("name"),
                    url: route_row.get("url"),
                    description: route_row.get("description"),
                    length: route_row.get("length"),
                    duration: route_row.get("duration"),
                    tags: route_row.get("tags"), // Option<Vec<String>>
                    category: route_row.get("category"), // String
                    created_at: route_row.get("created_at"),
                    status: route_row.get("status"), // String
                    is_deleted: route_row.get("is_deleted"),
                    rating: route_row.get("rating"),
                    images: route_row.get("images"),
                };

                let user_row = state
                    .db_client
                    .query_one(
                        "SELECT user_id, name, avatar_url FROM users WHERE user_id = $1",
                        &[&route.user_id],
                    )
                    .await;

                let user = match user_row {
                    Ok(user_row) => User {
                        user_id: user_row.get("user_id"),
                        name: user_row.get("name"),
                        image_url: user_row.get("avatar_url"),
                    },
                    Err(_) => {
                        return (
                            StatusCode::INTERNAL_SERVER_ERROR,
                            "Internal Server Error",
                        )
                            .into_response();
                    }
                };

                let points_rows = state
                    .db_client
                    .query(
                        "SELECT rp.point_id, ST_X(rp.coordinate::geometry) AS longitude, ST_Y(rp.coordinate::geometry) AS latitude, rp.time_offset, rp.elevation, rp.speed, rpi.point_description, rpi.images
                         FROM route_points rp
                         LEFT JOIN route_points_info rpi ON rp.point_id = rpi.point_id
                         WHERE rp.route_id = $1",
                        &[&route.route_id],
                    )
                    .await;

                let points = match points_rows {
                    Ok(rows) => rows
                        .into_iter()
                        .map(|row| RoutePoint {
                            point_id: row.get("point_id"),
                            coordinate: PointCoordinate {
                                latitude: row.get("latitude"),
                                longitude: row.get("longitude"),
                            },
                            time_offset: row.get("time_offset"),
                            elevation: row.get("elevation"),
                            speed: row.get("speed"),
                            point_description: row.get("point_description"),
                            images: row.get("images"),
                        })
                        .collect(),
                    Err(_) => {
                        return (
                            StatusCode::INTERNAL_SERVER_ERROR,
                            "Internal Server Error",
                        )
                            .into_response();
                    }
                };

                routes_for_moderation.push(RouteForModeration {
                    user,
                    route,
                    points,
                });
            }
        }
        Err(_) => {
            return (
                StatusCode::INTERNAL_SERVER_ERROR,
                "Internal Server Error",
            )
                .into_response();
        }
    }

    let mut response_headers = HeaderMap::new();
    response_headers.insert(
        "pagination-current-page",
        page_number.to_string().parse().unwrap(),
    );
    response_headers.insert(
        "pagination-total-elements",
        total_routes.to_string().parse().unwrap(),
    );
    response_headers.insert(
        "pagination-per-page",
        per_page.to_string().parse().unwrap(),
    );
    response_headers.insert(
        "pagination-total-pages",
        total_pages.to_string().parse().unwrap(),
    );

    let response_body = RoutesForModerationResponse {
        routes: routes_for_moderation,
    };

    (response_headers, Json(response_body)).into_response()
}


pub async fn approve_route(
    State(state): State<AppState>,
    headers: HeaderMap,
    Json(payload): Json<ApproveRouteRequest>,
) -> impl IntoResponse {
    if headers.get("session-token").is_none() {
        return (
            StatusCode::UNAUTHORIZED,
            "Missing session-token header",
        )
            .into_response();
    }

    if payload.object_type != EntityType::Route {
        return (
            StatusCode::BAD_REQUEST,
            "Invalid object_type, expected 'route'",
        )
            .into_response();
    }

    let result = state
        .db_client
        .execute(
            "UPDATE routes SET status = 'approved' WHERE route_id = $1",
            &[&payload.object_id],
        )
        .await;

    match result {
        Ok(_) => (StatusCode::OK, "Маршрут успешно одобрен").into_response(),
        Err(_) => (
            StatusCode::INTERNAL_SERVER_ERROR,
            "Internal Server Error",
        )
            .into_response(),
    }
}

pub async fn reject_route(
    State(state): State<AppState>,
    headers: HeaderMap,
    Json(payload): Json<RejectRouteRequest>,
) -> impl IntoResponse {
    if headers.get("session-token").is_none() {
        return (
            StatusCode::UNAUTHORIZED,
            "Missing session-token header",
        )
            .into_response();
    }

    if payload.object_type != EntityType::Route {
        return (
            StatusCode::BAD_REQUEST,
            "Invalid object_type, expected 'route'",
        )
            .into_response();
    }

    let result = state
        .db_client
        .execute(
            "UPDATE routes SET status = 'rejected' WHERE route_id = $1",
            &[&payload.object_id],
        )
        .await;

    match result {
        Ok(_) => (StatusCode::OK, "Маршрут отклонён").into_response(),
        Err(_) => (
            StatusCode::INTERNAL_SERVER_ERROR,
            "Internal Server Error",
        )
            .into_response(),
    }
}

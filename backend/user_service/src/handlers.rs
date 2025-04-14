use crate::models::*;
use crate::auth::authenticate_request;
use axum::{
    extract::{Path, State, Json},
    response::IntoResponse,
};
use axum_extra::extract::CookieJar;
use tokio_postgres::Client;
use chrono::TimeZone;
use redis::AsyncCommands;

#[derive(Debug)]
enum MyError {
    NotFound,
    DbError(tokio_postgres::Error),
}

pub async fn get_me(
    cookies: CookieJar,
    State(state): State<AppState>,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return axum::http::StatusCode::UNAUTHORIZED.into_response(),
    };

    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return axum::http::StatusCode::UNAUTHORIZED.into_response(),
    };

    match state.db_client.query_one(
        "SELECT username FROM users WHERE user_id = $1 AND is_deleted = FALSE",
        &[&user_id],
    ).await {
        Ok(row) => {
            let username: String = row.get("username");
            axum::Json(serde_json::json!({
                "user_id": user_id,
                "username": username
            })).into_response()
        },
        Err(e) => {
            eprintln!("Error fetching username: {}", e);
            axum::http::StatusCode::INTERNAL_SERVER_ERROR.into_response()
        }
    }
}

pub async fn get_user_profile(
    State(state): State<AppState>,
    Path(username): Path<String>,
) -> impl IntoResponse {
    match fetch_public_user_profile(&state.db_client, &username).await {
        Ok(profile) => axum::Json(profile).into_response(),
        Err(MyError::NotFound) => axum::http::StatusCode::NOT_FOUND.into_response(),
        Err(MyError::DbError(e)) => {
            eprintln!("Error fetching user profile: {}", e);
            axum::http::StatusCode::INTERNAL_SERVER_ERROR.into_response()
        }
    }
}

pub async fn delete_user_profile(
    cookies: CookieJar,
    State(state): State<AppState>,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return axum::http::StatusCode::UNAUTHORIZED.into_response(),
    };

    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return axum::http::StatusCode::UNAUTHORIZED.into_response(),
    };

    let result = state.db_client.execute(
        "UPDATE users SET is_deleted = TRUE WHERE user_id = $1",
        &[&user_id],
    ).await;

    match result {
        Ok(updated) => {
            if updated == 1 {
                let mut redis_conn = match state.redis_client.get_async_connection().await {
                    Ok(conn) => conn,
                    Err(e) => {
                        eprintln!("Redis connection error: {}", e);
                        return axum::http::StatusCode::INTERNAL_SERVER_ERROR.into_response();
                    }
                };

                let redis_key = format!("user:{}", user_id);
                if let Err(e) = redis_conn.del::<_, ()>(&redis_key).await {
                    eprintln!("Failed to delete Redis key {}: {}", redis_key, e);
                }

                axum::http::StatusCode::OK.into_response()
            } else {
                axum::http::StatusCode::NOT_FOUND.into_response()
            }
        },
        Err(e) => {
            eprintln!("Error deleting user profile: {}", e);
            axum::http::StatusCode::INTERNAL_SERVER_ERROR.into_response()
        }
    }
}

pub async fn get_user_settings(
    cookies: CookieJar,
    State(state): State<AppState>,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return axum::http::StatusCode::UNAUTHORIZED.into_response(),
    };

    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return axum::http::StatusCode::UNAUTHORIZED.into_response(),
    };

    let row_opt = state.db_client.query_opt(
        "SELECT show_phone, show_planned, show_visited FROM user_settings WHERE user_id = $1",
        &[&user_id],
    ).await;
    match row_opt {
        Ok(Some(row)) => {
            let settings = UserSettings {
                show_phone: row.get("show_phone"),
                show_planned: row.get("show_planned"),
                show_visited: row.get("show_visited"),
            };
            axum::Json(settings).into_response()
        },
        Ok(None) => axum::http::StatusCode::NOT_FOUND.into_response(),
        Err(e) => {
            eprintln!("Error fetching user settings: {}", e);
            axum::http::StatusCode::INTERNAL_SERVER_ERROR.into_response()
        }
    }
}

pub async fn update_user_settings(
    cookies: CookieJar,
    State(state): State<AppState>,
    Json(payload): Json<UserSettingsUpdate>,
) -> impl IntoResponse {
    let session_token = match cookies.get("session_token") {
        Some(cookie) => cookie.value().to_string(),
        None => return axum::http::StatusCode::UNAUTHORIZED.into_response(),
    };

    let user_id = match authenticate_request(&session_token).await {
        Ok(id) => id,
        Err(_) => return axum::http::StatusCode::UNAUTHORIZED.into_response(),
    };

    let result = state.db_client.execute(
        "UPDATE user_settings SET show_phone = COALESCE($1, show_phone), show_planned = COALESCE($2, show_planned), show_visited = COALESCE($3, show_visited) WHERE user_id = $4",
        &[&payload.show_phone, &payload.show_planned, &payload.show_visited, &user_id],
    ).await;
    match result {
        Ok(_) => axum::http::StatusCode::OK.into_response(),
        Err(e) => {
            eprintln!("Error updating user settings: {}", e);
            axum::http::StatusCode::INTERNAL_SERVER_ERROR.into_response()
        }
    }
}

async fn fetch_public_user_profile(
    db_client: &Client,
    username: &str,
) -> Result<PublicUserProfileResponse, MyError> {
    let user_row = db_client
        .query_one(
            "SELECT user_id, username, name, surname, country, city, phone, avatar_url, bio, created_at, instagram, facebook, x, vkontakte, telegram, youtube, user_site 
             FROM users 
             WHERE username = $1 AND is_deleted = FALSE",
            &[&username],
        )
        .await
        .map_err(MyError::DbError)?;
        
    let user_id: i32 = user_row.get("user_id");
    let ts: i64 = user_row.get("created_at");
    let created_at = chrono::Utc.timestamp_opt(ts, 0).single().unwrap().naive_utc();

    let phone_visible = match db_client
        .query_opt("SELECT show_phone FROM user_settings WHERE user_id = $1", &[&user_id])
        .await
    {
        Ok(opt) => {
            if let Some(row) = opt {
                row.get::<_, bool>("show_phone")
            } else {
                false
            }
        },
        Err(e) => return Err(MyError::DbError(e)),
    };
    let phone: Option<String> = if phone_visible {
        user_row.get("phone")
    } else {
        None
    };

    let routes_rows = db_client
        .query(
            "SELECT route_id, name, url, description, length, duration, tags, category, created_at, status, rating, images 
             FROM routes 
             WHERE user_id = $1 AND is_deleted = FALSE",
            &[&user_id],
        )
        .await
        .map_err(MyError::DbError)?;
    let mut routes = Vec::new();
    for row in routes_rows {
        let ts: i64 = row.get("created_at");
        let created_at = chrono::Utc.timestamp_opt(ts, 0).single().unwrap().naive_utc();
        let route = Route {
            route_id: row.get("route_id"),
            name: row.get("name"),
            url: row.get("url"),
            description: row.get("description"),
            length: row.get("length"),
            duration: row.get("duration"),
            tags: row.get("tags"),
            category: row.get("category"),
            created_at,
            status: row.get("status"),
            rating: row.get("rating"),
            images: row.get("images"),
        };
        routes.push(route);
    }

    let collections_rows = db_client
        .query(
            "SELECT collection_id, name, rating, url, description, tags, created_at 
             FROM collections 
             WHERE user_id = $1 AND is_deleted = FALSE",
            &[&user_id],
        )
        .await
        .map_err(MyError::DbError)?;
    let mut collections = Vec::new();
    for row in collections_rows {
        let ts: i64 = row.get("created_at");
        let created_at = chrono::Utc.timestamp_opt(ts, 0).single().unwrap().naive_utc();
        let collection = Collection {
            collection_id: row.get("collection_id"),
            name: row.get("name"),
            rating: row.get("rating"),
            url: row.get("url"),
            description: row.get("description"),
            tags: row.get("tags"),
            created_at,
        };
        collections.push(collection);
    }

    let reviews_rows = db_client
        .query(
            "SELECT r.review_id, r.route_id, r.rating, r.comment, r.created_at, r.images 
             FROM reviews r
             INNER JOIN routes rt ON r.route_id = rt.route_id
             WHERE r.user_id = $1 
             AND r.is_deleted = FALSE 
             AND rt.is_deleted = FALSE",
            &[&user_id],
        )
        .await
        .map_err(MyError::DbError)?;
    let mut reviews = Vec::new();
    for row in reviews_rows {
        let ts: i64 = row.get("created_at");
        let created_at = chrono::Utc.timestamp_opt(ts, 0).single().unwrap().naive_utc();
        let review = Review {
            review_id: row.get("review_id"),
            route_id: row.get("route_id"),
            rating: row.get("rating"),
            comment: row.get("comment"),
            created_at,
            images: row.get("images"),
        };
        reviews.push(review);
    }

    let completed_rows = db_client
        .query(
            "SELECT route_id, completed_at 
             FROM completed_routes 
             WHERE user_id = $1",
            &[&user_id],
        )
        .await
        .map_err(MyError::DbError)?;
    let mut completed_routes = Vec::new();
    for row in completed_rows {
        let ts: i64 = row.get("completed_at");
        let completed_at = chrono::Utc.timestamp_opt(ts, 0).single().unwrap().naive_utc();
        let completed = CompletedRoute {
            route_id: row.get("route_id"),
            completed_at,
        };
        completed_routes.push(completed);
    }

    Ok(PublicUserProfileResponse {
        username: user_row.get("username"),
        name: user_row.get("name"),
        surname: user_row.get("surname"),
        country: user_row.get("country"),
        city: user_row.get("city"),
        avatar_url: user_row.get("avatar_url"),
        bio: user_row.get("bio"),
        phone,
        created_at,
        instagram: user_row.get("instagram"),
        facebook: user_row.get("facebook"),
        x: user_row.get("x"),
        vkontakte: user_row.get("vkontakte"),
        telegram: user_row.get("telegram"),
        youtube: user_row.get("youtube"),
        user_site: user_row.get("user_site"),
        routes,
        collections,
        reviews,
        completed_routes,
    })
}

pub async fn get_user_brief(
    State(state): State<AppState>,
    Path(user_id): Path<i32>,
) -> impl IntoResponse {
    match state.db_client.query_one(
        "SELECT user_id, username, name, surname, avatar_url FROM users WHERE user_id = $1 AND is_deleted = FALSE",
        &[&user_id],
    ).await {
        Ok(row) => {
            let brief = UserBriefResponse {
                user_id: row.get("user_id"),
                username: row.get("username"),
                name: row.get("name"),
                surname: row.get("surname"),
                avatar_url: row.get("avatar_url"),
            };
            axum::Json(brief).into_response()
        },
        Err(e) => {
            eprintln!("Error fetching user brief: {}", e);
            axum::http::StatusCode::INTERNAL_SERVER_ERROR.into_response()
        }
    }
}

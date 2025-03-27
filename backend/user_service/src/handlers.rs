use crate::models::*;
use axum::{
    extract::{Path, State, Json, Query},
    response::IntoResponse,
};
use tokio_postgres::{error::SqlState, Client};
use chrono::NaiveDateTime;

pub async fn get_user_profile(
    State(state): State<AppState>,
    Path(username): Path<String>,
) -> impl IntoResponse {
    match fetch_public_user_profile(&state.db_client, &username).await {
        Ok(profile) => Json(profile).into_response(),
        Err(MyError::NotFound) => axum::http::StatusCode::NOT_FOUND.into_response(),
        Err(MyError::DbError(e)) => {
            eprintln!("Error fetching user profile: {}", e);
            axum::http::StatusCode::INTERNAL_SERVER_ERROR.into_response()
        }
    }
}

pub async fn delete_user_profile(
    State(state): State<AppState>,
    Json(payload): Json<DeleteUserProfileRequest>,
) -> impl IntoResponse {
    let result = state.db_client.execute(
        "UPDATE users SET is_deleted = TRUE WHERE username = $1",
        &[&payload.username],
    ).await;
    match result {
        Ok(updated) => {
            if updated == 1 {
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

// pub async fn get_user_settings(
//     State(state): State<AppState>,
//     Query(query): Query<GetUserSettingsQuery>,
// ) -> impl IntoResponse {
//     let row_opt = state.db_client.query_opt(
//         "SELECT show_phone, show_planned, show_visited FROM user_settings WHERE user_id = $1",
//         &[&query.user_id],
//     ).await;
//     match row_opt {
//         Ok(Some(row)) => {
//             let settings = UserSettings {
//                 show_phone: row.get("show_phone"),
//                 show_planned: row.get("show_planned"),
//                 show_visited: row.get("show_visited"),
//             };
//             Json(settings).into_response()
//         },
//         Ok(None) => axum::http::StatusCode::NOT_FOUND.into_response(),
//         Err(e) => {
//             eprintln!("Error fetching user settings: {}", e);
//             axum::http::StatusCode::INTERNAL_SERVER_ERROR.into_response()
//         }
//     }
// }

// pub async fn update_user_settings(
//     State(state): State<AppState>,
//     Json(payload): Json<UserSettingsUpdate>,
// ) -> impl IntoResponse {
//     let result = state.db_client.execute(
//         "UPDATE user_settings SET show_phone = COALESCE($1, show_phone), show_planned = COALESCE($2, show_planned), show_visited = COALESCE($3, show_visited) WHERE user_id = $4",
//         &[&payload.show_phone, &payload.show_planned, &payload.show_visited, &payload.user_id],
//     ).await;
//     match result {
//         Ok(_) => axum::http::StatusCode::OK.into_response(),
//         Err(e) => {
//             eprintln!("Error updating user settings: {}", e);
//             axum::http::StatusCode::INTERNAL_SERVER_ERROR.into_response()
//         }
//     }
// }

#[derive(Debug)]
enum MyError {
    NotFound,
    DbError(tokio_postgres::Error),
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
    let created_at = NaiveDateTime::from_timestamp(ts, 0);

    // Определяем, показывать ли телефон (на основе user_settings)
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

    // Получаем маршруты пользователя
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
        let route_id: i32 = row.get("route_id");
        let ts: i64 = row.get("created_at");
        let created_at = NaiveDateTime::from_timestamp(ts, 0);
        let route = Route {
            route_id,
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

    // Получаем подборки пользователя
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
        let collection_id: i32 = row.get("collection_id");
        let ts: i64 = row.get("created_at");
        let created_at = NaiveDateTime::from_timestamp(ts, 0);
        let collection = Collection {
            collection_id,
            name: row.get("name"),
            rating: row.get("rating"),
            url: row.get("url"),
            description: row.get("description"),
            tags: row.get("tags"),
            created_at,
        };
        collections.push(collection);
    }

    // Получаем отзывы пользователя
    let reviews_rows = db_client
        .query(
            "SELECT review_id, route_id, rating, comment, created_at, images 
             FROM reviews 
             WHERE user_id = $1 AND is_deleted = FALSE",
            &[&user_id],
        )
        .await
        .map_err(MyError::DbError)?;
    let mut reviews = Vec::new();
    for row in reviews_rows {
        let review_id: i32 = row.get("review_id");
        let ts: i64 = row.get("created_at");
        let created_at = NaiveDateTime::from_timestamp(ts, 0);
        let review = Review {
            review_id,
            route_id: row.get("route_id"),
            rating: row.get("rating"),
            comment: row.get("comment"),
            created_at,
            images: row.get("images"),
        };
        reviews.push(review);
    }

    // Получаем завершённые маршруты пользователя
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
        let completed_at = NaiveDateTime::from_timestamp(ts, 0);
        let completed = CompletedRoute {
            route_id: row.get("route_id"),
            completed_at,
        };
        completed_routes.push(completed);
    }

    Ok(PublicUserProfileResponse {
        user_id,
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

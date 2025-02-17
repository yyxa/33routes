use crate::models::*;
use axum::{
    extract::{Path, State},
    response::IntoResponse,
    Json,
};
use tokio_postgres::{error::SqlState, Client};

pub async fn get_user_profile(
    State(state): State<AppState>,
    Path(username): Path<String>,
) -> impl IntoResponse {
    match fetch_user_profile(&state.db_client, &username).await {
        Ok(user_profile) => Json::<UserProfileResponse>(user_profile).into_response(),
        Err(MyError::NotFound) => axum::http::StatusCode::NOT_FOUND.into_response(),
        Err(MyError::DbError(e)) => {
            eprintln!("Error fetching user profile: {}", e);
            axum::http::StatusCode::INTERNAL_SERVER_ERROR.into_response()
        }
    }
}

#[derive(Debug)]
enum MyError {
    NotFound,
    DbError(tokio_postgres::Error),
}

async fn fetch_user_profile(
    db_client: &Client,
    username: &str,
) -> Result<UserProfileResponse, MyError> {
    let row = db_client
        .query_one(
            "SELECT user_id, username, name, surname, country, city, instagram, facebook, x, vkontakte, telegram, youtube, user_site, avatar_url, bio, created_at 
             FROM users 
             WHERE username = $1 AND is_deleted = FALSE",
            &[&username],
        )
        .await
        .map_err(|e| {
            if let Some(code) = e.code() {
                if code == &SqlState::NO_DATA_FOUND {
                    MyError::NotFound
                } else {
                    MyError::DbError(e)
                }
            } else {
                MyError::DbError(e)
            }
        })?;
    

        let fullname = match row.get::<&str, Option<String>>("surname") {
            Some(surname) => format!("{} {}", row.get::<&str, String>("name"), surname),
            None => row.get::<&str, String>("name"), 
        };

        let created_at: chrono::DateTime<Utc> = row.get("created_at");
        let created_at_naive = created_at.naive_utc();
    
        let user_profile = UserProfileResponse {
            user_id: row.get("user_id"),
            username: row.get("username"),
            fullname: Some(fullname), 
            country: row.get::<&str, Option<String>>("country"), 
            city: row.get::<&str, Option<String>>("city"), 
            instagram: row.get::<&str, Option<String>>("instagram"),
            facebook: row.get::<&str, Option<String>>("facebook"),
            x: row.get::<&str, Option<String>>("x"),
            vkontakte: row.get::<&str, Option<String>>("vkontakte"),
            telegram: row.get::<&str, Option<String>>("telegram"),
            youtube: row.get::<&str, Option<String>>("youtube"),
            user_site: row.get::<&str, Option<String>>("user_site"),
            avatar_url: row.get::<&str, Option<String>>("avatar_url"),
            bio: row.get::<&str, Option<String>>("bio"),
            created_at: created_at_naive,
        };
    
        Ok(user_profile)
    }

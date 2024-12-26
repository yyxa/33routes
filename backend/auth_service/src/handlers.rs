use axum::{
    extract::{Json, Query, State},
    http::{HeaderMap, StatusCode},
    response::IntoResponse,
};
use std::env;

use crate::models::{
    AppState,
    RegisterRequest, RegisterResponse,
    LoginRequest, LoginResponse,
    VkAuthParams, VkTokenResponse,
};

use redis::{AsyncCommands, Cmd};
use bcrypt::{hash, verify};
use uuid::Uuid;
use chrono::Utc;
use serde_json::json;
use rand::Rng;

async fn generate_unique_username(state: &AppState, base_username: &str) -> String {
    let mut username = base_username.to_string();
    let mut counter = 1;

    loop {
        let select_sql = r#"
            SELECT user_id
            FROM users
            WHERE username = $1
        "#;

        let row_opt = match state.db_client.query_opt(select_sql, &[&username]).await {
            Ok(r) => r,
            Err(e) => {
                eprintln!("DB error: {}", e);
                return "error".to_string();
            }
        };

        if row_opt.is_none() {
            break;
        }

        username = format!("{}{}", base_username, counter);
        counter += 1;
    }

    username
}

pub async fn register_user(
    State(state): State<AppState>,
    Json(body): Json<RegisterRequest>,
) -> impl IntoResponse {
    let hashed_password = match hash(&body.password, 4) {
        Ok(h) => h,
        Err(e) => {
            eprintln!("bcrypt error: {}", e);
            return (StatusCode::INTERNAL_SERVER_ERROR, "Fail to hash password").into_response();
        }
    };

    let query = r#"
        INSERT INTO users (
            username, email, password_hash, name, created_at, is_deleted
        )
        VALUES ($1, $2, $3, $4, $5, FALSE)
        RETURNING user_id
    "#;
    let created_at = Utc::now().timestamp();

    let row = match state.db_client.query_one(
        query,
        &[
            &body.username,
            &body.email,
            &hashed_password,
            &body.username,
            &created_at,
        ],
    ).await {
        Ok(r) => r,
        Err(e) => {
            eprintln!("DB error: {}", e);
            return (StatusCode::CONFLICT, "User may already exist").into_response();
        }
    };

    let user_id: i32 = row.get("user_id");

    let token = Uuid::new_v4().to_string();

    let mut con = match state.redis_client.get_multiplexed_async_connection().await {
        Ok(c) => c,
        Err(e) => {
            eprintln!("Redis connection error: {}", e);
            return (StatusCode::INTERNAL_SERVER_ERROR, "Redis connection failed").into_response();
        }
    };

    let token_key = format!("token:{}", token);

    if let Err(e) = Cmd::set(token_key, user_id.to_string())
        .query_async::<()>(&mut con)
        .await
    {
        eprintln!("Redis set error: {}", e);
        return (StatusCode::INTERNAL_SERVER_ERROR, "Redis set error").into_response();
    }

    let resp = RegisterResponse {
        user_id,
        token,
    };
    (StatusCode::CREATED, Json(resp)).into_response()
}

pub async fn login_user(
    State(state): State<AppState>,
    Json(body): Json<LoginRequest>,
) -> impl IntoResponse {
    let row_opt = match state.db_client.query_opt(
        "SELECT user_id, password_hash FROM users WHERE email = $1 AND is_deleted = FALSE",
        &[&body.email],
    ).await {
        Ok(r) => r,
        Err(e) => {
            eprintln!("DB error: {}", e);
            return (StatusCode::INTERNAL_SERVER_ERROR, "DB error").into_response();
        }
    };

    let row = match row_opt {
        Some(r) => r,
        None => {
            return (StatusCode::UNAUTHORIZED, "No such user").into_response();
        }
    };

    let db_user_id: i32 = row.get("user_id");
    let db_pass_hash: String = row.get("password_hash");

    match verify(&body.password, &db_pass_hash) {
        Ok(true) => { /* пароль совпал */ }
        Ok(false) => {
            return (StatusCode::UNAUTHORIZED, "Wrong password").into_response();
        }
        Err(e) => {
            eprintln!("bcrypt verify error: {}", e);
            return (StatusCode::INTERNAL_SERVER_ERROR, "bcrypt error").into_response();
        }
    }

    let token = Uuid::new_v4().to_string();
    let refresh_token = Uuid::new_v4().to_string();

    let mut con = match state.redis_client.get_multiplexed_async_connection().await {
        Ok(c) => c,
        Err(e) => {
            eprintln!("Redis conn error: {}", e);
            return (StatusCode::INTERNAL_SERVER_ERROR, "Redis connection failed").into_response();
        }
    };

    if let Err(e) = con
        .set::<String, String, ()>(format!("token:{}", token), db_user_id.to_string())
        .await
    {
        eprintln!("Redis set error: {}", e);
        return (StatusCode::INTERNAL_SERVER_ERROR, "Redis set error").into_response();
    }

    if let Err(e) = con
        .set::<String, String, ()>(format!("token:{}", refresh_token), db_user_id.to_string())
        .await
    {
        eprintln!("Redis set error: {}", e);
        return (StatusCode::INTERNAL_SERVER_ERROR, "Redis set error").into_response();
    }

    let resp = LoginResponse {
        token,
        refresh_token,
    };
    (StatusCode::OK, Json(resp)).into_response()
}

pub async fn check_token(
    State(state): State<AppState>,
    headers: HeaderMap,
) -> impl IntoResponse {
    let session_token = match headers.get("session-token") {
        Some(val) => match val.to_str() {
            Ok(s) if !s.is_empty() => s.to_string(),
            _ => return (StatusCode::BAD_REQUEST, "Invalid session-token").into_response(),
        },
        None => {
            return (StatusCode::BAD_REQUEST, "Missing session-token").into_response();
        }
    };

    let mut con = match state.redis_client.get_multiplexed_async_connection().await {
        Ok(c) => c,
        Err(e) => {
            eprintln!("Redis error: {}", e);
            return (StatusCode::INTERNAL_SERVER_ERROR, "Redis conn error").into_response();
        }
    };

    let token_key = format!("token:{}", session_token);
    let user_id_opt: Option<String> = match con.get(token_key).await {
        Ok(v) => v,
        Err(e) => {
            eprintln!("Redis get error: {}", e);
            return (StatusCode::INTERNAL_SERVER_ERROR, "Redis get error").into_response();
        }
    };

    match user_id_opt {
        Some(uid) => {
            let body = json!({
                "status": "ok",
                "user_id": uid,
            });
            (StatusCode::OK, Json(body)).into_response()
        }
        None => {
            (StatusCode::UNAUTHORIZED, "Invalid token").into_response()
        }
    }
}

pub async fn login_via_vk(
    State(state): State<AppState>,
    Query(params): Query<VkAuthParams>,
) -> impl IntoResponse {
    println!("{}", params.code);
    let client_id = match env::var("VK_CLIENT_ID") {
        Ok(v) => v,
        Err(_) => {
            return (StatusCode::INTERNAL_SERVER_ERROR, "VK_CLIENT_ID not set").into_response();
        }
    };
    let client_secret = match env::var("VK_CLIENT_SECRET") {
        Ok(v) => v,
        Err(_) => {
            return (StatusCode::INTERNAL_SERVER_ERROR, "VK_CLIENT_SECRET not set").into_response();
        }
    };
    let redirect_uri = match env::var("VK_REDIRECT_URI") {
        Ok(v) => v,
        Err(_) => {
            return (StatusCode::INTERNAL_SERVER_ERROR, "VK_REDIRECT_URI not set").into_response();
        }
    };

    let url = format!(
        "https://oauth.vk.com/access_token?client_id={}&client_secret={}&redirect_uri={}&code={}",
        client_id, client_secret, redirect_uri, params.code
    );

    let vk_res = match reqwest::get(&url).await {
        Ok(resp) => resp,
        Err(e) => {
            eprintln!("Reqwest error: {}", e);
            return (StatusCode::UNAUTHORIZED, "Failed request to VK").into_response();
        }
    };

    println!("{:?}", vk_res);

    let vk_json: VkTokenResponse = match vk_res.json().await {
        Ok(json) => json,
        Err(e) => {
            eprintln!("VK JSON parse error: {}", e);
            return (StatusCode::UNAUTHORIZED, "Failed parse VK response").into_response();
        }
    };

    let vk_user_id = vk_json.user_id;
    let user_email = vk_json.email.unwrap_or_default();

    let select_sql = r#"
        SELECT user_id
        FROM users
        WHERE vk_id = $1
           OR email = $2
    "#;

    let row_opt = match state.db_client.query_opt(select_sql, &[&vk_user_id, &user_email]).await {
        Ok(r) => r,
        Err(e) => {
            eprintln!("DB error: {}", e);
            return (StatusCode::INTERNAL_SERVER_ERROR, "DB error").into_response();
        }
    };

    let db_user_id: i32 = if let Some(r) = row_opt {
        r.get("user_id")
    } else {
        let base_username = user_email.split('@').next().unwrap_or("user");
        let username = generate_unique_username(&state, base_username).await;

        let insert_sql = r#"
            INSERT INTO users (email, vk_id, username, created_at, is_deleted)
            VALUES ($1, $2, $3, $4, FALSE)
            RETURNING user_id
        "#;
        let created_at = Utc::now().timestamp();
        let row = match state.db_client.query_one(insert_sql, &[&user_email, &vk_user_id, &username, &created_at]).await {
            Ok(rr) => rr,
            Err(e) => {
                eprintln!("DB insert error: {}", e);
                return (StatusCode::INTERNAL_SERVER_ERROR, "DB insert error").into_response();
            }
        };
        row.get("user_id")
    };

    let token = Uuid::new_v4().to_string();
    let refresh_token = Uuid::new_v4().to_string();

    let mut con = match state.redis_client.get_multiplexed_async_connection().await {
        Ok(c) => c,
        Err(e) => {
            eprintln!("Redis conn error: {}", e);
            return (StatusCode::INTERNAL_SERVER_ERROR, "Redis error").into_response();
        }
    };

    if let Err(e) = Cmd::set(format!("token:{}", token), db_user_id.to_string())
        .query_async::<()>(&mut con)
        .await
    {
        eprintln!("Redis set error: {}", e);
        return (StatusCode::INTERNAL_SERVER_ERROR, "Redis set error").into_response();
    }

    if let Err(e) = con
        .set::<String, String, ()>(format!("token:{}", refresh_token), db_user_id.to_string())
        .await
    {
        eprintln!("Redis set error: {}", e);
        return (StatusCode::INTERNAL_SERVER_ERROR, "Redis set error").into_response();
    }

    let resp = LoginResponse {
        token,
        refresh_token,
    };
    (StatusCode::OK, Json(resp)).into_response()
}

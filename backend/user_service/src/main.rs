use axum::{
    routing::{get, delete},
    Router,
};
use dotenv::dotenv;
use std::sync::Arc;
use tokio_postgres::NoTls;
use axum_server::Server;
use tower_http::cors::{Any, CorsLayer};

mod handlers;
mod models;
mod auth;

#[tokio::main]
async fn main() {
    dotenv().ok();

    let (db_client, connection) = tokio_postgres::connect(
        &std::env::var("DATABASE_URL").expect("DATABASE_URL not set"),
        NoTls,
    )
    .await
    .expect("Failed to connect to the database");

    tokio::spawn(async move {
        if let Err(e) = connection.await {
            eprintln!("Database connection error: {}", e);
        }
    });

    let db_client = Arc::new(db_client);

    let redis_url = std::env::var("REDIS_URL").expect("REDIS_URL not set");
    let redis_client = redis::Client::open(redis_url).expect("Invalid Redis URL");

    let app_state = models::AppState {
        db_client: db_client.clone(),
        redis_client,
    };

    let cors = CorsLayer::new()
        .allow_origin(Any)
        .allow_methods(Any)
        .allow_headers(Any);

    let app = Router::new()
        .route("/api/user/{username}", get(handlers::get_user_profile))
        .route("/api/user/{user_id}/brief", get(handlers::get_user_brief))
        .route("/api/user/me", get(handlers::get_me))
        .route("/api/user/delete", delete(handlers::delete_user_profile))
        .route(
            "/api/user/settings",
            get(handlers::get_user_settings).put(handlers::update_user_settings),
        )
        .with_state(app_state)
        .layer(cors);

    Server::bind("0.0.0.0:8100".parse().unwrap())
        .serve(app.into_make_service())
        .await
        .unwrap();
}

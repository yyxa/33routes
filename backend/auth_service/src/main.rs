use axum::{
    routing::{get, post},
    Router,
};
use axum_server::Server;
use dotenv::dotenv;
use std::sync::Arc;
use tokio_postgres::NoTls;
use tower_http::cors::{Any, CorsLayer};

mod handlers;
mod models;

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

    let redis_client = redis::Client::open(
        std::env::var("REDIS_URL").expect("REDIS_URL not set")
    )
    .expect("Failed to create redis client");
    let redis_client = Arc::new(redis_client);

    let app_state = models::AppState {
        db_client: db_client.clone(),
        redis_client: redis_client.clone(),
    };

    let cors = CorsLayer::new()
        .allow_origin(Any)
        .allow_methods(Any)
        .allow_headers(Any);

    let app = Router::new()
        .route("/api/auth/register", post(handlers::register_user))
        .route("/api/auth/login", post(handlers::login_user))
        .route("/api/auth/check_token", get(handlers::check_token))
        .route("/api/auth/vk", post(handlers::login_via_vk))
        .with_state(app_state)
        .layer(cors);

    Server::bind("0.0.0.0:8100".parse().unwrap())
        .serve(app.into_make_service())
        .await
        .unwrap();
}

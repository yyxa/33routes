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
mod auth;
mod image;

#[tokio::main]
async fn main() {
    dotenv().ok();

    let (db_client, connection) = tokio_postgres::connect(
        &std::env::var("DATABASE_URL").expect("DATABASE_URL not set"), NoTls)
        .await
        .expect("Failed to connect to the database");

    tokio::spawn(async move {
        if let Err(e) = connection.await {
            eprintln!("Database connection error: {}", e);
        }
    });

    let db_client = Arc::new(db_client);

    let app_state = models::AppState {
        db_client: db_client.clone(),
    };

    let cors = CorsLayer::new()
        .allow_origin(Any)
        .allow_methods(Any)
        .allow_headers(Any);

    let app = Router::new()
        .route(
            "/api/comment/review/{review_id}/comments",
            get(handlers::get_comments),
        )
        .route(
            "/api/comment/review/{review_id}/comment",
            post(handlers::add_comment).delete(handlers::delete_comment),
        )
        .with_state(app_state)
        .layer(cors);

    Server::bind("0.0.0.0:8100".parse().unwrap())
        .serve(app.into_make_service())
        .await
        .unwrap();
}

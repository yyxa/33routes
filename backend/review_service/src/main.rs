use axum::{routing::{get, post}, Router};
use dotenv::dotenv;
use std::sync::Arc;
use tokio_postgres::NoTls;
use axum_server::Server;
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

    let app_state = models::AppState {
        db_client: db_client.clone(),
    };

    let cors = CorsLayer::new()
        .allow_origin(Any)
        .allow_methods(Any)
        .allow_headers(Any);

    let app = Router::new()
        .route(
            "/api/review/route/:route_id/reviews",
            get(handlers::get_route_reviews),
        )
        .route(
            "/api/review/route/:route_id/review",
            post(handlers::add_review).delete(handlers::delete_review),
        )
        .with_state(app_state)
        .layer(cors);

        Server::bind("0.0.0.0:8100".parse().unwrap())
        .serve(app.into_make_service())
        .await
        .unwrap();
}

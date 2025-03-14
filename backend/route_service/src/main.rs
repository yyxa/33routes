use axum::{routing::{get, put, post}, Router};
use dotenv::dotenv;
use std::sync::Arc;
use tokio_postgres::NoTls;
use axum_server::Server;
use tower_http::cors::{Any, CorsLayer};
use tokio::sync::Mutex;

mod handlers;
mod models;
use models::AppState;

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

    let db_client = Arc::new(Mutex::new(db_client));

    let app_state = AppState {
        db_client: db_client.clone(),
    };

    let cors = CorsLayer::new()
        .allow_origin(Any)
        .allow_methods(Any)
        .allow_headers(Any);

    let app = Router::new()
        .route("/api/route/routes", get(handlers::get_routes))
        .route("/api/route/route/:route_id", get(handlers::get_route_by_id))
        .route("/api/route/route/:route_id", put(handlers::update_route))
        .route("/api/route/route", post(handlers::create_route))
        .with_state(app_state)
        .layer(cors);

    Server::bind("0.0.0.0:8100".parse().unwrap())
        .serve(app.into_make_service())
        .await
        .unwrap();
}

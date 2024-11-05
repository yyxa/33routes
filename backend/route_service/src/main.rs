use axum::{routing::get, Router};
use dotenv::dotenv;
use std::env;
use std::sync::Arc;
use tokio_postgres::NoTls;

mod handlers;
mod models;

#[tokio::main]
async fn main() {
    dotenv().ok();

    let database_url = env::var("DATABASE_URL").expect("DATABASE_URL must be set");

    let (db_client, connection) = tokio_postgres::connect(&database_url, NoTls)
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

    let app = Router::new()
        .route("/api/routes", get(handlers::get_routes))
        .route("/api/route/:route_id", get(handlers::get_route_by_id))
        .with_state(app_state);

    let addr = "0.0.0.0:8100".parse().unwrap();
    println!("Server is running on {}", addr);
    axum::Server::bind(&addr)
        .serve(app.into_make_service())
        .await
        .unwrap();
}

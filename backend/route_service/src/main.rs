use axum::{routing::post, routing::put, routing::delete, Router, Extension};
use std::sync::Arc;
use tokio_postgres::NoTls;
use dotenv::dotenv;

mod handlers;
mod models;

#[tokio::main]
async fn main() {
    dotenv().ok();
    let db_url = std::env::var("DATABASE_URL").unwrap();
    let (client, connection) = tokio_postgres::connect(&db_url, NoTls).await.unwrap();

    tokio::spawn(async move {
        if let Err(e) = connection.await {
            eprintln!("connection error: {}", e);
        }
    });

    let shared_client = Arc::new(client);

    let app = Router::new()
        .route("/route", post(handlers::create_route))
        .route("/route/:url", put(handlers::update_route))
        .route("/route", delete(handlers::delete_route))
        .layer(Extension(shared_client));

    axum::Server::bind(&"0.0.0.0:8001".parse().unwrap())
        .serve(app.into_make_service())
        .await
        .unwrap();
}

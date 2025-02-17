use axum::{
    routing::{get, post},
    Router,
};
use axum_server::Server;
use dotenv::dotenv;
use std::sync::Arc;
use tower_http::cors::{Any, CorsLayer};
use aws_config::from_env;
use aws_sdk_s3::Client;

mod handlers;
mod models;

#[tokio::main]
async fn main() {
    dotenv().ok();

    let minio_url = std::env::var("MINIO_URL").expect("MINIO_URL not set");
    let bucket_name = std::env::var("MINIO_BUCKET").expect("MINIO_BUCKET not set");
    let region = std::env::var("AWS_REGION").unwrap_or_else(|_| "us-east-1".to_string());
    let region_static: &'static str = Box::leak(region.into_boxed_str());

    let shared_config = from_env().region(region_static).load().await;
    let s3_config = aws_sdk_s3::config::Builder::from(&shared_config)
        .endpoint_url(minio_url)
        .force_path_style(true)
        .build();
    let s3_client = Arc::new(Client::from_conf(s3_config));

    let app_state = models::AppState {
        s3_client,
        bucket_name,
    };

    let cors = CorsLayer::new().allow_origin(Any).allow_methods(Any).allow_headers(Any);

    let app = Router::new()
        .route("/api/media/image/:image_name", get(handlers::get_image))
        .route("/api/media/image/upload", post(handlers::upload_image))
        .with_state(app_state)
        .layer(cors);

    Server::bind("0.0.0.0:8100".parse().unwrap())
        .serve(app.into_make_service())
        .await
        .unwrap();
}

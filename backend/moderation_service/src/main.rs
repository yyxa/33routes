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
            "/api/moderation/entity/report",
            post(handlers::report_entity),
        )
        .route(
            "/api/moderation/entity/reports",
            get(handlers::get_entity_reports),
        )
        .route(
            "/api/moderation/entity/report/resolve",
            post(handlers::resolve_entity_report),
        )
        .route(
            "/api/moderation/bug/report",
            post(handlers::report_bug),
        )
        .route(
            "/api/moderation/bug/reports",
            get(handlers::get_bug_reports),
        )
        .route(
            "/api/moderation/bug/report/resolve",
            post(handlers::resolve_bug_report),
        )
        .route(
            "/api/moderation/routes",
            get(handlers::get_routes_for_moderation),
        )
        .route(
            "/api/moderation/route/approve",
            post(handlers::approve_route),
        )
        .route(
            "/api/moderation/route/reject",
            post(handlers::reject_route),
        )
        .with_state(app_state)
        .layer(cors);

    Server::bind("0.0.0.0:8100".parse().unwrap())
        .serve(app.into_make_service())
        .await
        .unwrap();
}

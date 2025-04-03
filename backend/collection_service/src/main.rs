use axum::{
    routing::{delete, get, post, put},
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
            "/api/collection/collections",
            get(handlers::get_collections),
        )
        .route(
            "/api/collection/collection",
            post(handlers::create_collection)
                .put(handlers::update_collection)
                .delete(handlers::delete_collection),
        )
        .route(
            "/api/collection/collection/:collection_id",
            get(handlers::get_collection),
        )
        .route(
            "/api/collection/collection/:collection_id/add/:route_id",
            put(handlers::add_route_to_collection),
        )
        .route(
            "/api/collection/collection/:collection_id/remove/:route_id",
            delete(handlers::remove_route_from_collection),
        )
        //.route(
        //    "/api/collection/collection/saved/add/:route_id",
        //    put(handlers::add_route_to_saved),
        //)
        //.route(
        //    "/api/collection/collection/saved/remove/:route_id",
        //    delete(handlers::remove_route_from_saved),
        //)
        .with_state(app_state)
        .layer(cors);

    Server::bind("0.0.0.0:8100".parse().unwrap())
        .serve(app.into_make_service())
        .await
        .unwrap();
}

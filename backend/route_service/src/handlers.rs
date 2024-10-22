use axum::{async_trait, extract::{Json, Path}, Extension, http::StatusCode};
use serde_json::json;
use std::sync::Arc;
use tokio_postgres::Client;
use postgres_types::Json as PgJson;
use crate::models::{NewRoute, UpdateRoute, Route};

#[async_trait]
pub async fn create_route(
    Json(new_route): Json<NewRoute>,
    Extension(pool): Extension<Arc<Client>>
) -> Result<Json<Route>, StatusCode> {
    let result = pool
        .execute(
            "INSERT INTO routes (name, description, url, photos, geodata) VALUES ($1, $2, $3, $4, $5)",
            &[&new_route.name, &new_route.description, &new_route.url, &PgJson(&new_route.images), &PgJson(&new_route.geodata)]
        )
        .await;

    match result {
        Ok(_) => Ok(Json(Route {
            name: new_route.name,
            description: new_route.description,
            url: new_route.url,
            likes: None,
            images: new_route.images,
            geodata: new_route.geodata,
        })),
        Err(_) => Err(StatusCode::INTERNAL_SERVER_ERROR),
    }
}

#[async_trait]
pub async fn update_route(
    Path(url): Path<String>,
    Json(update_route): Json<UpdateRoute>,
    Extension(pool): Extension<Arc<Client>>
) -> Result<StatusCode, StatusCode> {
    let result = pool
        .execute(
            "UPDATE routes SET name = $1, description = $2, photos = $3, geodata = $4 WHERE url = $5",
            &[&update_route.name, &update_route.description, &PgJson(&update_route.images), &PgJson(&update_route.geodata), &url]
        )
        .await;

    match result {
        Ok(_) => Ok(StatusCode::OK),
        Err(_) => Err(StatusCode::INTERNAL_SERVER_ERROR),
    }
}

#[async_trait]
pub async fn delete_route(
    Json(route): Json<Route>,
    Extension(pool): Extension<Arc<Client>>
) -> Result<StatusCode, StatusCode> {
    let result = pool
        .execute(
            "DELETE FROM routes WHERE url = $1",
            &[&route.url]
        )
        .await;

    match result {
        Ok(_) => Ok(StatusCode::OK),
        Err(_) => Err(StatusCode::INTERNAL_SERVER_ERROR),
    }
}

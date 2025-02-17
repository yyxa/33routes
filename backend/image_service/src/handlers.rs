use axum::{
    extract::{Multipart, Path, State},
    http::{HeaderMap, HeaderValue, StatusCode},
    response::IntoResponse,
    Json,
    body::Body,
};
use aws_sdk_s3::primitives::ByteStream;
use serde_json::json;
use uuid::Uuid;
use mime_guess::from_path;

use crate::models::AppState;

#[axum::debug_handler]
pub async fn upload_image(
    State(state): State<AppState>,
    mut multipart: Multipart,
) -> impl IntoResponse {
    if let Some(field) = multipart.next_field().await.unwrap() {
        let data = field.bytes().await.unwrap();

        let unique_name = format!("{}", Uuid::new_v4());
        let byte_stream = ByteStream::from(data.to_vec());

        match state
            .s3_client
            .put_object()
            .bucket(&state.bucket_name)
            .key(&unique_name)
            .body(byte_stream)
            .send()
            .await
        {
            Ok(_) => {
                return Json(json!({ "image_url": unique_name })).into_response();
            }
            Err(e) => {
                eprintln!("S3 Upload Error: {}", e);
                return (StatusCode::INTERNAL_SERVER_ERROR, Json(json!({ "error": "Upload failed" })))
                    .into_response();
            }
        }
    }
    (StatusCode::BAD_REQUEST, Json(json!({ "error": "No file provided" }))).into_response()
}


pub async fn get_image(
    Path(image_name): Path<String>,
    State(state): State<AppState>,
) -> impl IntoResponse {
    let result = state
        .s3_client
        .get_object()
        .bucket(&state.bucket_name)
        .key(&image_name)
        .send()
        .await;

    match result {
        Ok(output) => {
            let mime_type = from_path(&image_name).first_or_octet_stream();
            let mut headers = HeaderMap::new();
            headers.insert("Content-Type", HeaderValue::from_str(mime_type.as_ref()).unwrap());

            let collected = output.body.collect().await;
            if let Ok(bytes_output) = collected {
                let bytes = bytes_output.into_bytes();
                let body = Body::from(bytes);
                (StatusCode::OK, headers, body).into_response()
            } else {
                let error_body = json!({ "error": "Failed to collect object body" });
                (StatusCode::INTERNAL_SERVER_ERROR, Json(error_body)).into_response()
            }
        }
        Err(e) => {
            eprintln!("S3 GetObject Error: {}", e);
            let error_body = json!({ "error": "Image not found" });
            (StatusCode::NOT_FOUND, Json(error_body)).into_response()
        }
    }
}

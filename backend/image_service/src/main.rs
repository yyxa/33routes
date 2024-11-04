use axum::{
    extract::Path,
    http::{HeaderMap, StatusCode},
    response::{IntoResponse, Response},
    routing::get,
    Router,
};
use axum_server::Server;
use std::{fs::File, io::Read, path::Path as StdPath};

#[tokio::main]
async fn main() {
    let app = Router::new().route("/image/:image_url", get(get_image));

    Server::bind("0.0.0.0:8100".parse().unwrap())
        .serve(app.into_make_service())
        .await
        .unwrap();
}

async fn get_image(Path(image_url): Path<String>) -> Response {
    let images_dir = StdPath::new("/home/root/33routes_images");

    let file_path = images_dir.join(image_url + ".jpeg");

    if !file_path.exists() || !file_path.is_file() {
        return (StatusCode::NOT_FOUND, "Image not found").into_response();
    }

    match read_file(&file_path).await {
        Ok(bytes) => {
            let mut headers = HeaderMap::new();
            headers.insert("Content-Type", "image/jpeg".parse().unwrap());
            (StatusCode::OK, headers, bytes).into_response()
        }
        Err(_) => (StatusCode::INTERNAL_SERVER_ERROR, "Failed to read image").into_response(),
    }
}

async fn read_file(path: &StdPath) -> std::io::Result<Vec<u8>> {
    let mut file = File::open(path)?;
    let mut buffer = Vec::new();
    file.read_to_end(&mut buffer)?;
    Ok(buffer)
}

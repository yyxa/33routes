use reqwest::multipart;
use reqwest::Client as ReqwestClient;
use std::env;
use std::error::Error;
use serde_json::Value;

pub async fn upload_image(image_data: &str) -> Result<String, Box<dyn Error + Send + Sync>> {
    let image_service_host = env::var("IMAGE_SERVICE_HOST")
        .unwrap_or_else(|_| "localhost".to_string());
    let image_service_port = env::var("IMAGE_SERVICE_PORT")
        .unwrap_or_else(|_| "8100".to_string());
    let url = format!("http://{}:{}/api/media/image/upload", image_service_host, image_service_port);

    let part = multipart::Part::text(image_data.to_owned());
    let form = multipart::Form::new().part("file", part);

    let client = ReqwestClient::new();
    let response = client.post(&url)
        .multipart(form)
        .send()
        .await?;

    if !response.status().is_success() {
        let error_json: Value = response.json().await?;
        return Err(format!("Upload failed: {:?}", error_json).into());
    }

    let json_resp: Value = response.json().await?;
    if let Some(image_url) = json_resp.get("image_url").and_then(|v| v.as_str()) {
        Ok(image_url.to_string())
    } else {
        Err("Missing image_url in response".into())
    }
}

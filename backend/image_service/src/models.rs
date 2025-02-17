use aws_sdk_s3::Client;
use std::sync::Arc;

#[derive(Clone)]
pub struct AppState {
    pub s3_client: Arc<Client>,
    pub bucket_name: String,
}

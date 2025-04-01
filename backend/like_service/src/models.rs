use std::sync::Arc;
use tokio_postgres::Client;

#[derive(Clone)]
pub struct AppState {
    pub db_client: Arc<Client>,
}
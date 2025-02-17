use serde::{Deserialize, Serialize};
use std::sync::Arc;
use tokio_postgres::Client;
use postgres_types::{ToSql, FromSql};

#[derive(Debug, ToSql, FromSql, Serialize, Deserialize)]
#[postgres(name = "tag_type")]
#[serde(rename_all = "lowercase")]
pub enum TagType {
    #[postgres(name = "forest")]
    Forest,
    #[postgres(name = "park")]
    Park,
    #[postgres(name = "near_water")]
    NearWater,
}

#[derive(Clone)]
pub struct AppState {
    pub db_client: Arc<Client>,
}

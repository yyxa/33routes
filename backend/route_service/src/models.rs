use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize)]
pub struct Route {
    pub name: String,
    pub description: String,
    pub url: String,
    pub likes: Option<serde_json::Value>,
    pub images: serde_json::Value,
    pub geodata: serde_json::Value,
}

#[derive(Serialize, Deserialize)]
pub struct NewRoute {
    pub name: String,
    pub description: String,
    pub url: String,
    pub images: serde_json::Value,
    pub geodata: serde_json::Value,
}

#[derive(Serialize, Deserialize)]
pub struct UpdateRoute {
    pub name: String,
    pub description: String,
    pub images: serde_json::Value,
    pub geodata: serde_json::Value,
}

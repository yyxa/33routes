import requests
import pytest

BASE_URL = "http://localhost:8100/api/collection"
SESSION_TOKEN = "1"

def test_get_collections():
  url = f"{BASE_URL}/collections?pagination-page-number=1&pagination-per-page=10"
  response = requests.get(url)
  assert response.status_code == 200
  assert "collections" in response.json()

def test_get_collection_by_id():
  collection_id = 2
  url = f"{BASE_URL}/collection/{collection_id}"
  response = requests.get(url)
  assert response.status_code == 200
  data = response.json()
  assert "collection" in data
  assert data["collection"]["collection_id"] == collection_id

def test_create_collection():
  url = f"{BASE_URL}/collection"
  headers = {"session-token": SESSION_TOKEN}
  payload = {
      "user_id": 1,
      "name": "Test 1 Collection",
      "description": "A test description",
      "tags": ["forest", "park"]
  }
  response = requests.post(url, json=payload, headers=headers)
  assert response.status_code == 201

def test_update_collection():
  url = f"{BASE_URL}/collection"
  headers = {
      "session-token": SESSION_TOKEN,
      "collection-id": "1"
  }
  payload = {
    "user_id": 1,
    "description": "Updated description"}
  response = requests.put(url, json=payload, headers=headers)
  assert response.status_code == 200

def test_delete_collection():
  url = f"{BASE_URL}/collection"
  headers = {
      "session-token": SESSION_TOKEN,
      "collection-id": "1"
  }
  payload = {"user_id": 1}
  response = requests.delete(url, json=payload, headers=headers)
  assert response.status_code == 200

def test_add_route_to_collection():
  collection_id = 9
  route_id = 9
  url = f"{BASE_URL}/collection/{collection_id}/add/{route_id}"
  headers = {"session-token": SESSION_TOKEN}
  payload = {"user_id": 9}
  response = requests.put(url, json=payload, headers=headers)
  assert response.status_code == 200

def test_remove_route_from_collection():
  collection_id = 9
  route_id = 10
  url = f"{BASE_URL}/collection/{collection_id}/remove/{route_id}"
  headers = {"session-token": SESSION_TOKEN}
  payload = {"user_id": 9}
  response = requests.delete(url, json=payload, headers=headers)
  assert response.status_code == 200

if __name__ == "__main__":
  pytest.main()

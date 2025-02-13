import requests
import pytest

BASE_URL = "http://localhost:8100/api/collection"

HEADERS = {"session-token": "your_test_token"}

@pytest.mark.parametrize("page_number, per_page, expected_status", [
  (1, 10, 200),
  (99999, 10, 200),
])
def test_get_collections(page_number, per_page, expected_status):
  url = f"{BASE_URL}/collections?pagination-page-number={page_number}&pagination-per-page={per_page}"
  response = requests.get(url)
  
  assert response.status_code == expected_status, f"Unexpected response: {response.text}"
  
  if expected_status == 200:
    assert "collections" in response.json()

@pytest.mark.parametrize("collection_id, expected_status", [
  (2, 200),
  (99999, 404),
  ("abc", 400),
])
def test_get_collection(collection_id, expected_status):
  url = f"{BASE_URL}/collection/{collection_id}"
  response = requests.get(url)
  
  assert response.status_code == expected_status, f"Unexpected response: {response.text}"
  
  if expected_status == 200:
    assert "collection" in response.json()

def test_create_collection():
  url = f"{BASE_URL}/collection"
  payload = {
    "user_id": 1,
    "name": "Test Collection 2",
    "description": "This is a test collection",
    "tags": ["forest", "park"]
  }
  response = requests.post(url, json=payload, headers=HEADERS)
  
  assert response.status_code == 201

@pytest.mark.parametrize("collection_id, update_data, expected_status", [
  (2, {"user_id": 1, "description": "Updated description"}, 200),
  (99999, {"user_id": 1, "description": "Updated description"}, 404),
  (1, {}, 400),
])
def test_update_collection(collection_id, update_data, expected_status):
  url = f"{BASE_URL}/collection"
  headers = {**HEADERS, "collection-id": str(collection_id)}
  response = requests.put(url, json=update_data, headers=headers)
  
  assert response.status_code == expected_status

@pytest.mark.parametrize("collection_id, expected_status", [
  (1, 200),
  (99999, 404),
])
def test_delete_collection(collection_id, expected_status):
  url = f"{BASE_URL}/collection"  
  headers = {**HEADERS, "collection-id": str(collection_id)}
  payload = {"user_id": 1}
  response = requests.delete(url, json=payload, headers=headers)
  
  assert response.status_code == expected_status

@pytest.mark.parametrize("collection_id, route_id, user_id, expected_status", [
  (2, 5, 2, 200),
  (99999, 3, 1, 403),
  (2, 99999, 2, 404),
  (2, 3, 99999, 403),
  ("abc", 3, 1, 400),
  (2, "xyz", 1, 400),
])
def test_add_route_to_collection(collection_id, route_id, user_id, expected_status):
  url = f"{BASE_URL}/collection/{collection_id}/add/{route_id}"
  payload = {"user_id": user_id}
  response = requests.put(url, json=payload, headers=HEADERS)
  
  assert response.status_code == expected_status

@pytest.mark.parametrize("collection_id, route_id, expected_status", [
  (2, 3, 200),
  (99999, 2, 403),
  (1, 99999, 404),
])
def test_remove_route_from_collection(collection_id, route_id, expected_status):
  url = f"{BASE_URL}/collection/{collection_id}/remove/{route_id}"
  payload = {"user_id": 2}
  response = requests.delete(url, json=payload, headers=HEADERS)
  
  assert response.status_code == expected_status

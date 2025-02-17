import pytest
import requests

BASE_URL = "http://localhost:8100/api"  # Замените на ваш URL
SESSION_TOKEN = "valid-session-token"
INVALID_SESSION_TOKEN = "invalid-token"

@pytest.mark.parametrize("route_id, expected_status", [
  (1, 200),
  (9999, 404),
])
def test_get_reviews(route_id, expected_status):
  response = requests.get(f"{BASE_URL}/review/route/{route_id}/reviews")
  assert response.status_code == expected_status

@pytest.mark.parametrize("route_id, user_id, rating, comment, images, token, expected_status", [
  (1, 1, 4.5, "Great route!", ["url1", "url2"], SESSION_TOKEN, 200),  # Успех
  (9999, 1, 4.5, "Great route!", ["url1"], SESSION_TOKEN, 404),  # Несуществующий маршрут
])
def test_add_review(route_id, user_id, rating, comment, images, token, expected_status):
  headers = {"session-token": token} if token else {}
  payload = {
    "user_id": user_id,
    "rating": rating,
    "comment": comment,
    "images": images
  }
  response = requests.post(f"{BASE_URL}/review/route/{route_id}/review", json=payload, headers=headers)
  assert response.status_code == expected_status

@pytest.mark.parametrize("route_id, user_id, review_id, token, expected_status", [
  (1, 1, 1, SESSION_TOKEN, 200),
  (1, 1, 9999, SESSION_TOKEN, 404),  # Несуществующая рецензия
])
def test_delete_review(route_id, user_id, review_id, token, expected_status):
  headers = {"session-token": token}
  payload = {"user_id": user_id, "review_id": review_id}
  response = requests.delete(f"{BASE_URL}/review/route/{route_id}/review", json=payload, headers=headers)
  assert response.status_code == expected_status
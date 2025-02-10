import requests
import pytest

BASE_URL = "http://localhost:8100/api/comment/review"
SESSION_TOKEN = "your_test_session_token"

def test_get_comments():
  review_id = "1"
  url = f"{BASE_URL}/{review_id}/comments"
  response = requests.get(url)
  assert response.status_code == 200
  assert "comments" in response.json()

def test_add_comment():
  review_id = "1"
  url = f"{BASE_URL}/{review_id}/comment"
  headers = {"session-token": SESSION_TOKEN}
  payload = {
    "user_id": 1,
    "text": "This is an amazing route!"
  }
  response = requests.post(url, json=payload, headers=headers)
  assert response.status_code == 200

def test_delete_comment():
  review_id = "1"
  url = f"{BASE_URL}/{review_id}/comment"
  headers = {"session-token": SESSION_TOKEN}
  payload = {
    "user_id": 1,
    "comment_id": 1
  }
  response = requests.delete(url, json=payload, headers=headers)
  assert response.status_code == 200

if __name__ == "__main__":
  pytest.main()

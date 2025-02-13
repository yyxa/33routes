import requests
import pytest

BASE_URL = "http://localhost:8100/api/comment/review"
SESSION_TOKEN = "your_test_session_token"

@pytest.mark.parametrize("review_id, expected_status, expected_key", [
  ("1", 200, "comments"),
  ("99999", 404, None),
  ("abc", 400, None),
  ("", 400, None), 
])
def test_get_comments(review_id, expected_status, expected_key):
    url = f"{BASE_URL}/{review_id}/comments"
    response = requests.get(url)

    assert response.status_code == expected_status

@pytest.mark.parametrize("review_id, user_id, text, expected_status", [
    ("1", 1, "This is an amazing route!", 200),
    ("99999", 1, "This is an amazing route!", 400),
    ("1", 1, "", 400),
    ("1", None, "Valid text", 422),
    ("abc", 1, "This is an amazing route!", 400),
])
def test_add_comment(review_id, user_id, text, expected_status):
    url = f"{BASE_URL}/{review_id}/comment"
    headers = {"session-token": SESSION_TOKEN}
    payload = {"user_id": user_id, "text": text} if user_id else {"text": text}

    response = requests.post(url, json=payload, headers=headers)
    assert response.status_code == expected_status

@pytest.mark.parametrize("review_id, user_id, comment_id, expected_status", [
  ("1", 1, 1, 200), 
  ("99999", 1, 1, 404),
  ("1", 1, 99999, 404),
  ("1", None, 1, 422),  
  ("abc", 1, 1, 400),
])
def test_delete_comment(review_id, user_id, comment_id, expected_status):
  url = f"{BASE_URL}/{review_id}/comment"
  headers = {"session-token": SESSION_TOKEN}
  payload = {"user_id": user_id, "comment_id": comment_id} if user_id else {"comment_id": comment_id}

  response = requests.delete(url, json=payload, headers=headers)
  assert response.status_code == expected_status

if __name__ == "__main__":
  pytest.main()

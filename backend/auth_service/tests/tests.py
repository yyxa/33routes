import pytest
import requests

BASE_URL = "http://localhost:8100/api/auth"

TOKEN = None
USER_ID = None

@pytest.mark.parametrize("payload, expected_status", [
  ({"username": "teasdfasdfstuser1", "email": "tasafsddfest@example1.com", "password": "TestPassword123", "name": "Test User"}, 200),
  ({"username": "", "email": "invalid-email", "password": "123", "name": ""}, 500),
])
def test_register(payload, expected_status):
  response = requests.post(f"{BASE_URL}/register", json=payload)
  assert response.status_code == expected_status, f"Unexpected response: {response.text}"

  if response.status_code == 200:
    json_data = response.json()
    assert "token" in json_data, "Token is missing in the response"
    global TOKEN 
    global USER_ID
    TOKEN = json_data["token"]
    USER_ID = json_data["user_id"]


@pytest.mark.parametrize("email, password, expected_status", [
  ("test@example.com", "TestPassword123", 200),
  ("test@example.com", "WrongPassword", 401),
  ("wrong@example.com", "TestPassword123", 401),
])
def test_login(email, password, expected_status):
  response = requests.post(f"{BASE_URL}/login", json={"email": email, "password": password})
  assert response.status_code == expected_status, f"Unexpected response: {response.text}"


@pytest.mark.parametrize("token, user_id, expected_status", [
  ("get_token", -1, 200),
  ("get_token", -2, 400),
  ("invalid_token", 0, 401),
  ("", 0, 400),
])
def test_check_token(token, user_id, expected_status):
  if token == "get_token":
    global TOKEN
    token = TOKEN
  
  if user_id == -1:
    global USER_ID
    user_id = USER_ID

  headers = {"session-token": token} if token else {}
  response = requests.post(f"{BASE_URL}/check_token", headers=headers, json={"user_id": user_id})
  assert response.status_code == expected_status, f"Unexpected response: {response.text}"

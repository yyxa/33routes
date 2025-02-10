import requests
import pytest

BASE_URL = "http://localhost:8100/api/moderation/entity"
SESSION_TOKEN = "your_test_session_token"

def test_send_report():
  url = f"{BASE_URL}/report"
  headers = {"session-token": SESSION_TOKEN}
  payload = {
    "user_id": 1,
    "object_type": "route",
    "object_id": 1,
    "reason": "inappropriate content",
    "details": "This route contains inappropriate language."
  }
  response = requests.post(url, json=payload, headers=headers)
  assert response.status_code == 200

def test_get_reports():
  url = f"{BASE_URL}/reports?pagination-page-number=1&pagination-per-page=10&status=opened"
  headers = {"session-token": SESSION_TOKEN}
  response = requests.get(url, headers=headers)
  assert response.status_code == 200
  assert "reports" in response.json()

def test_resolve_report():
  url = f"{BASE_URL}/report/resolve"
  headers = {"session-token": SESSION_TOKEN}
  payload = {
    "user_id": 1,
    "report_id": 1,
    "resolution": "The issue has been resolved, and the content has been edited."
  }
  response = requests.post(url, json=payload, headers=headers)
  assert response.status_code == 200

def test_send_bug_report():
  url = "http://localhost:8100/api/moderation/bug/report"
  headers = {"session-token": SESSION_TOKEN}
  payload = {
    "user_id": 1,
    "description": "The app crashes when trying to upload a large file."
  }
  response = requests.post(url, json=payload, headers=headers)
  assert response.status_code == 200

def test_get_bug_reports():
  url = "http://localhost:8100/api/moderation/bug/reports?pagination-page-number=1&pagination-per-page=10"
  headers = {"session-token": SESSION_TOKEN}
  response = requests.get(url, headers=headers)
  assert response.status_code == 200
  assert "bug_reports" in response.json()

def test_resolve_bug_report():
  url = "http://localhost:8100/api/moderation/bug/report/resolve"
  headers = {"session-token": SESSION_TOKEN}
  payload = {
    "user_id": 1,
    "report_id": 1,
    "resolution": "Fixed the file upload issue by optimizing memory handling."
  }
  response = requests.post(url, json=payload, headers=headers)
  assert response.status_code == 200

if __name__ == "__main__":
  pytest.main()

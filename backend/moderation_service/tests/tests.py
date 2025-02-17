import pytest
import requests

BASE_URL = "http://localhost:8100/api/moderation"
SESSION_TOKEN = "1"

headers = {"session-token": SESSION_TOKEN}

@pytest.mark.parametrize("payload,expected_status", [
  ({"user_id": 1, "object_type": "route", "object_id": 1, "reason": "inappropriate content", "details": "This route contains inappropriate language."}, 200),
  ({"object_type": "route", "object_id": 1, "reason": "inappropriate content", "details": "This route contains inappropriate language."}, 400),
  ({"user_id": 1, "object_type": "invalid_type", "object_id": 1, "reason": "inappropriate content", "details": "This route contains inappropriate language."}, 422),
  ({"user_id": 1, "object_type": "route", "object_id": 1, "details": "This route contains inappropriate language."}, 422)
])
def test_report_creation(payload, expected_status):
  response = requests.post(f"{BASE_URL}/entity/report", json=payload, headers=headers)
  assert response.status_code == expected_status

@pytest.mark.parametrize("params,expected_status", [
  ({"pagination-page-number": 1, "pagination-per-page": 10, "status": "opened"}, 200),
  ({"pagination-page-number": 1, "pagination-per-page": 10}, 400),
  ({"pagination-page-number": 1, "pagination-per-page": 10, "status": "unknown_status"}, 400)
])
def test_get_reports(params, expected_status):
  response = requests.get(f"{BASE_URL}/entity/reports", params=params, headers=headers)
  assert response.status_code == expected_status

@pytest.mark.parametrize("payload,expected_status", [
  ({"user_id": 1, "report_id": 1, "resolution": "The issue has been resolved."}, 200),
  ({"user_id": 1, "resolution": "The issue has been resolved."}, 422),
  ({"user_id": 1, "report_id": 1}, 422)
])
def test_resolve_report(payload, expected_status):
  response = requests.post(f"{BASE_URL}/entity/report/resolve", json=payload, headers=headers)
  assert response.status_code == expected_status

@pytest.mark.parametrize("payload,expected_status", [
  ({"user_id": 1, "description": "The app crashes when uploading a large file."}, 200),
  ({"description": "The app crashes when uploading a large file."}, 422),
  ({"user_id": 1}, 422)
])
def test_bug_report(payload, expected_status):
  response = requests.post(f"{BASE_URL}/bug/report", json=payload, headers=headers)
  assert response.status_code == expected_status

@pytest.mark.parametrize("payload,expected_status", [
  ({"user_id": 1, "report_id": 1, "resolution": "Bug fixed."}, 200),
  ({"user_id": 1, "resolution": "Bug fixed."}, 422),
  ({"user_id": 1, "report_id": 1}, 422)
])
def test_resolve_bug(payload, expected_status):
  response = requests.post(f"{BASE_URL}/bug/report/resolve", json=payload, headers=headers)
  assert response.status_code == expected_status

@pytest.mark.parametrize("payload,expected_status", [
  ({"user_id": 1, "object_type": "route", "object_id": 1}, 200),
  ({"user_id": 1, "object_id": 1}, 422),
  ({"user_id": 1, "object_type": "invalid", "object_id": 1}, 422)
])
def test_approve_route(payload, expected_status):
  response = requests.post(f"{BASE_URL}/route/approve", json=payload, headers=headers)
  assert response.status_code == expected_status

@pytest.mark.parametrize("payload,expected_status", [
  ({"user_id": 1, "object_type": "route", "object_id": 1, "reason": "Incomplete description."}, 200),
  ({"user_id": 1, "object_type": "route", "object_id": 1}, 422)
])
def test_reject_route(payload, expected_status):
  response = requests.post(f"{BASE_URL}/route/reject", json=payload, headers=headers)
  assert response.status_code == expected_status

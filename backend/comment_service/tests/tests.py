import requests
import pytest

BASE_URL = "http://localhost:8100/api/comment/review"
SESSION_TOKEN = "your_test_session_token"

@pytest.mark.parametrize("review_id, expected_status, expected_key", [
  ("1", 200, "comments"),        # Корректный ID рецензии
  ("99999", 404, None),          # Несуществующий ID
  ("abc", 400, None),            # Некорректный формат ID
  ("", 404, None),               # Пустой ID (возможно 404 или 400)
])
def test_get_comments(review_id, expected_status, expected_key):
    url = f"{BASE_URL}/{review_id}/comments"
    response = requests.get(url)

    # Проверяем код статуса
    assert response.status_code == expected_status

    # Если ожидается JSON, проверяем наличие ключа
    if "application/json" in response.headers.get("Content-Type", ""):
        response_data = response.json()
        if expected_key:
            assert expected_key in response_data
        else:
            assert "error" in response_data
    else:
        # Если не JSON, обрабатываем как текст
        assert "Invalid URL" in response.text

# @pytest.mark.parametrize("review_id, user_id, text, expected_status", [
#     ("1", 1, "This is an amazing route!", 200),  # ✅ Корректный запрос
#     ("99999", 1, "This is an amazing route!", 404),  # ❌ Несуществующий review_id
#     ("1", 1, "", 400),  # ❌ Пустой текст комментария
#     ("1", None, "Valid text", 400),  # ❌ Нет user_id
#     ("abc", 1, "This is an amazing route!", 400),  # ❌ Некорректный формат ID
# ])
# def test_add_comment(review_id, user_id, text, expected_status):
#     url = f"{BASE_URL}/{review_id}/comment"
#     headers = {"session-token": SESSION_TOKEN}
#     payload = {"user_id": user_id, "text": text} if user_id else {"text": text}  # Исключаем user_id если он None

#     response = requests.post(url, json=payload, headers=headers)
#     assert response.status_code == expected_status

# Тестирование удаления комментариев с разными сценариями
@pytest.mark.parametrize("review_id, user_id, comment_id, expected_status", [
  ("1", 1, 1, 200),  # ✅ Корректный запрос
  ("99999", 1, 1, 404),  # ❌ Несуществующий review_id
  ("1", 1, 99999, 404),  # ❌ Несуществующий comment_id
  ("1", None, 1, 400),  # ❌ Нет user_id
  ("abc", 1, 1, 400),  # ❌ Некорректный review_id
])
def test_delete_comment(review_id, user_id, comment_id, expected_status):
  url = f"{BASE_URL}/{review_id}/comment"
  headers = {"session-token": SESSION_TOKEN}
  payload = {"user_id": user_id, "comment_id": comment_id} if user_id else {"comment_id": comment_id}

  response = requests.delete(url, json=payload, headers=headers)
  assert response.status_code == expected_status

if __name__ == "__main__":
  pytest.main()

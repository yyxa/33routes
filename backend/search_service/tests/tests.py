import os
import requests
import pytest

BASE_URL = "http://localhost:8100"

@pytest.fixture
def base_url():
    return BASE_URL

# -----------------------------------------------------------------------------
# Вспомогательные функции для запросов и валидации пагинации
# -----------------------------------------------------------------------------

def get_users(base_url, params=None, method="GET"):
    url = f"{base_url}/api/search/users"
    return requests.request(method, url, params=params)

def get_routes(base_url, params=None, method="GET"):
    url = f"{base_url}/api/search/routes"
    return requests.request(method, url, params=params)

def get_collections(base_url, params=None, method="GET"):
    url = f"{base_url}/api/search/collections"
    return requests.request(method, url, params=params)

def validate_pagination_headers(response):
    for header in ['pagination-current-page', 'pagination-total-elements', 'pagination-per-page', 'pagination-total-pages']:
        assert header in response.headers, f"В заголовках отсутствует {header}"
        try:
            int(response.headers[header])
        except (ValueError, TypeError):
            pytest.fail(f"Значение заголовка {header} не является целым числом")

# -----------------------------------------------------------------------------
# Тесты для поиска пользователей
# -----------------------------------------------------------------------------

@pytest.mark.parametrize("params, expected_current_page", [
    (None, 1),
    ({"q": "Иван", "pagination-page-number": 2, "pagination-per-page": 5}, 2),
    ({"pagination-page-number": 0}, 1),
    ({"pagination-page-number": -5}, 1),
])
def test_search_users_pagination(base_url, params, expected_current_page):
    response = get_users(base_url, params)
    assert response.status_code == 200, f"Ожидался статус 200, получен {response.status_code}"
    validate_pagination_headers(response)
    data = response.json()
    assert "results" in data, "Ключ 'results' отсутствует в ответе"

def test_search_users_no_query(base_url):
    response = get_users(base_url)
    assert response.status_code == 200, f"Ожидался статус 200, получен {response.status_code}"
    data = response.json()
    assert isinstance(data.get("results"), list), "Результаты должны быть списком"

@pytest.mark.parametrize("params", [
    {"pagination-page-number": "first"},
    {"pagination-page-number": 1.5},
    {"pagination-per-page": "ten"},
])
def test_search_users_invalid_types(base_url, params):
    response = get_users(base_url, params)
    assert response.status_code == 400, f"Ожидался статус 400 для параметров {params}, получен {response.status_code}"

@pytest.mark.parametrize("method", ["POST", "PUT", "DELETE"])
def test_search_users_invalid_http_method(base_url, method):
    response = get_users(base_url, method=method)
    assert response.status_code in [400, 405], f"Ожидался статус 400 или 405 для метода {method}, получен {response.status_code}"

# -----------------------------------------------------------------------------
# Тесты для поиска маршрутов
# -----------------------------------------------------------------------------

@pytest.mark.parametrize("params, expected_current_page", [
    (None, 1),
    ({"q": "Trail", "pagination-page-number": 3, "pagination-per-page": 5}, 3),
    ({"pagination-page-number": 0}, 1),
    ({"pagination-page-number": -3}, 1),
])
def test_search_routes_pagination(base_url, params, expected_current_page):
    response = get_routes(base_url, params)
    assert response.status_code == 200, f"Ожидался статус 200, получен {response.status_code}"
    validate_pagination_headers(response)
    data = response.json()
    assert "results" in data, "Ключ 'results' отсутствует в ответе"

def test_search_routes_filters(base_url):
    params = {
        "q": "Mountain",
        "min_length": 1000,
        "max_length": 10000,
        "min_duration": 3600,
        "max_duration": 7200,
        "min_rating": 3.0,
        "max_rating": 5.0,
        "tags": "forest,near_water",
        "category": "walking",
        "pagination-page-number": 1,
        "pagination-per-page": 10
    }
    response = get_routes(base_url, params)
    assert response.status_code == 200, f"Ожидался статус 200, получен {response.status_code}"
    validate_pagination_headers(response)
    data = response.json()
    assert "results" in data, "Ключ 'results' отсутствует в ответе"

@pytest.mark.parametrize("params", [
    {"q": "Test", "pagination-page-number": "second"},
    {"min_length": "long"},
    {"min_duration": "fast"}
])
def test_search_routes_invalid_types(base_url, params):
    response = get_routes(base_url, params)
    assert response.status_code == 400, f"Ожидался статус 400 для параметров {params}, получен {response.status_code}"

@pytest.mark.parametrize("method", ["POST", "PUT", "DELETE"])
def test_search_routes_invalid_http_method(base_url, method):
    response = get_routes(base_url, method=method)
    assert response.status_code in [400, 405], f"Ожидался статус 400 или 405 для метода {method}, получен {response.status_code}"

# --- Новые тесты для маршрутов ---

def test_search_routes_order_rating_desc(base_url):
    params = {
        "q": "Trail",
        "pagination-page-number": 1,
        "pagination-per-page": 10,
        "order": "rating_desc"
    }
    response = get_routes(base_url, params)
    assert response.status_code == 200, f"Ожидался статус 200, получен {response.status_code}"

def test_search_routes_order_created_asc(base_url):
    params = {
        "q": "Trail",
        "pagination-page-number": 1,
        "pagination-per-page": 10,
        "order": "created_asc"
    }
    response = get_routes(base_url, params)
    assert response.status_code == 200, f"Ожидался статус 200, получен {response.status_code}"

def test_search_routes_geolocation(base_url):
    params = {
        "q": "Trail",
        "pagination-page-number": 1,
        "pagination-per-page": 10,
        "order": "distance",
        "lat": 55.751244,
        "lon": 37.618423  # Москва
    }
    response = get_routes(base_url, params)
    assert response.status_code == 200, f"Ожидался статус 200, получен {response.status_code}"

def test_search_routes_between_points(base_url):
    params = {
        "q": "Trail",
        "pagination-page-number": 1,
        "pagination-per-page": 10,
        "order": "between",
        "start_lat": 55.751244,
        "start_lon": 37.618423,   # Москва
        "end_lat": 59.934280,
        "end_lon": 30.335099      # Санкт-Петербург
    }
    response = get_routes(base_url, params)
    assert response.status_code == 200, f"Ожидался статус 200, получен {response.status_code}"

# -----------------------------------------------------------------------------
# Тесты для поиска подборок
# -----------------------------------------------------------------------------

@pytest.mark.parametrize("params, expected_current_page", [
    (None, 1),
    ({"q": "Favorites", "pagination-page-number": 2, "pagination-per-page": 5}, 2),
    ({"pagination-page-number": 0}, 1),
    ({"pagination-page-number": -1}, 1),
])
def test_search_collections_pagination(base_url, params, expected_current_page):
    response = get_collections(base_url, params)
    assert response.status_code == 200, f"Ожидался статус 200, получен {response.status_code}"
    validate_pagination_headers(response)
    data = response.json()
    assert "results" in data, "Ключ 'results' отсутствует в ответе"

def test_search_collections_filters(base_url):
    params = {
        "q": "Summer",
        "min_rating": 2.5,
        "max_rating": 5.0,
        "tags": "park,forest",
        "pagination-page-number": 1,
        "pagination-per-page": 10,
        "order": "created_desc"
    }
    response = get_collections(base_url, params)
    assert response.status_code == 200, f"Ожидался статус 200, получен {response.status_code}"
    validate_pagination_headers(response)
    data = response.json()
    assert "results" in data, "Ключ 'results' отсутствует в ответе"

@pytest.mark.parametrize("params", [
    {"q": "Test", "pagination-page-number": "one"},
    {"min_rating": "high"},
    {"max_rating": "low"}
])
def test_search_collections_invalid_types(base_url, params):
    response = get_collections(base_url, params)
    assert response.status_code == 400, f"Ожидался статус 400 для параметров {params}, получен {response.status_code}"

@pytest.mark.parametrize("method", ["PUT", "DELETE"])
def test_search_collections_invalid_http_method(base_url, method):
    response = get_collections(base_url, method=method)
    assert response.status_code in [400, 405], f"Ожидался статус 400 или 405 для метода {method}, получен {response.status_code}"

@pytest.mark.parametrize("extra_params", [
    {"extra": "value"},
    {"pagination-page-number": 1, "unused": 123}
])
def test_search_collections_extra_query_params(base_url, extra_params):
    response = get_collections(base_url, extra_params)
    assert response.status_code == 200, f"Ожидался статус 200, получен {response.status_code}"


import requests
import pytest

BASE_URL = "http://localhost:8100"

@pytest.fixture
def base_url():
    return BASE_URL

# -----------------------------------------------------------------------------
# Вспомогательные функции для запросов и валидации
# -----------------------------------------------------------------------------

def get_routes(base_url, params=None, method="GET"):
    url = f"{base_url}/api/route/routes"
    return requests.request(method, url, params=params)

def get_route_details(base_url, route_id, params=None, method="GET"):
    url = f"{base_url}/api/route/route/{route_id}"
    return requests.request(method, url, params=params)

def validate_routes_response(response):
    for header in ['pagination-current-page', 'pagination-total-elements', 'pagination-per-page', 'pagination-total-pages']:
        assert header in response.headers, f"В заголовках отсутствует {header}"
        try:
            int(response.headers[header])
        except (ValueError, TypeError):
            pytest.fail(f"Значение заголовка {header} не является целым числом")
    data = response.json()
    assert "routes" in data, "Ключ 'routes' отсутствует в теле ответа"
    assert isinstance(data["routes"], list), "Поле 'routes' должно быть списком"
    for route_id in data["routes"]:
        assert isinstance(route_id, int), f"ID маршрута {route_id} не является числом"
    return data

def validate_route_details(data):
    for key in ["user", "route", "points"]:
        assert key in data, f"Ключ '{key}' отсутствует в ответе"
    
    user = data["user"]
    assert isinstance(user.get("user_id"), int), "user_id должен быть числом"
    assert isinstance(user.get("name"), str), "name должен быть строкой"
    image_url = user.get("image_url")
    assert image_url is None or isinstance(image_url, str), "image_url должен быть строкой или None"
    
    route = data["route"]
    expected_route_keys = [
        "route_id", "name", "url", "description", "length", "duration",
        "tags", "category", "created_at", "status", "is_deleted", "rating", "images"
    ]
    for key in expected_route_keys:
        assert key in route, f"Ключ '{key}' отсутствует в данных маршрута"
    assert isinstance(route["route_id"], int), "route_id должен быть числом"
    assert isinstance(route["name"], str), "name должен быть строкой"
    assert isinstance(route["url"], str), "url должен быть строкой"
    assert isinstance(route["description"], str), "description должен быть строкой"
    assert isinstance(route["length"], int), "length должен быть числом"
    assert isinstance(route["duration"], int), "duration должен быть числом"
    assert isinstance(route["tags"], list), "tags должен быть списком"
    for tag in route["tags"]:
        assert isinstance(tag, str), f"Элемент тега '{tag}' должен быть строкой"
    assert isinstance(route["category"], str), "category должен быть строкой"
    assert isinstance(route["created_at"], int), "created_at должен быть числом"
    assert isinstance(route["status"], str), "status должен быть строкой"
    assert isinstance(route["is_deleted"], bool), "is_deleted должен быть булевым значением"
    assert isinstance(route["rating"], (int, float)), "rating должен быть числом"
    assert isinstance(route["images"], list), "images должен быть списком"
    for image in route["images"]:
        assert isinstance(image, str), f"Элемент images '{image}' должен быть строкой"
    
    points = data["points"]
    assert isinstance(points, list), "points должен быть списком"
    for point in points:
        for key in ["point_id", "coordinate", "time_offset", "elevation", "speed", "point_description", "images"]:
            assert key in point, f"Ключ '{key}' отсутствует в точке маршрута"
        assert isinstance(point["point_id"], int), "point_id должен быть числом"
        coordinate = point["coordinate"]
        assert isinstance(coordinate, dict), "coordinate должен быть объектом"
        for coord_key in ["latitude", "longitude"]:
            assert coord_key in coordinate, f"Ключ '{coord_key}' отсутствует в coordinate"
            assert isinstance(coordinate[coord_key], (int, float)), f"{coord_key} должен быть числом"
        assert isinstance(point["time_offset"], int), "time_offset должен быть числом"
        assert isinstance(point["elevation"], int), "elevation должен быть числом"
        assert isinstance(point["speed"], (int, float)), "speed должен быть числом"
        assert isinstance(point["point_description"], str), "point_description должен быть строкой"
        assert isinstance(point["images"], list), "images должен быть списком"
        for image in point["images"]:
            assert isinstance(image, str), f"Элемент images '{image}' должен быть строкой"

# -----------------------------------------------------------------------------
# Тесты для /api/route/routes
# -----------------------------------------------------------------------------

@pytest.mark.parametrize("params, expected_current_page", [
    (None, 1),
    ({"pagination-page-number": 2, "pagination-per-page": 5}, 2),
    ({"pagination-page-number": 0}, 1),
    ({"pagination-page-number": -5}, 1),
])
def test_get_routes_valid_pagination(base_url, params, expected_current_page):
    """
    Проверка корректного запроса с различными значениями pagination-page-number.
    Сервер либо использует переданное значение, либо корректирует его до минимального (1).
    """
    response = get_routes(base_url, params)
    assert response.status_code == 200, f"Ожидался статус 200, получен {response.status_code}"
    current = int(response.headers.get("pagination-current-page", 0))
    assert current == expected_current_page, f"Ожидался current_page={expected_current_page}, получено {current}"
    validate_routes_response(response)

def test_get_routes_page_number_big_number_auto_correct(base_url):
    """
    При передаче очень большого значения для pagination-page-number сервер
    возвращает последнюю доступную страницу: pagination-current-page равен pagination-total-pages.
    """
    params = {"pagination-page-number": 999999}
    response = get_routes(base_url, params)
    assert response.status_code == 200, f"Ожидался статус 200, получен {response.status_code}"
    current = int(response.headers.get("pagination-current-page", 0))
    total = int(response.headers.get("pagination-total-pages", 0))
    assert current == total, "Ожидалось, что текущая страница равна последней (total_pages)"
    validate_routes_response(response)

@pytest.mark.parametrize("params", [
    {"pagination-page-number": "first"},
    {"pagination-page-number": 1.5},
    {"pagination-per-page": "ten"},
])
def test_get_routes_invalid_types(base_url, params):
    """
    При передаче некорректного типа параметров (например, строка или число с плавающей точкой)
    сервер возвращает 400 Bad Request.
    """
    response = get_routes(base_url, params)
    assert response.status_code == 400, f"Ожидался статус 400 для параметров {params}, получен {response.status_code}"

def test_get_routes_per_page_exceeding_auto_correct(base_url):
    """
    При передаче значения pagination-per-page, превышающего максимум (например, 101),
    сервер автоматически корректирует его до 100.
    """
    params = {"pagination-per-page": 101}
    response = get_routes(base_url, params)
    assert response.status_code == 200, f"Ожидался статус 200, получен {response.status_code}"
    corrected = int(response.headers.get("pagination-per-page", 0))
    assert corrected == 100, f"Ожидалось, что pagination-per-page будет скорректирован до 100, получено {corrected}"
    validate_routes_response(response)

@pytest.mark.parametrize("extra_params", [
    {"unknown": "value"},
    {"pagination-page-number": 1, "extra": 123},
])
def test_get_routes_extra_query_params(base_url, extra_params):
    """
    Проверка: При передаче лишних (неописанных) параметров сервер игнорирует их и возвращает корректный ответ.
    """
    response = get_routes(base_url, extra_params)
    assert response.status_code == 200, f"Ожидался статус 200, получен {response.status_code}"
    validate_routes_response(response)

@pytest.mark.parametrize("method", ["POST", "PUT", "DELETE"])
def test_get_routes_invalid_http_method(base_url, method):
    """
    Проверка неподдерживаемых HTTP-методов для /api/route/routes.
    Ожидается статус 405 Method Not Allowed.
    """
    response = get_routes(base_url, method=method)
    assert response.status_code == 405, f"Ожидался статус 405 для метода {method}, получен {response.status_code}"

# -----------------------------------------------------------------------------
# Тесты для /api/route/route/{route_id}
# -----------------------------------------------------------------------------

@pytest.mark.parametrize("route_id, expected_status", [
    (1, 200),          # Существующий маршрут
    (999999, 404),     # Несуществующий маршрут
    ("invalid", 400),  # Некорректный тип route_id
    (-1, 404),         # Пустой route_id – ожидается, что путь не будет найден
])
def test_get_route_details(base_url, route_id, expected_status):
    """
    Проверка получения детальной информации по маршруту.
    При корректном route_id (200) дополнительно проверяется структура ответа.
    Для некорректных значений ожидаются коды 404 или 400.
    """
    response = get_route_details(base_url, route_id)
    assert response.status_code == expected_status, (
        f"Ожидался статус {expected_status} для route_id={route_id}, получен {response.status_code}"
    )
    if expected_status == 200:
        data = response.json()
        validate_route_details(data)
    else:
        assert response.json() or response.text

@pytest.mark.parametrize("extra_params", [
    {"extra": "value"},
    {"unused": 123, "another": "test"}
])
def test_get_route_details_extra_query_params(base_url, extra_params):
    """
    Проверка: При передаче лишних query-параметров в запросе на получение деталей маршрута
    сервер возвращает корректный ответ.
    """
    response = get_route_details(base_url, 1, params=extra_params)
    assert response.status_code == 200, f"Ожидался статус 200, получен {response.status_code}"
    validate_route_details(response.json())

@pytest.mark.parametrize("method", ["POST", "PUT", "DELETE"])
def test_get_route_details_invalid_http_method(base_url, method):
    """
    Проверка неподдерживаемых HTTP-методов для /api/route/route/{route_id}.
    Ожидается статус 405 Method Not Allowed.
    """
    response = get_route_details(base_url, 1, method=method)
    assert response.status_code == 405, f"Ожидался статус 405 для метода {method}, получен {response.status_code}"

import os
import requests
import pytest

BASE_URL = "http://localhost:8100"

@pytest.fixture
def base_url():
    return BASE_URL

def upload_image(base_url, file_path, filename):
    url = f"{base_url}/api/media/image/upload"
    # Открываем файл в режиме 'rb'
    with open(file_path, 'rb') as f:
        files = {'file': (filename, f, 'image/jpeg')}
        response = requests.post(url, files=files)
    return response

def get_image(base_url, image_name, params=None, method="GET"):
    url = f"{base_url}/api/media/image/{image_name}"
    return requests.request(method, url, params=params)

def test_upload_valid_image(base_url):
    """
    Проверяем успешную загрузку изображения:
      - статус 200,
      - возвращается JSON с ключом "image_url",
      - URL начинается с "/api/media/image/".
    """
    test_file = os.path.join(os.path.dirname(__file__), "imgs", "1.jpg")
    response = upload_image(base_url, test_file, "1.jpg")
    assert response.status_code == 200, f"Ожидался статус 200, получен {response.status_code}"
    data = response.json()
    assert "image_url" in data, "Ключ 'image_url' отсутствует в ответе"

def test_upload_no_file(base_url):
    """
    Проверяем, что при отсутствии файла возвращается 400 и JSON с ошибкой.
    """
    url = f"{base_url}/api/media/image/upload"
    response = requests.post(url)  # без файла
    assert response.status_code == 400, f"Ожидался статус 400, получен {response.status_code}"

def test_get_uploaded_image(base_url):
    """
    Загружаем изображение, затем запрашиваем его по URL и проверяем:
      - статус 200,
      - в заголовке Content-Type присутствует image/*.
    """
    test_file = os.path.join(os.path.dirname(__file__), "imgs", "1.jpg")
    upload_resp = upload_image(base_url, test_file, "1.jpg")
    data = upload_resp.json()
    image_url = data["image_url"]
    # Извлекаем имя файла из URL
    image_name = image_url.split("/")[-1]
    get_resp = get_image(base_url, image_name)
    assert get_resp.status_code == 200, f"Ожидался статус 200, получен {get_resp.status_code}"
    content_type = get_resp.headers.get("Content-Type")
    assert content_type is not None and content_type.startswith("image/"), "Некорректный Content-Type"

def test_get_nonexistent_image(base_url):
    """
    Проверяем запрос несуществующего изображения – ожидается 404 и JSON с ошибкой.
    """
    response = get_image(base_url, "nonexistent.jpg")
    assert response.status_code == 404, f"Ожидался статус 404, получен {response.status_code}"
    data = response.json()
    assert "error" in data, "Ожидалась ошибка для несуществующего изображения"

@pytest.mark.parametrize("method", ["PUT", "DELETE"])
def test_upload_invalid_http_method(base_url, method):
    """
    Проверяем, что для эндпоинта загрузки изображений не поддерживаются методы, отличные от POST.
    """
    url = f"{base_url}/api/media/image/upload"
    response = requests.request(method, url)
    assert response.status_code == 405, f"Ожидался статус 405 для метода {method}, получен {response.status_code}"

@pytest.mark.parametrize("method", ["POST", "PUT", "DELETE"])
def test_get_invalid_http_method(base_url, method):
    """
    Проверяем, что для эндпоинта получения изображений не поддерживаются методы, отличные от GET.
    """
    response = get_image(base_url, "nonexistent.jpg", method=method)
    assert response.status_code == 405, f"Ожидался статус 405 для метода {method}, получен {response.status_code}"

def test_upload_extra_query_params(base_url):
    """
    Проверяем, что при передаче лишних query-параметров в запрос загрузки изображений
    сервер игнорирует их и возвращает корректный ответ.
    """
    url = f"{base_url}/api/media/image/upload?extra=value"
    test_file = os.path.join(os.path.dirname(__file__), "imgs", "2.jpg")
    with open(test_file, 'rb') as f:
        files = {'file': ("2.jpg", f, 'image/jpeg')}
        response = requests.post(url, files=files)
    assert response.status_code == 200, f"Ожидался статус 200, получен {response.status_code}"
    data = response.json()
    assert "image_url" in data, "Ключ 'image_url' отсутствует"

def test_get_extra_query_params(base_url):
    """
    Проверяем, что при передаче лишних query-параметров в запрос получения изображения
    сервер возвращает корректный ответ.
    """
    # Сначала загружаем изображение
    test_file = os.path.join(os.path.dirname(__file__), "imgs", "1.jpg")
    upload_resp = upload_image(base_url, test_file, "1.jpg")
    data = upload_resp.json()
    image_url = data["image_url"]
    image_name = image_url.split("/")[-1]
    response = get_image(base_url, image_name, params={"unused": "param"})
    assert response.status_code == 200, f"Ожидался статус 200, получен {response.status_code}"

INSERT INTO bug_reports (user_id, details, created_at, status)
VALUES
(6, 'Не загружается изображение при создании маршрута', EXTRACT(EPOCH FROM NOW())::BIGINT - 86400, 'opened'),
(3, 'Ошибка 500 при попытке изменить профиль', EXTRACT(EPOCH FROM NOW())::BIGINT - 86400 * 3, 'opened'),
(9, 'Отображение UI ломается при смене языка', EXTRACT(EPOCH FROM NOW())::BIGINT - 86400 * 7, 'closed');

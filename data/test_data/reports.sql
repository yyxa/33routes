
INSERT INTO reports (user_id, reported_entity, entity_id, reason, details, created_at, status)
VALUES
(2, 'route', 101, 'spam or advertising', 'Маршрут выглядит подозрительно, нет описания', EXTRACT(EPOCH FROM NOW())::BIGINT, 'opened'),
(4, 'comment', 205, 'offensive content', 'Комментарий содержит грубость и мат', EXTRACT(EPOCH FROM NOW())::BIGINT - 86400 * 2, 'opened'),
(1, 'user', 7, 'violation of community rules', 'Пользователь нарушает правила, загружая фейк-контент', EXTRACT(EPOCH FROM NOW())::BIGINT - 86400 * 5, 'closed');


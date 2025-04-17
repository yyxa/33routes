INSERT INTO collections (user_id, name, rating, url, description, tags, created_at, is_deleted) 
VALUES
    (5, 'Лесные прогулки Москвы', 4.7, 'forest-walks-moscow', 'Маршруты по живописным паркам и лесам Москвы и области.', ARRAY['forest', 'park']::tag_type[], 1711927200, FALSE),
    (1, 'Кремль и центр', 4.5, 'kremlin-center', 'Исторические маршруты в центре Москвы.', ARRAY['park']::tag_type[], 1711840800, FALSE),
    (9, 'Современные небоскрёбы', 4.1, 'urban-skyline', 'Прогулки среди высотных зданий.', ARRAY['park']::tag_type[], 1711747200, FALSE),
    (4, 'Воробьёвы горы и река', 4.8, 'sparrow-hills', 'Панорамные виды и маршруты у воды.', ARRAY['near_water', 'park']::tag_type[], 1711660800, FALSE),
    (3, 'Троицк — скрытые тропы', 4.3, 'troitsk-hidden', 'Локальные и редкие маршруты.', ARRAY['forest']::tag_type[], 1711574400, FALSE),
    (2, 'Речной маршрут', 3.9, 'river-route', 'Прогулка вдоль берега с видом на набережную.', ARRAY['near_water']::tag_type[], 1711488000, FALSE),
    (6, 'Чел — прогулка до леса', 4.0, 'chel-forest', 'Маршрут от метро в лесопарк.', ARRAY['forest', 'park']::tag_type[], 1711401600, FALSE),
    (7, 'Коломенское парк', 4.6, 'kolomenskoe', 'Маршрут через парк и музей.', ARRAY['park']::tag_type[], 1711315200, FALSE),
    (8, 'Лыткарино: у воды и лес', 4.2, 'lytk-water-forest', 'Природный маршрут по югу МО.', ARRAY['near_water', 'forest']::tag_type[], 1711228800, FALSE);

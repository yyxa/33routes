-- Вставка тестовых данных в таблицу users
INSERT INTO users (username, name, surname, country, city, email, password_hash, avatar_url, created_at)
VALUES
    ('john_doe', 'John', 'Doe', 'USA', 'New York', 'john@example.com', 'hashed_password_1', 'user_avatar_1.png', EXTRACT(EPOCH FROM NOW())::BIGINT),
    ('jane_smith', 'Jane', 'Smith', 'USA', 'Los Angeles', 'jane@example.com', 'hashed_password_2', 'user_avatar_2.png', EXTRACT(EPOCH FROM NOW())::BIGINT),
    ('alice_johnson', 'Alice', 'Johnson', 'Canada', 'Toronto', 'alice@example.com', 'hashed_password_3', 'user_avatar_3.png', EXTRACT(EPOCH FROM NOW())::BIGINT),
    ('bob_brown', 'Bob', 'Brown', 'UK', 'London', 'bob@example.com', 'hashed_password_4', 'user_avatar_4.png', EXTRACT(EPOCH FROM NOW())::BIGINT),
    ('charlie_white', 'Charlie', 'White', 'Australia', 'Sydney', 'charlie@example.com', 'hashed_password_5', 'user_avatar_5.png', EXTRACT(EPOCH FROM NOW())::BIGINT),
    ('diana_green', 'Diana', 'Green', 'USA', 'Chicago', 'diana@example.com', 'hashed_password_6', 'user_avatar_6.png', EXTRACT(EPOCH FROM NOW())::BIGINT),
    ('edward_black', 'Edward', 'Black', 'UK', 'Manchester', 'edward@example.com', 'hashed_password_7', 'user_avatar_7.png', EXTRACT(EPOCH FROM NOW())::BIGINT),
    ('fiona_yellow', 'Fiona', 'Yellow', 'Canada', 'Vancouver', 'fiona@example.com', 'hashed_password_8', 'user_avatar_8.png', EXTRACT(EPOCH FROM NOW())::BIGINT),
    ('george_purple', 'George', 'Purple', 'USA', 'Miami', 'george@example.com', 'hashed_password_9', 'user_avatar_9.png', EXTRACT(EPOCH FROM NOW())::BIGINT),
    ('hannah_orange', 'Hannah', 'Orange', 'Australia', 'Brisbane', 'hannah@example.com', 'hashed_password_10', 'user_avatar_10.png', EXTRACT(EPOCH FROM NOW())::BIGINT);


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


INSERT INTO collection_routes (collection_id, route_id) 
VALUES
    (1, 5), (1, 6), (1, 7),
    (2, 1), (2, 6),
    (3, 6), (3, 9),
    (4, 4), (4, 1),
    (5, 8), (5, 3),
    (6, 2), (6, 1),
    (7, 6), (7, 5),
    (8, 7), (8, 1), (8, 2),
    (9, 4), (9, 5);

-- -- Вставка тестовых данных в таблицу routes
-- INSERT INTO routes (user_id, name, url, description, length, duration, tags, category, created_at, status, rating, images)
-- VALUES
--     (1, 'Central Park Walk', 'central-park-walk', 'A beautiful walk through Central Park.', 5, 3600, ARRAY['park']::tag_type[], 'walking', EXTRACT(EPOCH FROM NOW())::BIGINT, 'approved', 4.5, ARRAY['image1.jpg']),
--     (2, 'Forest Trail', 'forest-trail', 'A scenic trail through the forest.', 10, 7200, ARRAY['forest']::tag_type[], 'walking', EXTRACT(EPOCH FROM NOW())::BIGINT, 'pending', 0.0, ARRAY['image2.jpg']),
--     (3, 'Beachside Stroll', 'beachside-stroll', 'A relaxing stroll along the beach.', 3, 1800, ARRAY['near_water']::tag_type[], 'walking', EXTRACT(EPOCH FROM NOW())::BIGINT, 'approved', 4.0, ARRAY['image3.jpg']),
--     (4, 'Mountain Hike', 'mountain-hike', 'A challenging hike up the mountain.', 15, 10800, ARRAY['forest']::tag_type[], 'walking', EXTRACT(EPOCH FROM NOW())::BIGINT, 'approved', 4.8, ARRAY['image4.jpg']),
--     (5, 'City Tour', 'city-tour', 'Explore the city on foot.', 8, 5400, ARRAY['park']::tag_type[], 'walking', EXTRACT(EPOCH FROM NOW())::BIGINT, 'approved', 4.2, ARRAY['image5.jpg']),
--     (6, 'River Walk', 'river-walk', 'A peaceful walk along the river.', 4, 2400, ARRAY['near_water']::tag_type[], 'walking', EXTRACT(EPOCH FROM NOW())::BIGINT, 'approved', 4.3, ARRAY['image6.jpg']),
--     (7, 'Desert Trek', 'desert-trek', 'An adventurous trek through the desert.', 20, 14400, ARRAY['forest']::tag_type[], 'walking', EXTRACT(EPOCH FROM NOW())::BIGINT, 'pending', 0.0, ARRAY['image7.jpg']),
--     (8, 'Historical Sites Tour', 'historical-sites-tour', 'Visit historical sites in the city.', 6, 3600, ARRAY['park']::tag_type[], 'walking', EXTRACT(EPOCH FROM NOW())::BIGINT, 'approved', 4.6, ARRAY['image8.jpg']),
--     (9, 'Lakeside Path', 'lakeside-path', 'A scenic path along the lake.', 7, 4200, ARRAY['near_water']::tag_type[], 'walking', EXTRACT(EPOCH FROM NOW())::BIGINT, 'approved', 4.7, ARRAY['image9.jpg']),
--     (10, 'Countryside Walk', 'countryside-walk', 'Enjoy the beauty of the countryside.', 12, 7200, ARRAY['forest']::tag_type[], 'walking', EXTRACT(EPOCH FROM NOW())::BIGINT, 'approved', 4.4, ARRAY['image10.jpg']);

-- -- Обновление данных в таблице collection_routes
-- INSERT INTO collection_routes (collection_id, route_id)
-- VALUES
--     -- Коллекция 1: один маршрут
--     (1, 1),
    
--     -- Коллекция 2: три маршрута
--     (2, 2),
--     (2, 3),
--     (2, 4),
    
--     -- Коллекция 3: два маршрута
--     (3, 5),
--     (3, 6),
    
--     -- Коллекция 4: три маршрута
--     (4, 7),
--     (4, 8),
--     (4, 9),
    
--     -- Коллекция 5: один маршрут
--     (5, 10),
    
--     -- Коллекция 6: два маршрута
--     (6, 1),
--     (6, 2),
    
--     -- Коллекция 7: три маршрута
--     (7, 3),
--     (7, 4),
--     (7, 5),
    
--     -- Коллекция 8: один маршрут
--     (8, 6),
    
--     -- Коллекция 9: два маршрута
--     (9, 7),
--     (9, 8),
    
--     -- Коллекция 10: три маршрута
--     (10, 8),
--     (10, 9),
--     (10, 10);

-- -- Вставка тестовых данных в таблицу reviews
-- INSERT INTO reviews (user_id, route_id, rating, comment, created_at, is_deleted, images)
-- VALUES
--     (1, 1, 5.0, 'Amazing walk! The views were breathtaking.', EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE, ARRAY['review_image1.jpg']),
--     (2, 2, 4.0, 'Nice trail, but a bit crowded.', EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE, ARRAY['review_image2.jpg']),
--     (3, 3, 4.5, 'Loved the beachside stroll, very relaxing.', EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE, ARRAY['review_image3.jpg']),
--     (4, 4, 5.0, 'The mountain hike was challenging but worth it!', EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE, ARRAY['review_image4.jpg']),
--     (5, 5, 4.2, 'Great city tour, learned a lot!', EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE, ARRAY['review_image5.jpg']),
--     (6, 6, 4.3, 'The river walk was peaceful and beautiful.', EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE, ARRAY['review_image6.jpg']),
--     (7, 7, 4.8, 'An unforgettable desert trek!', EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE, ARRAY['review_image7.jpg']),
--     (8, 8, 4.6, 'Loved visiting the historical sites.', EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE, ARRAY['review_image8.jpg']),
--     (9, 9, 4.7, 'The lakeside path was stunning!', EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE, ARRAY['review_image9.jpg']),
--     (10, 10, 4.4, 'A lovely countryside walk, very refreshing.', EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE, ARRAY['review_image10.jpg']);

-- -- Вставка тестовых данных в таблицу review_comments
-- INSERT INTO review_comments (review_id, user_id, comment, created_at, reply_to, is_deleted, images)
-- VALUES
--     (1, 2, 'I agree! It was a fantastic experience.', EXTRACT(EPOCH FROM NOW())::BIGINT, NULL, FALSE, ARRAY['comment_image1.jpg']),
--     (2, 1, 'Thanks for the review! I will check it out.', EXTRACT(EPOCH FROM NOW())::BIGINT, NULL, FALSE, ARRAY['comment_image2.jpg']),
--     (3, 3, 'Sounds amazing, cant wait to visit!', EXTRACT(EPOCH FROM NOW())::BIGINT, NULL, FALSE, ARRAY['comment_image3.jpg']);

-- -- Вставка тестовых данных в таблицу saved_routes
-- INSERT INTO saved_routes (user_id, route_id)
-- VALUES
--     (1, 2),
--     (2, 1),
--     (3, 3),
--     (4, 1),
--     (5, 4),
--     (6, 5),
--     (7, 6),
--     (8, 7),
--     (9, 8),
--     (10, 9);

-- -- Вставка тестовых данных в таблицу completed_routes
-- INSERT INTO completed_routes (user_id, route_id, completed_at)
-- VALUES
--     (1, 1, EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (2, 2, EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (3, 3, EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (4, 4, EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (5, 5, EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (6, 6, EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (7, 7, EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (8, 8, EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (9, 9, EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (10, 10, EXTRACT(EPOCH FROM NOW())::BIGINT);

-- -- Вставка тестовых данных в таблицу reports
-- INSERT INTO reports (user_id, reported_entity, entity_id, reason, details, created_at)
-- VALUES
--     (1, 'route', 2, 'inappropriate content', 'The description is misleading.', EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (2, 'review', 1, 'spam or advertising', 'This review seems promotional.', EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (3, 'comment', 1, 'offensive content', 'The comment is inappropriate.', EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (4, 'route', 3, 'inappropriate content', 'Route is not safe.', EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (5, 'review', 2, 'spam or advertising', 'This review is not genuine.', EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (6, 'comment', 2, 'offensive content', 'The comment is inappropriate.', EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (7, 'route', 4, 'inappropriate content', 'Route description is incorrect.', EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (8, 'review', 3, 'spam or advertising', 'This review seems biased.', EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (9, 'comment', 3, 'offensive content', 'This comment is offensive.', EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (10, 'route', 5, 'inappropriate content', 'Route is not well marked.', EXTRACT(EPOCH FROM NOW())::BIGINT);

-- -- Вставка тестовых данных в таблицу bug_reports
-- INSERT INTO bug_reports (user_id, details, created_at)
-- VALUES
--     (1, 'The app crashes when I try to save a route.', EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (2, 'I found a bug in the route creation form.', EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (3, 'The map does not load properly.', EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (4, 'The app freezes when I open the collections.', EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (5, 'I cannot edit my profile information.', EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (6, 'The search function is not working.', EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (7, 'I cannot upload images for my routes.', EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (8, 'The notifications are not being sent.', EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (9, 'The user settings page is not loading.', EXTRACT(EPOCH FROM NOW())::BIGINT),
--     (10, 'The app crashes when I try to view reviews.', EXTRACT(EPOCH FROM NOW())::BIGINT);


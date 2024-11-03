-- Вставка тестовых данных в таблицу users
INSERT INTO users (username, name, surname, country, city, email, password_hash, created_at)
VALUES
    ('john_doe', 'John', 'Doe', 'USA', 'New York', 'john@example.com', 'hashed_password_1', EXTRACT(EPOCH FROM NOW())::BIGINT),
    ('jane_smith', 'Jane', 'Smith', 'USA', 'Los Angeles', 'jane@example.com', 'hashed_password_2', EXTRACT(EPOCH FROM NOW())::BIGINT),
    ('alice_johnson', 'Alice', 'Johnson', 'Canada', 'Toronto', 'alice@example.com', 'hashed_password_3', EXTRACT(EPOCH FROM NOW())::BIGINT),
    ('bob_brown', 'Bob', 'Brown', 'UK', 'London', 'bob@example.com', 'hashed_password_4', EXTRACT(EPOCH FROM NOW())::BIGINT),
    ('charlie_white', 'Charlie', 'White', 'Australia', 'Sydney', 'charlie@example.com', 'hashed_password_5', EXTRACT(EPOCH FROM NOW())::BIGINT),
    ('diana_green', 'Diana', 'Green', 'USA', 'Chicago', 'diana@example.com', 'hashed_password_6', EXTRACT(EPOCH FROM NOW())::BIGINT),
    ('edward_black', 'Edward', 'Black', 'UK', 'Manchester', 'edward@example.com', 'hashed_password_7', EXTRACT(EPOCH FROM NOW())::BIGINT),
    ('fiona_yellow', 'Fiona', 'Yellow', 'Canada', 'Vancouver', 'fiona@example.com', 'hashed_password_8', EXTRACT(EPOCH FROM NOW())::BIGINT),
    ('george_purple', 'George', 'Purple', 'USA', 'Miami', 'george@example.com', 'hashed_password_9', EXTRACT(EPOCH FROM NOW())::BIGINT),
    ('hannah_orange', 'Hannah', 'Orange', 'Australia', 'Brisbane', 'hannah@example.com', 'hashed_password_10', EXTRACT(EPOCH FROM NOW())::BIGINT);

-- Вставка тестовых данных в таблицу user_settings
INSERT INTO user_settings (user_id, show_phone, show_planned, show_visited)
VALUES
    (1, TRUE, TRUE, TRUE),
    (2, FALSE, TRUE, FALSE),
    (3, TRUE, FALSE, TRUE),
    (4, FALSE, TRUE, TRUE),
    (5, TRUE, TRUE, FALSE),
    (6, FALSE, FALSE, TRUE),
    (7, TRUE, TRUE, TRUE),
    (8, FALSE, TRUE, FALSE),
    (9, TRUE, FALSE, TRUE),
    (10, FALSE, TRUE, TRUE);

-- Вставка тестовых данных в таблицу routes
INSERT INTO routes (user_id, name, url, description, length, duration, tags, category, created_at, status, rating, images)
VALUES
    (1, 'Central Park Walk', 'central-park-walk', 'A beautiful walk through Central Park.', 5, 3600, ARRAY['park'], 'walking', EXTRACT(EPOCH FROM NOW())::BIGINT, 'approved', 4.5, ARRAY['image1.jpg']),
    (2, 'Forest Trail', 'forest-trail', 'A scenic trail through the forest.', 10, 7200, ARRAY['forest'], 'walking', EXTRACT(EPOCH FROM NOW())::BIGINT, 'pending', 0.0, ARRAY['image2.jpg']),
    (3, 'Beachside Stroll', 'beachside-stroll', 'A relaxing stroll along the beach.', 3, 1800, ARRAY['near_water'], 'walking', EXTRACT(EPOCH FROM NOW())::BIGINT, 'approved', 4.0, ARRAY['image3.jpg']),
    (4, 'Mountain Hike', 'mountain-hike', 'A challenging hike up the mountain.', 15, 10800, ARRAY['forest'], 'walking', EXTRACT(EPOCH FROM NOW())::BIGINT, 'approved', 4.8, ARRAY['image4.jpg']),
    (5, 'City Tour', 'city-tour', 'Explore the city on foot.', 8, 5400, ARRAY['park'], 'walking', EXTRACT(EPOCH FROM NOW())::BIGINT, 'approved', 4.2, ARRAY['image5.jpg']),
    (6, 'River Walk', 'river-walk', 'A peaceful walk along the river.', 4, 2400, ARRAY['near_water'], 'walking', EXTRACT(EPOCH FROM NOW())::BIGINT, 'approved', 4.3, ARRAY['image6.jpg']),
    (7, 'Desert Trek', 'desert-trek', 'An adventurous trek through the desert.', 20, 14400, ARRAY['forest'], 'walking', EXTRACT(EPOCH FROM NOW())::BIGINT, 'pending', 0.0, ARRAY['image7.jpg']),
    (8, 'Historical Sites Tour', 'historical-sites-tour', 'Visit historical sites in the city.', 6, 3600, ARRAY['park'], 'walking', EXTRACT(EPOCH FROM NOW())::BIGINT, 'approved', 4.6, ARRAY['image8.jpg']),
    (9, 'Lakeside Path', 'lakeside-path', 'A scenic path along the lake.', 7, 4200, ARRAY['near_water'], 'walking', EXTRACT(EPOCH FROM NOW())::BIGINT, 'approved', 4.7, ARRAY['image9.jpg']),
    (10, 'Countryside Walk', 'countryside-walk', 'Enjoy the beauty of the countryside.', 12, 7200, ARRAY['forest'], 'walking', EXTRACT(EPOCH FROM NOW())::BIGINT, 'approved', 4.4, ARRAY['image10.jpg']);

-- Вставка тестовых данных в таблицу route_points
INSERT INTO route_points (route_id, coordinate, time_offset, elevation, speed)
VALUES
    (1, ST_SetSRID(ST_MakePoint(-73.9654, 40.7851), 4326), 0, 10, 3.5),
    (1, ST_SetSRID(ST_MakePoint(-73.9733, 40.7829), 4326), 600, 12, 4.0),
    (2, ST_SetSRID(ST_MakePoint(-79.3832, 43.6532), 4326), 0, 15, 2.5),
    (3, ST_SetSRID(ST_MakePoint(-80.1342, 25.7617), 4326), 0, 5, 3.0),
    (4, ST_SetSRID(ST_MakePoint(-105.2705, 40.0150), 4326), 0, 20, 4.5),
    (5, ST_SetSRID(ST_MakePoint(-73.9352, 40.7306), 4326), 0, 8, 3.8),
    (6, ST_SetSRID(ST_MakePoint(-79.3832, 43.6532), 4326), 0, 10, 2.0),
    (7, ST_SetSRID(ST_MakePoint(-116.1659, 33.9925), 4326), 0, 30, 3.0),
    (8, ST_SetSRID(ST_MakePoint(-73.9352, 40.7306), 4326), 0, 5, 4.0),
    (9, ST_SetSRID(ST_MakePoint(-73.9683, 40.7851), 4326), 0, 12, 3.5),
    (10, ST_SetSRID(ST_MakePoint(-73.9352, 40.7306), 4326), 0, 15, 4.0);

-- Вставка тестовых данных в таблицу route_points_info
INSERT INTO route_points_info (point_id, route_id, point_description, images)
VALUES
    (1, 1, 'Start of the walk at Central Park', ARRAY['point_image1.jpg']),
    (2, 1, 'Beautiful view of the lake', ARRAY['point_image2.jpg']),
    (1, 2, 'Entering the forest trail', ARRAY['point_image3.jpg']),
    (1, 3, 'Relaxing view of the beach', ARRAY['point_image4.jpg']),
    (1, 4, 'Reaching the mountain summit', ARRAY['point_image5.jpg']),
    (1, 5, 'City skyline view', ARRAY['point_image6.jpg']),
    (1, 6, 'Calm river view', ARRAY['point_image7.jpg']),
    (1, 7, 'Desert landscape', ARRAY['point_image8.jpg']),
    (1, 8, 'Historical monument', ARRAY['point_image9.jpg']),
    (1, 9, 'Lakeside view', ARRAY['point_image10.jpg']),
    (1, 10, 'Countryside scenery', ARRAY['point_image11.jpg']);

-- Вставка тестовых данных в таблицу collections
INSERT INTO collections (user_id, name, rating, url, description, tags, created_at, is_deleted)
VALUES
    (1, 'My Favorite Routes', 4.5, 'my-favorite-routes', 'A collection of my favorite walking routes.', ARRAY['park', 'forest'], EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE),
    (2, 'Scenic Trails', 5.0, 'scenic-trails', 'A collection of scenic trails.', ARRAY['forest'], EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE),
    (3, 'Beach Walks', 4.8, 'beach-walks', 'Best beach walks around the world.', ARRAY['near_water'], EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE),
    (4, 'Mountain Adventures', 4.9, 'mountain-adventures', 'Challenging hikes in the mountains.', ARRAY['forest'], EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE),
    (5, 'City Explorations', 4.6, 'city-explorations', 'Explore the best cities on foot.', ARRAY['park'], EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE),
    (6, 'Nature Trails', 4.7, 'nature-trails', 'Beautiful trails in nature.', ARRAY['forest'], EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE),
    (7, 'Historical Walks', 4.5, 'historical-walks', 'Walk through history.', ARRAY['park'], EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE),
    (8, 'Family Friendly Routes', 4.4, 'family-friendly-routes', 'Routes suitable for families.', ARRAY['park'], EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE),
    (9, 'Adventure Trails', 4.8, 'adventure-trails', 'For the adventurous spirit.', ARRAY['forest'], EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE),
    (10, 'Relaxing Walks', 4.6, 'relaxing-walks', 'Calm and peaceful walks.', ARRAY['near_water'], EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE);

-- Вставка тестовых данных в таблицу collection_routes
INSERT INTO collection_routes (collection_id, route_id)
VALUES
    (1, 1),
    (1, 3),
    (2, 2),
    (3, 4),
    (4, 5),
    (5, 6),
    (6, 7),
    (7, 8),
    (8, 9),
    (9, 10);

-- Вставка тестовых данных в таблицу reviews
INSERT INTO reviews (user_id, route_id, rating, comment, created_at, is_deleted, images)
VALUES
    (1, 1, 5.0, 'Amazing walk! The views were breathtaking.', EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE, ARRAY['review_image1.jpg']),
    (2, 2, 4.0, 'Nice trail, but a bit crowded.', EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE, ARRAY['review_image2.jpg']),
    (3, 3, 4.5, 'Loved the beachside stroll, very relaxing.', EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE, ARRAY['review_image3.jpg']),
    (4, 4, 5.0, 'The mountain hike was challenging but worth it!', EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE, ARRAY['review_image4.jpg']),
    (5, 5, 4.2, 'Great city tour, learned a lot!', EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE, ARRAY['review_image5.jpg']),
    (6, 6, 4.3, 'The river walk was peaceful and beautiful.', EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE, ARRAY['review_image6.jpg']),
    (7, 7, 4.8, 'An unforgettable desert trek!', EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE, ARRAY['review_image7.jpg']),
    (8, 8, 4.6, 'Loved visiting the historical sites.', EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE, ARRAY['review_image8.jpg']),
    (9, 9, 4.7, 'The lakeside path was stunning!', EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE, ARRAY['review_image9.jpg']),
    (10, 10, 4.4, 'A lovely countryside walk, very refreshing.', EXTRACT(EPOCH FROM NOW())::BIGINT, FALSE, ARRAY['review_image10.jpg']);

-- Вставка тестовых данных в таблицу review_comments
INSERT INTO review_comments (review_id, user_id, comment, created_at, reply_to, is_deleted, images)
VALUES
    (1, 2, 'I agree! It was a fantastic experience.', EXTRACT(EPOCH FROM NOW())::BIGINT, NULL, FALSE, ARRAY['comment_image1.jpg']),
    (2, 1, 'Thanks for the review! I will check it out.', EXTRACT(EPOCH FROM NOW())::BIGINT, NULL, FALSE, ARRAY['comment_image2.jpg']),
    (3, 4, 'I loved it too!', EXTRACT(EPOCH FROM NOW())::BIGINT, NULL, FALSE, ARRAY['comment_image3.jpg']),
    (4, 5, 'The views were incredible!', EXTRACT(EPOCH FROM NOW())::BIGINT, NULL, FALSE, ARRAY['comment_image4.jpg']),
    (5, 6, 'I can’t wait to try this route!', EXTRACT(EPOCH FROM NOW())::BIGINT, NULL, FALSE, ARRAY['comment_image5.jpg']),
    (6, 7, 'This sounds amazing!', EXTRACT(EPOCH FROM NOW())::BIGINT, NULL, FALSE, ARRAY['comment_image6.jpg']),
    (7, 8, 'I’ve been wanting to do this hike!', EXTRACT(EPOCH FROM NOW())::BIGINT, NULL, FALSE, ARRAY['comment_image7.jpg']),
    (8, 9, 'Great review! I’ll add this to my list.', EXTRACT(EPOCH FROM NOW())::BIGINT, NULL, FALSE, ARRAY['comment_image8.jpg']),
    (9, 10, 'Looks like a perfect weekend getaway!', EXTRACT(EPOCH FROM NOW())::BIGINT, NULL, FALSE, ARRAY['comment_image9.jpg']),
    (10, 3, 'I love countryside walks!', EXTRACT(EPOCH FROM NOW())::BIGINT, NULL, FALSE, ARRAY['comment_image10.jpg']);

-- Вставка тестовых данных в таблицу saved_routes
INSERT INTO saved_routes (user_id, route_id)
VALUES
    (1, 2),
    (2, 1),
    (3, 3),
    (4, 1),
    (5, 4),
    (6, 5),
    (7, 6),
    (8, 7),
    (9, 8),
    (10, 9);

-- Вставка тестовых данных в таблицу completed_routes
INSERT INTO completed_routes (user_id, route_id, completed_at)
VALUES
    (1, 1, EXTRACT(EPOCH FROM NOW())::BIGINT),
    (2, 2, EXTRACT(EPOCH FROM NOW())::BIGINT),
    (3, 3, EXTRACT(EPOCH FROM NOW())::BIGINT),
    (4, 4, EXTRACT(EPOCH FROM NOW())::BIGINT),
    (5, 5, EXTRACT(EPOCH FROM NOW())::BIGINT),
    (6, 6, EXTRACT(EPOCH FROM NOW())::BIGINT),
    (7, 7, EXTRACT(EPOCH FROM NOW())::BIGINT),
    (8, 8, EXTRACT(EPOCH FROM NOW())::BIGINT),
    (9, 9, EXTRACT(EPOCH FROM NOW())::BIGINT),
    (10, 10, EXTRACT(EPOCH FROM NOW())::BIGINT);

-- Вставка тестовых данных в таблицу reports
INSERT INTO reports (user_id, reported_entity, entity_id, reason, details, created_at)
VALUES
    (1, 'route', 2, 'inappropriate content', 'The description is misleading.', EXTRACT(EPOCH FROM NOW())::BIGINT),
    (2, 'review', 1, 'spam or advertising', 'This review seems promotional.', EXTRACT(EPOCH FROM NOW())::BIGINT),
    (3, 'comment', 1, 'offensive content', 'The comment is inappropriate.', EXTRACT(EPOCH FROM NOW())::BIGINT),
    (4, 'route', 3, 'inappropriate content', 'Route is not safe.', EXTRACT(EPOCH FROM NOW())::BIGINT),
    (5, 'review', 2, 'spam or advertising', 'This review is not genuine.', EXTRACT(EPOCH FROM NOW())::BIGINT),
    (6, 'comment', 2, 'offensive content', 'The comment is inappropriate.', EXTRACT(EPOCH FROM NOW())::BIGINT),
    (7, 'route', 4, 'inappropriate content', 'Route description is incorrect.', EXTRACT(EPOCH FROM NOW())::BIGINT),
    (8, 'review', 3, 'spam or advertising', 'This review seems biased.', EXTRACT(EPOCH FROM NOW())::BIGINT),
    (9, 'comment', 3, 'offensive content', 'This comment is offensive.', EXTRACT(EPOCH FROM NOW())::BIGINT),
    (10, 'route', 5, 'inappropriate content', 'Route is not well marked.', EXTRACT(EPOCH FROM NOW())::BIGINT);

-- Вставка тестовых данных в таблицу bug_reports
INSERT INTO bug_reports (user_id, details, created_at)
VALUES
    (1, 'The app crashes when I try to save a route.', EXTRACT(EPOCH FROM NOW())::BIGINT),
    (2, 'I found a bug in the route creation form.', EXTRACT(EPOCH FROM NOW())::BIGINT),
    (3, 'The map does not load properly.', EXTRACT(EPOCH FROM NOW())::BIGINT),
    (4, 'The app freezes when I open the collections.', EXTRACT(EPOCH FROM NOW())::BIGINT),
    (5, 'I cannot edit my profile information.', EXTRACT(EPOCH FROM NOW())::BIGINT),
    (6, 'The search function is not working.', EXTRACT(EPOCH FROM NOW())::BIGINT),
    (7, 'I cannot upload images for my routes.', EXTRACT(EPOCH FROM NOW())::BIGINT),
    (8, 'The notifications are not being sent.', EXTRACT(EPOCH FROM NOW())::BIGINT),
    (9, 'The user settings page is not loading.', EXTRACT(EPOCH FROM NOW())::BIGINT),
    (10, 'The app crashes when I try to view reviews.', EXTRACT(EPOCH FROM NOW())::BIGINT);


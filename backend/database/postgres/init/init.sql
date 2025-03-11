CREATE EXTENSION postgis;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = '33routes') THEN
        CREATE DATABASE "33routes";
    END IF;
END
$$;

\c "33routes";

CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    vk_id BIGINT,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    avatar_url TEXT UNIQUE,
    bio TEXT,
    phone VARCHAR(20),
    created_at BIGINT NOT NULL,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    instagram VARCHAR(255),
    facebook VARCHAR(255),
    x VARCHAR(255),
    vkontakte VARCHAR(255),
    telegram VARCHAR(255),
    youtube VARCHAR(255),
    user_site VARCHAR(255)
);

CREATE TYPE theme_type AS ENUM ('light', 'dark', 'system');

CREATE TABLE IF NOT EXISTS user_settings (
    user_id INT PRIMARY KEY REFERENCES users(user_id),
    -- theme theme_type DEFAULT 'system',
    show_phone BOOLEAN DEFAULT FALSE,
    show_planned BOOLEAN DEFAULT TRUE,
    show_visited BOOLEAN DEFAULT TRUE
    -- notification_settings JSONB
);

CREATE TYPE route_status_type AS ENUM ('pending', 'approved', 'rejected');
CREATE TYPE category_type AS ENUM ('walking');
CREATE TYPE tag_type AS ENUM ('forest', 'park', 'near_water');

CREATE TABLE IF NOT EXISTS routes (
    route_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    name VARCHAR(255) NOT NULL,
    url VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    length INT NOT NULL,
    duration BIGINT NOT NULL,
    tags tag_type[],
    category category_type NOT NULL,
    created_at BIGINT NOT NULL,
    status route_status_type DEFAULT 'pending',
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    rating FLOAT NOT NULL DEFAULT 0.0 CHECK (rating >= 0 AND rating <= 5),
    images TEXT[]
);

CREATE TABLE IF NOT EXISTS route_points (
    point_id SERIAL PRIMARY KEY,
    route_id INT REFERENCES routes(route_id),
    coordinate GEOGRAPHY(Point, 4326),
    time_offset BIGINT,
    elevation INT,
    speed FLOAT
);

CREATE TABLE IF NOT EXISTS route_points_info (
    point_id INT REFERENCES route_points(point_id),
    route_id INT REFERENCES routes(route_id),
    point_description TEXT,
    images TEXT[]
);

CREATE TABLE IF NOT EXISTS collections (
    collection_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    name VARCHAR(255) NOT NULL,
    rating FLOAT CHECK (rating >= 0 AND rating <= 5),
    url VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    tags tag_type[],
    created_at BIGINT NOT NULL,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE    
);

CREATE TABLE IF NOT EXISTS collection_routes (
    collection_id INT REFERENCES collections(collection_id),
    route_id INT REFERENCES routes(route_id),
    PRIMARY KEY (collection_id, route_id)
);

CREATE TABLE IF NOT EXISTS reviews (
    review_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    route_id INT REFERENCES routes(route_id),
    rating FLOAT CHECK (rating >= 0 AND rating <= 5),
    comment TEXT,
    created_at BIGINT NOT NULL,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    images TEXT[]
);

CREATE TABLE IF NOT EXISTS review_comments (
    comment_id SERIAL PRIMARY KEY,
    review_id INT REFERENCES reviews(review_id),
    user_id INT REFERENCES users(user_id),
    comment TEXT,
    created_at BIGINT NOT NULL,
    reply_to INT REFERENCES review_comments(comment_id),
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    images TEXT[]
);

CREATE TABLE IF NOT EXISTS review_likes (
    user_id INT REFERENCES users(user_id),
    review_id INT REFERENCES reviews(review_id),
    PRIMARY KEY (user_id, review_id)
);

CREATE TABLE IF NOT EXISTS comment_likes (
    user_id INT REFERENCES users(user_id),
    comment_id INT REFERENCES review_comments(comment_id),
    PRIMARY KEY (user_id, comment_id)
);

-- CREATE TABLE IF NOT EXISTS review_views (
--     user_id INT REFERENCES users(user_id),
--     review_id INT REFERENCES reviews(review_id),
--     PRIMARY KEY (user_id, review_id)
-- );

-- CREATE TABLE IF NOT EXISTS comment_views (
--     user_id INT REFERENCES users(user_id),
--     comment_id INT REFERENCES review_comments(comment_id),
--     PRIMARY KEY (user_id, comment_id)
-- );

CREATE TABLE IF NOT EXISTS saved_routes (
    user_id INT REFERENCES users(user_id),
    route_id INT REFERENCES routes(route_id),
    PRIMARY KEY (user_id, route_id)
);

CREATE TABLE IF NOT EXISTS completed_routes (
    user_id INT REFERENCES users(user_id),
    route_id INT REFERENCES routes(route_id),
    completed_at BIGINT NOT NULL,
    PRIMARY KEY (user_id, route_id)
);

CREATE TYPE entity_type AS ENUM ('route', 'review', 'collection', 'user', 'comment');
CREATE TYPE report_type AS ENUM ('spam or advertising', 'inappropriate content', 'violation of community rules', 'offensive content');
CREATE TYPE report_status AS ENUM ('opened', 'closed');

CREATE TABLE IF NOT EXISTS reports (
    report_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    reported_entity entity_type,
    entity_id INT,
    reason report_type,
    details TEXT,
    created_at BIGINT NOT NULL,
    closed_at  BIGINT DEFAULT NULL,
    status report_status DEFAULT 'opened',
    resolution TEXT
);

CREATE TABLE IF NOT EXISTS bug_reports (
    bug_report_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    details TEXT,
    created_at BIGINT NOT NULL,
    closed_at  BIGINT DEFAULT NULL,
    status report_status DEFAULT 'opened',
    resolution TEXT
);

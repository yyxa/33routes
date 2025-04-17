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

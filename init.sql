
-- Users Table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Workouts Table
CREATE TABLE workouts (
    workout_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    created_by INT NOT NULL REFERENCES users(user_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Exercises Table
CREATE TABLE exercises (
    exercise_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    video_url VARCHAR(255),
    image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Subscriptions Table
CREATE TABLE subscriptions (
    subscription_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    workout_id INT NOT NULL REFERENCES workouts(workout_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Notifications Table
CREATE TABLE notifications (
    notification_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Analytics Table
CREATE TABLE analytics (
    analytics_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    workout_id INT NOT NULL REFERENCES workouts(workout_id),
    exercise_id INT NOT NULL REFERENCES exercises(exercise_id),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    duration INT,
    calories_burned DECIMAL(10,2),
    performance_metrics JSONB,  -- Using JSONB for better performance
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Payments Table
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    amount DECIMAL(10,2) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'pending'
);



-- -- Insert test data
-- INSERT INTO zodiac_prediction (zodiac, date, prediction_text_general) VALUES
--     ('Scorpio', '2024-06-21', '123124141'),
--     ('Scorpio', '2024-06-22', 'ff <b>aef</b> ae'),
--     ('Scorpio', '2024-06-23', '1231ghsthtsdhd24141'),
--     ('Scorpio', '2024-06-24', '123124142311');
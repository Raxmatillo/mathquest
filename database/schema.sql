-- MathQuest PostgreSQL schema for the future shared backend.
-- The current DEV app stores player progress locally via SharedPreferences.
CREATE TABLE users (
 id UUID PRIMARY KEY,
 username VARCHAR(24) NOT NULL UNIQUE,
 display_name VARCHAR(100) NOT NULL,
 age SMALLINT CHECK(age BETWEEN 7 AND 12),
 grade SMALLINT CHECK(grade BETWEEN 1 AND 4),
 region VARCHAR(80), district VARCHAR(80), school VARCHAR(120),
 created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE TABLE modules (
 id INTEGER PRIMARY KEY,
 title_uz TEXT NOT NULL,
 grade SMALLINT NOT NULL CHECK(grade BETWEEN 1 AND 4),
 sort_order INTEGER NOT NULL
);
CREATE TABLE lessons (
 id INTEGER PRIMARY KEY,
 module_id INTEGER NOT NULL REFERENCES modules(id),
 level SMALLINT NOT NULL CHECK(level BETWEEN 1 AND 4),
 position SMALLINT NOT NULL CHECK(position BETWEEN 1 AND 25),
 explanation_uz TEXT NOT NULL,
 question_uz TEXT NOT NULL,
 answer INTEGER NOT NULL,
 UNIQUE(module_id,position)
);
CREATE TABLE attempts (
 id BIGSERIAL PRIMARY KEY,
 user_id UUID NOT NULL REFERENCES users(id),
 lesson_id INTEGER NOT NULL REFERENCES lessons(id),
 answer INTEGER NOT NULL,
 correct BOOLEAN NOT NULL,
 points INTEGER NOT NULL CHECK(points>=0),
 created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE TABLE point_events (
 id BIGSERIAL PRIMARY KEY,
 user_id UUID NOT NULL REFERENCES users(id),
 points INTEGER NOT NULL,
 event_type VARCHAR(30) NOT NULL,
 created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX idx_point_events_user_time ON point_events(user_id,created_at);
CREATE INDEX idx_users_region_district ON users(region,district);
-- Never trust client-submitted points: award them only from validated server-side attempts.

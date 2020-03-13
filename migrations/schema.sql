DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255),
  password VARCHAR(255),
  nickname VARCHAR(255)
);

DROP TABLE IF EXISTS games CASCADE;
CREATE TABLE games (
  id SERIAL PRIMARY KEY NOT NULL,
  cover_image VARCHAR(255),
  title VARCHAR(255),
  description VARCHAR(255),
  platform VARCHAR(255),
  genre VARCHAR(255),
  developer VARCHAR(255),
  metadata VARCHAR(255)
);

DROP TABLE IF EXISTS game_platofrms CASCADE;
CREATE TABLE game_platforms (
  id SERIAL PRIMARY KEY NOT NULL,
  game_id INTEGER REFERENCES games(id) ON DELETE CASCADE, 
  platform_image VARCHAR(255)
);

DROP TABLE IF EXISTS reviews CASCADE;
CREATE TABLE reviews (
  id SERIAL PRIMARY KEY NOT NULL,
  text VARCHAR(255),
  recommend INTEGER,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  author_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  game_id INTEGER REFERENCES games(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS comments CASCADE;
CREATE TABLE comments (
  id SERIAL PRIMARY KEY NOT NULL,
  author_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  text TEXT, 
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

DROP TABLE IF EXISTS favorite_games CASCADE;
CREATE TABLE favorite_games (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  game1_id INTEGER REFERENCES games(id) ON DELETE CASCADE,
  game2_id INTEGER REFERENCES games(id) ON DELETE CASCADE,
  game3_id INTEGER REFERENCES games(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS user_images CASCADE;
CREATE TABLE user_images (
  id SERIAL PRIMARY KEY NOT NULL,
  avatar_source VARCHAR(255),
  country_name VARCHAR(255),
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS user_games CASCADE;
CREATE TABLE user_games (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE, 
  game_id INTEGER REFERENCES games(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS alias CASCADE;
CREATE TABLE alias (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE, 
  platform_alias VARCHAR(255)
);







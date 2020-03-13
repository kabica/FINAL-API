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

DROP TABLE IF EXISTS reviews CASCADE;
CREATE TABLE reviews (
  id SERIAL PRIMARY KEY NOT NULL,
  text VARCHAR(255),
  recommend INTEGER,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  author_id REFERENCES users(id),
  game_id REFERENCES games(id)
);

DROP TABLE IF EXISTS reviews CASCADE;
CREATE TABLE reviews (
  id SERIAL PRIMARY KEY NOT NULL,
  author_id REFERENCES users(id),
  user_id REFERENCES user(id),
  text TEXT, 
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

DROP TABLE IF EXISTS favorite_games CASCADE;
CREATE TABLE favorite_games (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id REFERENCES users(id),
  game1_id REFERENCES games(id),
  game2_id REFERENCES games(id),
  game3_id REFERENCES games(id),
);

DROP TABLE IF EXISTS user_images CASCADE;
CREATE TABLE user_images (
  id SERIAL PRIMARY KEY NOT NULL,
  avatar_source VARCHAR(255),
  country_name VARCHAR(255),
  user_id REFERENCES users(id)
);

DROP TABLE IF EXISTS user_games CASCADE;
CREATE TABLE user_games (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id REFERENCES users(id), 
  game_id REFERENCES games(id)
);


DROP TABLE IF EXISTS discord_alias CASCADE;
CREATE TABLE discord_alias (
  id SERIAL PRIMARY KEY NOT NULL,
  alias VARCHAR(255),
  user_id REFERENCES users(id)
);

DROP TABLE IF EXISTS psn_alias CASCADE;
CREATE TABLE psn_alias (
  id SERIAL PRIMARY KEY NOT NULL,
  alias VARCHAR(255),
  user_id REFERENCES users(id)
);

DROP TABLE IF EXISTS xbox_alias CASCADE;
CREATE TABLE xbox_alias (
  id SERIAL PRIMARY KEY NOT NULL,
  alias VARCHAR(255),
  user_id REFERENCES users(id)
);

DROP TABLE IF EXISTS battlenet_alias CASCADE;
CREATE TABLE battlenet_alias (
  id SERIAL PRIMARY KEY NOT NULL,
  alias VARCHAR(255),
  user_id REFERENCES users(id)
);

DROP TABLE IF EXISTS uplay_alias CASCADE;
CREATE TABLE uplay_alias (
  id SERIAL PRIMARY KEY NOT NULL,
  alias VARCHAR(255),
  user_id REFERENCES users(id)
);

DROP TABLE IF EXISTS epic_alias CASCADE;
CREATE TABLE epic_alias (
  id SERIAL PRIMARY KEY NOT NULL,
  alias VARCHAR(255),
  user_id REFERENCES users(id)
);

DROP TABLE IF EXISTS origin_alias CASCADE;
CREATE TABLE origin_alias (
  id SERIAL PRIMARY KEY NOT NULL,
  alias VARCHAR(255),
  user_id REFERENCES users(id)
);

DROP TABLE IF EXISTS steam_alias CASCADE;
CREATE TABLE steam_alias (
  id SERIAL PRIMARY KEY NOT NULL,
  alias VARCHAR(255),
  user_id REFERENCES users(id)
);


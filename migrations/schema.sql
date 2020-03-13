DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255),
  password VARCHAR(255),
  nickname VARCHAR(255)
);

DROP TABLE IF EXISTS user_images CASCADE;
CREATE TABLE user_images (
  id SERIAL PRIMARY KEY NOT NULL,
  avatar_source VARCHAR(255),
  country_name VARCHAR(255),
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











DROP TABLE IF EXISTS events CASCADE;
CREATE TABLE events (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  title TEXT,
  count INTEGER
);
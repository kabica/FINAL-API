INSERT INTO users (first_name, last_name, email, password, nickname)
VALUES
('Quinton','Parogie','alex@gmail.com','password','broRogies'),
('Mohamed','Parogie','alex@gmail.com','password','broRogies'),
('Alex','Parogie','alex@gmail.com','password','broRogies');

INSERT INTO games (title, description)
VALUES
('Overwatch','I am already tracer'),
('RainbowSix','Dude, uninstall');

INSERT INTO reviews (text)
VALUES ('So my only question is: do you get me bruvv?');

INSERT INTO comments (author_id, user_id, text)
VALUES (1, 2, 'ALT+TAB right now please.');

INSERT INTO favorite_games (user_id, game1_id, game2_id, game3_id)
VALUES (1, 1, 2, 3);

INSERT INTO user_images (avatar_source, country_name, user_id)
VALUES ('avatar_image', 'country_image', 1);

INSERT INTO user_games (user_id, game_id)
VALUES (1, 1);

INSERT INTO discord_alias (alias, user_id)
VALUES ('Discord_Alias', 1);

INSERT INTO psn_alias (alias, user_id)
VALUES ('psn_Alias', 1);

INSERT INTO xbox_alias (alias, user_id)
VALUES ('xbox_Alias', 1);

INSERT INTO battlenet_alias (alias, user_id)
VALUES ('battlenet_Alias', 1);

INSERT INTO uplay_alias (alias, user_id)
VALUES ('uplay_Alias', 1);

INSERT INTO epic_alias (alias, user_id)
VALUES ('epic_Alias', 1);

INSERT INTO origin_alias (alias, user_id)
VALUES ('origin_Alias', 1);

INSERT INTO steam_alias (alias, user_id)
VALUES ('steam_Alias', 1);






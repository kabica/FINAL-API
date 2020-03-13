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

INSERT INTO favorite_games (user_id, game1_id, game2_id)
VALUES (1, 1, 2);

INSERT INTO user_images (avatar_source, country_name, user_id)
VALUES ('avatar_image', 'country_image', 1);

INSERT INTO user_games (user_id, game_id)
VALUES (1, 1);

INSERT INTO alias (user_id, platform_alias)
VALUES 
(1, 'Discord_alias');


INSERT INTO game_platforms (game_id, platform_image)
VALUES 
(1, 'image1'),
(2, 'image2');










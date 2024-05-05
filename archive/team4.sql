-- (1)
CREATE TABLE USERS (
    user_id INTEGER PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    DoB DATE,
    password VARCHAR(255),
    country VARCHAR(255)
);

INSERT INTO USERS (user_id, first_name, last_name, email, DOB, password, country)
VALUES
(1, 'josh@gmail.com', 'josh', 'handsome', DATE('2023-03-03'), 'password123', 'USA'),
(2, 'ethan@gmail.com', 'ethan', 'awesome', DATE('2022-03-04'), 'password456', 'USA'),
(3, 'justin@gmail.com', 'justin', 'excellent', DATE('2021-03-02'), 'password789', 'TW');

-- (2)
CREATE TABLE SUBSCRIPTIONS (
    subscription_id INTEGER PRIMARY KEY,
    user_id INTEGER,
    plan VARCHAR(255),
    account_status VARCHAR(255),
    next_bill DATE,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id)
);

INSERT INTO SUBSCRIPTIONS (subscription_id, user_id, plan, account_status, next_bill) 
VALUES 
(0, 1, 'Regular', 'Active', '2024-12-31'),
(1, 2, 'Premium', 'Active', '2025-06-30'),
(2, 3, 'Regular', 'Active', '2024-06-30');

-- (3)
CREATE TABLE TEAMS (
    team_id INTEGER PRIMARY KEY,
    name VARCHAR(255),
	location VARCHAR(255),
    ppg FLOAT,
    rpg FLOAT,
    apg FLOAT,
    oppg FLOAT
);

INSERT INTO TEAMS (team_id, name, location, ppg, rpg, apg, oppg)
VALUES
(1, 'Atlanta Hawks', 'Atlanta, Georgia', NULL, NULL, NULL, NULL),
(2, 'Boston Celtics', 'Boston, Massachusetts', NULL, NULL, NULL, NULL),
(3, 'Brooklyn Nets', 'Brooklyn, New York', NULL, NULL, NULL, NULL),
(4, 'Charlotte Hornets', 'Charlotte, North Carolina', NULL, NULL, NULL, NULL),
(5, 'Chicago Bulls', 'Chicago, Illinois', NULL, NULL, NULL, NULL),
(6, 'Cleveland Cavaliers', 'Cleveland, Ohio', NULL, NULL, NULL, NULL),
(7, 'Dallas Mavericks', 'Dallas, Texas', NULL, NULL, NULL, NULL),
(8, 'Denver Nuggets', 'Denver, Colorado', NULL, NULL, NULL, NULL),
(9, 'Detroit Pistons', 'Detroit, Michigan', NULL, NULL, NULL, NULL),
(10, 'Golden State Warriors', 'San Francisco, California', NULL, NULL, NULL, NULL),
(11, 'Houston Rockets', 'Houston, Texas', NULL, NULL, NULL, NULL),
(12, 'Indiana Pacers', 'Indianapolis, Indiana', NULL, NULL, NULL, NULL),
(13, 'Los Angeles Clippers', 'Los Angeles, California', NULL, NULL, NULL, NULL),
(14, 'Los Angeles Lakers', 'Los Angeles, California', NULL, NULL, NULL, NULL),
(15, 'Memphis Grizzlies', 'Memphis, Tennessee', NULL, NULL, NULL, NULL),
(16, 'Miami Heat', 'Miami, Florida', NULL, NULL, NULL, NULL),
(17, 'Milwaukee Bucks', 'Milwaukee, Wisconsin', NULL, NULL, NULL, NULL),
(18, 'Minnesota Timberwolves', 'Minneapolis, Minnesota', NULL, NULL, NULL, NULL),
(19, 'New Orleans Pelicans', 'New Orleans, Louisiana', NULL, NULL, NULL, NULL),
(20, 'New York Knicks', 'New York, New York', NULL, NULL, NULL, NULL),
(21, 'Oklahoma City Thunder', 'Oklahoma City, Oklahoma', NULL, NULL, NULL, NULL),
(22, 'Orlando Magic', 'Orlando, Florida', NULL, NULL, NULL, NULL),
(23, 'Philadelphia 76ers', 'Philadelphia, Pennsylvania', NULL, NULL, NULL, NULL),
(24, 'Phoenix Suns', 'Phoenix, Arizona', NULL, NULL, NULL, NULL),
(25, 'Portland Trail Blazers', 'Portland, Oregon', NULL, NULL, NULL, NULL),
(26, 'Sacramento Kings', 'Sacramento, California', NULL, NULL, NULL, NULL);

-- (4)
CREATE TABLE GAMES (
    game_id INTEGER PRIMARY KEY,
    team1_id INTEGER,
    team2_id INTEGER,
    score_team1 INTEGER,
    score_team2 INTEGER,
    broadcaster_id INTEGER,
    FOREIGN KEY (team1_id) REFERENCES TEAMS(team_id),
    FOREIGN KEY (team2_id) REFERENCES TEAMS(team_id),
    FOREIGN KEY (broadcaster_id) REFERENCES BROADCASTERS(broadcaster_id)
);

INSERT INTO GAMES (game_id, team1_id, team2_id, score_team1, score_team2, broadcaster_id)
VALUES 
(1, 2, 14, 112, 105, 1),
(2, 2, 17, 98, 92, 2),
(3, 13, 17, 124, 126, 2),
(4, 8, 20, 118, 106, 2),
(5, 17, 5, 118, 106, 5),
(6, 11, 4, 118, 106, 4),
(7, 3, 9, 118, 106, 3),
(8, 12, 16, 118, 106, 3),
(9, 9, 21, 118, 106, 4),
(10, 20, 15, 118, 106, 1),
(18, 2, 1, 112, 99, 2),
(20, 16, 20, 103, 101, 3),
(30, 24, 25, 109, 104, 1);

-- (5)
CREATE TABLE PLAYERS (
    player_id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    team_id INTEGER,
    number INTEGER,
    position VARCHAR(255),
    age INTEGER,
    DoB DATE,
    height VARCHAR(255),
    weight INTEGER,
    mpg FLOAT,
    ppg FLOAT,
    rpg FLOAT,
    apg FLOAT,
    bpg FLOAT,
    spg FLOAT,
    FOREIGN KEY (team_id) REFERENCES TEAMS(team_id)
);

INSERT INTO PLAYERS (player_id, name, team_id, number, position, age, DoB, height, weight, mpg, ppg, rpg, apg, bpg, spg)
VALUES 
(1, 'LeBron James', 14, 6, 'SF', 36, '1984-12-30', '6\'9"', 250, 34.6, 25.3, 7.8, 10.2, 1.2, 1.3),
(2, 'Anthony Davis', 14, 3, 'PF', 28, '1993-03-11', '6\'10"', 253, 33.0, 21.8, 8.4, 3.1, 1.8, 1.2),
(3, 'Stephen Curry', 10, 30, 'PG', 33, '1988-03-14', '6\'3"', 185, 34.2, 31.4, 5.5, 6.0, 0.2, 1.2),
(4, 'Klay Thompson', 10, 11, 'SG', 31, '1990-02-08', '6\'6"', 215, 28.8, 21.5, 3.8, 2.4, 0.5, 0.8),
(5, 'Jayson Tatum', 2, 0, 'SF', 23, '1998-03-03', '6\'8"', 210, 35.8, 26.4, 7.4, 4.3, 0.5, 1.3),
(6, 'Jaylen Brown', 2, 7, 'SG', 24, '1996-10-24', '6\'6"', 223, 33.5, 24.7, 6.0, 3.4, 0.6, 1.2),
(7, 'Kevin Durant', 3, 7, 'SF', 32, '1988-09-29', '6\'10"', 240, 34.3, 26.9, 7.1, 5.6, 1.3, 0.7),
(8, 'James Harden', 3, 13, 'SG', 32, '1989-08-26', '6\'5"', 220, 36.1, 25.2, 5.5, 10.9, 0.8, 1.8),
(9, 'Giannis Antetokounmpo', 17, 34, 'PF', 27, '1994-12-06', '6\'11"', 242, 33.5, 28.4, 11.0, 6.2, 1.2, 1.0),
(10, 'Kawhi Leonard', 13, 2, 'SF', 30, '1991-06-29', '6\'7"', 230, 34.1, 24.8, 5.5, 4.9, 0.4, 1.6),
(11, 'Luka Doncic', 7, 77, 'PG', 22, '1999-02-28', '6\'7"', 230, 34.4, 27.7, 8.0, 8.7, 0.6, 1.0),
(12, 'Nikola Jokic', 8, 15, 'C', 26, '1995-02-19', '7\'0"', 284, 35.0, 26.4, 10.9, 8.3, 0.6, 1.4),
(13, 'Joel Embiid', 23, 21, 'C', 27, '1994-03-16', '7\'0"', 280, 31.1, 28.5, 10.6, 2.8, 1.4, 1.0),
(14, 'Kyrie Irving', 3, 11, 'PG', 29, '1992-03-23', '6\'2"', 195, 34.9, 26.9, 4.8, 6.0, 0.6, 1.3);

-- (6)
CREATE TABLE PERFORMANCES (
    player_id INTEGER,
    game_id INTEGER,
    minutes INTEGER,
    pts INTEGER,
    reb INTEGER,
    ast INTEGER,
    stl INTEGER,
    blk INTEGER,
    PRIMARY KEY (player_id, game_id),
    FOREIGN KEY (player_id) REFERENCES PLAYERS(player_id),
    FOREIGN KEY (game_id) REFERENCES GAMES(game_id)
);

INSERT INTO PERFORMANCES (player_id, game_id, minutes, pts, reb, ast, stl, blk)
VALUES
(1, 1, 38, 32, 8, 12, 2, 1),
(1, 2, 36, 28, 11, 9, 1, 0),
(1, 3, 32, 25, 7, 8, 1, 1),
(2, 1, 33, 27, 10, 3, 2, 3),
(2, 2, 35, 23, 12, 2, 1, 1),
(2, 3, 31, 30, 9, 5, 3, 2),
(3, 1, 36, 39, 6, 8, 2, 0),
(3, 2, 33, 36, 5, 7, 1, 0),
(3, 3, 35, 28, 4, 10, 2, 0),
(4, 1, 28, 19, 4, 3, 1, 1),
(4, 2, 32, 24, 3, 2, 1, 0),
(4, 3, 25, 17, 5, 1, 0, 1),
(5, 1, 37, 30, 8, 4, 1, 1),
(5, 2, 39, 35, 9, 6, 1, 0),
(5, 3, 34, 28, 6, 3, 2, 1),
(6, 1, 36, 27, 6, 4, 2, 0),
(6, 2, 33, 25, 4, 5, 0, 1),
(6, 3, 35, 28, 8, 3, 1, 0),
(2, 18, 36, 23, 8, 10, 1, 0), 
(14, 2, 33, 27, 6, 4, 2, 1),  
(11, 20, 34, 28, 6, 3, 2, 1), 
(8, 12, 28, 19, 4, 3, 1, 1), 
(10, 20, 37, 30, 8, 4, 1, 1);

-- (7)
CREATE TABLE BROADCASTERS (
    broadcaster_id INTEGER PRIMARY KEY,
    brand VARCHAR(255),
    country VARCHAR(255)
);

INSERT INTO BROADCASTERS (broadcaster_id, brand, country)
VALUES
(1, 'ABC', 'USA'),
(2, 'ESPN', 'USA'),
(3, 'TNT', 'USA'),
(4, 'TSN', 'Canada'),
(5, 'Sportsnet', 'Canada');

-- (8)
CREATE TABLE STANDINGS (
    type_ VARCHAR(125),
    rank_ INTEGER,
    record VARCHAR(125),
    team_id INTEGER,
    PRIMARY KEY (type_, rank_),
    FOREIGN KEY (team_id) REFERENCES TEAMS(team_id)
);

INSERT INTO STANDINGS (type_, rank_, record, team_id) 
VALUES
('Eastern Conference', 1, '53-29', 3),
('Eastern Conference', 2, '51-31', 2),
('Eastern Conference', 3, '48-24', 1),
('Eastern Conference', 4, '47-25', 5),
('Eastern Conference', 5, '42-30', 20),
('Eastern Conference', 6, '41-31', 7),
('Eastern Conference', 7, '38-34', 9),
('Eastern Conference', 8, '36-36', 22),
('Eastern Conference', 9, '36-36', 6),
('Eastern Conference', 10, '35-37', 12),
('Eastern Conference', 11, '34-38', 23),
('Eastern Conference', 12, '33-39', 4),
('Eastern Conference', 13, '33-39', 15),
('Eastern Conference', 14, '31-41', 21),
('Eastern Conference', 15, '31-41', 18),
('Eastern Conference', 16, '22-50', 19),
('Western Conference', 1, '51-21', 10),
('Western Conference', 2, '47-25', 13),
('Western Conference', 3, '46-26', 24),
('Western Conference', 4, '45-27', 14),
('Western Conference', 5, '43-29', 8),
('Western Conference', 6, '42-30', 16),
('Western Conference', 7, '41-31', 25),
('Western Conference', 8, '40-32', 17),
('Western Conference', 9, '39-33', 12),
('Western Conference', 10, '39-33', 5),
('Western Conference', 11, '38-34', 11),
('Western Conference', 12, '36-36', 4),
('Western Conference', 13, '35-37', 18),
('Western Conference', 14, '33-39', 6),
('Western Conference', 15, '28-44', 23),
('Western Conference', 16, '25-47', 19);

-- (9)
CREATE TABLE CONTENTS (
    content_id INTEGER,
    source_file_hash VARCHAR(125),
    type VARCHAR(125),
    PRIMARY KEY (content_id, source_file_hash)
);

INSERT INTO CONTENTS (content_id, source_file_hash, type)
VALUES 
(1, 'xyz123', 'Stories'),
(2, 'abc456', 'Stories'),
(3, 'def789', 'Stories'),
(4, 'ghi123', 'Stories'),
(5, 'jkl456', 'Stories'),
(6, 'mno789', 'Stories'),
(7, 'pqr123', 'Stories'),
(8, 'stu456', 'Stories'),
(9, 'vwx789', 'Stories'),
(10, 'yza123', 'Stories'),
(11, 'h7d84g3j', 'Video'),
(12, 'c5f92e1b', 'Video'),
(13, 'b8a71k4c', 'Video'),
(14, 'f2e65d9a', 'Video'),
(15, 'h1g23f4e', 'Video'),
(16, 'g3j46b2i', 'Video'),
(17, 'e9a64f2c', 'Video'),
(18, 'd7c23g8f', 'Video'),
(19, 'a4b51e9d', 'Video'),
(20, 'k2j87d3c', 'Video'),
(21, 'e1b29f4c', 'Video'),
(22, 'h5c32d9f', 'Video'),
(23, 'f8g16b2e', 'Video'),
(24, 'j9a37d2f', 'Video');

-- (10)
CREATE TABLE STORIES (
    content_id INTEGER,
    source_file_hash VARCHAR(125),
    headlines VARCHAR(125),
    game_id INTEGER,
    PRIMARY KEY (content_id, source_file_hash),
    FOREIGN KEY (game_id) REFERENCES GAMES(game_id)
);

INSERT INTO STORIES (content_id, source_file_hash, headlines, game_id)
VALUES (1, 'xyz123', 'Boston beats LA in the rematch', 1),
       (2, 'abc456', 'Giannis records triple-double', 2),
       (3, 'def789', 'Clippers upsets defending champions, Giannis', 3),
       (4, 'ghi123', 'Tatum hits game-winning buzzer-beater', 4),
       (5, 'jkl456', 'Lavine sets new franchise record in turnovers', 5),
       (6, 'mno789', 'The Houston Rockets clinches playoff spot', 6),
       (7, 'pqr123', 'Durant scores career-high with 57', 7),
       (8, 'stu456', 'Turners dominates on both ends', 8),
       (9, 'vwx789', 'Pistons rallies from double-digit deficit', 9),
       (10, 'yza123', 'Brunsons hits milestone', 10);
       
-- (11)
CREATE TABLE VIDEOS (
    content_id INTEGER,
    source_file_hash VARCHAR(125),
    title VARCHAR(125),
    type VARCHAR(125),
    player_id INTEGER,
    PRIMARY KEY (content_id, source_file_hash),
    FOREIGN KEY (player_id) REFERENCES PLAYERS(player_id)
);

INSERT INTO VIDEOS (content_id, source_file_hash, title, type, player_id)
VALUES 
(11, 'h7d84g3j', 'LeBron James Top 10 Plays', 'Highlight', 1),
(12, 'c5f92e1b', 'Anthony Davis Mixtape', 'Mixtape', 2),
(13, 'b8a71k4c', 'Stephen Curry Highlights vs Lakers', 'Game Highlights', 3),
(14, 'f2e65d9a', 'Klay Thompson Career Highlights', 'Career Highlights', 4),
(15, 'h1g23f4e', 'Jayson Tatum Top 10 Dunks', 'Highlight', 5),
(16, 'g3j46b2i', 'Jaylen Brown 2021 Playoff Highlights', 'Playoff Highlights', 6),
(17, 'e9a64f2c', 'Kevin Durant Scoring Clinic vs Warriors', 'Game Highlights', 7),
(18, 'd7c23g8f', 'James Harden Triple-Double vs Suns', 'Game Highlights', 8),
(19, 'a4b51e9d', 'Giannis Antetokounmpo Slam Dunk Mix', 'Mixtape', 9),
(20, 'k2j87d3c', 'Kawhi Leonard Clutch Shots Compilation', 'Compilation', 10),
(21, 'e1b29f4c', 'Luka Doncic 50-Point Triple-Double vs Wizards', 'Game Highlights', 11),
(22, 'h5c32d9f', 'Nikola Jokic 2021 MVP Mixtape', 'Mixtape', 12),
(23, 'f8g16b2e', 'Joel Embiid Best Post Moves', 'Highlight', 13),
(24, 'j9a37d2f', 'Kyrie Irving Ankle Breakers Compilation', 'Compilation', 14);


-- Insert a user & the coresponding subscrition
SELECT MAX(user_id) INTO @last_userid FROM USERS;
SET @new_user_fname = 'John';
SET @new_user_lname = 'Doe';
SET @new_user_email = 'johndoe@example.com';
SET @new_user_DOB = '1990-01-01';
SET @new_user_passwd = 'youcantseeme';
INSERT INTO USERS (user_id, first_name, last_name, email, DOB, password)
VALUES (@last_userid + 1, @new_user_fname, @new_user_lname, @new_user_email, @new_user_DOB, @new_user_passwd);

-- Delete a record from USERS
DELETE FROM SUBSCRIPTIONS
WHERE user_id = 3;

-- Modify an existing record
-- Intent to modify a subscription for a user
UPDATE SUBSCRIPTIONS
SET plan = 'Preimum', account_status = 'Active'
WHERE user_id = 1;

-- Simple query on a single table
SELECT * FROM SUBSCRIPTIONS;

SELECT ' ';

-- Query that requires joining multiple tables
-- Find the 10-5-5 players that had played in games broadcasted by ESPN
SELECT DISTINCT pf.player_id, p.name 
FROM PERFORMANCES pf, GAMES g, PLAYERS p 
WHERE (pf.game_id = g.game_id AND 
       pf.pts >= 10 AND 
       pf.reb >= 5 AND 
       pf.ast >= 5 AND
       pf.player_id = p.player_id 
       AND g.broadcaster_id = (SELECT broadcaster_id 
                               FROM BROADCASTERS 
                               WHERE brand ='ESPN'));

SELECT ' ';

-- Query that requires joining multiple tables
-- Find all players recent performances
SELECT 
p.name, 
ROUND(AVG(pf.pts), 1) AS avg_pts, 
ROUND(AVG(pf.reb), 1) AS avg_reb, 
ROUND(AVG(pf.ast), 1) AS avg_ast 
FROM PERFORMANCES pf, PLAYERS p 
WHERE pf.player_id = p.player_id 
GROUP BY pf.player_id;

SELECT ' ';

-- Query that uses one or more aggregation functions
-- Find the names of the highest scoring players this season, and the ppg of that player
SELECT name, ppg
FROM PLAYERS
WHERE ppg = (
  SELECT MAX(ppg)
  FROM PLAYERS
);



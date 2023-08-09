
USE games;

CREATE VIEW best_games AS	
SELECT title
FROM videogame
WHERE userscore < 9.2;

SELECT *
FROM best_games;

#view for best games
CREATE VIEW best_videogame AS
SELECT *
FROM videogame
WHERE userscore >= 9.2;

DROP VIEW best_videogame;
DROP VIEW best_games;

#check option: begrenser
#view for best games
CREATE VIEW best_videogame AS
SELECT *
FROM videogame
WHERE userscore >= 9.2
WITH CHECK OPTION;



#select the view
SELECT *
FROM best_videogame
WHERE id = 9221
;

#update the view
UPDATE best_videogame
SET userscore = "9.2"
WHere id = 9222;




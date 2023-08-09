USE mydb;

SELECT * 
FROM videogame;

#find genre where name is Sports
SELECT *
FROM genre
WHERE name = "Sports";

#
SELECT * 
FROM videogame_has_genre
WHERE genre_id = 2;

#
SELECT videogame.title, sales.europe
FROM genre, videogame_has_genre, sales, videogame
WHERE genre.name = "Sports"
AND genre.id = videogame_has_genre.genre_id
AND videogame_has_genre.videogame_id = videogame.id
AND videogame.id = sales.videogame_id
;

SELECT * 
FROM esrb_description;

SELECT * 
FROM platform;

#before: fail
SELECT videogame.id, videogame.title, platform.name, platform.id
FROM videogame INNER JOIN platform
ON platform_id = videogame.id
WHERE platform.name = "PlayStation 5"
;

#after
SELECT videogame.id, videogame.title, platform.name, platform.id

FROM videogame INNER JOIN platform

#Join with foreign key videogame for platform and primary key platform  
ON videogame.platform_id = platform.id

WHERE platform.name = "PlayStation 5"
;


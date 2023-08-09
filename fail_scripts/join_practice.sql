
USE movies_imdb;

#=========INNER JOIN ===============================
SELECT m.title, g.name 
FROM movie m 
INNER JOIN movie_has_genre mg ON m.id = mg.movie_id 
INNER JOIN genre g ON mg.genre_id = g.id;

#inner join. get movies where "Frank Darabont" is director
SELECT m.director_id, d.id, m.title, d.name AS director
FROM movie AS m INNER JOIN director AS d
ON m.director_id = d.id
WHERE d.name = "Frank Darabont"
;

#find all movies where director is Tarantino
SELECT d.id, m.director_id, d.name AS director, m.title AS movie
FROM director AS d INNER JOIN movie AS m
ON d.id = m.director_id
WHERE d.name = "Quentin Tarantino"
;

# join also genre
SELECT d.id, m.director_id, d.name AS director, m.title AS movie, genre.name AS genre 
FROM director AS d 
INNER JOIN movie AS m ON d.id = m.director_id 
INNER JOIN movies_has_genre AS mg ON m.id = mg.movie_id 
INNER JOIN genre ON mg.genre_id = genre.id 
WHERE d.name = "Quentin Tarantino";

SELECT m.title as movie, g.name as director
FROM movie AS m
INNER JOIN movie_has_genre AS mg ON m.id = mg.movie_id
INNER JOIN genre AS g ON mg.genre_id = g.id
WHERE m.director_id = (
  SELECT id FROM director WHERE name = "Quentin Tarantino"
);

SELECT m.title as movie, g.name as director
FROM movie AS m
INNER JOIN movie_has_genre AS mg ON m.id = mg.movie_id
INNER JOIN genre AS g ON mg.genre_id = g.id
WHERE m.director_id = (
  SELECT id FROM director WHERE name = "Quentin Tarantino"
);

#
SELECT d.name AS director, m.title AS movie, g.name AS genre
FROM movie AS m
INNER JOIN director AS d ON d.id = m.director_id
INNER JOIN movie_has_genre AS mg ON m.id = mg.movie_id
INNER JOIN genre AS g ON mg.genre_id = g.id
WHERE m.director_id = (SELECT id FROM director WHERE name = "Quentin Tarantino");





SELECT *
FROM movie;

SELECT *
FROM movie_has_actor;
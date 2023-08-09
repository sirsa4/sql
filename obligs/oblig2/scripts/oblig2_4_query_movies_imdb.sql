
USE movies_imdb;

# 1: Hent ut alle filmene sortert på 'year'
SELECT *
FROM movie
ORDER BY year DESC;

#
# 2: Hent ut alle filmene som har en metascore
# source: https://www.w3schools.com/sql/sql_having.asp
SELECT *
FROM movie 
HAVING metascore
ORDER BY year DESC;

# 3: Hent ut filmer og hvem som har regissert filmen (director)
SELECT m.*, d.name
FROM movie AS m INNER JOIN director AS d
ON m.director_id = d.id;

# 4: Hent navnet og antallet filmer en regissør har regissert, sortert synkende på antallet
SELECT d.name AS regissor, COUNT(d.name) AS antall_filmer
FROM movie AS m
INNER JOIN director AS d 
ON m.director_id = d.id
GROUP BY regissor
ORDER BY antall_filmer DESC
;

# 5: Hent navnet og antallet filmer en regissør har regissert, samt totalinntekten (gross) for disse filmene, sortert synkende på inntekten
SELECT d.name AS regissor, COUNT(d.name) AS antall_filmer, SUM(m.gross) AS totalinntekt
FROM movie AS m
INNER JOIN director AS d
ON m.director_id = d.id
GROUP BY regissor
ORDER BY totalinntekt DESC
;

# 6: Hent ut alle filmer, samt tilhørende regissør og sjanger (genre)
# ressurs: fikk god forklaring fra studentassistenter på hvordan tabeller kobles i spørring i oppgave 4 og 5.
SELECT m.*, d.name AS regissor, g.name AS sjanger
FROM movie AS m
INNER JOIN director AS d
ON m.director_id = d.id
INNER JOIN movie_has_genre AS mg 
ON mg.movie_id = m.id
INNER JOIN genre AS g
ON mg.genre_id = g.id;

# 7: Hent ut film og regissør for den filmen som har gitt høyest inntekt
# gruppering når MAX(gross) er i øverst SELECT seksjon fungerte dårlig. Da må vi gruppere data og vi får ikke 1 resulat i gruppering.
SELECT m.title AS film, d.name AS regissor,m.gross AS inntekt
FROM movie AS m
INNER JOIN director AS d
ON m.director_id = d.id
WHERE m.gross = (SELECT MAX(gross) FROM movie)
;

# 8: Hent ut filmer med høyest inntekt for hver sjanger
# error, not working! group 
SELECT m.title AS film, g.name AS sjanger, MAX(m.gross) AS inntekt
FROM movie AS m
INNER JOIN movie_has_genre AS mg
ON mg.movie_id = m.id
INNER JOIN genre AS g
ON mg.genre_id = g.id
GROUP BY g.name
;

SELECT g.name AS sjanger, m,gross AS inntekt
FROM movie AS m
INNER JOIN movie_has_genre AS mg
ON mg.movie_id = m.id
INNER JOIN genre AS g
ON mg.genre_id = g.id
WHERE m.gross = (SELECT MAX(m.gross) FROM movie )
GROUP BY g.name
;


# 8: Hent ut filmer med høyest inntekt for hver sjanger
# source: https://www.youtube.com/watch?v=cW2MLIZ5CaU 
# jeg satt fast lenge på den, men fant løsning på video som forklarte at jeg kunne ikke ha irrelevante kolonner i select som ikke er en del GROUP BY clausen
SELECT g.name AS sjanger, MAX(m.gross) AS inntekt
FROM movie AS m
INNER JOIN movie_has_genre AS mg
ON mg.movie_id = m.id
INNER JOIN genre AS g
ON mg.genre_id = g.id
GROUP BY g.name
;

# 8: Hent ut filmer med høyest inntekt for hver sjanger
# source: https://www.youtube.com/watch?v=cW2MLIZ5CaU 
# jeg satt fast lenge på den, men fant løsning på video som forklarte at jeg kunne ikke ha irrelevante kolonner i select som ikke er en del GROUP BY clausen
# fikk hjelp med studass
SELECT movie.title AS film, x.sjanger AS sjanger, x.inntekt
FROM
(
SELECT g.name AS sjanger, MAX(m.gross) AS inntekt
FROM movie AS m
INNER JOIN movie_has_genre AS mg
ON mg.movie_id = m.id
INNER JOIN genre AS g
ON mg.genre_id = g.id
GROUP BY g.name
) AS x, movie
WHERE x.inntekt = movie.gross;



# 9: Hent ut hvilke filmer Christopher Nolan har regissert, som også Christian Bale har spilt i
SELECT m.title AS film, d.name AS regissor, a.name AS skuespiller
FROM movie AS m
INNER JOIN director AS d
ON m.director_id = d.id
INNER JOIn movie_has_actor AS ma
ON ma.movie_id = m.id
INNER JOIN actor AS a
ON ma.actor_id = a.id
WHERE d.name = "Christopher Nolan" AND a.name = "Christian Bale";

# 10: Hent ut skuespillerne og antallet filmer de har spilt i, sortert synkende på antallet
SELECT a.name AS skuespiller, COUNT(m.title) AS filmer
FROM movie AS m
INNER JOIN movie_has_actor AS ma
ON ma.movie_id = m.id
INNER JOIN actor AS a
ON ma.actor_id = a.id
GROUP BY a.name
ORDER BY filmer DESC
;

select distinct genre.name 
from genre;


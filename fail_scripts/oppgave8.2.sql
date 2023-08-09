
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

#single query
SELECT g.name AS sjanger, MAX(m.gross) AS inntekt
FROM movie AS m
INNER JOIN movie_has_genre AS mg
ON mg.movie_id = m.id
INNER JOIN genre AS g
ON mg.genre_id = g.id
GROUP BY g.name
;



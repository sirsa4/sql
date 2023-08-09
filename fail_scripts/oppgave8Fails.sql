

SELECT g.name AS sjanger, m.gross AS inntekt
FROM movie AS m
INNER JOIN movie_has_genre AS mg
ON mg.movie_id = m.id
INNER JOIN genre AS g
ON mg.genre_id = g.id
WHERE (m.id, m.gross) IN(
	SELECT movie_id, MAX(gross)
    FROM movie_has_genre AS mg1
    INNER JOIN genre AS g1
    ON m1.genre_id = m1.id
    GROUP BY genre_id
)
;

#original
SELECT MAX(gross) as total, m.title, g.name
FROM movie AS m
INNER JOIN movie_has_genre AS mhg
ON m.id = mhg.genre_id
INNER JOIN genre as g
ON mhg.genre_id = g.id
GROUP BY m.title, g.name;


SELECT MAX(m.gross) as total, m.title, g.name
FROM movie AS m
INNER JOIN movie_has_genre AS mhg
ON m.id = mhg.genre_id
INNER JOIN genre as g
ON mhg.genre_id = g.id
GROUP BY m.title, g.name;







SELECT g.name AS genre, m.title AS film, m.gross AS revenue
FROM genre g
INNER JOIN movie_has_genre mg ON g.id = mg.genre_id
INNER JOIN movie m ON mg.movie_id = m.id
WHERE (g.id, m.gross) IN (
  SELECT genre_id, MAX(gross)
  FROM movie_has_genre mg2
  INNER JOIN movie m2 ON mg2.movie_id = m2.id
  GROUP BY genre_id
)
ORDER BY g.name;


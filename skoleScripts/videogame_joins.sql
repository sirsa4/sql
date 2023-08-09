#videogame JOIN

USE mydb;

# <> we avoid having videogame 
SELECT *
FROM videogame AS v1 INNER JOIN videogame AS v2 
ON v1.id <> v2.id
AND v1.release_date = v2.release_date
WHERE YEAR(v1.release_date) >= "2020"
ORDER BY v1.release_date
;

#
SELECT v1.id, v1.title,v2.id,v2.title, v1.release_date, p1.name
FROM videogame AS v1 INNER JOIN videogame AS v2 
ON v1.id < v2.id
AND v1.release_date = v2.release_date
INNER JOIN platform AS p1 ON v1.platform_id = p1.id
INNER JOIN platform AS p2 ON v2.platform_id = p2.id
WHERE YEAR(v1.release_date) >= "2020"
ORDER BY v1.release_date
;


SELECT * 
FROM videogame
;
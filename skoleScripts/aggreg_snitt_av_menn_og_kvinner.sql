
#gjennom lønn på kvinner og menn
SELECT Stilling, Kjønn, AVG(Årslønn) AS Snitt
FROM ansatt
GROUP BY Stilling, kjønn;

SELECT Stilling,

#cross table part
ROUND(AVG(IF(Kjønn = "k",Årslønn,NULL)),2) AS k,
ROUND(AVG(IF(Kjønn = "m",Årslønn,NULL)),2) AS m

FROM ansatt
GROUP BY Stilling;

SELECT * FROM regn;

#akkumlasjon. 
SELECT Dato, Nedbør, SUM(Nedbør) OVER
	(ORDER BY Dato ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Akkumulert
FROM regn;

#average for the whole week
SELECT Dato, Nedbør, AVG(Nedbør) OVER
	(ORDER BY Dato ROWS BETWEEN 3 PRECEDING AND 3 FOLLOWING) AS Uke_snitt
FROM regn;

#10 most expensive products
SELECT * 
FROM vare
ORDER BY pris DESC
LIMIT 10;

#Here 
SELECT *, RANK() OVER (ORDER BY pris DESC) AS ranking 
FROM vare;

SELECT *
FROM
	(SELECT *, RANK() OVER (ORDER BY pris DESC) AS ranking 
	FROM vare) v
WHERE ranking <=10;
;


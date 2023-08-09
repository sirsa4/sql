USE students;

SELECT * FROM first_year;

#velge ut id kolonnen fra tabellen
SELECT id FROM first_year;

#velg ut first_name fra tabellen first_year
SELECT first_name FROM first_year;

#velg ut last_name fra tabellen
SELECT last_name FROM first_year; 

#velg ut age kolonnen fra tabellen
SELECT age FROM first_year;


#velg ut alt i en rad
SELECT * 
FROM first_year
WHERE first_name = "yahye";

#hent alle som er 22 år gamle. Default
SELECT * 
FROM first_year
WHERE age = 22 desc;

#alfabetisk rekkefølge
SELECT *
FROM first_year
ORDER BY first_name;

#sorter med nummer. Her med alder
SELECT * 
FROM first_year
ORDER BY age ASC;

#sorter synkende med nummer
SELECT *
FROM first_year
ORDER BY age DESC;

#sorter med nummer og begrens på alder.
SELECT *
FROM first_year
WHERE age <= 22
ORDER BY age DESC;

#sum av alle alder
SELECT SUM(age)
FROM first_year;

#AVG() gjennomsnitt alder
SELECT AVG(age)
FROM first_year;

#MAX() finn største nummer
SELECT MAX(age)
FROM first_year;

#finn minste nummer
SELECT MIN(age)
FROM first_year;

#UPPER() storbokstav
SELECT UPPER(first_name)
FROM first_year;

#LOWER() små bokstav
SELECT LOWER(first_name)
FROM first_year;

#CONCAT() legge sammen kolonner
SELECT CONCAT(first_name, " ",last_name) AS full_name
FROM first_year;

#AND operator. finn person hvor navn start på 'a' og alder er 25 eller mindere
SELECT *
FROM first_year
WHERE first_name LIKE "a%" AND age <= 25;

#OR operator. finn alle som har first_name som starter med 'a' eller på alder 25 eller mindre.
SELECT *
FROM first_year
WHERE first_name LIKE "a%" OR age <= 25;

#NOT. 
SELECT *
FROM first_year
WHERE first_name NOT LIKE "a%" AND age <= 25;
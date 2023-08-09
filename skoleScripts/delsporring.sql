SELECT * 
from Medlem;

SELECT * 
from Løp;

SELECT *
FROM Resultat;

#hent medlemliste og finn gjennomsnitt
SELECT Fornavn, Etternavn,
	(SELECT AVG(Tid)
    FROM Resultat AS r
    WHERE r.MedlemsNr = m.MedlemsNr
    ) AS gjennomsnitt
FROM Medlem AS m;

#med group by
#GROUP BY something unique. Here MedlemsNr
SELECT Fornavn, Etternavn, AVG(Tid) AS gjennomsnitt
FROM Medlem AS m, Resultat AS r
WHERE m.MedlemsNr = r.MedlemsNr
GROUP BY m.MedlemsNr;

#oppgave2: hent medlem fornavn, etternavn pg dato for siste løp medlem var med på
SELECT Fornavn, EtterNavn
FROM Medlem AS m;

SELECT m.MedlemsNr, MAX(Dato) 
FROM Medlem AS m, Resultat AS r, Løp AS l
WHERE m.MedlemsNr = r.MedlemsNr AND r.LøpsNr = l.LøpsNr
GROUP BY m.MedlemsNr;

#not working - fixed
SELECT Fornavn, EtterNavn, sistelop.lopsdato
FROM Medlem AS m,
(SELECT r.MedlemsNr, MAX(Dato) AS lopsdato 
FROM  Resultat AS r, Løp AS l
WHERE r.MedlemsNr = l.LøpsNr
GROUP BY r.MedlemsNr) AS sistelop

WHERE m.MedlemsNr = sistelop.MedlemsNr;

#working - stolen
SELECT Fornavn, Etternavn, SisteLøp.LøpsDato
FROM Medlem AS m, 
    (
    -- Finne den siste datoen for hvert MedlemsNr
    -- Delspørring som kun gir oss kun DEN SISTE (nyeste) DATOEN noen ble med på et løp
    SELECT r.MedlemsNr, MAX(Dato) AS LøpsDato
    FROM Resultat as r, Løp as l
    WHERE r.LøpsNr = l.LøpsNr
    GROUP BY r.MedlemsNr
    ) AS SisteLøp
WHERE m.MedlemsNr = SisteLøp.MedlemsNr;


#oppgave 3: 
SELECT Fornavn, Etternavn, Distanse, Tid
FROM Medlem AS m, Resultat AS r, Løp AS l
WHERE m.MedlemsNr = r.MedlemsNr AND r.LøpsNr = l.LøpsNr
AND Tid < (SELECT AVG(Tid) FROM Resultat);

#
SELECT AVG(Tid) FROM Resultat;


#oppgave 4: alle medlemene som har deltatt i 400meter løp
SELECT *
FROM Medlem AS m
WHERE EXISTS (
	SELECT r.MedlemsNr, Distanse
	FROM Resultat AS r, Løp AS l
	WHERE r.LøpsNr = l.LøpsNr
	AND Distanse = 400
);

SELECT r.MedlemsNr, Distanse
FROM Resultat AS r, Løp AS l
WHERE r.LøpsNr = l.LøpsNr
AND Distanse = 400;

-- Answers the question
SELECT *
FROM Medlem AS m
-- Finner alle medlemmer (1,2,3,4,5,6,7,8)
WHERE NOT EXISTS (
    SELECT *
    FROM Løp AS l
    WHERE l.Distanse = 400
        -- Finner alle 400 m løper (1,5,8)
        AND NOT EXISTS (
            SELECT *
            FROM Resultat AS r
            WHERE l.LøpsNr = r.LøpsNr
            AND m.MedlemsNr = r.MedlemsNr
        ));
-- Slår sammen mengdene (11, 16, 51, 56, 58)
-- Henter så kun den som har et par på alle muligheter, altså medlem #6





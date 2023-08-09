USE covid;

# 1: Hvor mange personer har blitt vaksinert, altså mottatt minst en vaksinedose, i hver kommune?
SELECT COUNT(DISTINCT pr.Personnummer) AS antall_personer, k.Navn AS kommune
FROM person AS pr INNER JOIN person_has_vaksine AS pv
ON pv.person_Personnummer = pr.Personnummer
INNER JOIN post AS ps
ON ps.postNr = pr.post_PostNr
INNER JOIN kommune AS k
ON k.kommuneID = ps.kommune_kommuneID
GROUP BY Kommune
ORDER BY COUNT(DISTINCT pr.Personnummer) DESC
;

# 2: Hvem, fullt navn, har blitt vaksinert?
# Here we also find how many times each person was vaxed
SELECT DISTINCT pr.Fornavn,pr.Etternavn, COUNT(pr.Personnummer) AS antall_vaksine
FROM person AS pr
INNER JOIN person_has_vaksine AS pv
ON pv.person_Personnummer = pr.Personnummer
GROUP BY pr.Personnummer
ORDER BY antall_vaksine DESC
;

# 3: Hvilken vaksine har flest personer mottatt, og hvor mange doser av denne er satt?
SELECT v.Navn AS vaksine, COUNT(pr.Personnummer) AS antall_doser_tatt, COUNT(DISTINCT pr.Personnummer) AS antall_personer ,v.Antall_doser AS antall_dose
FROM person AS pr INNER JOIN person_has_vaksine AS pv
ON pv.person_Personnummer = pr.Personnummer
INNER JOIN vaksine AS v
ON pv.vaksine_id = v.id
GROUP BY pv.vaksine_id
ORDER BY COUNT(pr.Personnummer) DESC
LIMIT 1
;

# 4: Hvilke kommuner har vi en oversikt over?
SELECT * 
FROM kommune;




# 5: View which returns only the vaxx which is used most. Here it is pfizer which has 7 doses used 
CREATE VIEW mest_tatt_vaksine AS
SELECT v.Navn, COUNT(pv.vaksine_id) AS antall_doser
FROM person AS pr INNER JOIN person_has_vaksine AS pv
ON pv.person_Personnummer = pr.Personnummer
INNER JOIN vaksine AS v
ON pv.vaksine_id = v.id
GROUP BY v.Navn 
ORDER BY antall_doser DESC
LIMIT 1
;

#query to show result of view
SELECT * 
FROM mest_tatt_vaksine;



# 5: Hvem har fått vaksine av den typen det er gitt flest doser av?
SELECT DISTINCT pr.Fornavn, pr.Etternavn, v.Navn AS vaksine
FROM  person AS pr INNER JOIN person_has_vaksine AS pv
ON pv.person_Personnummer = pr.Personnummer
INNER JOIN vaksine AS v
ON pv.vaksine_id = v.id
WHERE v.Navn = (SELECT Navn FROM mest_tatt_vaksine)
;



# 6: view which gets persons who are vaccinated atleast 2 or more times
CREATE VIEW vaxxed_2_or_more_times AS
SELECT pv.person_Personnummer
FROM person_has_vaksine AS pv
GROUP BY pv.person_Personnummer
HAVING COUNT(*) >= 2;
;

#personnummer of people who are vaxxed 2 or more times
SELECT *
FROM vaxxed_2_or_more_times;

# 6: Hvilke personer har mottatt to eller flere doser, og når ble disse dosene satt? 
# here we do normal inner join of person to able to person_has_vaksine and vaksine table
# then in WHERE clause we get record where personnummer is equal to personnumer from the ones in the view
# the personnummers returned from view are ones who have been vaccinated 2 or more times
SELECT pr.Fornavn, pr.Etternavn, v.Navn AS vaksine_navn, pv.vaksine_tid AS vaksinert_dato
FROM person AS pr 
INNER JOIN person_has_vaksine AS pv 
ON pv.person_Personnummer = pr.Personnummer INNER JOIN vaksine AS v 
ON pv.vaksine_id = v.id
WHERE pr.Personnummer IN (SELECT person_Personnummer FROM vaxxed_2_or_more_times)
ORDER BY pr.Fornavn
;



CREATE VIEW vaxxed_2_or_more_times AS
SELECT pv.person_Personnummer
FROM person_has_vaksine AS pv
GROUP BY pv.person_Personnummer
HAVING COUNT(*) >= 2;
;


# 7: Hvor mange personer i hver risikogruppe er fullvaksinert, dvs. har mottatt minst to doser?
# 
SELECT COUNT(pr.Personnummer) AS antall_personer,Beskrivelse AS risiko_gruppe
FROM person AS pr INNER JOIN person_has_risikogruppe AS phr
ON phr.person_Personnummer = pr.Personnummer
INNER JOIN risikogruppe AS r
ON phr.risikogruppe_RisikogruppeID = r.RisikogruppeID
WHERE pr.Personnummer IN (SELECT person_Personnummer FROM vaxxed_2_or_more_times)
GROUP BY r.RisikogruppeID
;




#testtt på usikkerhet i oppgave 7
SELECT pr.Fornavn, r.Beskrivelse AS risiko_gruppe ,COUNT(phr.person_Personnummer)
FROM person AS pr INNER JOIN person_has_risikogruppe AS phr
ON phr.person_Personnummer = pr.Personnummer
INNER JOIN risikogruppe AS r
ON phr.risikogruppe_RisikogruppeID = r.RisikogruppeID
GROUP BY pr.Personnummer,r.Beskrivelse
;

#, Beskrivelse AS risiko_gruppe































USE oblig2v23;

SELECT * FROM world;

# 1: sortert fra størst til minst basert på antall innbyggere
SELECT * 
FROM world
ORDER BY Population DESC;

# 2: Hent landsnavn og innbyggertall for landene som ligger i Europa, sortert alfabetisk på landsnavn.
#EASTERN EUROPE, WESTERN EUROPE, BALTICS, C.W. OF IND. STATES
#spørring til å finne ut alle mulige regioner. med DISTINCT nøkkelord kan vi unngå duplikasjon
SELECT DISTINCT Region
FROM world;

#PROBELM: land i Region "C.W. OF IND. STATES" er blant Turkmenistan, Tajikistan, i sentral asia. 
SELECT * 
FROM world
WHERE Region IN("C.W. OF IND. STATES");

#hent alle i europa eller relatert
SELECT * 
FROM world
WHERE Region IN("EASTERN EUROPE","WESTERN EUROPE","BALTICS")
ORDER BY Country
;

# 3: Hent landsnavn og innbyggertall for landene som ligger i Europa med over 50 millioner mennesker, sorter fra størst til minst på antall innbyggere.
SELECT Country,Population
FROM world
WHERE Region IN("EASTERN EUROPE","WESTERN EUROPE","BALTICS")
AND Population > 50000000
ORDER BY Population DESC
; 

# 4: Hent ut navn på alle land i Europa, bortsett fra landene Finland, Sverige og Danmark.
SELECT Country
FROM world
WHERE Region IN("EASTERN EUROPE","WESTERN EUROPE","BALTICS")
AND NOT Country IN("Finland","Sweden","Denmark")
;

# 5: - FAIL Hent ut navn, befolkningstetthet (personer per kvadratkilometer) og gjennomsnittlig GDP per innbygger 
#Tallene skal oppgis med to desimaler sortert synkende på den utregnede GDP’en
#Sources:
# befolkningstetthet formel: https://www.wikihow.com/Calculate-Population-Density 
# formel: Population Density = Number of People / Land Area
#not working
SELECT Country, CAST(Population / Area AS DECIMAL(2)) AS befolkningstetthet, CAST(AVG(GDP / Population) AS DECIMAL(2) ) AS gjennomsnittlig_GDP
FROM world
ORDER BY GDP DESC
; 


# 5: - Hent ut navn, befolkningstetthet (personer per kvadratkilometer) og gjennomsnittlig GDP per innbygger 
#Tallene skal oppgis med to desimaler sortert synkende på den utregnede GDP’en
#Sources:
# befolkningstetthet formel: https://www.wikihow.com/Calculate-Population-Density 
# formel: Population Density = Number of People / Land Area
SELECT Country, Population / Area AS befolkningstetthet, ROUND(GDP / Population,2) AS gjennomsnittlig_GDP
FROM world
ORDER BY gjennomsnittlig_GDP DESC
; 


# 6: Hent ut alle regionene, men hver av de bare én gang.
#Denne spørringen har jeg allerede brukt i oppgave2 der vi skulle finne alle land europa.
SELECT DISTINCT Region
FROM world;

# 7: Hent ut alle land i America 
#I spørring oppgave6 henter vi alle regionene distinct
#så fra spørring in oppgave6, kan vi se regionene som er en del av America
#Region i America: 'LATIN AMER. & CARIB' og 'NORTHERN AMERICA'
SELECT Country, Region
FROM world
WHERE Region IN("LATIN AMER. & CARIB","NORTHERN AMERICA")
;

# 8: Hent ut landsnavn og innbyggertall for de landene som har mellom 4 og 8 millioner
#    eller over 100000000 innbyggere
#source: https://www.w3schools.com/sql/sql_between.asp 
# code example
/*
	SELECT * FROM Products
	WHERE Price BETWEEN 10 AND 20;
*/
SELECT Country, Population
FROM world
WHERE Population BETWEEN 4000000 AND 8000000 OR Population >= 100000000
;

#9: Skriv ut land navn, innbyggertall og areal for de nordiske landene
#for finne ut Region navnet for nordisk land, kjører vi spørringen fra oppgave6 igjen. Den hver region kun 1 gang
SELECT DISTINCT Region
FROM world;

#source for land i norden: https://en.wikipedia.org/wiki/Nordic_countries 
#kan ikke finne Åland i spørrigen, men resten er ok
#tabellen har ingen Region som er kun nordisk land, så vi må hente dem selv 1 og 1.
SELECT Country AS navn, Population AS innbyggertall, Area AS areal
FROM world
WHERE Country IN("Norway","Sweden","Denmark","Finland","Iceland","Faroe Islands","Åland")
;

# 10: Finn snittet av innbyggertall i hele verden
#Med AVG() funksjon som vi har lært i forrige oblig
SELECT AVG(Population) AS avg_innbyggertall
FROM world
;

# 11: Finn snittet av innbyggere for hver region
# got help from fellow student on this one. I was stuck on it try to make 2 SELECT to work
SELECT DISTINCT Region, AVG(Population) AS avg_snitt_per_region
FROM world
GROUP BY Region
;

# 12: Vis navn på region og hvor mange innbyggere det er i hver region. Sorter synkende på innbyggertall
# Vi GROUP BY for å finne hver Region
# SUM() aggreg funksjon med alias innbyggertall
# tilslutt sorterer vi med sum av innbyggertall for hver region synkende med DESC. Fra høy til lav
SELECT DISTINCT Region, SUM(Population) AS innbyggertall
FROM world
GROUP BY Region
ORDER BY SUM(Population) DESC
;

# 13: Skriv ut navn og innbyggertall for det landet med flest innbyggere i verden
# I got help with this one from fellow student.
/* My query looked something like this. i struggled to limit to show 1 country only

SELECT Country, MAX(Population) AS innbyggertall
FROM world;

*/
#Using Select in WHERE clause/seksjon blir løsningen på oppgaven
SELECT Country, Population AS innbyggertall
FROM world
WHERE Population = (SELECT MAX(Population) FROM world)
;




SELECT * FROM world;


USE covid;

# ---------------this table has values-----------------
SELECT * 
FROM kommune;

SELECT * 
FROM kommune;

SELECT * 
FROM vaksine;

SELECT * 
FROM produsent;

SELECT * 
FROM vaksine_has_produsent;

SELECT * 
FROM post;

# ------------------tables without values-----------------------------
#this table has value values
SELECT * 
FROM person;

#drop foreign keys of person table in tables: person_has_vaksine AND person_has_risikogruppe before be able to change datatype of person.personnummer
ALTER TABLE person_has_vaksine DROP FOREIGN KEY person_has_vaksine_ibfk_1;

ALTER TABLE person_has_risikogruppe DROP FOREIGN KEY person_has_risikogruppe_ibfk_1;

#change personnummer column data type to BIGINT which can store enough numbers long enough personal ID in Norway
ALTER TABLE person
MODIFY COLUMN personnummer BIGINT(20);

#modify Telefonnummer 
ALTER TABLE person
MODIFY COLUMN Telefonnummer BIGINT(20);

#remove foreign keys columns in person_has_vaksine and person_has_risikogruppe tables
ALTER TABLE person_has_vaksine
DROP COLUMN person_Personnummer;

ALTER TABLE person_has_risikogruppe
DROP COLUMN person_Personnummer;


#add foreign key to person_has_vaksine and person_has_risikogruppe
ALTER TABLE person_has_vaksine
ADD person_Personnummer BIGINT(20) FIRST,
ADD FOREIGN KEY(person_personnummer) REFERENCES person(personnummer);

ALTER TABLE person_has_risikogruppe
ADD person_Personnummer BIGINT(20) FIRST,
ADD FOREIGN KEY(person_personnummer) REFERENCES person(personnummer);

#add foreign key contraint back to person_has_vaksine and person_has_risikogruppe
ALTER TABLE person_has_vaksine 
ADD CONSTRAINT person_has_vaksine_ibfk_1 
FOREIGN KEY (person_Personnummer) REFERENCES person(personnummer);


INSERT INTO person(Navn,personnummer,Telefonnummer,Adresse,post_postNr)
VALUES
("kabada","21099238795",4799003330,"fake street",1602)
;

INSERT INTO person(Navn,personnummer,Telefonnummer,Adresse,post_postNr)
VALUES
("dabada","08056032364",4759570803,"somewhere 2",1539),
("lala",)
;

SELECT * 
FROM post;

SELECT * 
FROM person_has_vaksine;





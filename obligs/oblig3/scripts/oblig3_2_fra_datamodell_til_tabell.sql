USE covid;

#change database to add COLLATE utf-8_bin. We tried this in oblig2_1
ALTER SCHEMA `covid`  DEFAULT CHARACTER SET utf8mb4  DEFAULT COLLATE utf8mb4_bin ;
ALTER SCHEMA `covid`  DEFAULT CHARACTER SET utf8mb4  DEFAULT COLLATE utf8mb4_unicode_520_ci ;



SELECT * FROM risikogruppe;


#change column name in kommune table
Alter table kommune rename column kommuneID TO KommuneID;

SELECT * FROM kommune;



#change coloumn to match the one from the csv
Alter table post rename column kommune_kommuneID TO Kommune_KommuneID;

#post table
SELECT * from post;

SELECT * from person;

#remove foreign key constraint first before being able to remove the column holding the foreign key 
ALTER TABLE vaksine
DROP FOREIGN KEY fk_vaksine_produsent1;

#remove produsent foreign key column in vaksine table
ALTER TABLE vaksine
DROP COLUMN produsent_ProdusentID;



#change relationship between vaksine and produsent entities to many-to-many relationship using middle table
CREATE TABLE vaksine_has_produsent (
   id INT AUTO_INCREMENT PRIMARY KEY,
   vaksine_id INT,
   produsent_id INT,
   FOREIGN KEY (vaksine_id) REFERENCES vaksine(id),
   FOREIGN KEY (produsent_id) REFERENCES produsent(ProdusentID)
);

#insert values in vaksine
INSERT INTO vaksine(Navn,Godkjenningsdato,Antall_dose)
VALUES
("pfizer","2020,11,20",4)
;

INSERT INTO vaksine(Navn,Godkjenningsdato,Antall_dose)
VALUES
("Oxford–AstraZeneca","2021-03-26",4),
("Moderna","2021-04-12",3)
;


#connect vaksine to correct producer using middle table
#here for example pfizer has 2 produsers.
INSERT INTO vaksine_has_produsent(vaksine_id, produsent_id)
VALUES
(1,1),
(1,2),
(2,4),
(3,3)
;


SELECT * FROM produsent;

SELECT * FROM vaksine;

select * from vaksine_has_produsent;

#remove the id column as this is not needed as primary key
ALTER TABLE post
DROP column id;

#drop primary key constraint first before adding new one
ALTER TABLE post
DROP PRIMARY KEY;

#make postNr column the primary key post table
ALTER TABLE post
MODIFY PostNr INT PRIMARY KEY;

#change the foreign key of post table in person to new one
#first drop old foreign key
ALTER TABLE person
DROP FOREIGN KEY fk_person_post1;

#drop old post foreign key column in person table
ALTER TABLE person
DROP COLUMN post_id;

#add column post_Nr and make it foreign key referencing post.postNr
ALTER TABLE person
ADD COLUMN post_postNr INT,
ADD FOREIGN KEY (post_postNr) REFERENCES post(postNr)
;

#change person primary key to Personnummer attribut
ALTER TABLE person
DROP COLUMN id;

#asign personnumer to be the new primary key in person table
ALTER TABLE person
MODIFY personnummer int PRIMARY KEY;

#drop the person foreign key in person_has_vaksine table
ALTER TABLE person_has_vaksine
DROP FOREIGN KEY fk_person_has_vaksine_person1;

#drop the person_id column
ALTER TABLE person_has_vaksine
DROP COLUMN person_id;

#add new column refering to personummer column as foreign key
ALTER TABLE person_has_vaksine
ADD person_Personnummer INT FIRST,
ADD FOREIGN KEY(person_personnummer) REFERENCES person(personnummer);

#DROP foreign key constraint before being able to remove the foreign key column
ALTER TABLE person_has_risikogruppe
DROP FOREIGN KEY fk_person_has_risikogruppe_person1;

#drop person_id column and change referance to the person table's primary key
ALTER TABLE person_has_risikogruppe
DROP COLUMN person_id;

#add new foreign key column
ALTER TABLE person_has_risikogruppe
ADD person_Personnummer INT FIRST,
ADD FOREIGN KEY(person_personnummer) REFERENCES person(personnummer);





SELECT * FROM person_has_risikogruppe;
SELECT * FROM post;


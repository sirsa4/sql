
USE covid;

# ---------------this table has values-----------------
SELECT * 
FROM kommune;

SELECT * 
FROM vaksine;

SELECT * 
FROM vaksine_has_produsent;

SELECT * 
FROM produsent;

SELECT * 
FROM risikogruppe;

SELECT * 
FROM post;

# ------------------tables without values-----------------------------
#this table has value values
SELECT * 
FROM person;


#--------------------------vaksine table values--------------------
#insert values in vaksine
INSERT INTO vaksine(Navn,Godkjenningsdato,Antall_doser)
VALUES
("pfizer","2020,11,20",4)
;

INSERT INTO vaksine(Navn,Godkjenningsdato,Antall_doser)
VALUES
("Oxford–AstraZeneca","2021-03-26",4),
("Moderna","2021-04-12",3)
;


#connect vaksine to correct producer using middle table
#here for example pfizer has 2 produsers.
INSERT INTO vaksine_has_produsent(vaksine_id, produsent_ProdusentID)
VALUES
(1,1),
(1,2),
(2,4),
(3,3)
;



#-----------------------
INSERT INTO person(Fornavn,Etternavn,personnummer,Telefonnummer,Adresse,post_postNr)
VALUES
("kabada","kii",21099238795,4799003330,"fake street",1602),
("lala","lire",23073226317,4748332264,"prog2",1624),
("mr","anderson",21029633913,4759991463,"grass",1641),
("omba","lumba",29109318297,4741088114,"mountains",1657),
("nisar","read",01019416395,4791735957,"dondurma",1683),
("billie","bin",21114739550,4740114532,"stalingrad",1701),
("tic","tac",26034941296,4740481251,"keke",1742),
("mara","kilini",30077102244,4748113068,"gate kjar",1743),
("bam","barabum",04127922824,4747470572,"tnt land",1751),
("mikel","juqson",18108218904,4746327461,"smooth",1757)
;

INSERT INTO person(Fornavn,Etternavn,personnummer,Telefonnummer,Adresse,post_postNr)
VALUES
("final","person",21099212791,4799003340,"lol street",1602)
;

SELECT * 
FROM person;


#people who have taken the vax and they took it
# 1: pfizer, 2: astra, 3: moderna
INSERT INTO person_has_vaksine(person_Personnummer,vaksine_id,vaksine_tid)
VALUES
(1019416395,3,"2021-05-28"),
(4127922824,1,"2020-08-22"),
(4127922824,1,"2021-01-12"),
(4127922824,1,"2022-10-10"),
(18108218904,2,"2020-11-25"),
(21029633913,3,"2021-03-14"),
(21029633913,3,"2021-12-28"),
(21099238795,2,"2022-01-21"),
(21114739550,1,"2020-11-18"),
(23073226317,3,"2021-01-23"),
(23073226317,1,"2021-11-05"),
(23073226317,3,"2022-06-14"),
(26034941296,2,"2022-03-15"),
(30077102244,1,"2020-05-11"),
(30077102244,1,"2021-01-19")
;

SELECT * 
FROM person_has_vaksine;

#insert data into person_has_risikogruppe
INSERT INTO person_has_risikogruppe(person_Personnummer,risikogruppe_RisikogruppeID)
VALUES
(21099238795,2),
(23073226317,1),
(21029633913,9),
(29109318297,2),
(01019416395,9),
(21114739550,3),
(26034941296,3),
(30077102244,7),
(04127922824,3),
(18108218904,3)
;


SELECT *
FROM person_has_risikogruppe;







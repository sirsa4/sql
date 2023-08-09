CREATE SCHEMA students;

USE students;

CREATE TABLE first_year(

	id 	INT NOT NULL auto_increment PRIMARY KEY UNIQUE,
    
    first_name VARCHAR(255) NOT NULL,
    
	last_name VARCHAR(255) NOT NULL,
    
    age INT NOT NULL
    
) auto_increment = 1;


INSERT INTO first_year(first_name, last_name, age) 
VALUES("yahye","abdi",28);

INSERT INTO first_year(first_name, last_name, age) 
VALUES
("mostafa","ali",22);

INSERT INTO first_year(first_name,last_name,age)
VALUES

("astrid","johan",25),
("peter","kiir",19),
("kahn","ozi",18),
("anne","marie",22),
("jon","arne",32),
("martin","ger",26),
("seline","sami",21),
("arild","wilhaven",30)
;

DROP TABLE first_year;


select * from first_year;

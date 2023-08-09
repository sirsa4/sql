#create schema/datbase
CREATE SCHEMA `oblig2v23` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;	


#use the database
USE oblig2v23;


#create a table
create TABLE world (
id INT NOT NULL AUTO_INCREMENT,
Country VARCHAR(25),
Region VARCHAR(25),
Population INT,
Area INT,
GDP INT,
PRIMARY KEY(id)
);




#show sure folder path where mysql can read csv file from
SHOW VARIABLES LIKE "secure_file_priv";


#import data from a file
LOAD DATA 
INFILE "/var/lib/mysql-files/countries.csv"
INTO TABLE world
FIELDS TERMINATED BY ";"
lines terminated by "\n"
IGNORE 1 ROWS 
(Country, Region,Population,Area,GDP);



SELECT * FROM world;
#create schema/datbase
CREATE SCHEMA `oblig2v23` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;

#use the database
USE oblig2v23;

#create a table
create TABLE world (
id INT NOT NULL AUTO_INCREMENT,
Country VARCHAR(25),
Region VARCHAR(25),
Pupulation INT,
Area INT,
GDP INT,
PRIMARY KEY(id)
) AUTO_INCREMENT = 1;

#import data from a file



SELECT * FROM world;
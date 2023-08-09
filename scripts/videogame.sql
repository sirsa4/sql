USE games;

CREATE TABLE `videogame` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(100) NOT NULL,
    `platform` VARCHAR(45) DEFAULT NULL,
    `metascore` DOUBLE DEFAULT NULL,
    `userscore` DOUBLE DEFAULT NULL,
    `genre` VARCHAR(45) DEFAULT NULL,
    `release_date` DATE DEFAULT NULL, 
    PRIMARY KEY (`id`) 
)  AUTO_INCREMENT=1;

SELECT * 
FROM videogame
WHERE platform = "PlayStation 5"
;

SELECT *
FROM videogame
WHERE release_date >= '2015-01-01'
AND  release_date <= '2020-12-31';
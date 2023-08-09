USE games;

SELECT * FROM videogame;

CREATE TABLE platform
(
id INT NOT NULL AUTO_INCREMENT,
platform VARCHAR(50),
PRIMARY KEY(id)
) auto_increment = 1;

#insert unique data from videogame table to the platform table
INSERT INTO platform(platform)
SELECT DISTINCT platform FROM videogame;

SELECT * FROM platform;

#Lag ny kolonne i videogame tabell
ALTER TABLE videogame
add platform_id INT;

#gjør platform_id kolonne til foreign key
ALTER TABLE videogame
ADD CONSTRAINT fk_video_platform
FOREIGN KEY(platform_id) REFERENCES platform(id);

#sjekk om videogame platform og platform tabell samsvarer
SELECT platform.id, platform.platform, videogame.platform
FROM platform, videogame
WHERE platform.platform = videogame.platform;

#Slå av safe updates før du kan update data
SET SQL_SAFE_UPDATES = 0;

#update videogame. Set inn KUN id
UPDATE videogame
SET platform_id = (
	SELECT platform.id
	FROM platform
	WHERE platform.platform = videogame.platform
);

#slett column plaform column i videogames
ALTER TABLE videogame
DROP COLUMN platform;

SELECT * FROM videogame;
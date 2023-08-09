CREATE DATABASE ordere;

USE ordere;

CREATE TABLE ordretabell
(kundenr INT,
etternavn CHAR(15),
ordrenr INT,
varenr INT,
betegnelse CHAR(45),
pris DECIMAL(5,2),
CONSTRAINT nokkel PRIMARY KEY (ordrenr, varenr)
);

update ordretabell
set pris = 62.25
where betegnelse = "Nisseskjegg, 30 cm";



INSERT INTO ordretabell VALUES (5022, 'Østbø', 20505, 10830, 'Nisseskjegg, 30 cm', '57.50');
INSERT INTO ordretabell VALUES (5022, 'Østbø', 20505, 77033, 'Japanbarlind', '358.00');
INSERT INTO ordretabell VALUES (5009, 'Eckhoff', 20506, 10830, 'Nisseskjegg, 30 cm', '57.50');
INSERT INTO ordretabell VALUES (5009, 'Eckhoff', 20506, 44939, 'Hobbymaling, 6 farger', '115.00');
INSERT INTO ordretabell VALUES (5009, 'Echoff', 20506, 65081, 'Plantegreip', '112.00');
INSERT INTO ordretabell VALUES (5188, 'Marcussen', 20507, 12088, 'Einer "Tyrihans"', '215.00');
INSERT INTO ordretabell VALUES (5188, 'Marcussen', 20507, 21032, 'Furuspon, 3 cm', '57.50');

#delete ordre
DELETE FROM ordretabell
WHERE ordrenr = 20506;

select *
from ordretabell;


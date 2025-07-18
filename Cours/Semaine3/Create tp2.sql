-- Creation de la base de donnée tp2
-- create database if not exists tp2;
--
-- USE tp2 ;

-- 1. Creation de la table artistes
CREATE TABLE artistes(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(50),
genreMusical VARCHAR(50),
anneeDebutCarriere INT
);

--
-- 2. Creation de la table albums

CREATE TABLE albums(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
titre VARCHAR(50),
-- idArtiste VARCHAR(50) FOREIGN KEY(idArtiste) REFERENCES artistes(id),
anneeDeSortie INT
);


-- 3. Creation de la table chansons
CREATE TABLE chansons(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
titre VARCHAR(50),
-- idAlbums VARCHAR(50) FOREIGN KEY(idAlbum) REFERENCES album(id),
dureeChanson DOUBLE
);

-- ALTER TABLE ADD CONSTRAINT sur albums
ALTER TABLE albums
ADD index idx_album_artistes(id_artiste),
ADD CONSTRAINT FK_idartiste 
FOREIGN KEY (id_artiste)
REFERENCES artistes(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- ALTER TABLE ADD CONSTRAINT sur chansons

ALTER TABLE chansons
ADD id_album int references albums(id);

ALTER TABLE chansons
ADD index idx_chanson_albums(id_album),
ADD CONSTRAINT FK_idalbum 
FOREIGN KEY (id)
REFERENCES albums(id)
ON DELETE CASCADE
ON UPDATE CASCADE;

describe chansons ;

INSERT INTO artistes (nom,
genreMusical, anneeDebutCarriere) VALUES ('Michael Jackson', 'Pop', 1964, 'The Beatles', 'Rock', 1960);

INSERT INTO artistes (nom,
genreMusical, anneeDebutCarriere) VALUES ('Michael Jackson', 'Pop', 1964);

INSERT INTO artistes (nom,
genreMusical, anneeDebutCarriere) VALUES ('The Beatles', 'Rock', 1960);


INSERT INTO artistes (nom,
genreMusical, anneeDebutCarriere) VALUES ('Madonna', 'Pop', 1979);

INSERT INTO artistes (nom,
genreMusical, anneeDebutCarriere) VALUES ('Bob Marley', 'Reggae', 1963);

INSERT INTO artistes (nom,
genreMusical, anneeDebutCarriere) VALUES ('Prince', 'RnB', 1975);

INSERT INTO artistes (nom,
genreMusical, anneeDebutCarriere) VALUES ('Edith Piah', 'Chanson Française', 1935);

SELECT * FROM artistes;

INSERT INTO artistes (nom,
genreMusical, anneeDebutCarriere) VALUES ('Charles Aznavour', 'Chanson Française', 1946);

INSERT INTO artistes (nom,
genreMusical, anneeDebutCarriere) VALUES ('Stromae', 'Pop', 2000);

INSERT INTO artistes (nom,
genreMusical, anneeDebutCarriere) VALUES ('Adèle', 'Pop', 2006);

INSERT INTO albums (titre, id_artiste, anneeDeSortie)
VALUES
   ('Legend', 4, 1984),
   ('Purple rain', 5, 1984),
   ('La vie en rose', 6, 1947),
   ('Sur ma vie', 7, 1954),
   ('Racine Carée', 8, 2013),
   ('Adèle', 9, 2006)
   ;
   
SELECT * FROM chansons;

INSERT INTO chansons (titre, id_album, dureeChanson)
VALUES
   ('Billie jean', 1, 4.54),
   ('Beat it', 1, 4.18),
   ('Imagine', 2, 3.03),
   ('Material girl', 3, 3.53),
   ('Redemption song', 4, 3.49),
   ('Purple rain', 5, 8.41),
   ('Non je ne regrette rien', 6, 2.23),
   ('La bohème', 7, 4.05),
   ('Papaoutai', 8, 3.51)
   ;
   
-- Recherchez tous les artistes du genre "Pop" 
SELECT nom, genreMusical FROM artistes WHERE genreMusical = 'Pop';

-- Obtenez la liste des albums sortis en 1984 
SELECT titre, anneeDeSortie FROM albums WHERE anneeDeSortie = 1984;

-- Trouvez toutes les chansons de l’album d’id 6 
SELECT titre, id_album FROM chansons WHERE id_album = 6;

--  Recherchez toutes les chansons dont la durée est supérieure à 4 minutes
Alter table chansons CHANGE COLUMN dureeChanson dureeChanson FLOAT;
describe chansons;

UPDATE chansons SET dureeChanson = '4.54' WHERE id = 1;

SELECT * FROM chansons;

UPDATE chansons SET dureeChanson = '3.03' WHERE id = 3;
UPDATE chansons SET dureeChanson = '3.53' WHERE id = 4;
UPDATE chansons SET dureeChanson = '3.49' WHERE id = 5;
UPDATE chansons SET dureeChanson = '8.41' WHERE id = 6;
UPDATE chansons SET dureeChanson = '2.23' WHERE id = 7;
UPDATE chansons SET dureeChanson = '4.05' WHERE id = 8;
UPDATE chansons SET dureeChanson = '3.51' WHERE id = 9;
SELECT titre, dureeChanson FROM chansons WHERE dureeChanson > 4.00 ;


SELECT titre, dureeChanson FROM chansons;

-- Recherchez les artistes dont le nom commence par "M" 

select nom from artistes where nom like 'M%' ;

-- Affichez les artistes qui ont commencé leur carrière entre 1990 et 2023 
select nom from artistes where anneeDebutCarriere between 1990 and 2023 ;


-- Sélectionnez les artistes de genre "Pop" ou "Rock" 
select nom, genreMusical from artistes where genreMusical = 'Pop' or  genreMusical = 'Rock' ;

-- Retrouvez les artistes de genre "pop" qui ont commencé leur carrière après 1990 *
select nom, genreMusical from artistes where genreMusical = 'Pop' and dateDebCarriere > 1990 ;

-- Affichez les artistes qui sont soit de genre "Reggae" soit de genre "Rock"
select nom, genreMusical from artistes where  genreMusical = 'Reggae' or genreMusical = 'Rock' ;

describe artistes;

select * from artistes;







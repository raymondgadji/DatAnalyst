-- Création de la base de données
-- Drop database if exists TP21;
CREATE DATABASE TP21;
CREATE DATABASE if not exists TP21;

-- Utilisation de la base de données
USE TP21;



CREATE TABLE Artistes (
    ID INT PRIMARY KEY auto_increment,
    Nom VARCHAR(100),
    Genre VARCHAR(50),
    `Année de début` INT NOT NULL
);

SELECT * FROM Artistes;

-- Création de la table Albums
CREATE TABLE Albums (
    ID INT PRIMARY KEY auto_increment,
    Titre VARCHAR(100),
    `Artiste ID` INT,
    `Année de sortie` INT,
    FOREIGN KEY (`Artiste ID`) REFERENCES Artistes(ID)
);

-- Création de la table Chansons
CREATE TABLE Chansons (
    ID INT PRIMARY KEY auto_increment,
    Titre VARCHAR(100),
    `Album ID` INT,
    Durée VARCHAR(10),
    FOREIGN KEY (`Album ID`) REFERENCES Albums(ID)
);
-- Insert some data

-- Insertion de données dans la table Artistes
INSERT INTO Artistes (ID, Nom, Genre, `Année de début`)
VALUES
    (1, 'Michael Jackson', 'Pop', 1964),
    (2, 'The Beatles', 'Rock', 1960),
    (3, 'Madonna', 'Pop', 1979),
    (4, 'Bob Marley', 'Reggae', 1963),
    (5, 'Prince', 'R&B', 1975),
    (6, 'Édith Piaf', 'Chanson française', 1935),
    (7, 'Charles Aznavour', 'Chanson française', 1946),
    (8, 'Stromae', 'Pop', 2000),
    (9, 'Justin Timberlake', 'Pop', 1992),
    (10, 'Justin Timberlake', 'R&B', 1992);
    
INSERT INTO Artistes (Nom, Genre,`Année de début`)
VALUES
    ('Janet Jackson', 'Pop',1970);

-- Insertion de données dans la table Albums
INSERT INTO Albums (ID, Titre, `Artiste ID`, `Année de sortie`)
VALUES
    (1, 'Thriller', 1, 1982),
    (2, 'Abbey Road', 2, 1969),
    (3, 'Like a Virgin', 3, 1984),
    (4, 'Legend', 4, 1984),
    (5, 'Purple Rain', 5, 1984),
    (6, 'La Vie en rose', 6, 1947),
    (7, 'Sur ma vie', 7, 1954),
    (8, 'Racine Carrée', 8, 2013),
    (9, 'The 20/20 Experience', 10, 2013);
    
    

-- Insertion de données dans la table Chansons
INSERT INTO Chansons (ID, Titre, `Album ID`, Durée)
VALUES
    (1, 'Billie Jean', 1, '4:54'),
    (2, 'Beat It', 1, '4:18'),
    (3, 'Imagine', 2, '3:03'),
    (4, 'Material Girl', 3, '3:53'),
    (5, 'Redemption Song', 4, '3:49'),
    (6, 'Purple Rain', 5, '8:41'),
	(7, 'Non, je ne regrette rien', 6, '2:23'),
    (8, 'La Bohème', 7, '4:05'),
    (9, 'Papaoutai', 8, '3:51'),
    (10, 'Suit & Tie', 9, '5:26'),
    (11, 'Mirrors', 9, '8:05');

-- quelques requetes: 
-- Recherchez tous les artistes du genre "Pop" :

SELECT * FROM Artistes WHERE Genre = 'Pop';
-- Obtenez la liste des albums sortis en 1984 :
SELECT Titre FROM Albums WHERE `Année de sortie` = 1984;
--  Recherchez toutes les chansons dont la durée est supérieure à 4 minutes :

SELECT Chansons.Titre
FROM Chansons
WHERE SUBSTRING(Chansons.Durée, 1, 1) > 4;

select * from chansons where Chansons.Durée>'00:04';

-- Listez les artistes par ordre alphabétique de leur nom :

SELECT Nom, Genre, `Année de début`
FROM Artistes
ORDER BY Nom ASC;
-- Recherchez les artistes dont le nom commence par "M" :

SELECT Nom, Genre, `Année de début`
FROM Artistes
WHERE Nom LIKE 'M%';
-- Affichez les artistes qui ont commencé leur carrière entre 1960 et 1980 :

SELECT Nom, Genre, `Année de début`
FROM Artistes
WHERE `Année de début` BETWEEN 1990 AND 2023;
-- Sélectionnez les artistes de genre "Pop" ou "Rock" :

SELECT *
FROM Artistes
WHERE Genre IN ('Pop', 'Rock');

SELECT Nom, Genre, `Année de début`
FROM Artistes
WHERE Genre ='Pop'or Genre= 'Rock';
-- Retrouvez les artistes de genre "RpopB" qui ont commencé leur carrière après 1990 :

SELECT Nom, Genre, `Année de début`
FROM Artistes
WHERE Genre = 'pop' AND `Année de début` > 1990;
-- Affichez les artistes qui sont soit de genre "Reggae" soit de genre "Rock" :

SELECT Nom, Genre, `Année de début`
FROM Artistes
WHERE Genre = 'Reggae' OR Genre = 'Rock';


-- Obtenez tous les artistes du genre "Pop" et leurs albums :
SELECT artistes.nom, albums.Titre, artistes.Genre 
FROM artistes AS ar
INNER JOIN albums ON albums.`Artiste ID` = artistes.`ID` 
WHERE Genre = 'Pop';

-- Obtenez une liste des artistes et de leurs albums correspondants (INNER JOIN) 
SELECT artistes.nom, albums.Titre
FROM artistes
INNER JOIN albums 
ON albums.`Artiste ID` = artistes.`ID`;

-- Listez tous les artistes, même ceux sans albums (LEFT JOIN)
SELECT artistes.nom, albums.Titre
FROM artistes
LEFT JOIN albums 
ON albums.`Artiste ID` = artistes.`ID`;

-- Affichez tous les albums et leurs artistes correspondants (RIGHT JOIN) 
SELECT albums.Titre, artistes.nom
FROM artistes
RIGHT JOIN albums
ON albums.`Artiste ID` = artistes.`ID`;

-- Sélectionnez les chansons et les albums correspondants
SELECT chansons.Titre, albums.Titre
FROM chansons
INNER JOIN albums 
ON chansons.`Album ID` = albums.`ID`;

-- Affichez les artistes qui n'ont pas d'albums 
SELECT artistes.nom, albums.Titre
FROM artistes
LEFT JOIN albums 
ON albums.`Artiste ID` = artistes.`ID` 
WHERE albums.Titre IS NULL;

SELECT artistes.nom, albums.Titre
FROM artistes
LEFT JOIN albums 
ON albums.`Artiste ID` = artistes.`ID` 
WHERE albums.`Artiste ID` IS NULL;

-- Aggrégations -- Trouvez le nombre total d'albums dans la base de données :
SELECT COUNT(ID) 
AS Nombre_total_albums 
FROM Albums;

-- Calculez la durée totale de toutes les chansons dans la base de données :
SELECT SUM(Durée) 
AS Durée_totale_chansons
FROM chansons; 

-- Déterminez la moyenne d'années de début des artistes :
SELECT AVG(artistes.`Année de début`) 
AS Moyenne_année_début_artistes 
FROM artistes;

-- Trouvez le nombre d'albums pour chaque artiste (groupé par artiste) :
SELECT art.ID, art.nom, COUNT(alb.ID) AS NbAlbums_ParArtiste 
FROM artistes as art, Albums as alb 
WHERE art.ID = alb.`Artiste ID`
GROUP BY art.ID;

-- GROUP BY art.nom;

-- Sélectionnez les années de sortie avec plus de 3 albums (groupées par année) :
SELECT COUNT(ID) AS NbAlbums,
`Année de sortie` AS Annee_De_Sortie
FROM Albums
GROUP BY `Année de sortie`
Having  NbAlbums >= 3 ;

-- Trouvez la durée moyenne des chansons pour chaque album (groupée par album) :
SELECT Alb.ID AS ID_ALBUM, AVG(Chn.`Durée`) AS Duree_Moyenne 
FROM Albums as Alb, Chansons as Chn
WHERE Alb.ID = Chn.`Album ID`
Group BY Alb.Titre;


-- Calculez le nombre total de chansons dans chaque genre musical (groupé par genre) :
SELECT artistes.Genre,
count(chansons.ID) AS Nbre_chansons
FROM chansons
JOIN Albums ON chansons.`Album ID` = albums.ID
JOIN artistes ON albums.`Artiste ID` = artistes.ID
GROUP BY artistes.Genre
ORDER BY Nbre_chansons desc;

-- Déterminez l'année de sortie de l'album le plus récent :
SELECT max(`Année de sortie`) FROM albums;

-- Trouvez le genre musical le plus populaire (genre avec le plus grand nombre d'artistes) :


-- Calculez la durée totale de chaque album en minutes (groupée par album) 
SELECT a.ID, a.Titre, SUM(TIME_TO_SEC(c.Durée) / 60) AS DureeTotale_ParAlbum
FROM tp21.albums a
LEFT JOIN tp21.chansons c ON a.ID = c.`Album ID`
GROUP BY a.ID, a.Titre;

DESCRIBE tp21.chansons;

-- Bonus: Opérations ensemblistes:
-- Listez tous les artistes qui sont soit de genre "Pop" soit de genre "Rock" (UNION) 
-- Sélectionnez les artistes qui sont à la fois de genre "Pop" et "R&B" (INTERSECT simulé avec INNER JOIN)
-- Trouvez les artistes qui sont de genre "Pop" mais pas "Rock" (EXCEPT simulé avec LEFT JOIN) 
-- Listez tous les artistes de genre "Pop" et "Rock" avec doublons (UNION ALL) :
-- Sélectionnez les artistes qui ne sont ni "Pop" ni "Rock"



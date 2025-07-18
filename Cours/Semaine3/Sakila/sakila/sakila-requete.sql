USE sakila;

-- 1- Afficher les 5 premiers Records de la table Actor

SELECT actor_id, first_name, last_name 
FROM actor
LIMIT 5;

-- 2- Récupérer dans une colonne Actor_Name le full_name des acteurs 
-- sous le format: first_name + " " + last_name
SELECT actor_id, CONCAT(first_name, ' ', last_name) 
AS Actor_Name
FROM actor;

SELECT CONCAT_WS(" ", first_name, last_name) 
AS Actor_Name 
from actor ;

-- 3- Récupérer dans une colonne Actor_Name 
-- le full_name des acteurs sous le format:
-- first_name en minuscule + "." + last_name en majuscule
SELECT actor_id, CONCAT(LOWER(first_name), '.', UPPER(last_name)) 
AS Actor_Name
FROM actor;

-- 4- Récupérer dans une colonne Actor_Name 
-- le full_name des acteurs sous le format: 
-- last_name en majuscule + "." + premiere lettre du first_name en majuscule
SELECT  actor_id, 
CONCAT(UPPER(last_name), '.', 
UPPER(LEFT(first_name, 1)), 
LOWER(SUBSTRING(first_name, 2))) 
AS Actor_Name 
FROM actor;

SELECT  actor_id, 
CONCAT(UPPER(last_name), '.', 
CONCAT(UPPER(LEFT(first_name, 1)), 
LOWER(SUBSTRING(first_name, 2)))) 
AS Actor_Name 
FROM actor;

SELECT 
    actor_id, 
    CONCAT(UPPER(last_name), '.', 
           CONCAT(UPPER(LEFT(first_name, 1)), 
                  LOWER(SUBSTRING(first_name, 2)))) 
    AS Actor_Name 
FROM actor;

-- 5- Trouver le ou les acteurs appelé(s) "JENNIFER"
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'JENNIFER';

-- 6- Trouver les acteurs ayant des prénoms de 3 charactères.
SELECT actor_id, 
CONCAT(first_name, ' ', last_name) 
AS Actor_Name
FROM actor
WHERE LENGTH(first_name) = 3;

-- 7- Afficher les acteurs 
-- (actor_id, first_name, last_name, nbre char first_name, nbre char last_name )
-- par ordre décroissant de longueur de prénoms
SELECT 
    actor_id, 
    first_name, 
    last_name, 
    LENGTH(first_name) AS first_name_length, 
    LENGTH(last_name) AS last_name_length, 
    CONCAT(first_name, ' ', last_name) AS Actor_Name
FROM actor
ORDER BY LENGTH(first_name) DESC;

-- 8- Afficher les acteurs 
-- (actor_id, first_name, last_name, nbre char first_name, nbre char last_name )
-- par ordre décroissant de longueur de prénoms et croissant de longuer de noms
SELECT 
    actor_id, 
    first_name, 
    last_name, 
    LENGTH(first_name) AS first_name_length, 
    LENGTH(last_name) AS last_name_length, 
    CONCAT(first_name, ' ', last_name) AS Actor_Name
FROM actor
ORDER BY LENGTH(first_name) DESC, LENGTH(last_name) ASC;

-- 9- Trouver les acteurs ayant dans leurs last_names la chaine: "SON
SELECT actor_id, first_name, last_name, 
CONCAT(first_name, ' ', last_name) 
AS Actor_Name
FROM actor
WHERE last_name LIKE '%SON%';

-- 10- Trouver les acteurs ayant des last_names commençant par la chaine: "JOH"
SELECT actor_id, first_name, last_name, 
CONCAT(first_name, ' ', last_name) 
AS Actor_Name
FROM actor
WHERE last_name LIKE 'JOH%';

-- 11- Afficher par ordre alphabétique croissant 
-- les last_names et les first_names des acteurs 
-- ayant dans leurs last_names la chaine "LI"
SELECT actor_id, first_name, last_name, 
CONCAT(first_name, ' ', last_name) 
AS Actor_Name
FROM actor
WHERE last_name LIKE '%LI%'
ORDER BY last_name, first_name;

-- 12- trouver dans la table country les countries "China", "Afghanistan", "Bangladesh"
SELECT country_id, country
FROM country
WHERE country IN ('China', 'Afghanistan', 'Bangladesh');

-- 13- Ajouter une colonne middle_name entre les colonnes first_name et last_name
ALTER TABLE actor
ADD COLUMN middle_name VARCHAR(50) AFTER first_name;

-- 14- Changer le data type de la colonne middle_name au type blobs
ALTER TABLE actor
MODIFY COLUMN middle_name BLOB;

-- check 
DESCRIBE actor;
-- check type column
SHOW COLUMNS FROM actor;

-- 15- Supprimer la colonne middle_name
ALTER TABLE actor
DROP COLUMN middle_name;

-- 16- Trouver le nombre des acteurs ayant le meme last_name Afficher le resultat par ordre
-- décroissant
SELECT last_name, COUNT(*) AS name_count
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1
ORDER BY name_count DESC;

-- 17- Trouver le nombre des acteurs ayant le meme last_name Afficher UNIQUEMENT les
-- last_names communs à au moins 3 acteurs Afficher par ordre alph. croissant
SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 2
ORDER BY last_name ASC;

-- 18- Trouver le nombre des acteurs ayant le meme first_name 
-- Afficher le resultat par ordre alph. croissant
SELECT first_name, COUNT(first_name) AS name_count
FROM actor
GROUP BY first_name
HAVING COUNT(first_name) > 1
ORDER BY first_name ASC;

-- 19- Insérer dans la table actor ,un nouvel acteur , faites attention à l'id!
INSERT INTO actor (actor_id, first_name, last_name) 
VALUES ('201', 'new_actor', 'New Actor');

INSERT INTO actor (first_name, last_name) 
VALUES ('second_new_actor', 'New Actor');

-- 20- Modifier le first_name du nouvel acteur à "Jean"
UPDATE actor
SET first_name = 'Jean'
WHERE actor_id = 201;

-- 21- Supprimer le dernier acteur inséré de la table actor
DELETE FROM actor
WHERE actor_id IN (201, 202);

-- 22- Corriger le first_name de l'acteur HARPO WILLIAMS 
-- qui était accidentellement inséré à GROUCHO WILLIAMS

UPDATE actor
SET first_name = 'HARPO'
WHERE last_name = 'WILLIAMS' AND first_name = 'GROUCHO';

-- check table
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'HARPO' AND last_name = 'WILLIAMS';

SELECT REPLACE('GROUCHO WILLIAMS','GROUCHO','HARPO');

-- 23- Mettre à jour le first_name dans la table actor 
-- pour l'actor_id 173 comme suit: si le first_name ="ALAN" 
-- alors remplacer le par "ALLAN" sinon par "MUCHO ALLAN"

-- check table
SELECT first_name
FROM actor
WHERE actor_id = '173';

-- la requête
UPDATE actor
SET first_name = 'ALLAN'
WHERE actor_id = 173 ;

-- check table
SELECT first_name
FROM actor
WHERE actor_id = '173';

	UPDATE actor
		SET first_name = 
			CASE 
				WHEN first_name = 'ALAN' THEN 'ALLAN'
				ELSE 'MUCHO ALLAN'
			END
				WHERE actor_id = 173;

UPDATE actor
SET first_name = IF(first_name="ALAN","ALLAN","MUCHO ALLAN") WHERE actor_id = 173;

	-- UPDATE actor SET first_name=
		-- case 
			-- WHEN first_name = 'ALAN'
			-- THEN 'ALLAN'
			-- ELSE 'MUCHO ALLAN'
		-- END
		-- WHERE actor_id =173;

-- 24- Trouver les first_names,last names et l'adresse de chacun des membre staff RQ: 
-- utiliser join avec les tables staff & address:
--  first_name last_name address 
-- address : 0 Mike Hillyer 23 Workhaven Lane
-- address : 1 Jon Stephens 1411 Lillydale Drive
SELECT s.first_name, s.last_name, a.address
FROM staff s
JOIN address a
ON s.address_id = a.address_id;


SELECT first_name, last_name,address 
FROM staff as st
JOIN address ad on st.address_id=ad.address_id;

SELECT first_name, last_name,address 
FROM staff as st
JOIN address ad USING(address_id); 

-- 25- Afficher pour chaque membre du staff ,
-- le total de ses salaires depuis Aout 2005. 
-- RQ: Utiliser les tables staff & payment.
SELECT s.staff_id, s.first_name, s.last_name, SUM(p.amount) AS total_salary
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
WHERE p.payment_date >= '2005-08-01'
GROUP BY s.staff_id, s.first_name, s.last_name; 


-- 26- Afficher pour chaque film ,le nombre de ses acteurs
SELECT f.film_id, f.title, COUNT(fa.actor_id) AS actor_count
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.film_id, f.title
ORDER BY COUNT(actor_id) DESC;

-- 27- Trouver le film intitulé "Hunchback Impossible"
-- Out[66]: film_id 0 439
SELECT film_id  
FROM film f 
WHERE film_id = 439;

-- 28- combien de copies exist t il 
-- dans le systme d'inventaire pour le film Hunchback Impossible
select count(inventory.film_id) 
as "nombre de copies de Hunchback Impossible" 
from inventory 
join film 
on inventory.film_id = film.film_id 
where title = "Hunchback Impossible";

-- 29- Afficher les titres des films en anglais commençant par 'K' ou 'Q'
SELECT title FROM film
WHERE (title LIKE 'k%'
OR title LIKE 'Q%')
AND language_id=1;

	
SELECT title FROM film
WHERE (title LIKE 'k%'
OR title LIKE 'Q%')
AND language_id= (SELECT language_id FROM language WHERE name='english');


SELECT title,language.name 
FROM film INNER JOIN language 
on film.language_id=language.language_id
WHERE title LIKE 'k%'
OR title LIKE 'Q%'
AND language.name='english';

-- 30- Afficher les first et last names des acteurs 
-- qui ont participé au film intitulé 'ACADEMY DINOSAUR'
SELECT a.actor_id, a.first_name, a.last_name
FROM film_actor fa
INNER JOIN actor a ON fa.actor_id = a.actor_id
INNER JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'ACADEMY DINOSAUR';


SELECT actor.actor_id, actor.first_name, actor.last_name, film.title 
FROM film JOIN film_actor ON film.film_id = film_actor.film_id JOIN actor 
ON actor.actor_id = film_actor.actor_id WHERE film.title = 'ACADEMY DINOSAUR';


SELECT 
    a.actor_id, first_name, last_name
FROM
    actor a
        INNER JOIN
    film_actor f ON a.actor_id = f.actor_id
WHERE
    film_id IN (SELECT 
            film_id
        FROM
            film
        WHERE
title = 'ACADEMY DINOSAUR');


-- 31- Trouver la liste des film catégorisés comme family films.

-- check 
SELECT category_id
FROM category
WHERE name = 'Family';

-- requête 
SELECT f.film_id, f.title 
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON c.category_id = fc.category_id
WHERE c.category_id = 8;


-- 32- Afficher le top 5 des films les plus loués par ordre decroissant
SELECT f.film_id, f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
ORDER BY rental_count DESC
LIMIT 5;


SELECT film.title, COUNT(rental.inventory_id) AS Count_of_Rented_Movies
 FROM film 
 JOIN inventory ON film.film_id = inventory.film_id 
 JOIN rental ON inventory.inventory_id = rental.inventory_id 
 GROUP BY film.film_id 
 ORDER BY 2 DESC LIMIT 5;


-- 33- Afficher la liste des stores : store ID, city, country
SELECT s.store_id, c.city, co.country
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
JOIN country co ON c.country_id = co.country_id;


-- 34- Afficher le chiffre d'affaire par store. 
-- RQ: le chiffre d'affaire = somme (amount)
select store.store_id, sum(amount) 
from store 
join staff 
on store.store_id = staff.store_id 
join payment 
on staff.staff_id = payment.staff_id 
group by store.store_id 
order by sum(amount) desc; 


-- 35- Lister par ordre décroissant le top 5 des catégories ayant le plus des revenues. 
-- RQ utiliser les tables : category, film_category, inventory, payment, et rental.
SELECT c.category_id, c.name, SUM(p.amount) AS total_revenue
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN inventory i ON fc.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.category_id, c.name
ORDER BY total_revenue DESC
LIMIT 5;


select category.name, sum(amount) 
from category 
join film_category on category.category_id = film_category.category_id 
join film on film_category.film_id = film.film_id 
join inventory on film.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
join payment on rental.rental_id = payment.rental_id
group by category.name
order by sum(amount) desc limit 5;


-- 36- Créer une view top_five_genres avec les résultat de la requete precedante.
CREATE VIEW top_five_genres AS
SELECT c.category_id, c.name, SUM(p.amount) AS total_revenue
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN inventory i ON fc.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.category_id, c.name
ORDER BY total_revenue DESC
LIMIT 5;


-- 37- Supprimer la table top_five_genres
DROP VIEW IF EXISTS top_five_genres;




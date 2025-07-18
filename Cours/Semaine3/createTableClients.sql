create database tp1;

USE tp1 ;

-- Creation de la table
CREATE TABLE clients(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(50),
prenom VARCHAR(50),
age INT
);

-- DESCRIBE clients;
-- SELECT * FROM tp1.clients;
-- Drop table pour reconstruire la structure de la table clients
-- Drop table clients; 

-- ALTER TABLE clients AUTO_INCREMENT = 10;


-- Insertion desenregistrements
insert into clients(nom,prenom ,age) values('toto', 'tata', 18);
insert into clients(nom,prenom ,age) values('toto1', 'tata1', 20);
insert into clients(nom,prenom ,age) values('toto2', 'tata2', 22);

-- Update (maj) desenregistrements
update clients  
set 
	nom='toto3', 
	prenom='tata3', 
	age=23
where id= 3;


SELECT * FROM tp1.clients;


-- DELETE  FROM

DELETE FROM clients WHERE id = 3;


insert into clients(nom,prenom ,age) values('toto4', 'tata4', 44);
 

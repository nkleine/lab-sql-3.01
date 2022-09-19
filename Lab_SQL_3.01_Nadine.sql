-- Lab 3.01 
USE sakila;
-- Activity 1

-- Task 1: Drop column picture from staff.
ALTER TABLE staff
DROP COLUMN picture;

SELECT * FROM staff;

-- Task 2: A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

SELECT * FROM customer
WHERE last_name='SANDERS';

INSERT INTO staff(first_name, last_name, address_id, email, store_id, active, username) 
VALUES
('TAMMY','SANDERS', 79, 'TAMMY.SANDERS@sakilacustomer.org', 2, 1, 'TAMMY');

SELECT * FROM staff;

-- Task 3: Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. 
-- Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. 
-- For eg., you would notice that you need customer_id information as well. To get that you can use the following query: 
-- select customer_id from sakila.customer where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

SELECT * FROM rental;
SELECT * FROM customer;
SELECT * FROM staff;
SELECT * FROM film;

INSERT INTO rental (rental_date, inventory_id, customer_id, return_date, staff_id)
SELECT CURDATE() AS 'rental date', i.inventory_id, c.customer_id, CURDATE() + f.rental_duration AS 'return_date', s.staff_id
FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN staff s ON s.store_id = s.store_id
INNER JOIN customer c ON c.store_id = s.store_id
WHERE title = 'Academy Dinosaur' AND c.first_name = 'CHARLOTTE' and c.last_name = 'HUNTER'
LIMIT 1;

SELECT * FROM rental;

-- Activity 2:
-- Task 1: Use dbdiagram.io or draw.io to propose a new structure for the Sakila database.

-- Link to the new structure: https://drive.google.com/file/d/1b1vUfbnSitPWqnelhBlnOOgbl5sCbBTC/view?usp=sharing

-- Task 2: Define primary keys and foreign keys for the new database.

-- Ideas to clean up the diagram:
-- a) combine tstaff & store
-- b) combine address, city & contry
-- c) combine rental & payment
-- d) combine actor & film_actor
-- e) bring film_category, category & language into film

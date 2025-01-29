/* Database Review 2
JOINS
1. Obtener los clientes y las películas que han alquilado. */

USE sakila;

SELECT c.first_name, c.last_name, f.title
FROM customer c 
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON  i.film_id = f.film_id
order by c.last_name;


-- 2. Obtener los actores y las películas en las que han actuado.
SELECT a.first_name, a.last_name, f.title
FROM film f
LEFT JOIN film_actor fa ON f.film_id = fa.film_id
LEFT JOIN actor a ON a.actor_id = fa.actor_id
ORDER BY f.title;


-- 3. Obtener todas las películas y, si están disponibles en inventario, mostrar la cantidad disponible.

SELECT f.title, COUNT(i.film_id) as CantidadDisponible
FROM film f
LEFT JOIN inventory i ON i.film_id = f.film_id
GROUP BY f.title;


-- 4. Obtener todos los clientes y mostrar la cantidad de alquileres que han realizado, incluso si no han realizado ningún alquiler.

SELECT c.customer_id, COUNT(r.rental_id) as CantidadAlquileres
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id;

-- 5. Obtener todas las películas y mostrar los actores que han actuado en ellas, incluso si algunas películas no tienen actores asociados.

SELECT f.title, a.first_name, a.last_name
FROM film f
LEFT JOIN film_actor fa ON f.film_id = fa.film_id
LEFT JOIN actor a ON a.actor_id = fa.actor_id
ORDER BY a.last_name;

-- 6. Obtener todos los actores y mostrar las películas en las que han actuado, incluso si algunos actores no han actuado en ninguna película.

SELECT a.first_name, a.last_name, f.title
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN film f ON f.film_id = fa.film_id
ORDER BY a.last_name;

-- Ejercicios like, not like y regexp --

-- 1. Encuentra todas las películas que comienzan con la letra "A" en su título.
SELECT title
FROM film
WHERE title LIKE 'A%';

-- 2. Encuentra todas las películas que tienen al menos una vocal en su título.

SELECT title
FROM film
WHERE title REGEXP '[aeiouAEIOU]';

-- 3. Encuentra todas las películas que tienen una longitud de título de al menos 10 caracteres.

SELECT title
FROM film
WHERE title LIKE '__________%';

-- 4. Encuentra todas las películas cuyo título contiene la palabra "The."

SELECT title
FROM film
WHERE title LIKE '% the %'
   OR title LIKE 'the %'
   OR title LIKE '% the'
   OR title = 'the';


SELECT title
FROM film
WHERE title REGEXP '\\bthe\\b';

-- 5 Encuentra todas las películas cuyo título comienza con la letra "S."
SELECT title
FROM film
WHERE title LIKE 'S%';

-- Ejercicios union--
-- 1. Encuentra todos los actores cuyos nombres comienzan con la letra "A" en la tabla actor, y encuentra todos los clientes cuyos nombres comienzan con la letra "B" en la tabla customer. 
-- Combina ambos conjuntos de resultados en una sola tabla.

SELECT a.first_name as nombre, a.last_name
FROM actor a
WHERE a.first_name LIKE 'A%'
UNION
SELECT c.first_name as nombre, c.last_name
FROM customer c
WHERE c.first_name LIKE 'B%';

-- 2. Encuentra todas las películas cuyos títulos contienen la palabra "Comedy" en la tabla film, y encuentra todas las películas cuyo título comienza con la letra "D" en la misma tabla. 
-- Combina ambos conjuntos de resultados en una sola lista de películas.

SELECT title
FROM film
WHERE title LIKE '%Comedy%'
UNION
SELECT title
FROM film
WHERE title LIKE 'D%';

-- Ejercicios subqueries y queries complejas--

-- 1. Encuentra el nombre y apellido de los actores que han actuado en películas que se alquilaron después de que la película "ACADEMY DINOSAUR" se alquilara por primera vez. 
-- Ordena los resultados alfabéticamente por apellido.
SELECT DISTINCT a.first_name, a.last_name
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON f.film_id = fa.film_id
WHERE f.title IN (SELECT DISTINCT f.title
	FROM rental r
	INNER JOIN inventory i ON r.inventory_id = i.inventory_id
	INNER JOIN film f ON i.film_id = f.film_id
	WHERE r.rental_date > (SELECT MIN(r.rental_date) AS EarliestRental
		FROM rental r
		INNER JOIN inventory i ON r.inventory_id = i.inventory_id
		INNER JOIN film f ON i.film_id = f.film_id
		WHERE f.title = 'ACADEMY DINOSAUR'))
ORDER BY a.last_name;


-- 2. Encuentra el título de las películas que han sido alquiladas por el cliente con el nombre "MARY SMITH" y que aún no se han devuelto. 
-- Ordena los resultados alfabéticamente por título de película.

SELECT DISTINCT f.title
FROM film f
LEFT JOIN inventory i ON i.film_id = f.film_id
LEFT JOIN rental r ON r.inventory_id = i.inventory_id
WHERE r.return_date IS NULL AND
 r.rental_id IN (SELECT rental_id
	FROM rental
	WHERE customer_id = (SELECT customer_id
		FROM customer
		WHERE first_name = 'Mary' AND last_name = 'Smith'))
ORDER BY f.title ASC;

-- 3. Encuentra los nombres de los clientes que han alquilado al menos 5 películas distintas. 
-- Ordena los resultados alfabéticamente por apellido.

SELECT c.first_name, c.last_name
FROM customer c
WHERE c.customer_id IN (SELECT r.customer_id
	FROM film f
	LEFT JOIN inventory i ON i.film_id = f.film_id
	LEFT JOIN rental r ON r.inventory_id = i.inventory_id
	GROUP BY r.customer_id
	HAVING COUNT(DISTINCT f.title) >= 5);

-- REMOVED: COUNT(DISTINCT f.title) as NumMovieTitles




 
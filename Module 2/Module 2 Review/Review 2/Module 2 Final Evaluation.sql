USE sakila;

-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.
SELECT DISTINCT title
FROM film
ORDER BY title;

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
SELECT title, rating
FROM film
WHERE rating = 'PG-13';

/* 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su
descripción. */
SELECT title, description
FROM film
WHERE description like '%amazing%';

-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
SELECT title, length
FROM film
WHERE length > 120;

-- 5. Recupera los nombres de todos los actores.
SELECT first_name, last_name
FROM actor
ORDER BY last_name;

-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
SELECT first_name, last_name
FROM actor
WHERE last_name like '%gibson%';

-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
SELECT first_name, last_name, actor_id
FROM actor
WHERE actor_id BETWEEN 10 AND 20;

 /* 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su
clasificación. */
SELECT title, rating
FROM film
WHERE rating NOT IN ('R', 'PG-13');

/* 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la
clasificación junto con el recuento.*/
SELECT  rating, COUNT(title) 
FROM film
GROUP BY rating;

/* 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su
nombre y apellido junto con la cantidad de películas alquiladas..*/
SELECT r.customer_id, first_name, last_name, COUNT(r.rental_id) as CantidadPelisAlquiladas
FROM rental r
INNER JOIN customer c ON r.customer_id = c.customer_id
GROUP BY r.customer_id;

/* 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría
junto con el recuento de alquileres.*/
SELECT c.name, COUNT(r.inventory_id)
FROM category c
INNER JOIN film_category fc ON c.category_id = fc.category_id
INNER JOIN inventory i ON fc.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name;


/* 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y
muestra la clasificación junto con el promedio de duración. */
SELECT rating, AVG(length) as PromedioDuracion
FROM film 
GROUP BY rating;

-- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love". 
SELECT a.first_name as Nombre, a.last_name as Apellido
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON fa.film_id =f.film_id
WHERE title = "Indian Love";

-- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción. 
SELECT title, description
FROM film
WHERE description LIKE '%dog%' OR description REGEXP '%cat%';

-- 15. Hay algún actor o actriz que no aparezca en ninguna película en la tabla film_actor?
SELECT a.last_name, a.first_name
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE fa.film_id IS NULL;

-- 16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
SELECT title, release_year
FROM film
WHERE release_year BETWEEN 2005 AND 2010;

-- 17. Encuentra el título de todas las películas que son de la misma categoría que "Family".
SELECT f.title, c.name
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE c.name = "Family";

-- 18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.
SELECT a.first_name as Nombre, a.last_name as Apellido, COUNT(fa.film_id) as NumPelis
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
HAVING NumPelis > 10;

/* 19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la
tabla film.*/

SELECT title, length, rating
FROM film 
WHERE length > 120 AND rating = 'R';

/* 20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y
muestra el nombre de la categoría junto con el promedio de duración. */
SELECT c.name as Categoria, AVG(f.length) as PromedioDuracion
FROM category c
INNER JOIN film_category fc ON c.category_id = fc.category_id
INNER JOIN film f ON f.film_id = fc.film_id
GROUP BY c.name
HAVING PromedioDuracion > 120;

/* 21. Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto
con la cantidad de películas en las que han actuado.*/
SELECT a.first_name as Nombre, a.last_name as Apellido, COUNT(fa.film_id) as NumPelis
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
HAVING NumPelis > 5;

/* 22. Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una
subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego selecciona las
películas correspondientes. */

SELECT DISTINCT f.title
FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON r.inventory_id = i.inventory_id
WHERE r.rental_id IN (SELECT r2.rental_id
	FROM rental r2
	WHERE DATEDIFF(r2.return_date, r2.rental_date) > 5);
    
/* 23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría
"Horror". Utiliza una subconsulta para encontrar los actores que han actuado en películas de la
categoría "Horror" y luego exclúyelos de la lista de actores. */

SELECT a.first_name, a.last_name
FROM actor a
WHERE a.actor_id NOT IN (SELECT a2.actor_id
	FROM actor a2
	INNER JOIN film_actor fa ON a2.actor_id = fa.actor_id
	INNER JOIN film f ON fa.film_id = f.film_id
	INNER JOIN film_category fc ON fc.film_id = f.film_id
	INNER JOIN category c ON c.category_id = fc.category_id
	WHERE c.name = 'Horror');


/* 24. Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en
la tabla film. */

SELECT f.title, f.length, c.name 
FROM film f 
INNER JOIN film_category fc ON fc.film_id = f.film_id
INNER JOIN category c ON c.category_id = fc.category_id
WHERE length > 180 AND c.name = 'Comedy';

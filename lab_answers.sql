-- Determina la película más larga y más corta y llama a los nuevos valores max_duration y min_duration

SELECT MAX(length) AS max_duration, MIN(length) AS min_duration
FROM sakila.film;

	-- la de máxima duración es 185 minutos
    -- la de mínima duración es 46 minutos
    
-- Expresa la duración media de las películas en horas y minutos sin decimales
SELECT (ROUND(AVG(length)/60)) AS hours, (ROUND(AVG(length) MOD 60)) AS minutes
FROM sakila.film;

	-- 2 horas y 55 minutos

-- Calcula el número de días que la compañía ha operado

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating_time
FROM sakila.rental;

	-- 266 días
    
-- Extrae la información del rental y 2 columnas adicionales que muestren el mes y el día de la semana del rental. Devuelve 20 filas.
SELECT *, DATE_FORMAT(rental_date, '%M') AS month, DATE_FORMAT(rental_date, '%W') AS day    
FROM sakila.rental;

-- Extrae la información del rental y añade una columna más que se llame DAY_TYPE con valores 'weekend' o 'workday'
SELECT *,
CASE 
	WHEN DATE_FORMAT(rental_date, '%W') IN ('Saturday', 'Sunday')
	THEN 'weekend'
	ELSE 'workday' 
END AS day_type
FROM sakila.rental;

-- Extrae los títulos y duración y añade 'Not available' si hay valores nulos
SELECT title, IFNULL(rental_duration, "Not available") AS rental_duration
FROM sakila.film
ORDER BY title ASC;

-- Extrae el nombre y apellido de los clientes y los 3 primeros caracteres de su email ordenado por apellido en ascendente
SELECT CONCAT(first_name, " ", last_name) AS full_name, SUBSTRING(email, 1, 3) AS email_prefix
FROM sakila.customer
ORDER BY last_name ASC;

-- 4.
SELECT CONCAT(first_name, ' ', last_name) as full_name, SUBSTRING(email, 1, 3) as email_prefix
FROM customer
ORDER BY last_name ASC;

-- 1. número total de películas
SELECT COUNT(*) AS 'num_films' FROM film;

-- 1.2. número de películas para cada rating
SELECT rating, COUNT(*) AS 'num_films' FROM film
GROUP BY rating;

-- 1.3 número de películas para cada rating ordenándolo
SELECT rating, COUNT(*) AS 'num_films' FROM film
GROUP BY rating
ORDER BY num_films DESC;

-- 2. La duración media de cada renting
SELECT rating, ROUND(AVG(length),2) AS 'avg_length' FROM film
GROUP BY rating
ORDER BY avg_length DESC;

-- 2.2 qué ratings tienen una duración superior a las dos horas
SELECT rating, ROUND(AVG(length),2) AS avg_duration FROM film
GROUP BY rating
HAVING avg_duration > 120
ORDER BY avg_duration DESC;

-- 3. 
SELECT last_name FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;







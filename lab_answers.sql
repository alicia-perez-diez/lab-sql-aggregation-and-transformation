-- Determina la película más larga y más corta y llama a los nuevos valores max_duration y min_duration
SELECT
	title, 
	length AS max_duration
FROM sakila.film
ORDER BY length desc
LIMIT 1;

SELECT
	title, 
	length AS min_duration
FROM sakila.film
ORDER BY length asc
LIMIT 1;

	-- la de máxima duración es CHICAGO NORTH con 185 minutos
    -- la de mínima duración es ALIEN CENTER con 46 minutos
    
-- Expresa la duración media de las películas en horas y minutos sin decimales
SELECT 
	CONCAT(
		FLOOR(AVG(length)/60),
        ' hours ',
        FLOOR(AVG(length) MOD 60),
        ' minutes '
	) AS avg_length
FROM sakila.film;

	-- 1 hora y 55 minutos

-- Calcula el número de días que la compañía ha operado

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating_time
FROM sakila.rental;

	-- 266 días
    
-- Extrae la información del rental y 2 columnas adicionales que muestren el mes y el día de la semana del rental. Devuelve 20 filas.
SELECT
    DATE_FORMAT(CONVERT(rental_date, DATE), '%M' AS 'month',
FROM sakila.rental;
    
    
    





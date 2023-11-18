-- 1. Get the first_name from actors table
SELECT first_name FROM actors;

-- 2. Get first_name, last_name from actors table
SELECT first_name, last_name FROM actors;

-- 3. Get movie_names, movie_language from moves
SELECT movie_name, movie_language FROM movies;


-- Adding alias to a column name
-- Often, the technical name is different from the common
-- language of the business.

-- 1. View all the records from the 'actors' table.
SELECT * FROM actors;

-- 2. Make an alias for first_name as firstName 
-- Quote the alias to return it exactly as it has been typed
-- *If there is mixed casing or symbols in the alias, it must 
-- be in double quotes

-- The AS keyboard is optional but it can improve readability.
SELECT first_name AS "firstName" 
FROM actors;

SELECT first_name as "First Name"
FROM actors;

SELECT 
	movie_name AS "Movie Name",
	movie_language AS "Movie Language"
FROM movies;

-- Assign column alias to an expression

-- 1. View these columns from 'actors'.
SELECT first_name, last_name FROM actors;

-- 2. Let's use the || operator to concatename columns
-- and return that column as "Full Name".
SELECT 
	first_name || ' ' || last_name AS "Full Name"
FROM actors;


-- 3. The SELECT statement can be used for expressions
SELECT 4*2;
SELECT 'Abraham' || ' ' || 'Briones';

















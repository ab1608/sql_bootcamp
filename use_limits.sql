-- Use LIMIT to limit the number of records in the result.
/*
SELECT column(s)
FROM table_name
LIMIT number
*/

-- 1. Get the top 5 biggest movie by length
SELECT *
FROM movies
ORDER BY movie_name
LIMIT 5;

-- 2. Get the 5 oldest American directors
SELECT *
FROM directors
WHERE
    nationality = 'American'
ORDER BY date_of_birth
LIMIT 5;

-- 3. Get the top 10 youngest female actors
SELECT *
FROM actors
WHERE
    gender = 'F'
ORDER BY date_of_birth DESC
LIMIT 10;

-- 4. Get the top 10 domestic movies
SELECT *
FROM movies_revenues
ORDER BY revenues_domestic DESC NULLS LAST;

-- Using OFFSET
-- LIMIT number OFFSET fromnumber

-- 6. List 5 films starting from the fourth film order by id
SELECT *
FROM movies
ORDER BY movie_id
-- This will begin the query at the fourth record
OFFSET 4
LIMIT 5;

-- 7. List the next top 5 movies by domestic revenue
SELECT *
FROM movies_revenues
ORDER BY revenues_domestic DESC NULLS LAST
OFFSET 5
LIMIT 5;


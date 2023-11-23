-- Using FETCH
/*
 FETCH clause to retrieve a portion of rows returned by a query
 FETCH clause is functionally the same as LIMIT.
 FETCH is standard is SQL.

 OFFSET start { ROW | ROWS }
 FETCH { FIRST | NEXT } [ row_count ] (ROW | ROWS) ONLY

 The OFFSET start is an integer that must be zero or positive. By default, 0.
 If start is greater than the number of rows in the db, no results are returned.
 */

-- 1. Get the first row of the movie table
SELECT *
FROM movies
LIMIT 1;

-- Is the same as this using FETCH:
SELECT *
FROM movies
FETCH FIRST ROW ONLY;

-- 2. Get the top 5 longest movies
SELECT *
FROM movies
ORDER BY movie_length DESC
FETCH FIRST 5 ROWS ONLY;

-- 3. Get the 5 oldest American directors
SELECT *
FROM directors
WHERE nationality = 'American'
ORDER BY date_of_birth
FETCH FIRST 5 ROWS ONLY;


-- 4. Get the next top 5 longest movies
SELECT *
FROM movies
ORDER BY movie_length DESC
OFFSET 5
FETCH FIRST 5 ROWS ONLY;


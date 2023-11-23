-- Three types of Operators

/*
 Operators are special keywords used in conjunction with SQL clauses to:
 1. Compare the values of fields
 2. Select subsets of fields
 3. Perform arithmetic operations

 Types of Operators:
 1. COMPARISON
 - Equal to : =
 - Greater Than : >
 - Less Than: <
 - Greater Than or Equal To : >=
 - Less Than or Equal To: <=
 - Not Equal To: <> , !=

 2. LOGICAL
 - AND
 - OR
 - LIKE
 - IN
 - BETWEEN

 3. ARITHMETIC
 -- Add : +
 -- Subtract : -
 -- Division : /
 -- Multiply: *
 -- Modulo: %
 */

/*
 Using the WHERE clause

 WHERE clause allows us to filter the data by passing criteria that the
 data must meet.
 The WHERE clause is often used with Operators.

 SELECT column_list
 FROM table_name
 WHERE condition(s);
 */

-- Using WHERE with a single TEXT condition
-- Note, pass the text value(s) to match with single quotes.

-- 1. Get movie_name that are in English
SELECT
    movie_name
FROM movies
WHERE movie_language = 'English';

-- 2. Get movie_name that are in English OR Chinese
-- Note the 'OR' operator.
SELECT
    movie_name
FROM movies
WHERE movie_language = 'English' OR movie_language = 'Chinese';

-- Get movies in Japanese that have an age_certification of 18
SELECT
    movie_name,
    age_certification
FROM movies
WHERE
    movie_language = 'Japanese'
    AND age_certification = '18';

-- 4. Combine AND and OR operators
-- Note: Put parenthesis when using multiple operators
-- in this case, it is needed so that Postgres filters the English/Chinese
-- movies fro age = 12
SELECT * FROM movies
WHERE
    (movie_language = 'English' OR movie_language = 'Chinese')
    AND age_certification = '12'
ORDER BY movie_language DESC;

-- 5. Alias cannot be used with WHERE clauses
SELECT
    first_name,
    last_name AS l_name
FROM actors
WHERE last_name = 'Allen';
-- This query will return an error
SELECT
    first_name,
    last_name AS l_name
FROM actors
WHERE l_name = 'Allen';

-- Use LOGICAL operators
SELECT * FROM movies
WHERE movie_length > 104
ORDER BY movie_length;

SELECT * FROM movies
WHERE movie_length <= 104
ORDER BY movie_length;

-- Work with DATES
-- The date format is important i.e. YYYY-MM-DD or DD-MM-YYYY
-- release_date is of the format YYYY-MM-DD
-- Note: Pass the matching date value(s) with single quotes

SELECT movie_name,
       release_date
FROM movies
WHERE
    release_date >= '2000-01-01'
ORDER BY release_date;


-- Get movies that are NOT in English and length is greater than 100
SELECT movie_name
FROM movies
WHERE movie_language <> 'English' AND movie_length >= 100;




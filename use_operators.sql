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
SELECT movie_name
FROM movies
WHERE movie_language = 'English';

-- 2. Get movie_name that are in English OR Chinese
-- Note the 'OR' operator.
SELECT movie_name
FROM movies
WHERE movie_language = 'English'
   OR movie_language = 'Chinese';

-- Get movies in Japanese that have an age_certification of 18
SELECT movie_name,
       age_certification
FROM movies
WHERE movie_language = 'Japanese'
  AND age_certification = '18';

-- 4. Combine AND and OR operators
-- Note: Put parenthesis when using multiple operators
-- in this case, it is needed so that Postgres filters the English/Chinese
-- movies fro age = 12
SELECT *
FROM movies
WHERE (movie_language = 'English' OR movie_language = 'Chinese')
  AND age_certification = '12'
ORDER BY movie_language DESC;

-- 5. Alias cannot be used with WHERE clauses
SELECT first_name,
       last_name AS l_name
FROM actors
WHERE last_name = 'Allen';
-- This query will return an error
SELECT first_name,
       last_name AS l_name
FROM actors
WHERE l_name = 'Allen';

-- Use LOGICAL operators
SELECT *
FROM movies
WHERE movie_length > 104
ORDER BY movie_length;

SELECT *
FROM movies
WHERE movie_length <= 104
ORDER BY movie_length;

-- Work with DATES
-- The date format is important i.e. YYYY-MM-DD or DD-MM-YYYY
-- release_date is of the format YYYY-MM-DD
-- Note: Pass the matching date value(s) with single quotes

SELECT movie_name,
       release_date
FROM movies
WHERE release_date >= '2000-01-01'
ORDER BY release_date;


-- Get movies that are NOT in English and length is greater than 100
SELECT movie_name
FROM movies
WHERE movie_language <> 'English'
  AND movie_length >= 100;


-- Using IN or NOT IN
/*
 IN and NOT IN are used to check if a value matches values in a list

 VALUE IN | VALUE NOT IN (val1, val2)
 */

-- 1. Get all moves for English, Chinese and Japanese
-- First, get with WHERE clause
SELECT *
FROM movies
WHERE movie_language = 'English'
   OR movie_language = 'Chinese'
   OR movie_language = 'Japanese'
ORDER BY movie_language;

-- Now, with IN
SELECT *
FROM movies
WHERE movie_language IN ('English', 'Chinese', 'Japanese')
ORDER BY movie_language;


-- 2. Get all movies that are rated for 12 and PG
SELECT *
FROM movies
WHERE age_certification IN ('12', 'PG')
ORDER BY age_certification;

-- 3. Get all movies where director_id is not 13 or 10
SELECT *
FROM movies
WHERE director_id NOT IN (13, 10)
ORDER BY director_id;

-- Using BETWEEN low_value AND high_value
-- The low and high values are inclusive.

-- 1. Get actors born between two dates
SELECT *
FROM actors
WHERE date_of_birth BETWEEN '1991-01-01' AND '1995-12-31'
ORDER BY date_of_birth;

-- 2. Same example with only date col
SELECT release_date
FROM movies
WHERE release_date BETWEEN '2000-01-01' AND '2008-12-31';

-- 3. Get movies where domestic revenues between 100 and 300
SELECT *
FROM movies_revenues
WHERE revenues_domestic BETWEEN 102.10 AND 300
ORDER BY revenues_domestic;

-- 4. Get movies that are not of length 100 to 200
SELECT *
FROM movies
WHERE movie_length NOT BETWEEN 100 AND 200
ORDER BY movie_length;

-- Using LIKE and NOT LIKE
/*
 value LIKE {pattern} CASE SENSITIVE
 Used these clauses to query data using 'pattern matching'
 Search for string patterns using these two special characters:
% : Percent sign matches any sequence of zero or more characters
_ : Underscores match any single character


 If we need case-insensitive search, we can use ILIKE
column ILIKE {pattern}
 */
-- Will return true
SELECT 'Hello' LIKE 'Hello';
-- Find an 'H' and any character so TRUE
SELECT 'Hello' LIKE 'H%';
-- Find any character before a sequence of 'll' so FALSE
SELECT 'hello' LIKE '%ll';
-- Find any single character before 'ello' so TRUE
SELECT 'hello' LIKE '_ello';
-- Find multiple characters in the pattern
SELECT 'Hello' LIKE '__ll_';
-- Using % and _ together
SELECT 'Hello' LIKE '%ll_';

-- 1. Get all actors whose first name starts with A
SELECT *
FROM actors
WHERE first_name LIKE 'A%'
ORDER BY first_name;

-- 2. Get all actors whose last names end in A
SELECT *
FROM actors
WHERE last_name LIKE '%a'
ORDER BY last_name;

-- 3. Get actors whose names has a 'b'
SELECT *
FROM actors
WHERE first_name LIKE '%b%'
ORDER BY first_name;

-- 4. Get actors whose name has an 'l' as the second character
SELECT *
FROM actors
WHERE first_name LIKE '_l%'
ORDER BY first_name;

-- Using IS NULL and IS NOT NULL
/*
 IS NULL to check for NULL values
 IS NOT NULL to check for non-null values

 value IS NULL
 value IS NOT NULL
 */

-- 1. Find actors who have a missing birth date
SELECT *
FROM actors
WHERE date_of_birth IS NULL;

-- 2. Find list of actors with missing DOB or first name
SELECT *
FROM actors
WHERE date_of_birth IS NULL OR first_name IS NULL;

-- 3. Get list of movies where domestic revenues IS NULL
SELECT *
FROM movies_revenues
WHERE revenues_domestic IS NULL;

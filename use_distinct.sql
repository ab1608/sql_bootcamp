-- Select distinct values

-- SELECT DISTINCT column_name FROM table_name

-- 1. Get all records from the movies table
SELECT * FROM movies;

-- 2. Get movie_language from movies table
-- and notice the multiple records for the same language
SELECT
    movie_language
FROM movies;

-- 3. Get unique values of languages
SELECT
    DISTINCT movie_language AS lang
FROM movies
ORDER BY lang;

-- 4. Get unique director_id
SELECT
    DISTINCT director_id
FROM movies
ORDER BY 1;

-- 5. Get multiple distinct values
-- Get unique movie_language and director_id
-- Notice that languages still appear multiple times because the
-- statement is returning the unique pairs of language and director.
SELECT
    DISTINCT movie_language, director_id
FROM movies
ORDER BY 1;

-- 6. Get all unique records in movies table
SELECT
    DISTINCT *
FROM movies;

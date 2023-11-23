-- Using ORDER BY with alias column

-- 1. Get first_name, last_name from actors table
SELECT
    first_name,
    last_name
FROM actors;

-- 2. Make an alias for last_name as surname
-- and sort descending.
SELECT
    first_name,
    last_name AS surname
FROM actors
ORDER BY last_name DESC;

-- 3. Use alias 'Last Name' in ORDER BY clause\
SELECT
    first_name AS "First Name",
    last_name AS "Last Name"
FROM actors
ORDER BY "First Name";


-- Use ORDER BY to sort rows by expressions

-- 1. Get all records of the actors table
SELECT * FROM actors;

-- 2. Calculate the length of the first_name with LENGTH function
SELECT
    first_name as "First Name",
    LENGTH(first_name) as len
FROM actors
ORDER BY len DESC;

-- How to use column name or column number in ORDER BY clause.

-- 1. View all actors records
SELECT * FROM actors;

-- 2. Select the column names
SELECT * FROM actors
ORDER BY
    first_name,
    date_of_birth DESC;

-- 3. Use the column numbers instead of col names.
-- Careful, if you change the order of the cols,
-- you may not return what you expected
SELECT
    first_name,
    last_name,
    date_of_birth
FROM actors
ORDER BY
    -- first_name
    1,
    -- date_of_birth
    3 DESC;

-- Using ORDER BY with NULL values
-- NULL is a marker that indicates missing or unknown data.
-- Use NULLS FIRST or NULLS LAST as an option in an ORDER BY clause

-- 1. Create table demo_sorting
CREATE TABLE demo_sorting (
    num INT
);

-- 2. Insert values into column num
INSERT INTO demo_sorting (num)
VALUES
(1),
(2),
(3),
(NULL);

-- 3. Get records from demo_sorting and sort ASC
-- Notice the NULL is the final value
SELECT * FROM demo_sorting
ORDER BY num ASC;

-- 4. Now, place the NULL first by using the NULLS FIRST option
SELECT * FROM demo_sorting
ORDER BY num ASC NULLS FIRST;

-- 5. Sort DESC with NULLS LAST
SELECT * FROM demo_sorting
ORDER BY num DESC NULLS LAST;

-- 6. Drop the demo_sorting table
DROP TABLE demo_sorting;


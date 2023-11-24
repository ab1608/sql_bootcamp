-- Concatenation techniques
/*
 To concatenate two or more strings, use the double pipe || operator.

 -- Combine strings together:
 SELECT 'string1' || 'string2' AS new_string;

 -- Combine columns together
 SELECT CONCAT(column1, column2) AS new_string;

 -- Combine columns together with a specific seperator
 SELECT CONCAT_WS('|', column1, column2) AS new_string;
 */

-- 1. Combine 'Hello' and 'World' using ||
SELECT 'Hello' || 'World' AS new_string;
SELECT 'Hello' || ' ' || 'World' AS new_string;

-- 2. Use the CONCAT function
SELECT CONCAT(first_name, ' | ', last_name) AS "Actor Name"
FROM actors
ORDER BY "Actor Name";

-- 3. Print first name, last name, and DOB
SELECT CONCAT_WS(', ', first_name, last_name, date_of_birth)
FROM actors
ORDER BY date_of_birth;

-- 4. How are NULL values treated?
-- This will always return null
SELECT 'Hello' || NULL || 'World';
-- CONCAT functions will treat NULL as an empty text
SELECT CONCAT('Hello', NULL, 'World');
SELECT CONCAT_WS('|', 'Hello', NULL, 'World')


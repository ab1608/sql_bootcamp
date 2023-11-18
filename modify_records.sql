-- INSERT DATA INTO A TABLE

-- 1. Create a table called 'customers'
-- function: CREATE TABLE
CREATE TABLE customers (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(150),
	age INT
)

-- 2. Let's view the table data with SELECT
-- function: SELECT 
SELECT * FROM customers;

-- 3. Insert data into a table.
-- function: 
-- INSERT INTO tablename (column 1, col2)
-- VALUES ('value 1', 'value 2')
INSERT INTO customers (first_name, last_name, email, age)
VALUES ('Adnan', 'Waheed', 'a@b.com', 40);

-- 4. Insert multiple records into a table
INSERT INTO customers (first_name, last_name)
VALUES
('ADNAN', 'WAHEED'),
('JOHN', 'ADAMS'),
('LINDA', 'ABE')

SELECT * FROM customers;

-- 5. Insert a record where the text contains quotes
-- Example: Bill O'Reilly
-- Escape the quote by adding another quote next to the char '
INSERT INTO customers (first_name)
VALUES
('Bill ''O Reilly');

-- 6. Use 'RETURNING' to get the data that has just been added
-- By default, PG responds with a success or error
-- function: RETURNING * OR RETURNING (col)
INSERT INTO customers (first_name)
VALUES ('John')
RETURNING *;

INSERT INTO customers (first_name)
VALUES ('Mike')
RETURNING (customer_id);

-- 7. Update values in a table and return the updated records
SELECT * FROM customers;

UPDATE customers
SET email = 'a@w.com'
WHERE customer_id = 2
RETURNING (email);

UPDATE customers
SET
email = 'a4@b.com',
age = 30
WHERE customer_id = 3
RETURNING *;


-- 8. Update all records in a table (i.e. no WHERE clause)
UPDATE customers
SET new_enable = 'Y';

UPDATE customers
SET new_enable = 'N'
WHERE email = 'a4@b.com'
RETURNING *;

-- 9. DELETE records from a table using WHERE 
DELETE FROM customers 
WHERE customer_id = 3;

SELECT * FROM customers;

-- DELETE all records from a table without WHERE;
-- Be careful! Deleted data is irrecoverable.
DELETE FROM customers;










-- Using UPSERT
--
/*
	1. When you insert a row into the table, PostgreSQL will update
	the existing row if it already exists, otherwise, it will
	make a new record in the table. 
	Think of UPSERT as 'update or insert'.
	
	2. SYNTAX
	INSERT INTO table_name (colnames)
	VALUES (values)
	ON CONFLICT (col) action;
	
	3. The 'action' that can be taken:
	
	ON CONFLICT
	
	DO NOTHING : do nothing if the row already exists
	DO UPDATE SET column_1 = value_1 : update fields in the table
	WHERE condition
	
	4. This logic is similar to INSERT INTO.... IF NOT EXISTS	
*/

-- Create a table
CREATE TABLE t_tags (
	id SERIAL PRIMARY KEY,
	tag TEXT UNIQUE,
	update_date TIMESTAMP DEFAULT NOW()
);

-- Insert into some sample data
INSERT INTO t_tags (tag) 
VALUES
('Pen'),
('Pencil');

SELECT * FROM t_tags;

-- 2023-11-18 11:35:18.267094

-- Let's insert a record, on conflict do nothing
INSERT INTO t_tags (tag)
VALUES ('Pen')
ON CONFLICT (tag) 
DO NOTHING;

-- Let's insert a record, on conflict set new values
-- Use the EXCLUDED word to bring in the new value
INSERT INTO t_tags (tag)
VALUES ('Pen')
ON CONFLICT (tag) 
DO 
	UPDATE SET 
		tag = EXCLUDED.tag,
		update_date = NOW();
















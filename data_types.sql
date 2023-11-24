-- Boolean data type
/*
 1. PGSQL supports a single BOOLEAN type:
 - TRUE
 - FALSE
 - NULL

 2. These are some valid literals for boolean values
 -- must be used with single quotes
 TRUE               FALSE
 ----               -----
 TRUE               FALSE
 'true'             'false'
 't'                'f'
 'y'                'n'
 'yes'              'no'
 '1'                '0'
 */

-- 1. Create a sample table called boolean_table
CREATE TABLE table_boolean
(
    product_id   SERIAL PRIMARY KEY,
    is_available BOOLEAN NOT NULL
);

-- 2. insert TRUE values
INSERT INTO table_boolean (is_available)
VALUES (TRUE),
       ('true'),
       ('t'),
       ('y'),
       ('1');

-- ALl the value are True
SELECT *
FROM table_boolean;

-- insert FALSE values
INSERT INTO table_boolean (is_available)
VALUES (FALSE),
       ('false'),
       ('f'),
       ('n'),
       ('0');


-- 3.
SELECT *
FROM table_boolean
WHERE is_available;

SELECT *
FROM table_boolean
WHERE NOT is_available;

-- 4. Set default value as false
ALTER TABLE table_boolean
    ALTER COLUMN is_available
        SET DEFAULT '0';

INSERT INTO table_boolean (product_id)
VALUES (17);

SELECT * FROM table_boolean;


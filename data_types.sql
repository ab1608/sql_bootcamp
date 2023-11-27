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

SELECT *
FROM table_boolean;

-- Character Data Type
/*
1. Character strings types are general-purpose types suitable for:
    - text
    - numbers
    - symbols

2. Three main types of CHARACTER data:
Character Type
--------------
CHARACTER(n), CHAR(n) : fixed length, blank padded
CHARACTER VARYING(n), VARCHAR(n) : variable length with length limit
TEXT, VARCHAR : variable unlimited length (though usually, limited to 1GB)
-- TEXT, VARCHAR is not a standard SQL datatype though similar types exist in other SQLs

If N is unspecified, default to 1.
If the length of the string is less than N, PG will
add spaces to fill the remaining N length.
 */

-- 1. This will return 'Abraham   'with spaces to fill the length
SELECT CAST('Abraham' AS char(10)) AS "Name";
SELECT 'Abraham'::char(10) as "Name";

-- 2. This will return 'Abraham' without spaces
SELECT CAST('Abraham' AS VARCHAR(10)) AS "Name";
SELECT 'Mike'::VARCHAR(10) AS "SecondName";

-- 3. This will only return the first 10 characters 'THIS IS '
SELECT 'THIS IS A TEST'::VARCHAR(8) AS "Sample";

-- This will return
SELECT CAST('Eiusmod eiusmod Lorem mollit sint dolor occaecat ' ||
            'tempor dolor laborum est tempor est minim.' AS TEXT)
           AS "Sample";


-- Numeric data types
/*
1. Numbers columns can hold integers, floating points but cannot hold NULL.
2. Can be used to perform math operations.

Integers
-------
Three main types of integers:
smallint | 2 bytes | -32768 to +32768
integer | 4 bytes | -2147483648 to +2147483648
bigint | 8 bytes | -9223372036854775808 to +9223372036854775808

DB will give an error if you try to store a number outside the integer type

3. Autoincrement integer data type: SERIAL
smallserial | 2 bytes
serial | 4 bytes
bigserial | 8 bytes

If a row is deleted, the SERIAL value will continue to increment.
It is possible that after some time, there may be gaps in the
primary key columns. Don't ever modify the key column!
 */

-- Decimal numbers
/*
 Fixed-point numbers
 -------------------
 numeric(precision, scale)
 - precision : max number of digits (significant figures)
 - scale : the number of decimal place values
 decimal(precision, scale), variable bytes

 Floating-point numbers
 -------------------------
- real: allows scale up to 6 digits, 4 bytes
- double: allows scale up to 15 digits, 8 bytes

 Guidelines about choosing numeric types
 1. Use integers whenever possible2
 2. If decimal data and calculations need to be exact, then use numeric or decimal.
 Floating point numbers can save space but can lead to inaccuracies.
 3. Choose based on the maximum and minimum values in the data
 4. With whole numbers, use bigint only if column values will not fit
 into int or small int.
 */
CREATE TABLE table_numbers
(
    col_numeric NUMERIC(20, 5),
    col_real    REAL,
    col_double  DOUBLE PRECISION
);
INSERT INTO table_numbers (col_numeric, col_real, col_double)
VALUES (0.9, 0.9, 0.9),
       (3.13579, 3.13579, 3.13579),
       (4.1357987654, 4.1357987654, 4.1357987654);
SELECT *
FROM table_numbers;

-- Date/Time data types
/*
 1. Assigned to a variable that is supposed to store only the time value

 Date : Date only : 4713 BC - 294276 AD
 Time : Time only : 4713 BC - 5874897 AD
 Timestamp : Date and time: 4713 BC - 294276 AD
 Timestamptz : date, time, and timezone : 4713 BC - 294276 AD

 DATE data type
 1. By default, is formatted to YYYY-MM-DD
 2. CURRENT_DATE is a good keyword that stores the system's date.
 Usage: col_name DATE
 */

-- 1. Create table with DATE column
CREATE TABLE table_date
(
    id            SERIAL PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    hire_date     DATE         NOT NULL,
    creation_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO table_date (employee_name, hire_date)
VALUES ('ADAM', '2021-01-01'),
       ('LINDA', '2020-02-03');
SELECT *
FROM table_date;
-- Useful function to get the current datetime
SELECT NOW();

-- Time format
/*
 Common formats:
 HH:MM 10:30
 HH:MM:SS 10:30:35
 HHMMSS 103055

 These formats store the precision of time
 Useful for databases that may have many transactions occurs near the same time
 HH:MM:SS.ffffff 03:34:41.111111

 -- Current time in the system
 SELECT CURRENT_TIME(N)
 where N is the precision.

 -- Get the time on local machine
 SELECT LOCALTIME;

 Time can be used to do arithmetic operations.
 */
CREATE TABLE table_time
(
    id         SERIAL PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    start_time TIME         NOT NULL,
    end_time   TIME         NOT NULL
);
INSERT INTO table_time (class_name, start_time, end_time)
VALUES ('MATH', '08:00:00', '09:00:00'),
       ('CHEMISTRY', '09:01:00', '10:00:00');
SELECT *
FROM table_time;

SELECT LOCALTIME, CURRENT_TIME(2);
-- INTERVAL 'n type' where type is second, minute, hour, day etc.
SELECT CURRENT_TIME + INTERVAL '2 hours' as result;

-- Timezone format
/*
 Timestamptz stores time in the Universally Coordinate Time timezone
 Modify the timezone relative to UTC by adding +/- hours next to the
 value of timestamp tz.

 SELECT CURRENT_TIMESTAMP;
 SELECT TIMEOFDAY();
 */
CREATE TABLE table_timetz
(
    ts   TIMESTAMP,
    tstz TIMESTAMPTZ
);
SET TIMEZONE = 'America/New_York';
SHOW TIMEZONE;

-- Notice the -07 is ignored in ts but respected in tstz
INSERT INTO table_timetz (ts, tstz)
VALUES ('2020-02-22 10:10:10-07', '2020-02-22 10:10:10-07');
SELECT * FROM table_timetz;

-- UUID Data Type
/*
 1. Universal Unique Identifier
 2. 128-bit quantity generated by an algorithm.
 3. Properties of a UUID
 - 32 digits length
 - hexadecimal digits
 - separated by hyphens
 4. UUID is a better unique value than using SERIAL.
 5. To create a UUID in Postgres, we will need to provide a third-party UUID
 algorithm. We will need to install it as an extension.
 */

-- 1. Enable third party UUID extensions.
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 2. Generate a sample UUID.
SELECT uuid_generate_v1();
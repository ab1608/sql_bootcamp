-- Create the 'actors' table
-- The SERIAL data type lets Postgres automtically assign
-- a unique identifier. SERIAL produces integer values.
-- function: CREATE TABLE
CREATE TABLE actors (
	actor_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150) NOT NULL,
	gender CHAR(1),
	date_of_birth DATE,
	add_date DATE,
	update_date DATE
);


-- Create the 'directors' table
-- function: CREATE TABLE
CREATE TABLE directors (
	director_id SERIAL PRIMARY KEY,
	first_name VARCHAR (150),
	last_name VARCHAR(150),
	date_of_birth DATE,
	nationality VARCHAR(20),
	add_date DATE,
	update_date DATE
);

-- Create the movies table
-- Use NOT NULL so that blank values are not allowed in
-- that column.
-- Movies have Directors so it needs a foreign key
-- that points to the directors table.
CREATE TABLE movies (
	movie_id SERIAL PRIMARY KEY,
	movie_name VARCHAR(100) NOT NULL,
	movie_length INT,
	movie_language VARCHAR(20),
	age_certification VARCHAR(10),
	release_date DATE,
	director_id INT REFERENCES directors (director_id)
);

-- Create the 'movies_revenues' table
-- that has a foreign key to the movies table
CREATE TABLE movies_revenues (
	revenue_id SERIAL PRIMARY KEY,
	movie_id INT REFERENCES movies (movie_id),
	revenues_domestic NUMERIC(10, 2),
	revenues_international NUMERIC(10, 2)
);

-- Create a movies_actors junction table 
-- that records transactions
CREATE TABLE movies_actors (
	movie_id INT REFERENCES movies (movie_id),
	actor_id INT REFERENCES actors (actor_id),
	PRIMARY KEY (movie_id, actor_id)
);

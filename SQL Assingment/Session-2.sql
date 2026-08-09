-- 1. Open your SQL editor and run a query to select all columns from a table named restaurants using SELECT * FROM restaurants;.
CREATE DATABASE Assignment ;
USE Assignment ;
CREATE TABLE restaurants (
    id INT ,
    name VARCHAR(50),
    cuisine VARCHAR(50),
    rating INT 
);
INSERT INTO restaurants (id, name, cuisine, rating) VALUES
(1, 'Pizza Hut', 'Italian', 4),
(2, 'Burger King', 'Fast Food', 4),
(3, 'Taco Bell', 'Mexican', 3),
(4, 'KFC', 'Fast Food', 4),
(5, 'Subway', 'Healthy', 4),
(6, 'Dominos', 'Italian', 4),
(7, 'Starbucks', 'Cafe', 4),
(8, 'McDonalds', 'Fast Food', 4),
(9, 'Chipotle', 'Mexican', 4),
(10, 'Dunkin Donuts', 'Cafe', 4),
(11, 'Nandos', 'Portuguese', 4),
(12, 'Panda Express', 'Chinese', 3);

SELECT * FROM restaurants ;

-- 2. Write an SQL query to display only the name and rating columns from the table zomato_reviews
SELECT name , rating FROM restaurants ;
/*
3.
Write an SQL query to select the movie_name and release_year columns from a table 
called movies, but rename movie_name as 'Title' and release_year as 'Year Released' in the output using the AS keyword.
*/

CREATE TABLE movies (
    id INT,
    movie_name VARCHAR(100),
    release_year INT
);

INSERT INTO movies (id, movie_name, release_year) VALUES
(1, 'Inception', 2010),
(2, 'The Matrix', 1999),
(3, 'Interstellar', 2014),
(4, 'Avatar', 2009);

SELECT movie_name AS 'Title', release_year AS 'Year Released' 
FROM movies;

/*4.
In a table called products, write an SQL query that selects all columns and add a comment
 in your SQL code explaining what the query does.<br><br><em><strong>Hint:</strong> Use -- to write a single-line comment above your query.</em>
*/
-- Create a simple products table
CREATE TABLE products (
    product_id INT ,
    product_name VARCHAR(50),
    price INT
);

-- Insert sample products
INSERT INTO products (product_id, product_name, price) VALUES
(101, 'Wireless Mouse', 25.50),
(102, 'Mechanical Keyboard', 75.00),
(103, 'USB-C Cable', 12.99);

-- Your query with a comment
-- This query selects all columns and all rows from the products table
SELECT * FROM products;

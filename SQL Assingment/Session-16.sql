/*1.Write an SQL query using CONCAT to combine first_name and last_name columns from a users table into a single full_name column and display the result.*/

CREATE TABLE users (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO users (id, first_name, last_name) VALUES
(1, 'Rahul', 'Sharma'),
(2, 'Priya', 'Singh');

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name 
FROM users;

/*
2.
Given a table called playlists with a column song_title, write a query to display all song titles in uppercase using the UPPER function.*/

CREATE TABLE playlists (
    id INT PRIMARY KEY,
    song_title VARCHAR(100)
);



INSERT INTO playlists (id, song_title) VALUES
(1, 'tum hi ho'),
(2, 'Shape of You');
SELECT 
    UPPER(song_title) AS uppercase_title 
FROM playlists;
/*
3.
You have a table food_items with a column item_code that sometimes contains extra spaces at the beginning or end. 
Write an SQL query to select item_code values after removing all leading and trailing spaces using TRIM.*/

CREATE TABLE food_items (
    id INT PRIMARY KEY,
    item_code VARCHAR(50)
);

INSERT INTO food_items (id, item_code) VALUES
(1, '   PZA-001 '),
(2, 'BRG-002   ');


SELECT 
    TRIM(item_code) AS clean_item_code 
FROM food_items;
/*
4.
In a table called movies, the column imdb_id contains codes like 'tt1234567'. Write a query to extract just the numeric 
part (the last 7 characters) using RIGHT and display it as movie_number.<br><br><em><strong>Hint:</strong> Use RIGHT(imdb_id, 7) to get the numeric part.</em>*/
CREATE TABLE movies (
    id INT PRIMARY KEY,
    imdb_id VARCHAR(20)
);


INSERT INTO movies (id, imdb_id) VALUES
(1, 'tt1234567'),
(2, 'tt9876543');

SELECT 
    RIGHT(imdb_id, 7) AS movie_number 
FROM movies;


/*
5.
A products table has a column sku_code where some entries use dashes (e.g. 'MOB-123-XY'). Write an SQL query to replace all dashes '-' 
with underscores '_' in sku_code using the REPLACE function and display the updated codes.*/

CREATE TABLE products_1 (
    id INT PRIMARY KEY,
    sku_code VARCHAR(50)
);

INSERT INTO products_1 (id, sku_code) VALUES
(1, 'MOB-123-XY'),
(2, 'LAP-456-AB');

SELECT 
    REPLACE(sku_code, '-', '_') AS updated_sku 
FROM products_1;
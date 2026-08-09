-- 1.Write an SQL query to select all restaurants from a table named 'restaurants' where the rating is greater than or equal to 4.5.
USE assignment ;
SELECT * 
FROM restaurants 
WHERE rating >= 4;
/*2.In a table called 'movies', filter and display only the movies 
released after 2020 and with genre 'Action' using the WHERE clause and AND operator. */
CREATE TABLE movies (
    id INT ,
    title VARCHAR(100),
    release_year INT,
    genre VARCHAR(50)
);
INSERT INTO movies (id, title, release_year, genre) VALUES
(1, 'The Batman', 2022, 'Action'),
(2, 'Dune', 2021, 'Sci-Fi'),
(3, 'John Wick 3', 2019, 'Action'),
(4, 'Fast X', 2023, 'Action'),
(5, 'Oppenheimer', 2023, 'Drama');

SELECT * 
FROM movies 
WHERE release_year > 2020 AND genre = 'Action';
/*
3. Given a table 'products' with columns (id, name, price, category), 
write a query to find all products not in the 'Electronics' category or with a price less than 500. */
CREATE TABLE products (
    id INT,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    category VARCHAR(50)
);
INSERT INTO products (id, name, price, category) VALUES
(1, 'Smartphone', 800.00, 'Electronics'), 
(2, 'Wireless Mouse', 25.00, 'Electronics'), 
(3, 'Wooden Desk', 150.00, 'Furniture'), 
(4, 'Office Chair', 550.00, 'Furniture');

SELECT * 
FROM products 
WHERE category != 'Electronics' OR price < 500;


/*
4.
Write an SQL query for a table 'users' to 
show all users who are NOT from 'Ahmedabad' and have more than 1000 followers.<br><br><em><strong>Hint:</strong> Use the NOT operator combined with AND.</em>
*/

CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    city VARCHAR(50),
    followers INT
);

INSERT INTO users (id, username, city, followers) VALUES
(1, 'rohan_patel', 'Ahmedabad', 1500), 
(2, 'priya_sharma', 'Mumbai', 2000),    
(3, 'amit_singh', 'Ahmedabad', 800),    
(4, 'neha_gupta', 'Delhi', 500),        
(5, 'karan_verma', 'Pune', 1200);

SELECT * 
FROM users 
WHERE NOT city = 'Ahmedabad' AND followers > 1000;
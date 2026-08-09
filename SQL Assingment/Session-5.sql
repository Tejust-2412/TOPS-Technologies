-- 1. Write an SQL query using the DISTINCT keyword to find all unique payment methods used in the orders table of a food delivery app database.
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    total_amount DECIMAL(6, 2),
    payment_method VARCHAR(50)
);
INSERT INTO orders (order_id, customer_name, total_amount, payment_method) VALUES
(101, 'Amit', 250.00, 'Credit Card'),
(102, 'Priya', 150.00, 'UPI'),
(103, 'Rahul', 450.00, 'Cash on Delivery'),
(104, 'Sneha', 300.00, 'UPI'),
(105, 'Karan', 500.00, 'Credit Card'),
(106, 'Neha', 120.00, 'Wallet');

SELECT DISTINCT payment_method 
FROM orders;

-- 2.Query the users table to list all cities where users have registered, but display each city only once and sort the result in alphabetical order (A-Z).
SELECT DISTINCT city 
FROM users 
ORDER BY city ASC;

-- 3.Write an SQL query to select the top 5 most recent movie bookings from the bookings table, ordered by booking_date in descending order.
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    movie_name VARCHAR(100),
    booking_date DATE
);

INSERT INTO bookings (booking_id, customer_name, movie_name, booking_date) VALUES
(1, 'Rahul', 'Inception', '2023-10-01'),
(2, 'Sneha', 'The Matrix', '2023-10-15'),
(3, 'Amit', 'Avatar', '2023-10-20'),
(4, 'Pooja', 'Interstellar', '2023-09-25'),
(5, 'Karan', 'Dune', '2023-10-18'),
(6, 'Neha', 'The Batman', '2023-10-22'),
(7, 'Vikram', 'Oppenheimer', '2023-10-05');

SELECT * 
FROM bookings 
ORDER BY booking_date DESC 
LIMIT 5;
/*
4.From a products table containing Flipkart-style product data (id, name, category, sold_count), write an 
SQL query to retrieve the 10 products with the highest sold_count, 
displaying only product name and sold_count, sorted from highest to lowest.<br><br><em><strong>Hint:
</strong> Use ORDER BY and LIMIT together to achieve this.</em> */

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    sold_count INT
);

INSERT INTO products (id, name, category, sold_count) VALUES
(1, 'Boat Airdopes', 'Electronics', 15000),
(2, 'Puma Running Shoes', 'Fashion', 8500),
(3, 'Milton Thermosteel', 'Home', 12000),
(4, 'iPhone 14', 'Electronics', 5000),
(5, 'Sony Bravia TV', 'Electronics', 3200),
(6, 'Levis Jeans', 'Fashion', 9000),
(7, 'Casio Watch', 'Accessories', 4500),
(8, 'Samsung Galaxy S23', 'Electronics', 7000),
(9, 'Nivea Body Lotion', 'Beauty', 11000),
(10, 'HP Pavilion Laptop', 'Electronics', 2500),
(11, 'Safari Backpack', 'Travel', 6200),
(12, 'Philips Trimmer', 'Electronics', 13500);

SELECT name, sold_count 
FROM products 
ORDER BY sold_count DESC 
LIMIT 10;
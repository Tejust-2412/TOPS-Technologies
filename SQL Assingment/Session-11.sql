/*
1.
Write a SQL query to display the names and ratings of restaurants (from a table named Restaurants) 
where the rating is higher than the average rating of all restaurants in the table.<br><br><em><strong>Hint:
</strong> Use a subquery in the WHERE clause to calculate the average rating.</em> */
CREATE TABLE Restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    rating DECIMAL(3, 1)
);

INSERT INTO Restaurants (id, name, rating) VALUES
(1, 'Pizza Hut', 4.2),
(2, 'Dominos', 3.8),
(3, 'Burger King', 4.0),
(4, 'Truffles', 4.8),
(5, 'KFC', 3.5);
SELECT name, rating 
FROM Restaurants
WHERE rating > (SELECT AVG(rating) FROM Restaurants);
/*
2.
In a Flipkart-style Products table (columns: product_id, name, price, category), write a SQL query to 
list each product name along with the average price of its category as an additional column using a scalar subquery in the SELECT statement.*/
CREATE TABLE Productss (
    product_id INT PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(10, 2),
    category VARCHAR(50)
);

INSERT INTO Products (product_id, name, price, category) VALUES
(1, 'Laptop', 60000.00, 'Electronics'),
(2, 'Smartphone', 20000.00, 'Electronics'),
(3, 'T-Shirt', 500.00, 'Fashion'),
(4, 'Jeans', 1500.00, 'Fashion');

SELECT p1.name, p1.price, (SELECT AVG(price) 
     FROM Products p2 
     WHERE p2.category = p1.category) AS avg_category_price
FROM Products p1;
/*
3.
Given a Playlists table (playlist_id, user_id, playlist_name) and a Users table (user_id, username), write a SQL query using 
a subquery in the FROM clause to show each username and the number of playlists they have created, 
displaying only users who have created more playlists than the average number of playlists per user.
<br><br><em><strong>Hint:</strong> Use a derived table (subquery in FROM) to count playlists per user, then filter with a subquery in WHERE.</em>  */

/*
4.
Suppose you have an Orders table (order_id, user_id, total_amount) for a food delivery app. 
Write a query to find all user_ids who have placed at least one order with a total_amount greater 
than the average order amount, using a subquery in the WHERE clause.*/

CREATE TABLE Orders_App (
    order_id INT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(8, 2)
);

INSERT INTO Orders_App (order_id, user_id, total_amount) VALUES
(1, 101, 150.00),
(2, 102, 200.00),
(3, 101, 800.00), 
(4, 103, 300.00);

SELECT DISTINCT user_id 
FROM Orders_App 
WHERE total_amount > (SELECT AVG(total_amount) FROM Orders_App);
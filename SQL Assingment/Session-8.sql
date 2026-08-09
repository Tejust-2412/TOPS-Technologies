/*1.
Create two tables in your SQL database: Users (user_id, username, city) and Orders 
(order_id, user_id, product, amount). Insert at least 3 users and 5 orders, making sure some users have no orders.*/
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    product VARCHAR(50),
    amount DECIMAL(8, 2)
);

INSERT INTO Users (user_id, username, city) VALUES
(1, 'Alice', 'Mumbai'),
(2, 'Bob', 'Delhi'),
(3, 'Charlie', 'Bangalore'),
(4, 'Dave', 'Pune');


INSERT INTO Orders (order_id, user_id, product, amount) VALUES
(101, 1, 'Laptop', 55000.00),
(102, 1, 'Mouse', 1500.00),
(103, 2, 'Keyboard', 2500.00),
(104, 2, 'Monitor', 12000.00),
(105, 99, 'Headphones', 3000.00);


/*
2.
Write an SQL query using INNER JOIN to list all usernames and their ordered products, showing only users who have placed at least one order. */
SELECT Users.username, Orders.product 
FROM Users 
INNER JOIN Orders ON Users.user_id = Orders.user_id;

/*
3.
Write an SQL query using LEFT JOIN to display all usernames along with their ordered products.
For users who haven't placed any orders, show NULL for the product.*/
 SELECT Users.username, Orders.product 
FROM Users 
LEFT JOIN Orders ON Users.user_id = Orders.user_id;
/*


/*4.
Write an SQL query using RIGHT JOIN to show all orders and the corresponding username for each order. 
If an order has a user_id that doesn't exist in the Users table, display NULL for the username.<br><br><em><strong>Hint:
</strong> Try deleting one user and keeping their order to test this case.</em>*/
SELECT Orders.order_id,Orders.product,Users.username
FROM Users 
RIGHT JOIN Orders ON Users.user_id = Orders.user_id;
/*
5.
Suppose you want to analyze food delivery data like Zomato. Create a CustomerSegments table (segment_id, segment_name), 
and link it to Users with a foreign key. Write an SQL query to show each username, their segment name, and total order amount (use JOINs as needed).*/

CREATE TABLE CustomerSegments (
    segment_id INT PRIMARY KEY,
    segment_name VARCHAR(50)
);
INSERT INTO CustomerSegments (segment_id, segment_name) VALUES
(10, 'Zomato Gold'),
(20, 'Regular');

ALTER TABLE Users ADD COLUMN segment_id INT;

UPDATE Users SET segment_id = 10 WHERE user_id IN (1, 3); 
UPDATE Users SET segment_id = 20 WHERE user_id IN (2, 4);

SELECT 
    u.username,
    cs.segment_name,
    SUM(o.amount) AS total_order_amount
FROM Users u
LEFT JOIN CustomerSegments cs ON u.segment_id = cs.segment_id
LEFT JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.username, cs.segment_name;

/*
1.
Create a SQL view named TopRatedRestaurants that selects the restaurant name, average rating, and total number of reviews from a
 table of Zomato-style restaurant reviews, showing only restaurants with an average rating above 4.0.*/
 
 CREATE TABLE Restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    restaurant_id INT,
    rating DECIMAL(3,1)
);

INSERT INTO Restaurants (id, name, city) VALUES 
(1, 'Meghana Foods', 'Bangalore'),
(2, 'Burger King', 'Delhi'),
(3, 'Truffles', 'Bangalore');

INSERT INTO Reviews (review_id, restaurant_id, rating) VALUES 
(1, 1, 5.0), (2, 1, 4.0), 
(3, 2, 3.0), (4, 2, 4.0), 
(5, 3, 4.5), (6, 3, 4.5);
CREATE VIEW TopRatedRestaurants AS
SELECT 
    r.name AS restaurant_name,
    AVG(rev.rating) AS average_rating,
    COUNT(rev.review_id) AS total_reviews
FROM Restaurants r
JOIN Reviews rev ON r.id = rev.restaurant_id
GROUP BY r.id, r.name
HAVING AVG(rev.rating) > 4.0;
 
 /*
2.
Update the TopRatedRestaurants view to also include the city column from the original restaurants table by joining the relevant tables
.<br><br><em><strong>Hint:</strong> Use an INNER JOIN to combine data from both tables in your view definition.</em>*/
CREATE OR REPLACE VIEW TopRatedRestaurants AS
SELECT 
    r.name AS restaurant_name,
    r.city,
    AVG(rev.rating) AS average_rating,
    COUNT(rev.review_id) AS total_reviews
FROM Restaurants r
JOIN Reviews rev ON r.id = rev.restaurant_id
GROUP BY r.id, r.name, r.city
HAVING AVG(rev.rating) > 4.0;
/*
3.
Try to update the average rating column directly through the TopRatedRestaurants view and observe what error or limitation occurs. 
Write down the exact error message and explain why this happens based on SQL view limitations.*/
UPDATE TopRatedRestaurants 
SET average_rating = 4.8 
WHERE restaurant_name = 'Truffles';


/*
4.
Create a view called DailyOrderSummary that shows, for each date, the total number of food orders and the total revenue from a Swiggy-style orders table. 
Ensure the view only includes dates from the last 30 days.<br><br><em><strong>Constraint:</strong> Use WHERE and GROUP BY clauses in your view definition.</em>*/
-- Step 1: Create Table and Insert Data
CREATE TABLE SwiggyOrders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    order_amount DECIMAL(10,2)
);

INSERT INTO SwiggyOrders (order_id, order_date, order_amount) VALUES 
(1, '2026-08-08', 500.00),
(2, '2026-08-08', 350.00),
(3, '2026-08-05', 1200.00),
(4, '2025-01-01', 400.00); 

CREATE VIEW DailyOrderSummary AS
SELECT 
    order_date,
    COUNT(order_id) AS total_orders,
    SUM(order_amount) AS total_revenue
FROM SwiggyOrders
WHERE order_date >= DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY)
GROUP BY order_date;
/*
5.
List 3 good practices you should follow when creating SQL views for analytics dashboards, and for each, give a one-line example related to a Flipkartsales
 reporting scenario.*/
 
 
 
-- Section A — Concept Application

/*1.SCENARIO
You are a data analyst at a food delivery platform. The operations team needs a report
showing which restaurant partners earned more than Rs 1,00,000 in total revenue last
month — but only for restaurants that received at least 50 orders.


Question: Explain how you would use GROUP BY and HAVING together to produce this report.
Why is HAVING more appropriate than WHERE for filtering on aggregated values? What would
break in your query if you replaced HAVING with WHERE?

Answer:
To produce this report, I would group the data by the restaurant using the GROUP BY clause and then apply the HAVING clause to filter
the aggregated metrics: HAVING SUM(revenue) > 100000 AND COUNT(order_id) >= 50. HAVING is more appropriate than WHERE because the WHERE clause filters individual
rows before aggregation occurs, whereas HAVING filters the results after the aggregations (like SUM and COUNT) are calculated.
 If I replaced HAVING with WHERE, the query would break and return an error because SQL does not allow aggregate functions within a WHERE clause.

*/

/*2.SCENARIO
You are building a customer insights report for a food delivery app. The marketing team
needs a list of every registered customer and their most recent order details — even for
customers who have never placed an order

Which type of JOIN would you use to ensure all customers appear in the result,
including those with no orders? Justify your choice by comparing it with INNER JOIN, and explain
specifically what data would be lost if INNER JOIN were used instead.


I would use a LEFT JOIN (with the customers table on the left and the orders table on the right).
This ensures that all records from the customers table are included in the result set. For customers who have never placed an order,
the order detail columns will simply display NULL.If an INNER JOIN were used instead, it would only return rows where there is a match in both tables. 
Consequently, the data of any registered customer who has not yet placed an order would be completely lost (filtered out) from the final report.
*/

/*
3.SCENARIO
You are designing a delivery performance dashboard. The business wants to identify
delivery agents whose average delivery time is faster than the overall platform average,
without using a temporary table or creating a new view.

Describe how you would write a subquery to find these agents. What type of
subquery is most appropriate here — scalar, row, or table — and why? What would happen if you
tried to place this subquery in the SELECT clause instead of the WHERE clause?


I would write a subquery in the WHERE clause to compare each agent's average time against the platform's overall average: WHERE agent_avg_time < (SELECT AVG(delivery_time) FROM deliveries).
A scalar subquery is the most appropriate type here because it returns a single, specific value (one row and one column—the overall average)
that can be evaluated using standard comparison operators (like < or >). If this subquery were placed in the SELECT clause instead of the WHERE clause,
it would not filter the agents; rather, it would simply append a new column displaying the platform's overall average delivery time on every single row.

*/

/*
4.SCENARIO
You are analysing order data for a food delivery company. The product team wants to
rank the top 3 highest-revenue restaurants within each city. Two restaurants in Surat
have the exact same revenue figure and you must decide how to number them.

Compare RANK() and DENSE_RANK() window functions for this use case. Which would
you choose and why? Provide a brief example showing how each function would number three
restaurants where two share the same revenue, and explain the practical impact of that
difference on the product team's report.

I would choose DENSE_RANK() for this use case.
When dealing with ties, RANK() assigns the same rank to tied rows but skips the subsequent ranking numbers (e.g., 1, 1, 3). 
DENSE_RANK() assigns the same rank to ties but does not skip the next number (e.g., 1, 1, 2).
Example: If Restaurants A and B both tie for the highest revenue, and Restaurant C is next, RANK() numbers them 1, 1, 3. 
DENSE_RANK() numbers them 1, 1, 2. The practical impact on the product team's report is that using DENSE_RANK() 
guarantees they will accurately see the top 3 distinct revenue tiers, whereas RANK() might accidentally exclude the 3rd highest earner if a tie occurs above them.
*/

/*
5.SCENARIO
You are writing a CRM query for a food delivery startup. The customer success team
wants each customer labelled as 'Platinum', 'Gold', or 'Standard' based on total lifetime
spend — above Rs 5,000, between Rs 2,000 and Rs 5,000, and below Rs 2,000
respectively — directly in the query output without creating a new table.

Explain how you would use CASE WHEN to generate this classification column. If a customer's total spend is exactly Rs 5,000, which tier will they fall into, 
and how does the order of your WHEN conditions control that outcome?

I would generate this classification column using the following logic:
CASE WHEN total_spend > 5000 THEN 'Platinum' WHEN total_spend >= 2000 THEN 'Gold' ELSE 'Standard' END.
If a customer's total spend is exactly Rs 5,000, they will fall into the 'Gold' tier because the 'Platinum' requirement specifies 
"above Rs 5,000". The order of the WHEN conditions controls this outcome because a CASE statement evaluates 
sequentially from top to bottom. Once the engine finds the first condition that evaluates to true, it assigns that value and ignores the remaining conditions.

*/

/*
6.SCENARIO
You are optimising a slow-running analytics query for a food delivery platform. The
query joins four large tables and applies a GROUP BY across 10 million rows, taking over
30 seconds. A colleague suggests adding an index on the JOIN column used most
frequently.

Explain what a database index does at the engine level and why it would speed up
this specific query. Are there scenarios where adding an index could actually hurt performance?
What trade-off must you evaluate before indexing every column in a large table?

At the engine level, a database index creates a separate, highly organized data structure (like a B-Tree) for the indexed column.
`This speeds up the specific query because, during the JOIN operation, the engine
can quickly look up matching rows using the index rather than performing a slow, resource-heavy Full Table Scan across all 10 million rows.
However, adding an index can hurt performance during Data Manipulation Language (DML) operations (like INSERT, UPDATE, or DELETE).
Every time the table's data changes, the index must also be updated, which adds overhead. Before indexing every column, one must evaluate 
the trade-off between faster read speeds versus slower write speeds and increased storage space requirements.
*/

/* 
Section B  —  Practical Coding Tasks

Task 1: Menu & Order Explorer
*/

/*
Create a table named food_orders with columns: order_id, customer_name,
restaurant_name, item_ordered, quantity, price_per_item, order_date, and city. Insert at
least 8 rows spanning at least 3 cities.
*/
-- Create the food_orders table


CREATE TABLE food_orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    restaurant_name VARCHAR(50),
    item_ordered VARCHAR(50),
    quantity INT,
    price_per_item DECIMAL(10,2),
    order_date DATE,
    city VARCHAR(50)
);

INSERT INTO food_orders (order_id, customer_name, restaurant_name, item_ordered, quantity, price_per_item, order_date, city) VALUES
(1, 'Rahul Sharma', 'Spice Grill', 'Paneer Tikka', 2, 250.00, '2023-10-01', 'Mumbai'),
(2, 'Priya Singh', 'Burger Hub', 'Cheese Burger', 1, 150.00, '2023-10-02', 'Pune'),
(3, 'Amit Patel', 'Spice Grill', 'Butter Chicken', 1, 350.00, '2023-10-03', 'Mumbai'),
(4, 'Neha Gupta', 'Delhi Darbar', 'Chole Bhature', 2, 120.00, '2023-10-04', 'Delhi'),
(5, 'Vikram Rao', 'Pizza Point', 'Margherita Pizza', 3, 300.00, '2023-10-05', 'Mumbai'),
(6, 'Anjali Desai', 'Burger Hub', 'Veggie Burger', 2, 130.00, '2023-10-06', 'Pune'),
(7, 'Rohan Mehta', 'Delhi Darbar', 'Rajma Chawal', 1, 140.00, '2023-10-07', 'Delhi'),
(8, 'Kavita Iyer', 'Spice Grill', 'Dal Makhani', 2, 200.00, '2023-10-08', 'Mumbai');



/*
Write a query to retrieve all orders placed in the city of 'Mumbai', sorted by price_per_item in
descending order.
*/
SELECT * 
FROM food_orders 
WHERE city = 'Mumbai' 
ORDER BY price_per_item DESC;

/*
Write a query to return all distinct restaurant names that have received at least one order.
*/
SELECT DISTINCT restaurant_name 
FROM food_orders;

/*
Write a query to list the top 5 most expensive individual orders using ORDER BY and LIMIT.
*/

SELECT order_id, customer_name, restaurant_name, item_ordered, (quantity * price_per_item) AS total_order_value
FROM food_orders 
ORDER BY total_order_value DESC 
LIMIT 5;


/*Task 2: Restaurant Revenue Summary */

/* Create a table named delivery_orders with columns: order_id, restaurant_name, city,
total_amount, order_status, and order_date. Insert at least 10 rows covering at least 4
different restaurants. */

CREATE TABLE delivery_orders (
    order_id INT PRIMARY KEY,
    restaurant_name VARCHAR(50),
    city VARCHAR(50),
    total_amount DECIMAL(10,2),
    order_status VARCHAR(20),
    order_date DATE
);

INSERT INTO delivery_orders (order_id, restaurant_name, city, total_amount, order_status, order_date) VALUES
(101, 'KFC', 'Mumbai', 1200.00, 'Delivered', '2023-10-01'),
(102, 'McDonalds', 'Pune', 800.00, 'Delivered', '2023-10-01'),
(103, 'Dominos', 'Delhi', 5500.00, 'Delivered', '2023-10-02'),
(104, 'KFC', 'Mumbai', 3000.00, 'Delivered', '2023-10-02'),
(105, 'Subway', 'Mumbai', 600.00, 'Delivered', '2023-10-03'),
(106, 'Dominos', 'Delhi', 6000.00, 'Delivered', '2023-10-03'),
(107, 'McDonalds', 'Pune', 1500.00, 'Delivered', '2023-10-04'),
(108, 'KFC', 'Mumbai', 7000.00, 'Delivered', '2023-10-04'),
(109, 'Subway', 'Mumbai', 4000.00, 'Delivered', '2023-10-05'),
(110, 'Subway', 'Mumbai', 1200.00, 'Cancelled', '2023-10-06');

/*
Write a query using SUM, COUNT, and AVG to calculate total revenue, total orders, and average
order value per restaurant. 
Add a HAVING clause to return only restaurants whose total revenue exceeds Rs 5,000. 
Extend the SELECT list with a CASE WHEN expression that labels each qualifying restaurant as
'High Revenue' if total revenue is above Rs 10,000, or 'Moderate Revenue' otherwise. */

SELECT 
    restaurant_name,
    SUM(total_amount) AS total_revenue,
    COUNT(order_id) AS total_orders,
    AVG(total_amount) AS average_order_value,
    CASE 
        WHEN SUM(total_amount) > 10000 THEN 'High Revenue'
        ELSE 'Moderate Revenue'
    END AS revenue_tier
FROM delivery_orders
GROUP BY restaurant_name
HAVING SUM(total_amount) > 5000;	



 -- Task 3:Customer–Order–Restaurant Joined Report
 
/*Create three tables: customers (customer_id, name, city, phone), restaurants (restaurant_id,
name, cuisine_type, city), and orders (order_id, customer_id, restaurant_id, amount,
order_date). Insert at least 6 rows per table and intentionally include at least 2 customers who
have placed no orders.*/

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    phone VARCHAR(15)
);

CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(50),
    cuisine_type VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

INSERT INTO customers (customer_id, name, city, phone) VALUES
(1, 'Aarav', 'Mumbai', '9876543210'),
(2, 'Ishita', 'Pune', '8765432109'),
(3, 'Kabir', 'Delhi', '7654321098'),
(4, 'Myra', 'Mumbai', '6543210987'),
(5, 'Sunil', 'Pune', '5432109876'), -- No orders
(6, 'Pooja', 'Delhi', '4321098765'); -- No orders

INSERT INTO restaurants (restaurant_id, name, cuisine_type, city) VALUES
(1, 'Taco Bell', 'Mexican', 'Mumbai'),
(2, 'China Gate', 'Chinese', 'Pune'),
(3, 'Punjabi Dhaba', 'North Indian', 'Delhi'),
(4, 'Mumbai Masala', 'Indian', 'Mumbai'),
(5, 'Cafe Mocha', 'Beverages', 'Pune'),
(6, 'South Indian Express', 'South Indian', 'Delhi');

INSERT INTO orders (order_id, customer_id, restaurant_id, amount, order_date) VALUES
(201, 1, 1, 450.00, '2023-10-01'),
(202, 1, 4, 800.00, '2023-10-02'),
(203, 2, 2, 600.00, '2023-10-03'),
(204, 3, 3, 1200.00, '2023-10-04'),
(205, 4, 1, 350.00, '2023-10-05'),
(206, 2, 5, 250.00, '2023-10-06');

/*Write an INNER JOIN query to list each order alongside the placing customer's name and the
fulfilling restaurant's name. */

SELECT o.order_id, c.name AS customer_name, r.name AS restaurant_name, o.amount, o.order_date
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN restaurants r ON o.restaurant_id = r.restaurant_id;

/*
Write a LEFT JOIN query to list all customers — including those with no orders — with NULL
appearing in order columns where no order exists. */
SELECT c.name AS customer_name, o.order_id, o.amount, o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

/*
Add a WHERE condition to the joined result to show only orders where both the customer and
the restaurant belong to the same city. */

SELECT o.order_id, c.name AS customer_name, c.city AS customer_city, r.name AS restaurant_name, r.city AS restaurant_city, o.amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN restaurants r ON o.restaurant_id = r.restaurant_id
WHERE c.city = r.city;


-- Task 4: Delivery Agent Performance Ranking
/*Create a table named deliveries with columns: delivery_id, agent_name, restaurant_name,
delivery_time_mins, and order_date. Insert at least 10 rows across at least 4 delivery agents,
with varied delivery times. */
CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    agent_name VARCHAR(50),
    restaurant_name VARCHAR(50),
    delivery_time_mins INT,
    order_date DATE
);
INSERT INTO deliveries (delivery_id, agent_name, restaurant_name, delivery_time_mins, order_date) VALUES
(301, 'Raju', 'KFC', 25, '2023-10-01'),
(302, 'Raju', 'McDonalds', 30, '2023-10-02'),
(303, 'Suresh', 'Dominos', 45, '2023-10-01'),
(304, 'Suresh', 'Subway', 40, '2023-10-03'),
(305, 'Babu', 'Pizza Point', 20, '2023-10-02'),
(306, 'Babu', 'Spice Grill', 22, '2023-10-04'),
(307, 'Shyam', 'Delhi Darbar', 50, '2023-10-05'),
(308, 'Shyam', 'China Gate', 55, '2023-10-06'),
(309, 'Raju', 'Subway', 28, '2023-10-07'),
(310, 'Babu', 'KFC', 18, '2023-10-08');
/*
Write a CTE named agent_stats that calculates each agent's average delivery time across all
their deliveries. 
Using the CTE result, apply RANK() OVER (ORDER BY avg_delivery_time ASC) to rank agents
from fastest to slowest. 
Add a scalar subquery to compute the overall platform average delivery time, then use CASE
WHEN in the final SELECT to label each agent 'On Track' if their average is at or below the
platform average, or 'Needs Improvement' if it is above. */
WITH agent_stats AS (
    SELECT 
        agent_name, 
        AVG(delivery_time_mins) AS avg_delivery_time
    FROM deliveries
    GROUP BY agent_name
)
SELECT 
    agent_name,
    avg_delivery_time,
    RANK() OVER (ORDER BY avg_delivery_time ASC) AS speed_rank,
    (SELECT AVG(delivery_time_mins) FROM deliveries) AS platform_avg_time,
    CASE 
        WHEN avg_delivery_time <= (SELECT AVG(delivery_time_mins) FROM deliveries) THEN 'On Track'
        ELSE 'Needs Improvement'
    END AS performance_status
FROM agent_stats;


 -- Section C  —  Mini Capstone Project
 
/*Design a schema with at least four related tables: customers, restaurants, orders, and
delivery_agents. Define appropriate PRIMARY KEY and FOREIGN KEY constraints and insert at
least 10 rows per table with realistic food delivery data across at least 3 cities.*/

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE delivery_agents (
    agent_id INT PRIMARY KEY,
    agent_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    agent_id INT,
    order_amount DECIMAL(10,2),
    order_date DATE,
    delivery_time_mins INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
    FOREIGN KEY (agent_id) REFERENCES delivery_agents(agent_id)
);

INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Aarav', 'Mumbai'), (2, 'Ishita', 'Pune'), (3, 'Kabir', 'Delhi'),
(4, 'Myra', 'Mumbai'), (5, 'Sunil', 'Pune'), (6, 'Pooja', 'Delhi'),
(7, 'Riya', 'Mumbai'), (8, 'Karan', 'Pune'), (9, 'Neha', 'Delhi'), (10, 'Vikram', 'Mumbai');

INSERT INTO restaurants (restaurant_id, restaurant_name, city) VALUES
(1, 'Spice Grill', 'Mumbai'), (2, 'Burger Hub', 'Pune'), (3, 'Delhi Darbar', 'Delhi'),
(4, 'Pizza Point', 'Mumbai'), (5, 'China Gate', 'Pune'), (6, 'Punjabi Dhaba', 'Delhi'),
(7, 'Cafe Mocha', 'Mumbai'), (8, 'Taco Bell', 'Pune'), (9, 'Subway', 'Delhi'), (10, 'KFC', 'Mumbai');

INSERT INTO delivery_agents (agent_id, agent_name, city) VALUES
(1, 'Raju', 'Mumbai'), (2, 'Suresh', 'Pune'), (3, 'Babu', 'Delhi'),
(4, 'Shyam', 'Mumbai'), (5, 'Mohan', 'Pune'), (6, 'Hari', 'Delhi'),
(7, 'Ganesh', 'Mumbai'), (8, 'Ramesh', 'Pune'), (9, 'Vijay', 'Delhi'), (10, 'Ajay', 'Mumbai');


INSERT INTO orders (order_id, customer_id, restaurant_id, agent_id, order_amount, order_date, delivery_time_mins) VALUES
(101, 1, 1, 1, 1200.00, '2026-08-10', 30),
(102, 2, 2, 2, 2500.00, '2026-08-11', 45),
(103, 3, 3, 3, 5500.00, '2026-08-12', 25),
(104, 4, 1, 4, 1500.00, '2026-08-13', 35),
(105, 5, 5, 5, 800.00, '2026-08-14', 40),
(106, 6, 6, 6, 3000.00, '2026-08-10', 20),
(107, 7, 1, 7, 1800.00, '2026-08-15', 30),
(108, 8, 8, 8, 400.00, '2026-08-15', 50),
(109, 9, 9, 9, 6000.00, '2026-08-14', 28),
(110, 10, 1, 10, 2000.00, '2026-08-15', 32); 
/*
Write a revenue report query using GROUP BY, HAVING, and aggregate functions (SUM, COUNT,
AVG) that returns total orders and total revenue per restaurant, filtered to include only
restaurants with more than 3 orders.*/

SELECT 
    c.customer_name,
    SUM(o.order_amount) AS total_spend,
    CASE 
        WHEN SUM(o.order_amount) > 5000 THEN 'Platinum'
        WHEN SUM(o.order_amount) >= 2000 AND SUM(o.order_amount) <= 5000 THEN 'Gold'
        ELSE 'Standard'
    END AS customer_tier
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spend DESC;
/*
Write a customer segmentation query using CASE WHEN to classify each customer as
'Platinum' (spend above Rs 5,000), 'Gold' (Rs 2,000–Rs 5,000), or 'Standard' (below Rs 2,000)
based on their total spend, ordered from highest to lowest spender.*/

WITH RestaurantRevenue AS (
    SELECT 
        r.city, 
        r.restaurant_name, 
        SUM(o.order_amount) AS total_revenue
    FROM restaurants r
    JOIN orders o ON r.restaurant_id = o.restaurant_id
    GROUP BY r.city, r.restaurant_id, r.restaurant_name
),
RankedRestaurants AS (
    SELECT 
        city, 
        restaurant_name, 
        total_revenue,
        DENSE_RANK() OVER (PARTITION BY city ORDER BY total_revenue DESC) AS city_rank
    FROM RestaurantRevenue
)
SELECT * FROM RankedRestaurants WHERE city_rank <= 3;

/*
Write a window function query using DENSE_RANK() OVER (PARTITION BY city ORDER BY
total_revenue DESC) to identify the top 3 performing restaurants in each city, and a separate
query using ROW_NUMBER() to find each customer's single most recent order.*/

WITH RecentOrders AS (
    SELECT 
        customer_id, 
        order_id, 
        order_date,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS recent_rank
    FROM orders
)
SELECT 
    c.customer_name, 
    ro.order_id, 
    ro.order_date
FROM RecentOrders ro
JOIN customers c ON ro.customer_id = c.customer_id
WHERE ro.recent_rank = 1;

/*
Create a SQL VIEW named vw_daily_order_summary that JOINs all four tables and returns:
order_date, customer_name, restaurant_name, agent_name, order_amount, and
delivery_time_mins. Query the view to display only orders placed in the last 7 days.
-- Create the View
CREATE VIEW vw_daily_order_summary AS
SELECT 
    o.order_date,
    c.customer_name,
    r.restaurant_name,
    da.agent_name,
    o.order_amount,
    o.delivery_time_mins
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
JOIN delivery_agents da ON o.agent_id = da.agent_id;

-- Query the View for orders in the last 7 days
SELECT * 
FROM vw_daily_order_summary
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY);

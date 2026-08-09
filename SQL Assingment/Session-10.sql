/*
1.
Create two tables: AppOrders (for orders placed via a food delivery app like Zomato) and InStoreOrders 
(for direct restaurant orders), each with columns: order_id, customer_name, amount, and order_date. Insert at least 3 sample records into each table.*/

CREATE TABLE AppOrders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    amount DECIMAL(8, 2),
    order_date DATE
);

CREATE TABLE InStoreOrders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    amount DECIMAL(8, 2),
    order_date DATE
);

INSERT INTO AppOrders (order_id, customer_name, amount, order_date) VALUES
(101, 'Rahul', 350.00, '2026-07-25'),
(102, 'Priya', 450.00, '2026-07-25'),
(103, 'Amit', 150.00, '2026-07-25');

INSERT INTO InStoreOrders (order_id, customer_name, amount, order_date) VALUES
(201, 'Neha', 800.00, '2026-07-25'),
(202, 'Rahul', 250.00, '2026-07-25'),
(203, 'Karan', 600.00, '2026-07-25');


/*
2.
Write a SQL query using UNION to combine all unique customer names from both AppOrders and InStoreOrders tables into a single list.*/
SELECT customer_name FROM AppOrders
UNION
SELECT customer_name FROM InStoreOrders;
/*
3.
Write a SQL query using UNION ALL to display every order (including duplicates if any) from 
both AppOrders and InStoreOrders, showing order_id, customer_name, amount, and order_date.*/

SELECT order_id, customer_name, amount, order_date FROM AppOrders
UNION ALL
SELECT order_id, customer_name, amount, order_date FROM InStoreOrders;


/*
4.
Demonstrate the difference between UNION and UNION ALL by adding a duplicate customer_name in both tables,
 then running both queries and noting the difference in the result count.<br><br><em><strong>
 Hint:</strong> UNION removes duplicates, UNION ALL does not.</em>*/
 
 -- By looking at the outputs above, the difference is clear:
/*
UNION removes duplicates: When we pulled just the customer_name using UNION, the database saw that 'Rahul' was in both lists.
 It deleted the second 'Rahul' to give a clean, unique list of 5 customers.*/
/*
UNION ALL keeps everything: When we pulled the full order details using UNION ALL, the database did no filtering.
 It simply appended the 3 in-store orders directly below the 3 app orders, resulting in all 6 rows being displayed exactly as they exist in the database. */
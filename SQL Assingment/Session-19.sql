/*1.
Run a SELECT query on a large 'orders' table (at least 10,000 rows) to find all orders for a specific user_id and measure the query execution time.*/
CREATE TABLE large_orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

DELIMITER //
CREATE PROCEDURE PopulateOrders()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 10000 DO
        -- Random user_id between 1 and 500
        INSERT INTO large_orders (user_id, order_date, total_amount) 
        VALUES (FLOOR(1 + RAND() * 500), CURRENT_DATE, RAND() * 1000);
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

CALL PopulateOrders();

SELECT * FROM large_orders WHERE user_id = 45;
/*
2.
Create an index on the user_id column of the 'orders' table and re-run the same SELECT query to measure the new execution time
.<br><br><em><strong>Hint:</strong> Use CREATE INDEX idx_user_id ON orders(user_id); and compare the times before and after.</em> */
CREATE INDEX idx_user_id ON large_orders(user_id);
SELECT * FROM large_orders WHERE user_id = 45;
SELECT * FROM large_orders WHERE user_id = 45;
/*
3.
Use the EXPLAIN PLAN command to analyze how your SELECT query runs before and after adding the index, and write down the key differences you observe in the output. */
EXPLAIN SELECT * FROM large_orders WHERE user_id = 45;
/*
4.
Write a query for a 'products' table that avoids a full table scan by using an index on the 'category' column to fetch all products in a specific category. */
CREATE TABLE products_catalog (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50)
);

CREATE INDEX idx_category ON products_catalog(category);

INSERT INTO products_catalog (product_id, name, category) VALUES
(1, 'Laptop', 'Electronics'),
(2, 'T-Shirt', 'Clothing'),
(3, 'Smartphone', 'Electronics');

SELECT product_id, name 
FROM products_catalog 
WHERE category = 'Electronics';
/*
5.
Suppose your SELECT query on the 'orders' table is still slow even after adding an index. Use EXPLAIN PLAN and research at least one 
more optimization technique (other than indexing) using an AI tool like ChatGPT or Copilot, and describe how you would apply it. */

SELECT order_date FROM large_orders WHERE user_id = 45;
CREATE INDEX idx_user_date ON large_orders(user_id, order_date);
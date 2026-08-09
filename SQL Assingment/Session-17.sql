/*
1.
Write an SQL query using CASE WHEN to classify orders in a 'FoodOrders' table as 'Small', 'Medium', or 'Large' based on the total_amount: 'Small' 
for less than 300, 'Medium' for 300 to 999, and 'Large' for 1000 and above.*/
CREATE TABLE FoodOrders (
    order_id INT PRIMARY KEY,
    total_amount DECIMAL(10, 2)
);

INSERT INTO FoodOrders (order_id, total_amount) VALUES
(1, 150.00),
(2, 550.00),  
(3, 1200.00); 

SELECT 
    order_id, 
    total_amount,
    CASE 
        WHEN total_amount < 300 THEN 'Small'
        WHEN total_amount BETWEEN 300 AND 999 THEN 'Medium'
        ELSE 'Large'
    END AS order_size
FROM FoodOrders;
/*
2.
Given a 'Movies' table with a 'rating' column (out of 10), write an SQL query that adds a new column 'popularity' which shows 'Blockbuster' for 
ratings 8 and above, 'Hit' for 5 to 7.9, and 'Average' for below 5 using CASE WHEN ELSE END.*/


CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100),
    rating DECIMAL(3, 1)
);

INSERT INTO Movies (movie_id, title, rating) VALUES
(1, 'Dangal', 8.4),       -- Blockbuster
(2, 'Ra.One', 4.7),       -- Average
(3, 'Singham', 6.8);      -- Hit

SELECT 
    title, 
    rating,
    CASE 
        WHEN rating >= 8.0 THEN 'Blockbuster'
        WHEN rating >= 5.0 THEN 'Hit'
        ELSE 'Average'
    END AS popularity
FROM Movies;


/*
3.
For a 'FlipkartProducts' table with a 'price' column, write an SQL query to create a 'price_category' column that bins prices as 'Budget'
 (below 500), 'Standard' (500 to 2000), and 'Premium' (above 2000) using CASE WHEN.*/
 
CREATE TABLE FlipkartProducts (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO FlipkartProducts (product_id, name, price) VALUES
(101, 'Wired Earphones', 299.00),
(102, 'Smartwatch', 1500.00),
(103, 'Smartphone', 15000.00);

SELECT 
    name, 
    price,
    CASE 
        WHEN price < 500 THEN 'Budget'
        WHEN price <= 2000 THEN 'Standard'
        ELSE 'Premium'
    END AS price_category
FROM FlipkartProducts;
 
 
/*
4.
Write an SQL query for a 'SpotifyTracks' table that uses CASE WHEN to assign a 'duration_label' column: 'Short' for tracks under 180 seconds, 
'Medium' for 180-300 seconds, and 'Long' for over 300 seconds.<br><br><em><strong>Hint:</strong> Use multiple WHEN conditions to cover all possible durations.</em>*/

CREATE TABLE SpotifyTracks (
    track_id INT PRIMARY KEY,
    name VARCHAR(100),
    duration_sec INT
);

INSERT INTO SpotifyTracks (track_id, name, duration_sec) VALUES
(1, 'Jingle', 45),           
(2, 'Shape of You', 233),    
(3, 'Bohemian Rhapsody', 354);

SELECT 
    name, 
    duration_sec,
    CASE 
        WHEN duration_sec < 180 THEN 'Short'
        WHEN duration_sec BETWEEN 180 AND 300 THEN 'Medium'
        WHEN duration_sec > 300 THEN 'Long'
    END AS duration_label
FROM SpotifyTracks;
/* 1.Write an SQL query using the SUM() function to calculate the total amount spent by users on food orders 
in a table food_orders (columns: order_id, user_id, amount) — imagine it's like Zomato's order history. */

CREATE TABLE food_orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(8, 2)
);

INSERT INTO food_orders (order_id, user_id, amount) VALUES
(1, 101, 350.50),
(2, 102, 120.00),
(3, 101, 450.00),
(4, 103, 850.75),
(5, 102, 210.00);

SELECT user_id , SUM(amount) AS total_spent 
FROM food_orders
GROUP BY user_id;

-- 2.Using the COUNT() function, find out how many songs a user has added to their playlist in a table spotify_playlists (columns: playlist_id, user_id, song_id).
CREATE TABLE spotify_playlists (
    playlist_id INT,
    user_id INT,
    song_id INT
);

INSERT INTO spotify_playlists (playlist_id, user_id, song_id) VALUES
(1, 101, 5001), 
(1, 101, 5002), 
(2, 102, 5003), 
(1, 101, 5004), 
(3, 103, 5001), 
(2, 102, 5005);

SELECT user_id, COUNT(song_id) AS total_songs 
FROM spotify_playlists 
GROUP BY user_id;

/*
3.Write an SQL query to get the average rating given to a movie in a table bookmyshow_reviews (columns: review_id, movie_id, rating),
and round the result to 1 decimal place using the ROUND() function.<br><br><em><strong>Hint:</strong> Use AVG() with ROUND() to format the output.</em> */
CREATE TABLE bookmyshow_reviews (
    review_id INT PRIMARY KEY,
    movie_id INT,
    rating DECIMAL(3, 1)
);

INSERT INTO bookmyshow_reviews (review_id, movie_id, rating) VALUES
(1, 101, 4.0),
(2, 101, 5.0),
(3, 101, 4.0), 
(4, 102, 3.0), 
(5, 102, 4.0); 

SELECT 
    movie_id, 
    ROUND(AVG(rating), 1) AS average_rating 
FROM bookmyshow_reviews 
GROUP BY movie_id;
/*
4.
Find the minimum and maximum
transaction values for a user from a table paytm_transactions (columns: txn_id, user_id, amount) — show both the smallest and largest transaction amounts.*/

CREATE TABLE paytm_transactions (
    txn_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(8, 2)
);
INSERT INTO paytm_transactions (txn_id, user_id, amount) VALUES
(1, 101, 15.00),   
(2, 101, 1200.00), 
(3, 102, 50.00),
(4, 101, 450.00),  
(5, 103, 8500.00), 
(6, 102, 10.00);

SELECT 
    user_id, 
    MIN(amount) AS smallest_transaction, 
    MAX(amount) AS largest_transaction
FROM paytm_transactions
GROUP BY user_id;
/*
5.
Given a table myntra_orders (columns: order_id, user_id, total_price), write an SQL query to display the total number of orders, the average 
order value (rounded to 2 decimals), and the highest order value for each user_id.<br><br><em><strong>Constraint:</strong> Use GROUP BY to get results per user.</em> */
CREATE TABLE myntra_orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    total_price DECIMAL(10, 2)
);

INSERT INTO myntra_orders (order_id, user_id, total_price) VALUES
(1, 101, 1500.50), 
(2, 101, 800.00), 
(3, 102, 2500.75), 
(4, 103, 1200.00), 
(5, 101, 350.25),  
(6, 102, 450.00);

SELECT 
    user_id,
    COUNT(order_id) AS total_orders,
    ROUND(AVG(total_price), 2) AS average_order_value,
    MAX(total_price) AS highest_order_value
FROM myntra_orders
GROUP BY user_id;


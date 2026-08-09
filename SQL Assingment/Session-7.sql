/*
1.Write an SQL query to display the total number of orders placed by each user in a 'food_orders' table, grouped by user_id.*/
SELECT user_id, COUNT(order_id) AS total_orders 
FROM food_orders 
GROUP BY user_id;
/*
2.
Using a 'transactions' table with columns (transaction_id, user_id, amount, payment_method),
write an SQL query to show the total amount spent by each payment_method. 
 */
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(50)
);

INSERT INTO transactions (transaction_id, user_id, amount, payment_method) VALUES
(1, 101, 500.00, 'UPI'),
(2, 102, 1200.50, 'Credit Card'),
(3, 103, 350.00, 'Wallet'),
(4, 101, 850.75, 'UPI'),
(5, 104, 2100.00, 'Net Banking'),
(6, 105, 150.00, 'UPI'),
(7, 102, 3400.00, 'Credit Card'),
(8, 106, 450.25, 'Debit Card'),
(9, 103, 120.00, 'Wallet'),
(10, 107, 999.99, 'UPI'),
(11, 108, 5500.00, 'Net Banking'),
(12, 101, 200.00, 'Debit Card'),
(13, 104, 75.50, 'UPI'),
(14, 109, 600.00, 'Credit Card'),
(15, 110, 1050.00, 'Wallet');

SELECT payment_method, SUM(amount) AS total_spent 
FROM transactions 
GROUP BY payment_method;
/*
3.
Given a 'movies' table with columns (movie_id, genre, box_office_collection),
write an SQL query to display each genre and its total box_office_collection, but only show genres
where the total collection is above 10 crore.<br><br><em><strong>Hint:</strong> Use GROUP BY and HAVING together to filter the aggregated results.</em> */ 

CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    genre VARCHAR(50),
    box_office_collection BIGINT
);

INSERT INTO movies (movie_id, genre, box_office_collection) VALUES
(1, 'Action', 80000000),
(2, 'Action', 70000000), 
(3, 'Comedy', 40000000),
(4, 'Comedy', 10000000),  
(5, 'Drama', 120000000),  
(6, 'Horror', 80000000);

SELECT genre, SUM(box_office_collection) AS total_collection
FROM movies
GROUP BY genre
HAVING SUM(box_office_collection) > 100000000;

/*
4.
Suppose you have a 'playlist' table with columns (playlist_id, user_id, song_id, duration).
Write an SQL query to find users who have created playlists with a combined song duration of
more than 2 hours (7200 seconds), showing user_id and total duration. */ 
CREATE TABLE playlist (
    playlist_id INT,
    user_id INT,
    song_id INT,
    duration INT
);

INSERT INTO playlist (playlist_id, user_id, song_id, duration) VALUES
(1, 101, 501, 4000),
(1, 101, 502, 4000),
(2, 102, 503, 3000),
(2, 102, 504, 2000),
(3, 103, 505, 7500);

SELECT user_id, SUM(duration) AS total_duration
FROM playlist
GROUP BY user_id
HAVING SUM(duration) > 7200;
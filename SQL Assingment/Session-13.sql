/*
1.
Create a table called Orders with columns: order_id, user_id, order_amount, and app_name (e.g., 'Zomato', 'Swiggy', 'Flipkart').
 Insert at least 10 sample records with different users and apps. Write an SQL query using the OVER() function to display each order's 
 amount along with the total order amount for all orders.*/
 CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_amount DECIMAL(10, 2),
    app_name VARCHAR(50)
);

INSERT INTO Orders (order_id, user_id, order_amount, app_name) VALUES
(1, 101, 350.00, 'Zomato'),
(2, 102, 1200.00, 'Flipkart'),
(3, 101, 150.00, 'Swiggy'),
(4, 103, 850.00, 'Zomato'),
(5, 102, 400.00, 'Swiggy'),
(6, 104, 250.00, 'Swiggy'),
(7, 101, 600.00, 'Flipkart'),
(8, 105, 1500.00, 'Zomato'),
(9, 103, 200.00, 'Zomato'),
(10, 104, 100.00, 'Swiggy');
 SELECT 
    order_id, 
    user_id, 
    order_amount, 
    app_name,
    SUM(order_amount) OVER() AS total_all_orders
FROM Orders;
 
 /*
2.
Using the Orders table, write an SQL query to show each user's order_id, order_amount, and the average order_amount for that user using the
 OVER(PARTITION BY user_id) clause.<br><br><em><strong>Hint:</strong> Use AVG(order_amount) OVER(PARTITION BY user_id) to get the per-user average.</em>*/
 SELECT 
    order_id, 
    user_id, 
    order_amount,
    AVG(order_amount) OVER(PARTITION BY user_id) AS avg_user_amount
FROM Orders;
 
/* 
3.
Suppose you have a table called Playlist with columns: song_id, user_id, and duration_sec. Write an SQL query to display each song's duration, and the 
total duration of songs added by each user using SUM(duration_sec) OVER(PARTITION BY user_id).*/

CREATE TABLE Playlist (
    song_id INT PRIMARY KEY,
    user_id INT,
    duration_sec INT
);

INSERT INTO Playlist (song_id, user_id, duration_sec) VALUES
(1, 1, 180),
(2, 1, 240), 
(3, 2, 200),
(4, 2, 210),
(5, 3, 300);
SELECT 
    song_id, 
    user_id, 
    duration_sec,
    SUM(duration_sec) OVER(PARTITION BY user_id) AS total_user_duration
FROM Playlist;

/*
4.
Given a table named MovieRatings with columns: rating_id, user_id, movie_name, and rating (1-5), write an SQL query to show each rating, the average 
rating per movie, and the difference between the user's rating and the movie's average rating using window functions.<br><br><em><strong>Hint:</strong>
 Use AVG(rating) OVER(PARTITION BY movie_name) and subtract it from the user's rating.</em>*/
 
 CREATE TABLE MovieRatings (
    rating_id INT PRIMARY KEY,
    user_id INT,
    movie_name VARCHAR(100),
    rating DECIMAL(3, 1)
);

INSERT INTO MovieRatings (rating_id, user_id, movie_name, rating) VALUES
(1, 101, 'Inception', 5.0),
(2, 102, 'Inception', 4.0),
(3, 103, 'Inception', 4.5),  
(4, 101, 'Interstellar', 5.0),
(5, 104, 'Interstellar', 3.0);

SELECT 
    rating_id, 
    user_id, 
    movie_name, 
    rating,
    AVG(rating) OVER(PARTITION BY movie_name) AS avg_movie_rating,
    rating - AVG(rating) OVER(PARTITION BY movie_name) AS rating_difference
FROM MovieRatings;
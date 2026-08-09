/*

1.
Given a table Orders with columns (order_id, user_id, order_date, total_amount), write an SQL query using ROW_NUMBER() to 
assign a unique sequential number to each order per user, ordered by order_date descending.*/

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);
SELECT 
    order_id, 
    user_id, 
    order_date, 
    total_amount,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY order_date DESC) AS order_sequence
FROM Orders;
/*
2.
Suppose you have a table called Songs with columns (song_id, artist, streams). Write an SQL query using RANK() to list each song along with its 
rank based on streams within each artist.*/

CREATE TABLE Song (
    song_id INT PRIMARY KEY,
    artist VARCHAR(50),
    streams BIGINT
);

INSERT INTO Song (song_id, artist, streams) VALUES
(1, 'Arijit Singh', 5000000),
(2, 'Arijit Singh', 5000000),
(3, 'Arijit Singh', 3000000),
(4, 'Ed Sheeran', 8000000),
(5, 'Ed Sheeran', 7500000);

SELECT 
    song_id, 
    artist, 
    streams,
    RANK() OVER(PARTITION BY artist ORDER BY streams DESC) AS song_rank
FROM Song;

/*
3.
For a table named Movies with columns (movie_id, genre, rating), write an SQL query using DENSE_RANK() to assign a rank to each movie within its 
genre based on rating, with the highest rating getting rank 1.*/

CREATE TABLE Movie (
    movie_id INT PRIMARY KEY,
    genre VARCHAR(50),
    rating DECIMAL(3, 1)
);

INSERT INTO Movie (movie_id, genre, rating) VALUES
(1, 'Action', 9.0),
(2, 'Action', 9.0), -- Tie!
(3, 'Action', 8.5),
(4, 'Comedy', 8.8),
(5, 'Comedy', 8.0);

SELECT 
    movie_id, 
    genre, 
    rating,
    DENSE_RANK() OVER(PARTITION BY genre ORDER BY rating DESC) AS movie_rank
FROM Movie;

/*
4.
Imagine a table named Influencers with columns (id, platform, followers). Write an SQL query to display the top 3 influencers per platform using ROW_NUMBER(), 
showing id, platform, followers, and their row number.<br><br><em><strong>Hint:</strong> Use a subquery or CTE to filter for row numbers less than or equal to 3.</em>*/

CREATE TABLE Influencer (
    id INT PRIMARY KEY,
    platform VARCHAR(50),
    followers BIGINT
);

INSERT INTO Influencer (id, platform, followers) VALUES
(1, 'Instagram', 100000),
(2, 'Instagram', 500000),
(3, 'Instagram', 200000),
(4, 'Instagram', 50000),  
(5, 'YouTube', 800000),
(6, 'YouTube', 1200000),
(7, 'YouTube', 300000),
(8, 'YouTube', 100000);

WITH RankedInfluencers AS (
    SELECT 
        id, 
        platform, 
        followers,
        ROW_NUMBER() OVER(PARTITION BY platform ORDER BY followers DESC) AS row_num
    FROM Influencer
)
SELECT 
    id, 
    platform, 
    followers, 
    row_num
FROM RankedInfluencers
WHERE row_num <= 3;
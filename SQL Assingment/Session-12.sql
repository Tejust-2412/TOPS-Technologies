
/*
1.
Write an SQL query using the WITH clause to create a temporary result set called TopArtists that selects 
the top 3 most-followed artists from a table SpotifyArtists (columns: artist_id, name, followers), then select all rows from TopArtists.*/
CREATE TABLE SpotifyArtists (
    artist_id INT PRIMARY KEY,
    name VARCHAR(100),
    followers BIGINT
);

INSERT INTO SpotifyArtists (artist_id, name, followers) VALUES
(1, 'Arijit Singh', 105000000),
(2, 'Taylor Swift', 120000000),
(3, 'Ed Sheeran', 115000000),
(4, 'Badshah', 50000000),
(5, 'Neha Kakkar', 45000000);
WITH TopArtists AS (
    SELECT 
        artist_id, 
        name,
        followers
    FROM SpotifyArtists
    ORDER BY followers DESC
    LIMIT 3
)
SELECT * FROM TopArtists;

/*
2.
Using a table named FlipkartOrders (columns: order_id, user_id, order_date, total_amount), write a query with a CTE called 
MonthlyTotals that calculates the total sales amount for each month in 2023, then select the month with the highest total sales 
from MonthlyTotals.<br><br><em><strong>Hint:</strong> Use EXTRACT(MONTH FROM order_date) or DATE_FORMAT(order_date, '%m') depending on your SQL dialect.</em>*/ 
CREATE TABLE FlipkartOrders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);
INSERT INTO FlipkartOrders (order_id, user_id, order_date, total_amount) VALUES
(1, 101, '2023-01-15', 5000.00),   
(2, 102, '2023-01-28', 3500.00),  
(3, 103, '2023-02-14', 12000.00),  
(4, 101, '2023-10-24', 25000.00),  
(5, 104, '2023-10-31', 8000.00),   
(6, 105, '2022-12-25', 15000.00);


WITH MonthlyTotals AS (
    SELECT EXTRACT(MONTH FROM order_date) AS order_month, SUM(total_amount) AS total_sales
    FROM FlipkartOrders
    WHERE EXTRACT(YEAR FROM order_date) = 2023
    GROUP BY EXTRACT(MONTH FROM order_date)
)
SELECT 
    order_month, 
    total_sales
FROM MonthlyTotals
ORDER BY total_sales DESC
LIMIT 1;
/*
3.
Create a recursive CTE to generate a list of dates for the next 7 days starting from today in a table called CalendarDays 
(columns: day_date).<br><br><em><strong>Hint:</strong> Use UNION ALL inside your CTE and limit recursion to 7 levels.</em> */
WITH RECURSIVE CalendarDays AS (
    SELECT CURRENT_DATE() AS day_date, 1 AS step
    
    UNION ALL
    
    SELECT day_date + INTERVAL 1 DAY, step + 1
    FROM CalendarDays
    WHERE step < 7
)
SELECT day_date FROM CalendarDays;

/*
4.
Given a table called ZomatoRestaurants (columns: id, name, city, rating), use a CTE to find the average rating for each city, then select all 
restaurants in cities where the average rating is above 4.0.*/ 
CREATE TABLE ZomatoRestaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    rating DECIMAL(3, 1)
);

INSERT INTO ZomatoRestaurants (id, name, city, rating) VALUES
(1, 'Honest Restaurant', 'Ahmedabad', 4.5),
(2, 'Manek Chowk Dosa', 'Ahmedabad', 4.1),
(3, 'Burger King', 'Delhi', 3.8),
(4, 'Taco Bell', 'Delhi', 3.6),          
(5, 'Joey Pizza', 'Mumbai', 4.8),
(6, 'Kyani & Co.', 'Mumbai', 4.0);

WITH CityAverage AS (
    SELECT 
        city, 
        AVG(rating) AS avg_city_rating
    FROM ZomatoRestaurants
    GROUP BY city
)

SELECT 
    zr.id, 
    zr.name, 
    zr.city, 
    zr.rating
FROM ZomatoRestaurants zr
JOIN CityAverage ca ON zr.city = ca.city
WHERE ca.avg_city_rating > 4.0;
/*
5.
Use ChatGPT or Copilot to help you write an SQL query with a CTE that, given a table IPLMatches (columns: match_id, team, runs, match_year), 
calculates the total runs scored by each team in 2023 and lists only teams with more than 2000 runs.*/

CREATE TABLE IPLMatches (
    match_id INT PRIMARY KEY,
    team VARCHAR(50),
    runs INT,
    match_year INT
);

INSERT INTO IPLMatches (match_id, team, runs, match_year) VALUES
(1, 'CSK', 210, 2023),
(2, 'CSK', 1850, 2023), 
(3, 'MI', 190, 2023),
(4, 'MI', 1700, 2023),  
(5, 'GT', 2150, 2023),  
(6, 'RCB', 2100, 2022);

WITH TeamRuns2023 AS (SELECT 
        team, 
        SUM(runs) AS total_runs
    FROM IPLMatches
    WHERE match_year = 2023
    GROUP BY team
)
SELECT 
    team, 
    total_runs
FROM TeamRuns2023
WHERE total_runs > 2000;
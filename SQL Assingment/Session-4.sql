-- 1.Write an SQL query to find all restaurants in a table called Restaurants whose names end with 'Cafe' using the LIKE operator.
CREATE TABLE Restaurant (
    id INT,
    name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO Restaurant (id, name, city) VALUES
(1, 'Starbucks Cafe', 'Mumbai'),
(2, 'Burger King', 'Delhi'),
(3, 'Hard Rock Cafe', 'Pune'),
(4, 'Cafe Coffee Day', 'Bangalore'),
(5, 'The Blue Oven', 'Ahmedabad');

SELECT * 
FROM Restaurant
WHERE name LIKE '%Cafe';

-- 2. In a Flipkart-style Products table, use the BETWEEN operator to select all products with a price between 500 and 1500 rupees.


SELECT * 
FROM Products 
WHERE price BETWEEN 500 AND 1500;

-- 3. Write an SQL query to display all users from a Users table whose city is either 'Ahmedabad', 'Surat', or 'Vadodara' using the IN operator.

SELECT * FROM users WHERE city IN ("AHMEDABAD" , "SURAT" , "VADODARA"); 
/*
4.
Given a table called Songs with columns song_name and artist_name, find all songs where the artist_name contains
the letter sequence 'ar' anywhere in the name using the LIKE operator.<br><br><em><strong>Hint:</strong> Use wildcards on both sides of the pattern.</em>
*/
USE assignment ;

CREATE TABLE songs ( 
  id INT ,
  song_name VARCHAR(100) ,
  artist_name VARCHAR(100) 
  );
  
INSERT INTO Songs (id, song_name, artist_name) VALUES
(1, 'Shape of You', 'Ed Sheeran'),
(2, 'Uptown Funk', 'Bruno Mars'),     
(3, 'Starboy', 'The Weeknd'),
(4, 'Attention', 'Charlie Puth'),      
(5, 'Levitating', 'Dua Lipa'),
(6, 'Sugar', 'Maroon 5');

SELECT * 
FROM Songs 
WHERE artist_name LIKE '%ar%';

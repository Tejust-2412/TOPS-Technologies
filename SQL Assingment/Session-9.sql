/*
1.
Create two tables, influencers and brands, with at least 3 sample rows each.
 Use a FULL OUTER JOIN to list all influencers and brands, showing influencer_name and brand_name, matching on city.
 If there is no match, display NULL for the missing side.<br><br><em><strong>Hint:</strong> Use LEFT JOIN, RIGHT JOIN, and
 UNION if your SQL dialect does not support FULL OUTER JOIN directly.</em>
 */
 
CREATE TABLE influencers (
    id INT PRIMARY KEY,
    influencer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE brands (
    id INT PRIMARY KEY,
    brand_name VARCHAR(50),
    city VARCHAR(50)
);


INSERT INTO influencers (id, influencer_name, city) VALUES
(1, 'Rohan', 'Mumbai'),
(2, 'Sneha', 'Delhi'),
(3, 'Aman', 'Bangalore');

INSERT INTO brands (id, brand_name, city) VALUES
(101, 'Boat', 'Mumbai'),
(102, 'Puma', 'Delhi'),
(103, 'Myntra', 'Pune'); 

SELECT i.influencer_name, b.brand_name, i.city
FROM influencers i
LEFT JOIN brands b ON i.city = b.city

UNION

SELECT i.influencer_name, b.brand_name, b.city
FROM influencers i
RIGHT JOIN brands b ON i.city = b.city;
 
 /*
2.
Given a table called playlists with columns (id, playlist_name, parent_playlist_id),
 write a SELF JOIN query to display each playlist alongside its parent playlist's name, similar to how Spotify might nest playlists.*/
 
CREATE TABLE playlists (
    id INT PRIMARY KEY,
    playlist_name VARCHAR(50),
    parent_playlist_id INT
);

INSERT INTO playlists (id, playlist_name, parent_playlist_id) VALUES
(1, 'Workout Mixes', NULL),
(2, 'Cardio Bangers', 1),
(3, 'Heavy Lifting', 1),
(4, 'Chill Vibes', NULL);

SELECT child.playlist_name AS Playlist, parent.playlist_name AS Parent_Playlist
FROM playlists child
LEFT JOIN playlists parent ON child.parent_playlist_id = parent.id;

/*
3.
Create two tables: users and offers. Write a CROSS JOIN query to generate all possible combinations of users and offers,
 displaying user_name and offer_title. Explain in a comment how this could be used for a Flipkart-style personalized offer campaign.*/
 CREATE TABLE flipkart_users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50)
);

CREATE TABLE flipkart_offers (
    offer_id INT PRIMARY KEY,
    offer_title VARCHAR(100)
);

INSERT INTO flipkart_users (user_id, user_name) VALUES 
(1, 'Amit'), 
(2, 'Priya'), 
(3, 'Rahul');

INSERT INTO flipkart_offers (offer_id, offer_title) VALUES 
(101, '10% Off Electronics'), 
(102, 'Buy 1 Get 1 Free on Shoes');

SELECT 
    u.user_name, 
    o.offer_title
FROM flipkart_users u
CROSS JOIN flipkart_offers o;
 
/* 4.
You have an employees table with columns (id, name, manager_id). Write a SELF JOIN to display each employee's
 name along with their manager's name. Then, modify your query to only show employees who do not have a manager (i.e., top-level managers). */


CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees (id, name, manager_id) VALUES
(1, 'Sundar Pichai', NULL),   
(2, 'Satya Nadella', NULL),  
(3, 'Rahul', 1),             
(4, 'Sneha', 2);

SELECT 
    e.name AS Employee, 
    m.name AS Manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.id;

SELECT name AS Top_Level_Managers
FROM employees
WHERE manager_id IS NULL;

/*5.
Use ChatGPT or Copilot to help you write a SQL query that finds all pairs of users from a users table who 
live in the same city (excluding pairs where the user is compared with themselves). Paste the query and briefly describe how the AI helped you improve or debug it.*/

CREATE TABLE city_users (
    id INT PRIMARY KEY,
    user_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO city_users (id, user_name, city) VALUES 
(1, 'Rahul', 'Mumbai'),
(2, 'Neha', 'Delhi'),
(3, 'Amit', 'Mumbai'),
(4, 'Priya', 'Delhi'),
(5, 'Karan', 'Mumbai');

SELECT u1.user_name AS User_1, u2.user_name AS User_2, u1.city
FROM city_users u1
JOIN city_users u2 ON u1.city = u2.city AND u1.id < u2.id;
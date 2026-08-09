-- 1.Install MySQL Community Server on your computer and take a screenshot of the MySQL installer completion window.
--
/*2.Open MySQL Workbench or DB Browser, connect to your local MySQL server, and create a new database called music_streaming_db. */

CREATE DATABASE music_streaming_db ;
/*
3.
Write the SQL command to create a new database named food_delivery_db and execute it in your
 SQL Workbench or DB Browser.<br><br><em><strong>Hint:</strong> Use the CREATE DATABASE statement.</em>
*/

CREATE DATABASE food_delivery_db ;
USE food_delivery_db ;
/*
CREATE DATABASE: These are magic words that tell the computer, "Create a brand new, empty storage box for my project."

food_delivery_db: This is simply the name of your new box. We use underscores (_) instead of spaces because computers understand it better without spaces.

; (Semicolon): This works like a full stop in English. It tells the computer, "My command ends here, go ahead and run it." 
*/

-- 4. List 3 differences between MySQL and PostgreSQL in terms of features or use cases, and give one example of a popular app or company that uses each.
/*

3 Key Differences
Speed vs. Complexity

MySQL is built primarily for speed and simplicity. It is the go-to choice for websites that need to load simple data very quickly, 
like reading blog posts or displaying a basic user profile.

PostgreSQL is built to handle complex math, massive data analysis, and strict data rules. 
If you have extremely complicated queries, PostgreSQL handles the heavy lifting much better.

Handling Flexible Data (JSON)

MySQL is a traditional relational database (strict tables, columns, and rows).
 While it can store JSON data, its features for searching inside that data are somewhat basic.

PostgreSQL has highly advanced JSON capabilities (specifically a format called JSONB). 
This means it can store flexible, unstructured data just like a NoSQL database, giving developers the best of both traditional and modern data storage.

Traffic Jams (Concurrency)

MySQL is lightning-fast when the vast majority of your users are just reading data.

PostgreSQL is better at handling high-traffic situations where thousands of users are reading, writing, and updating data 
at the exact same millisecond. It uses a special system that prevents the database from "locking up" during heavy two-way traffic.
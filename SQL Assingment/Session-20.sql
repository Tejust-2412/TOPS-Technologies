
/*
1.
Download a sample IPL match data CSV file and load it into a new SQL table called ipl_matches using your preferred SQL tool (MySQL Workbench, DBeaver, or Azure Data Studio).*/
CREATE TABLE ipl_matches (
    id INT PRIMARY KEY,
    season INT,
    city VARCHAR(50),
    match_date DATE, 
    team1 VARCHAR(50),
    team2 VARCHAR(50),
    toss_winner VARCHAR(50),
    toss_decision VARCHAR(10),
    result VARCHAR(20),
    dl_applied INT,
    winner VARCHAR(50),
    win_by_runs INT,
    win_by_wickets INT,
    player_of_match VARCHAR(50),
    venue VARCHAR(100),
    umpire1 VARCHAR(50),
    umpire2 VARCHAR(50),
    umpire3 VARCHAR(50)
);
/*
2.
Write a SQL query to select all matches where the team 'Mumbai Indians' played, then export the query results as a CSV file named mi_matches.csv.*/
SELECT * 
FROM ipl_matches 
WHERE team1 = 'Mumbai Indians' OR team2 = 'Mumbai Indians';

/*
3.
Connect Microsoft Excel to your SQL database and import the ipl_matches table. Create a simple table in Excel that shows the total matches played by each team.*/
SELECT team, COUNT(*) as matches_played
FROM (
    SELECT team1 AS team FROM ipl_matches
    UNION ALL
    SELECT team2 AS team FROM ipl_matches
) AS all_teams
GROUP BY team
ORDER BY matches_played DESC;
/*
4.
Connect Power BI Desktop to your SQL database, import the ipl_matches table, and create a pivot chart showing the number of wins for each team.*/


/*
5.
Use Python (with pandas and sqlalchemy) to read the mi_matches.csv file, filter matches where 'Mumbai Indians' won, and insert those rows into a new SQL table 
called mi_wins.<br><br><em><strong>Hint:</strong> Use pandas.read_csv(), DataFrame filtering, and to_sql() for this task.</em>*/
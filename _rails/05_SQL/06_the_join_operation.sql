
# 1.  The first example shows the goal scored by a player with the last name 'Bender'. The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime
SELECT matchid, player FROM goal 
  WHERE teamid LIKE 'Ger'

# 2.  From the previous query you can see that Lars Benders scored a goal in game 1012. Now we want to know what teams were playing in that match.
SELECT DISTINCT id,stadium,team1,team2
  FROM game JOIN goal ON (id=matchid)
 WHERE matchid = 1012

# 3.  Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
Where teamid LIKE 'GER'

# 4.  Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
Where player LIKE 'Mario%'

# 5.  Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam on teamid=id
 WHERE gtime<=10

# 6.  List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
select mdate, teamname
from game JOIN eteam on team1=eteam.id
WHERE eteam.coach LIKE 'Fernando Santos'

# 7.  List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player
FROM game JOIN goal ON id=matchid
WHERE stadium LIKE 'National Stadium, Warsaw'

# 8.  The example query shows all goals scored in the Germany-Greece quarterfinal. Instead show the name of all players who scored a goal against Germany.
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2='GER')
     AND (goal.teamid NOT LIKE 'GER')

# 9.  Show teamname and the total number of goals scored.
SELECT teamname, COUNT(teamid)
  FROM eteam JOIN goal ON id=teamid
 Group BY teamname

#10.  Show the stadium and the number of goals scored in each stadium.
select stadium, count(teamid)
from game JOIN goal ON id=matchid
GROUP BY stadium

#11.  For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid, mdate, COUNT(stadium)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY mdate, matchid

#12.  For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT matchid, mdate, COUNT(teamid)
FROM game JOIN goal ON id=matchid
WHERE goal.teamid = 'GER'
GROUP BY matchid,mdate

#13.  List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises. (INCOMPLETE - 2 rows for Jun 24 and Jun 27 do not show b/c sum=0)
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
  FROM game JOIN goal ON matchid = id
GROUP BY mdate, team1, team2
ORDER BY mdate, matchid, team1, team2





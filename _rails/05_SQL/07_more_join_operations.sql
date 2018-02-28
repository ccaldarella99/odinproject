
# 1.  List the films where the yr is 1962 [Show id, title]
SELECT id, title
 FROM movie
 WHERE yr=1962

# 2.  Give year of 'Citizen Kane'.
SELECT yr
 FROM movie
 WHERE title LIKE 'Citizen Kane'

# 3.  List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
select id, title, yr
from movie
where title LIKE '%Star Trek%'

# 4.  What id number does the actor 'Glenn Close' have?
select id
from actor
where name like 'Glenn Close'

# 5.  What is the id of the film 'Casablanca'
select id
from movie
where title like 'Casablanca'

# 6.  Obtain the cast list for 'Casablanca'.
select DISTINCT name
from actor join casting on id=actorid
where movieid = (select id
from movie
where title like 'Casablanca')

# 7.  Obtain the cast list for the film 'Alien'
select DISTINCT name
from actor join casting on id=actorid
where movieid = (select id
from movie
where title like 'Alien')

# 8.  List the films in which 'Harrison Ford' has appeared
select title
from movie join casting on id=movieid
where actorid = (select id
from actor
where name like 'Harrison Ford')

# 9.List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
select title
from movie join casting on id=movieid
where actorid = (select id
from actor
where name like 'Harrison Ford') AND ord>1

#10.  List the films together with the leading star for all 1962 films.
select DISTINCT movie.title, actor.name
from movie join casting on movie.id=movieid JOIN actor on actor.id=actorid
where yr=1962
and casting.ord=1

#11.  Which were the busiest years for 'John Travolta', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
)

#12.  List the film title and the leading actor for all of the films 'Julie Andrews' played in. Did you get "Little Miss Marker twice"?
SELECT movie.title, actor.name
FROM movie JOIN casting ON (movie.id=movieid AND ord=1) JOIN actor ON (actor.id=actorid)
WHERE movieid IN (
SELECT movieid
FROM casting
WHERE actorid IN (
SELECT actor.id
FROM actor
WHERE actor.name LIKE 'Julie Andrews'))

#13.  Obtain a list, in alphabetical order, of actors who have had at least 30 starring roles.
SELECT actor.name
  FROM actor
  WHERE actor.name IN (
    SELECT (CASE WHEN COUNT(actorid) >= 30 THEN actor.name END)
    FROM actor JOIN casting on (actor.id=actorid) 
    WHERE ord=1
    GROUP BY actor.name 
    ORDER BY actor.name)

#14.  List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT title, COUNT(actorid) AS NumActors
FROM movie JOIN casting ON (movie.id=movieid)
WHERE yr=1978
GROUP BY title
ORDER BY NumActors DESC, title


#15.  List all the people who have worked with 'Art Garfunkel'. 
SELECT actor.name
  FROM actor JOIN casting ON (actor.id=actorid)
  WHERE movieid IN (
    SELECT movieid
      FROM casting
      WHERE actorid = (
        SELECT actor.id
          FROM actor
          WHERE name LIKE 'Art Garfunkel'))
  AND name NOT LIKE 'Art Garfunkel'




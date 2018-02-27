
# 1.  List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

# 2.  Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
Per Capita GDP
SELECT name
  FROM world
 WHERE continent LIKE 'Europe'
  AND gdp/population >
  (SELECT gdp/population as pcgdp from world where name LIKE 'United Kingdom')


# 3.  List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
select name, continent
from world
where continent LIKE (select continent from world where name LIKE 'Argentina')
or continent LIKE (select continent from world where name LIKE 'Australia')
ORDER BY name

# 4.  Which country has a population that is more than Canada but less than Poland? Show the name and the population.
select name, population from world
where population > (select population from world where name LIKE 'canada')
and population < (select population from world where name LIKE 'Poland')

# 5.  Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.
select name, concat(Round(100*population/(select population from world where name LIKE 'Germany'), 0),'%') AS population
  from world
 where continent LIKE 'Europe'

# 6.  Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
select name
  From world
 where gdp > ALL(select gdp from world where continent LIKE 'Europe' and gdp>0 order by gdp desc)

# 7.  Find the largest country (by area) in each continent, show the continent, the name and the area:
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

# 8.  List each continent and the name of the country that comes first alphabetically.
select continent, name from world x
  WHERE name <= ALL
(select name from world y where x.continent=y.continent)

# 9.  Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
select name, continent, population
from world as new
where (select max(population)
  from world
 where continent = new.continent)<=25000000

#10.  Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
select name, continent 
from world as x
where population >= 3 * (select population 
from world
where continent = x.continent and name <> x.name
order by population desc
limit 1)




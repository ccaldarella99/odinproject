
# 1.  Show the total population of the world. world(name, continent, area, population, gdp)
SELECT SUM(population)
FROM world

# 2.  List all the continents - just once each.
select DISTINCT continent
from world

# 3.  Give the total GDP of Africa
select sum(gdp)
from world
where continent like 'Africa'

# 4.  How many countries have an area of at least 1000000
select Count(name)
from world
where area >= 1000000

# 5.  What is the total population of ('Estonia', 'Latvia', 'Lithuania')
select sum(population)
from world 
where name in ('Estonia', 'Latvia', 'Lithuania')

# 6.  For each continent show the continent and number of countries.
select continent, count(name) as 'number of countries'
from world
Group by continent

# 7.  For each continent show the continent and number of countries with populations of at least 10 million.
select continent, count(name) as 'number of countries'
from world
Where population >= 10000000
Group by continent

# 8.  List the continents that have a total population of at least 100 million. 
SELECT continent
FROM world
Group by continent
HAVING sum(population) >100000000



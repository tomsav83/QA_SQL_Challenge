USE world;

-- Using COUNT, get the number of cities in the USA.

SELECT COUNT(ID)
FROM city
JOIN country ON country.`code`=city.CountryCode
WHERE country.Name="United States";

-- 274


-- Find out the population and life expectancy for people in Argentina.

SELECT Population, LifeExpectancy
FROM country
WHERE`name`="Argentina";

-- 37032000, 75.1


-- Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?

SELECT `name`, LifeExpectancy
FROM country
WHERE LifeExpectancy IS NOT NULL
ORDER BY LifeExpectancy DESC
LIMIT 5;

-- Andorra 83.5


-- Using JOIN ... ON, find the capital city of Spain.

SELECT city.`name`
FROM city
JOIN country ON country.capital=city.ID
WHERE country.`name`="spain";

-- Madrid


-- Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.

SELECT DISTINCT countrylanguage.`language`
FROM countrylanguage
JOIN country ON country.`code`=countrylanguage.CountryCode
WHERE country.region="southeast asia";


-- Using a single query, list 25 cities around the world that start with the letter F.

SELECT *
FROM world.city
WHERE `name`
LIKE 'F%'
LIMIT 25;



-- Using COUNT and JOIN ... ON, get the number of cities in China.

SELECT COUNT(ID)
FROM city
JOIN country ON country.`code`=city.CountryCode
WHERE country.Name="china";

-- 363


-- Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.

SELECT `name`population
FROM country
WHERE population IS NOT NULL 
AND population > 0
ORDER BY `name`
LIMIT 1;

-- Afghanistan


-- Using aggregate functions, return the number of countries the database contains.

SELECT COUNT(`name`) 
FROM country;

-- 239


-- What are the top ten largest countries by area?

SELECT `name`, SurfaceArea
FROM country
ORDER BY SurfaceArea DESC
LIMIT 10;

-- List the five largest cities by population in Japan.

SELECT city.`name`
FROM city
JOIN country ON country.`code`=city.CountryCode
WHERE country.name="japan"
ORDER BY city.population DESC
LIMIT 5;

-- Tokyo, Jokohama [Yokohama], Osaka, Nagoya, Sapporo


-- List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!

SELECT `name`, `code`
FROM country
WHERE HeadOfState="Elisabeth II";


-- List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.



-- List every unique world language.

SELECT DISTINCT `language`
FROM countrylanguage;


-- List the names and GNP of the world's top 10 richest countries.

SELECT `name`, GNP
FROM country
ORDER BY GNP DESC
LIMIT 10;


-- List the names of, and number of languages spoken by, the top ten most multilingual countries.

select COUNT(country.`name`), country.`name`
from countrylanguage
JOIN country ON countrylanguage.CountryCode=Country.`code`
GROUP BY country.`name`
ORDER BY COUNT(country.`name`) DESC
LIMIT 10;


-- List every country where over 50% of its population can speak German.

select country.`name`
from countrylanguage
JOIN country ON countrylanguage.CountryCode=Country.`code`
WHERE countrylanguage.`language`="German" AND countrylanguage.Percentage >50;

-- Which country has the worst life expectancy? Discard zero or null values.

SELECT country.`name`, lifeExpectancy
FROM country
WHERE lifeExpectancy IS NOT NULL
AND lifeExpectancy !=0
ORDER BY lifeExpectancy ASC
LIMIT 1;

-- List the top three most common government forms.

select COUNT(GovernmentForm)
FROM country
GROUP BY GovernmentForm
ORDER BY Count(GovernmentForm) DESC
LIMIT 3;



-- How many countries have gained independence since records began?

select COUNT(`name`)
FROM Country
WHERE IndepYear;

-- 192
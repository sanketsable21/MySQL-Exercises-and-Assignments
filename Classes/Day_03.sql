-- Single Line Comment

/*
Multi 
Line
Comments
*/

-- Database related queries

create database Travel_Agent;
show databases;

create database if not exists Travel_Agent21;
drop database Travel_Agent;
drop database if exists Travel_Agent21;

use Travel_Agent;

/*
Clauses are components of a SQL statement that specify the actions to be performed on the data in a database.
Each clause serves a specific purpose and helps to define the structure and behaviour of the SQL query.
Clauses can be combined to create complex queries that retrieve, manipulate or manage data.

the main clauses in MySQL include:
SELECT: Retrieves data from a database table.
FROM: Specifies the table(s) to retrieve data from.
WHERE: Filters data bases on one or more columns.
GROUP BY: Group data based on one or more columns.
HAVING: Filters grouped data based on conditions.
ORDER BY: Sorts data in ascending or descending order.
LIMIT: Limits the number of rows returned.

1. WHERE Clause
The WHERE clause is used to filter records in a table based on specific conditions.
It is typically used with SELECT, UPDATE, and DELETE statements.

Syntax:

SELECT column1, column2
FROM table_name
WHERE condition;

2. Distinct Clause
The DISTINCT Clause is used to return unique values from a column by removing duplicates in the result set.

Syntax:

SELECT DISTINCT column 1
FROM table_name;

3. FROM Clause
The FROM Clause specifies the table or tables from which the data is retrieved.
It is mandatory part of SELECT statement and can also be used with joins for combining data from multiple tables

Syntax:
 SELECT column1, column2
 FROM table_name;
 
 4. ORDER BY Clause
 The ORDER BY Clause is used to sort the result set in ascending (ASC) or descending(DESC) order based on one or more columns.
 
 Syntax:
 
 SELECT column1, column2
 FROM table_name
 ORDER BY column_name[ASC|DESC];
 
 5. GROUP BY Clause
 The GROUP BY Clause groups rows with the same value into summary rows,
 often used with aggregate functions(e.g., COUNT, SUM, AVG).
 
 Syntax:
 
 SELECT column1, aggregate_funtion(column2)
 FROM table_name
 GROUP BY column1;
 
 6. HAVING Clause
 The HAVING Clause is used to filter grouped data after the GROUP By clause.
 It works similarly to the WHERE clause but is applied to aggregated results.

-- Table 01--------------------
-- Create the Contries Table
 
 SELECT Query:
 The SELECT Statement is used to retrieve data from a database table.
 It allows you to specify the columns you want to fetch and apply conditions to filter the results.
 
 Syntax:
 SELECT column1, column2,...
 FROM table_name
 WHERE condition;
 
 */
 
-- Table Queries-------------------------------

-- Data Definition Language(DDL){Create, Alter, Drop, Truncate, Rename, Comment}
-- Data Manipulation Language(DML){Insert, Update, Delete}
-- Data Query Language(DQL){Select Query}

-- Table-1
-- Create the countries table
create table countries (
-- unique identifier for each country
id int primary key auto_increment,
-- Name of the country
name varchar(50) not null, -- unique,
-- Description of the country
description text,
-- Capital city of the country
capital_city varchar(50) not null,
-- Currency of the country
currency varchar(20) not null
);

-- Insert records into the countries table
INSERT INTO countries (name, description, capital_city, currency) VALUES
('United States', 'A country in North America known for its diverse culture and economy.', 'Washington, D.C.', 'USD'),
('Canada', 'A country in North America known for its natural beauty and multicultural society.', 'Ottawa', 'CAD'),
('United Kingdom', 'A country in Europe consisting of England, Scotland, Wales, and Northern Ireland.', 'London', 'GBP'),
('Australia', 'A country and continent surrounded by the Indian and Pacific oceans.', 'Canberra', 'AUD'),
('Germany', 'A country in Central Europe known for its history, culture, and engineering.', 'Berlin', 'EUR'),
('France', 'A country in Western Europe known for its art, fashion, and cuisine.', 'Paris', 'EUR'),
('Japan', 'An island country in East Asia known for its technology and traditional culture.', 'Tokyo', 'JPY'),
('India', 'A country in South Asia known for its rich history and diverse culture.', 'New Delhi', 'INR'),
('Brazil', 'The largest country in South America known for its Amazon rainforest and carnival festival.', 'Brasília', 'BRL'),
('South Africa', 'A country at the southern tip of Africa known for its varied topography and cultural diversity.', 'Pretoria', 'ZAR');

-- 1. Select all columns from the Countries table
select * from countries;

-- 2. Select specific columns
select name, capital_city from countries;

-- 3. Select a country by name
select * from countries where name = 'India';

-- 4. Select countries with a specific currency
select * from countries where currency = 'EUR';

-- 5. Count the number of countries
select count(*) as total_countries from countries;

-- 6. Select countries with the description containing a specific word 
select * from countries where description like '%culture%';

-- 7. Select countries order by name
select * from countries order by name;

-- 8. Select countries with a Capital City starting with 'B'
select * from countries where capital_city like 'B%';

-- 9. Select countries with more than 50 Charactes in Description
select * from countries where char_length(description) > 50;

-- 10. Select the first 5 countries
select * from countries limit 5;

-- 11. Select countries with a currency name longer than 3 characters
select * from countries where char_length(currency) > 3;

-- 12. Select countries with a description that does not contain 'country'
select * from countries where description not like '%country%';

-- 13. Select the country with the longest name 
select * from countries order by char_length(name) desc limit 1;

-- 14. Select countries with a description containing 'known'
select * from countries where description like '%known%';

-- 15. Select countries with a capital city that is not 'ottawa'
select * from countries where capital_city != 'Ottawa';

-- 16. Select the total number of unique currencies
select count(distinct currency) as unique_currencies from countries; 

-- 17. Select countries with names that have more than 6 characters
select * from countries where char_length(name) > 6;

-- 18. Select countries ordered by currency 
select * from countries order by currency;

-- 19. Select Countries with a Description that is Not NULL
SELECT * FROM countries WHERE description IS NOT NULL;

-- 20. Select Countries with a Capital City Containing 'a'
SELECT * FROM countries WHERE capital_city LIKE '%a%';

 
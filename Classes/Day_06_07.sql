-- Create the airline database if it does not already exist
CREATE DATABASE IF NOT EXISTS Airline;
USE Airline; -- Set the context to the airline database

-- Function

/*
Functions in MYSQL are predefined operations that can be used to perform calculations, manipulating data, and retrive specific information. 
These functions make it easier to work strings, numbers, dates, and more.
Functions ------ 1. Built-in functions (sum(),avg(),count()....)
				 2. User defined functions.
                 
They are categorized as follows based on their functionality:



1. String FuNctions
These functions are used to manipulate and process string data.

LENGTH(str): Returns the length of a string.
CONCAT(str1, str2, ...): Concatenates two or more strings.

UPPER(str) : Converts a string to uppercase.

LOWER(str) : Converts a string to lowercase.

SUBSTRING(str, start, length): Returns a substring from a string.



2. Numeric Functions
These functions perform operations on numeric data.

ROUND(number, decimals): Rounds a number to a specified number of decimal places.

FLOOR(number): Returns the largest integer less than or equal to a number.

CEIL(number): Returns the smallest integer greater then or equal to a number.

ABS(number): Returns the absolute value of a number.



3. Date and Time Functions
These functions are used to manipulate and format date and time values.

NOW(): Returns the current date and time.

CURDATE(): Returns the current date. 

DATE_FORMAT(date, format): Formats a date according to a specified format.

DATEDIFF(date1, date2): Reurns the difference in days between two dates.	



4. Aggregate Functions
These functions perform calculations on a set of values and return a single value.

COUNT(expression): Returns the number of rows that match a specified condition.

SUM(column): Returns the sum of numeric column.

AVG(column): Returns the average value of a numeric column.

MAX(column): Returns the maximum value of a column.

MIN(column): Returns the minimum value of a column.



5. Control Flow Functions
These fumctions allow for conditional logic in SQL queries.

IF(condition, true_value, false_value): Returns one value if the conditions is true and another value if it is false.

CASE: Provides a way to perform conditional logic in a more complex manner.



6. Conversion Functions
These functions convert data from one type to another.

CAST(expression AS type): Converts an expression to a specified data type.

CONVERT(expression, type): Similar to CAST, but with different syntax.



7. JSON Functions
These fumctions are used to work with JSON data types.

JSON_EXTRACT(json_doc,path): Extracts data  from a JSON document.

JSON_ARRAYAGG(value): Aggregates values into a JSON array.



8. User - Defined Functions(UDFs)
MySQL allows users to create their own functions for specific tasks.\
*/

-- Table-1 Create Flights table
CREATE TABLE Flights (
  Flight_ID INT PRIMARY KEY, -- Unique identifier for each flight (Primary Key)
  Flight_Number VARCHAR(10) NOT NULL, -- Flight number (e.g., AA123) (Not Null)
  Departure_Airport VARCHAR(100) NOT NULL, -- Name of the departure airport (Not Null)
  Arrival_Airport VARCHAR(100) NOT NULL, -- Name of the arrival airport (Not Null)
  Departure_Time DATETIME NOT NULL, -- Scheduled departure time (Not Null)
  Arrival_Time DATETIME NOT NULL, -- Scheduled arrival time (Not Null)
  Flight_Duration INT NOT NULL, -- Duration of the flight in minutes (Not Null)
  Seats_Available INT NOT NULL CHECK (Seats_Available >= 0),
  -- Number of available seats (Not Null, must be non-negative)
  Aircraft_Type VARCHAR(50) NOT NULL, -- Type of aircraft used for the flight (Not Null)
  Status ENUM('On Time', 'Delayed', 'Cancelled') NOT NULL DEFAULT 'On Time'
  -- Current status of the flight (Not Null, default is 'On Time')
);


-- Insert Records into Flights Table

INSERT INTO Flights (Flight_ID, Flight_Number, Departure_Airport, Arrival_Airport, Departure_Time, Arrival_Time, Flight_Duration, Seats_Available, Aircraft_Type, Status)
VALUES
(1, 'AI101', 'Delhi (DEL)', 'Mumbai (BOM)', '2023-10-01 06:00:00', '2023-10-01 08:00:00', 120, 50, 'Boeing 737', 'On Time'),
(2, 'AI102', 'Mumbai (BOM)', 'Delhi (DEL)', '2023-10-01 09:00:00', '2023-10-01 11:00:00', 120, 60, 'Airbus A320', 'On Time'),
(3, 'AI103', 'Delhi (DEL)', 'Bangalore (BLR)', '2023-10-01 07:00:00', '2023-10-01 09:30:00', 150, 70, 'Boeing 737', 'On Time'),
(4, 'AI104', 'Bangalore (BLR)', 'Delhi (DEL)', '2023-10-01 10:00:00', '2023-10-01 12:30:00', 150, 80, 'Airbus A320', 'On Time'),
(5, 'AI105', 'Delhi (DEL)', 'Chennai (MAA)', '2023-10-01 08:00:00', '2023-10-01 10:30:00', 150, 40, 'Boeing 737', 'On Time'),
(6, 'AI106', 'Chennai (MAA)', 'Delhi (DEL)', '2023-10-01 11:00:00', '2023-10-01 13:30:00', 150, 50, 'Airbus A320', 'On Time'),
(7, 'AI107', 'Delhi (DEL)', 'Kolkata (CCU)', '2023-10-01 09:00:00', '2023-10-01 11:30:00', 150, 30, 'Boeing 737', 'On Time'),
(8, 'AI108', 'Kolkata (CCU)', 'Delhi (DEL)', '2023-10-01 12:00:00', '2023-10-01 14:30:00', 150, 20, 'Airbus A320', 'On Time'),
(9, 'AI109', 'Delhi (DEL)', 'Hyderabad (HYD)', '2023-10-01 10:00:00', '2023-10-01 12:30:00', 150, 60, 'Boeing 737', 'On Time'),
(10, 'AI110', 'Hyderabad (HYD)', 'Delhi (DEL)', '2023-10-01 13:00:00', '2023-10-01 15:30:00', 150, 50, 'Airbus A320', 'On Time'),
(11, 'AI111', 'Delhi (DEL)', 'Pune (PNQ)', '2023-10-01 14:00:00', '2023-10-01 16:00:00', 120, 40, 'Boeing 737', 'On Time'),
(12, 'AI112', 'Pune (PNQ)', 'Delhi (DEL)', '2023-10-01 17:00:00', '2023-10-01 19:00:00', 120, 30, 'Airbus A320', 'On Time'),
(13, 'AI113', 'Delhi (DEL)', 'Ahmedabad (AMD)', '2023-10-01 15:00:00', '2023-10-01 17:00:00', 120, 50, 'Boeing 737', 'On Time'),
(14, 'AI114', 'Ahmedabad (AMD)', 'Delhi (DEL)', '2023-10-01 18:00:00', '2023-10-01 20:00:00', 120, 40, 'Airbus A320', 'On Time'),
(15, 'AI115', 'Delhi (DEL)', 'Jaipur (JAI)', '2023-10-01 16:00:00', '2023-10-01 17:30:00', 90,  60, 'Boeing 737', 'On Time');

SELECT * FROM flights;


-- select, alter, delete, update queries

-- Mysql Alias

/*
In MySQL, an alias is a temporary name assigned to a table or a column for the duration of a query (within the scope of a query). 
Aliases are primarily used to enhance the readability and clarity of SQL statements, making it easier for users to understand the purpose of the data being retrieved or manipulated.

Key Points about MySQL Aliases:

1. Temporary Nature:
Aliases exist only for the duration of the query. Once the query execution is complete,
the alias ceases to exist.

2. Improved Readability:
By using aliases, you can simplify complex column names or provide more meaningful names that better describe the data. This is particularly useful when dealing with 
long or complicated column names.

Syntax:

For column aliases, the syntax is:

SELECT column_name AS alias_name
FROM table_name;

For table aliases, the syntax is:

SELECT column_name 
FROM table_name AS alias_name;

3. Usage in Queries:
Aliases can be used in various SQL statements, including SELECT, UPDATE and DELETE.
They can also be used in conjuction with aggregate functions, joins and subqueries.

4. No Impact on Database Structure:
Using an alias does not change the actual table or column names in the database;
it only affects how they are referenced in the query.

*/

-- Table Alias 
SELECT f.Flight_ID, f.Flight_Number, f.Departure_Airport, f.Arrival_Airport 
FROM Flights f;

-- Column Alias
SELECT f.Flight_ID AS ID, f.Flight_Number AS Num, f.Departure_Airport AS Departure,
f.Arrival_Airport AS Arrival FROM Flights f;


-- 1. WHERE Clause Queries
 
 -- Select flights that are delayed
 SELECT * FROM Flights WHERE Status = 'Delayed';
 
 -- Select flights departing from Delhi
 SELECT * FROM Flights WHERE Departure_Airport = 'Delhi (DEL)';
 
 -- Select flights arriving in Mumbai
 SELECT * FROM Flights WHERE Arrival_Airport = 'Mumbai (BOM)';
 
 -- Select flights with a duration greater than 120 minutes
 SELECT * FROM Flights WHERE Flight_Duration > 120;
 
 -- Select flights with available seats less than 30
 SELECT * FROM Flights WHERE Seats_Available < 30;
 
 -- Select flights that departed after a specific date
 SELECT * FROM Flights WHERE Departure_Time > '2023-10-01 00:00:00';
 
 -- Select flights with a specific flight number
 SELECT * FROM Flights WHERE Flight_Number = 'AI101';
 
 -- Select flights that are either cancelled or delayed
SELECT * FROM Flights WHERE Status IN ('Cancelled', 'Delayed');

-- Select flights with a flight duration between 90 and 150 minutes
SELECT * FROM Flights WHERE Flight_Duration BETWEEN 90 AND 150;

-- Select flights with more than 50 available seats
SELECT * FROM Flights WHERE Seats_Available > 50;


-- 2. DISTINCT Clause Queries 

SELECT * FROM Flights;

-- select distinct aircraft types used in flights
SELECT DISTINCT Aircraft_type FROM Flights;

-- select distinct departure airports
SELECT DISTINCT Departure_Airport FROM Flights;

-- select distinct arrival airports
SELECT DISTINCT Arrival_Airport FROM Flights;

-- select distinct flight statuses
SELECT DISTINCT Status FROM Flights;

-- Select distinct flight numbers
SELECT DISTINCT Flight_Number FROM Flights;

-- Select distinct combinations of departure and arrival airports
SELECT DISTINCT Departure_Airport, Arrival_Airport FROM Flights;

-- Select distinct flight durations
SELECT DISTINCT Flight_Duration FROM Flights;

-- Select distinct departure times
SELECT DISTINCT Departure_Time FROM Flights;

-- Select distinct arrival times
SELECT DISTINCT Arrival_Time FROM Flights;

-- Select distinct seat availability counts
SELECT DISTINCT Seats_Available FROM Flights;


-- 3. FROM Clause Queries

-- Select all records from Flights table
SELECT * FROM Flights;

-- Select flight numbers and statuses from Flights table
SELECT Flight_Number, Status FROM Flights;

-- Select departure and arrival airports from Fligths table
SELECT Departure_Airport, Arrival_Airport FROM Flights;

-- Select flight ID and duration from Flights table
SELECT Flight_ID , Flight_Duration FROM Flights;

-- select allcolumns from Flights table where status is 'On Time'
SELECT * FROM Flights WHERE Status = 'On Time';

-- Select all flights with a specific aircraft type
SELECT * FROM Flights WHERE Aircraft_Type = 'Boeing 737';

-- Select all flights departing after a specific time
SELECT * FROM Flights WHERE Departure_Time > '2023-10-01 12:00:00';

-- Select all flights arriving in a specific city
SELECT * FROM Flights WHERE Arrival_Airport = 'Chennai (MAA)';

-- Select all flights with available seats greater than 40
SELECT * FROM Flights WHERE Seats_Available > 40;

-- Select all flights with a specific flight duration
SELECT * FROM Flights WHERE Flight_Duration = 120;


-- 4. ORDER BY Clause Queries

-- select all flights ordered by Departure_Time
SELECT * FROM Flights ORDER BY  Departure_Time;

-- select all flights ordered by Flight_Duration in descending order
SELECT * FROM Flights ORDER BY Flight_Duration DESC;

-- Select all flights ordered by Seat_Available
SELECT * FROM Flights ORDER BY Seats_Available;

-- select all flights oedered by Status and then Departure_Time
SELECT * FROM Flights ORDER BY Status, Departure_Time;  -- Only 1st attribute is done

-- select all flights ordered by Arrival_Airport
SELECT * FROM Flights ORDER BY Arrival_Airport;

-- Select all flights ordered by Flight_Number in descending order
SELECT * FROM Flights ORDER BY Flight_Number DESC;

-- Select all flights ordered by Departure_Airport and then by Flight_Duration
SELECT * FROM Flights ORDER BY Departure_Airport, Flight_Duration;

-- Select all flights ordered by Arrival_Time in descending order
SELECT * FROM Flights ORDER BY Arrival_Time DESC;

-- Select all flights ordered by Flight_ID
SELECT * FROM Flights ORDER BY Flight_ID;

-- Select all flights ordered by Arrival_Time
SELECT * FROM Flights ORDER BY Arrival_Time;


-- 5. GROUP BY Clause Queries

-- Count flights grouped by status
SELECT Status, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Status;

-- Group Flights by Departure_Airport and count them
SELECT Departure_Airport, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Departure_Airport;

-- Group flights by Arrival_Airport and count them
SELECT Arrival_Airport, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Arrival_Airport;

-- Group flights by Aircraft_Type and calculate average duration
SELECT Aircraft_Type, AVG (Flight_Duration) AS AverageDuration FROM Flights GROUP BY Aircraft_Type;

-- Group flights by Flight_Number and count them
SELECT Flight_Number, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Flight_Number;

-- Group flights by Departure_Airport and calculate total available seats
SELECT Departure_Airport, SUM(Seats_Available) AS TotalSeats FROM Flights GROUP BY Departure_Airport;

-- Group flights by status and calculate maximum duration
SELECT Status, MAX(Flight_Duration) AS MaxDuration FROM Flights GROUP BY Status;

-- Group by flights by Arrival_Airport and calculate minimum duration
SELECT Arrival_Airport, MIN(Flight_Duration) AS MinDuration FROM Flights GROUP BY Arrival_Airport;

-- group flights by Departure_Airport and calculate average available seats
SELECT Departure_Airport, AVG(Seats_Available) as AverageSeats FROM Flights group by Departure_Airport;

-- group flights by aircraft type and count distinct statuses
SELECT Aircraft_Type, COUNT(Distinct Status) AS DistinctStatusCount FROM Flights GROUP BY Aircraft_Type;


-- 6. HAVING Clause Queries

-- select statuses with more than 5 flights
SELECT Status, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Status HAVING COUNT(*) > 5;

-- select departure airports with more than 3 flights
SELECT Departure_Airport, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Departure_Airport HAVING COUNT(*) > 3;

-- select aircraft types with an average flight duration greater than 120 minutes
SELECT Aircraft_Type, AVG(Flight_Duration) AS AverageDuration FROM Flights GROUP BY Aircraft_Type HAVING AVG(Flight_Duration) > 120; 

-- Select arrivala airports with less than 2 flights
SELECT Arrival_Airport, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Arrival_Airport HAVING COUNT(*) < 2;

-- Select statuses with a total available seats greater than 200
SELECT Status, SUM(Seats_Available) AS TotalSeats FROM Flights GROUP BY Status HAVING SUM(Seats_Available) > 200;

-- Select flight number with more than 1 occurrence
SELECT Flight_Number, COUNT(*) AS Occurrences FROM Flights GROUP BY Flight_Number HAVING COUNT(*) > 1;

-- Select departure airports with an average available seat count less than 50
SELECT Departure_Airport, AVG(Seats_Available) AS AverageSeats FROM Flights GROUP BY Departure_Airport 
HAVING AVG(Seats_Available) < 50;

-- Select aircraft types with a maximum flight duration of less than 150 minutes
SELECT Aircraft_Type, MAX(Flight_Duration) AS MaxDuration FROM Flights GROUP BY Aircraft_Type HAVING 
MAX(Flight_Duration) < 150;

-- Select statuses with a count of flights equal to 1
SELECT Status, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Status HAVING COUNT(*) = 1;

-- Select arrival airports with an average flight duration greater than 100 minutes
SELECT Arrival_Airport, AVG(Flight_Duration) AS AverageDuration FROM Flights GROUP BY Arrival_Airport 
HAVING AVG(Flight_Duration) > 100;



-- 7. LIMIT Clause Queries

/*

In MySQL, the LIMIT clause is used to restrict the number of rows returned by a query. 
Unlike some other SQL databases (e.g., SQL Server or PostgreSQL) that use TOP or FETCH, 
MySQL exclusively supports LIMIT. 

Syntax for LIMIT

SELECT column1, column2, ...
FROM table_name
LIMIT [offset,] row_count;

Key Components

1. row_count: Specifies the number of rows to return.
2. offset (optional): Specifies the starting point from which rows are returned. If omitted, 
the default is 0 (start from the first row).
3. LIMIT: Used to specify the maximum number of records to return.
4. Using LIMIT with a comma: An alternative way to specify both the offset and the limit in a single clause.
5. ROW_COUNT(): While not directly applicable, you can use SQL_CALC_FOUND_ROWS and FOUND_ROWS() to get the 
total count of rows.

*/

SELECT * FROM Flights LIMIT 5;

SELECT * FROM Flights LIMIT 5 OFFSET 2;

-- SELECT THE FIRST 10 FLIGHTS ORDERD BY DEPARTURE_TIME
SELECT * FROM Flights ORDER BY Departure_Time LIMIT 10;

-- SELECT THE LAST 3 FLIGHTS BASED ON FLIGHT_ID
SELECT * FROM Flights ORDER BY Flight_ID DESC LIMIT 3;

-- SELECT THE FIRST 7 FLIGHTS THAT ARE DELAYED
SELECT * FROM Flights WHERE Status = 'Delayed' LIMIT 7;

-- SELECT THE FIRST 5 FLIGHTS DEPARTING FROM DELHI
SELECT * FROM FlightS WHERE Departure_Airport = 'Delhi (DEL)' LIMIT 5;

-- SELECT THE FIRST 10 FLIGHTS WITH AVAILABLE SEATS GREATER THEN 50
SELECT * FROM Flights WHERE Seats_Available > 50 LIMIT 10;

-- Select the first 5 flights arriving in Mumbai
SELECT * FROM Flights WHERE Arrival_Airport = 'Mumbai (BOM)' LIMIT 5;

-- Select the first 10 flights with a flight duration greater than 120 minutes
SELECT * FROM Flights WHERE Flight_Duration > 120 LIMIT 10;

-- Select the first 5 flights ordered by Flight_Number
SELECT * FROM Flights ORDER BY Flight_Number LIMIT 5;

-- Select the first 3 flights that departed after a specific date
SELECT * FROM Flights WHERE Departure_Time > '2023-10-01 00:00:00' LIMIT 3;

-- Select 5 flights starting from the 10th record (OFFSET)
SELECT * FROM Flights LIMIT 5 OFFSET 10;

-- Select 10 flights starting from the 20th record
SELECT * FROM Flights LIMIT 10 OFFSET 20;

-- Select 3 flights starting from the 5th record
SELECT * FROM Flights LIMIT 3 OFFSET 5;

-- Select 7 flights starting from the 15th record
SELECT * FROM Flights LIMIT 7 OFFSET 15;

-- Select 4 flights starting from the 0th record (first record)
SELECT * FROM Flights LIMIT 4 OFFSET 0;

-- Select 5 flights starting from the 10th record
SELECT * FROM Flights LIMIT 10, 5;  -- This means skip 10 records and then return the next 5

-- Select 10 flights starting from the 20th record
SELECT * FROM Flights LIMIT 20, 10;  -- Skip 20 records and return the next 10

-- Select 3 flights starting from the 5th record
SELECT * FROM Flights LIMIT 5, 3;  -- Skip 5 records and return the next 3

-- Select 7 flights starting from the 15th record
SELECT * FROM Flights LIMIT 15, 7;  -- Skip 15 records and return the next 7

-- Select 4 flights starting from the 0th record (first record)
SELECT * FROM Flights LIMIT 0, 4;  -- Skip 0 records and return the first 4

-- Get the total number of flights and limit the results
SELECT SQL_CALC_FOUND_ROWS * FROM Flights LIMIT 5; 
SELECT FOUND_ROWS();  -- This will return the total number of rows without the LIMIT


-- 8. JOIN Clause

/*
Note - to join 2 or more table their 1 attributes must be common.

INNER JOIN: Returns records that have matching values in both tables.

LEFT JOIN: Returns all records from the left table (Flights) and the matched records from the right 
table (Bookings or Airlines). If there is no match, NULL values are returned for columns from the right table.

RIGHT JOIN: Returns all records from the right table (Bookings) and the matched records from the left table 
(Flights). If there is no match, NULL values are returned for columns from the left table.
*/


-- 9. UNION Clause

/*
The UNION clause is used to combine the results of two or more SELECT statements. Duplicate rows are 
removed by default.
*/



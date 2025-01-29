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



1. String Functions
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

-- 1. SELECT FLIGHTS FROM TWO DIFFERENT DEPARTURE AIRPORTS
SELECT FLIGHT_ID, FLIGHT_NUMBER, DEPARTURE_AIRPORT, ARRIVAL_AIRPORT
FROM FLIGHTS
WHERE DEPARTURE_AIRPORT = 'DELHI (DEL)'
UNION
SELECT FLIGHT_ID, FLIGHT_NUMBER, DEPARTURE_AIRPORT, ARRIVAL_AIRPORT
FROM FLIGHTS
WHERE DEPARTURE_AIRPORT = 'MUMBAI (BOM)';

-- 2. Select All Delayed and Cancelled Flights
SELECT Flight_ID, Flight_Number, Status 
FROM Flights 
WHERE Status = 'Delayed'
UNION
SELECT Flight_ID, Flight_Number, Status 
FROM Flights 
WHERE Status = 'Cancelled';

-- 3. Select Flights with More Than 50 Available Seats
SELECT Flight_ID, Flight_Number, Seats_Available 
FROM Flights 
WHERE Seats_Available > 50
UNION
SELECT Flight_ID, Flight_Number, Seats_Available 
FROM Flights 
WHERE Flight_Duration < 120;  -- Assuming you want to compare with a different condition

-- 4. Select Flights to Chennai and Bangalore
SELECT Flight_ID, Flight_Number, Arrival_Airport 
FROM Flights 
WHERE Arrival_Airport = 'Chennai (MAA)'
UNION
SELECT Flight_ID, Flight_Number, Arrival_Airport 
FROM Flights 
WHERE Arrival_Airport = 'Bangalore (BLR)';

-- 5. Select Flights with Specific Flight Numbers
SELECT Flight_ID, Flight_Number, Departure_Airport 
FROM Flights 
WHERE Flight_Number = 'AI101'
UNION
SELECT Flight_ID, Flight_Number, Departure_Airport 
FROM Flights 
WHERE Flight_Number = 'AI102';

-- 6. Select Flights with a Duration Greater Than 150 Minutes
SELECT Flight_ID, Flight_Number, Flight_Duration 
FROM Flights 
WHERE Flight_Duration > 150
UNION
SELECT Flight_ID, Flight_Number, Flight_Duration 
FROM Flights 
WHERE Status = 'On Time';

-- 7. Select Flights with Arrival in Specific Cities
SELECT Flight_ID, Flight_Number, Arrival_Airport 
FROM Flights 
WHERE Arrival_Airport = 'Hyderabad (HYD)'
UNION
SELECT Flight_ID, Flight_Number, Arrival_Airport 
FROM Flights 
WHERE Arrival_Airport = 'Pune (PNQ)';

-- 8. Select Flights with Specific Statuses
SELECT Flight_ID, Flight_Number, Status 
FROM Flights 
WHERE Status = 'On Time'
UNION
SELECT Flight_ID, Flight_Number, Status 
FROM Flights 
WHERE Status = 'Delayed';

-- 9. Select Flights with Departure After a Specific Time
SELECT Flight_ID, Flight_Number, Departure_Time 
FROM Flights 
WHERE Departure_Time > '2023-10-01 12:00:00'
UNION
SELECT Flight_ID, Flight_Number, Departure_Time 
FROM Flights 
WHERE Departure_Time > '2023-10-01 14:00:00';

-- 10. Select Flights with Different Aircraft Types
SELECT Flight_ID, Flight_Number, Aircraft_Type 
FROM Flights 
WHERE Aircraft_Type = 'Boeing 737'
UNION
SELECT Flight_ID, Flight_Number, Aircraft_Type 
FROM Flights 
WHERE Aircraft_Type = 'Airbus A320';


-- 10. INTO CLAUSE ( MYSQL DOES NOT SUPPORT INTO CLAUSE DIRECTLY IN THIS WAY )

-- CREATE A NEW TABLE TO STORE FLIGHTS WITH LESS THAN 50 AVAILABLE SEATS
SELECT FLIGHT_NUMBER, DEPARTURE_AIRPORT
INTO NEW_FLIGHTS_TABLE
FROM FLIGHTS
WHERE SEATS_AVAILABLE < 50;

-- CREATE A NEW TABLE TO STORE DETAILS OF FLIGHTS THAT ARE DELAYED
SELECT FLIGHT_ID, FLIGHT_NUMBER, ARRIVAL_AIRPORT
INTO DELAYED_FLIGHTS
FROM FLIGHTS
WHERE STATUS = 'DELAYED';

-- Create a new table for flights that use Boeing 737 aircraft
SELECT Flight_Number, Departure_Airport, Arrival_Airport 
INTO Boeing737_Flights 
FROM Flights 
WHERE Aircraft_Type = 'Boeing 737';

-- Create a new table for flights that have a duration greater than 150 minutes
SELECT Flight_Number, Flight_Duration 
INTO Long_Flights 
FROM Flights 
WHERE Flight_Duration > 150;

-- Create a new table for flights departing from Delhi (DEL)
SELECT Flight_Number, Arrival_Airport 
INTO Delhi_Departures 
FROM Flights 
WHERE Departure_Airport = 'Delhi (DEL)';

-- Create a new table for flights that have no available seats
SELECT Flight_Number, Departure_Airport, Arrival_Airport 
INTO Fully_Booked_Flights 
FROM Flights 
WHERE Seats_Available = 0;

-- Create a new table for flights arriving at either Mumbai (BOM) or Chennai (MAA)
SELECT Flight_Number, Arrival_Airport 
INTO Mumbai_Chennai_Arrivals 
FROM Flights 
WHERE Arrival_Airport IN ('Mumbai (BOM)', 'Chennai (MAA)');

-- Create a new table for flights that have a duration of less than 90 minutes
SELECT Flight_Number, Flight_Duration 
INTO Short_Flights 
FROM Flights 
WHERE Flight_Duration < 90;

-- Create a new table for flights that are currently cancelled
SELECT Flight_Number, Departure_Airport, Arrival_Airport 
INTO Cancelled_Flights 
FROM Flights 
WHERE Status = 'Cancelled';

-- -- Create a new table for flights that depart between 2 PM and 4 PM
SELECT Flight_Number, Departure_Time 
INTO Afternoon_Flights 
FROM Flights 
WHERE Departure_Time BETWEEN '2023-10-01 14:00:00' AND '2023-10-01 16:00:00';


-- 11. CASE CLAUSE

SELECT * FROM FLIGHTS;

-- SELECT FLIGHT NUMBERS AND PROVIDE A DESCRIPTIVE STATUS MESSAGE
SELECT FLIGHT_NUMBER,
	CASE 
		WHEN STATUS = 'ON TIME' THEN 'FLIGHT IS ON SCHEDULE'
        WHEN STATUS = 'DELAYED' THEN 'FLIGHT IS DELAYED'
        ELSE 'FLIGHT IS CANCELLED'
	END AS FLIGHT_STATUS
FROM FLIGHTS;

-- SELECT FLIGHT NUMBERS AND CATEGORIZE THEM BASED ON DURATION
SELECT FLIGHT_NUMBER,
	CASE
		WHEN FLIGHT_DURATION < 90 THEN 'SHORT FLIGHT'
        WHEN FLIGHT_DURATION BETWEEN 90 AND 150 THEN 'MEDIUM FLIGHT'
        ELSE 'LONG FLIGHT'
	END AS FLIGHT_CATEGORY
FROM FLIGHTS;

-- Select flight numbers and categorize seat availability
SELECT Flight_Number, 
       CASE 
           WHEN Seats_Available > 50 THEN 'Plenty of Seats Available' 
           WHEN Seats_Available BETWEEN 20 AND 50 THEN 'Limited Seats Available' 
           ELSE 'Almost Full' 
       END AS Seat_Status 
FROM Flights;

-- Select flight numbers and convert flight duration from minutes to hours
SELECT Flight_Number, 
       CASE 
           WHEN Flight_Duration < 60 THEN CONCAT(Flight_Duration, ' minutes') 
           ELSE CONCAT(Flight_Duration / 60, ' hours') 
       END AS Duration 
FROM Flights;

-- Select flight numbers and provide status based on departure time
SELECT Flight_Number, 
       CASE 
           WHEN Departure_Time < NOW() THEN 'Flight has departed' 
           WHEN Departure_Time = NOW() THEN 'Flight is departing now' 
           ELSE 'Flight is scheduled to depart' 
       END AS Departure_Status 
FROM Flights;

-- Select flight numbers and categorize based on aircraft type
SELECT Flight_Number, 
       CASE 
           WHEN Aircraft_Type LIKE 'Boeing%' THEN 'Boeing Aircraft' 
           WHEN Aircraft_Type LIKE 'Airbus%' THEN 'Airbus Aircraft' 
           ELSE 'Other Aircraft' 
       END AS Aircraft_Type_Category 
FROM Flights;

-- Select flight numbers and provide a status message based on flight duration
SELECT Flight_Number, 
       CASE 
           WHEN Flight_Duration < 120 THEN 'Short Trip' 
           WHEN Flight_Duration BETWEEN 120 AND 180 THEN 'Standard Trip' 
           ELSE 'Long Trip' 
       END AS Trip_Length 
FROM Flights;

-- Select flight numbers and provide custom messages based on flight status
SELECT Flight_Number, 
       CASE 
           WHEN Status = 'On Time' THEN 'All systems go!' 
           WHEN Status = 'Delayed' THEN 'Please wait for updates.' 
           WHEN Status = 'Cancelled' THEN 'We apologize for the inconvenience.' 
           ELSE 'Unknown status' 
       END AS Custom_Status_Message 
FROM Flights;

-- Select flight numbers and categorize based on arrival airport
SELECT Flight_Number, 
       CASE 
           WHEN Arrival_Airport = 'Delhi (DEL)' THEN 'Arriving in Capital' 
           WHEN Arrival_Airport = 'Mumbai (BOM)' THEN 'Arriving in Financial Hub' 
           ELSE 'Arriving Elsewhere' 
       END AS Arrival_Category 
FROM Flights;

-- Select flight numbers and provide status based on current time and flight status
SELECT Flight_Number, 
       CASE 
           WHEN Status = 'On Time' AND Departure_Time > NOW() THEN 'On Schedule' 
           WHEN Status = 'Delayed' THEN 'Delayed' 
           WHEN Status = 'Cancelled' THEN 'Cancelled' 
           ELSE 'Flight has already departed' 
       END AS Final_Flight_Status 
FROM Flights;


-- 12. IN CLAUSE

-- SELECT ALL FLIGHTS ARRIVING AT MUMBAI (BOM) OR DELHI (DEL)
SELECT * FROM FLIGHTS
WHERE ARRIVAL_AIRPORT IN ('MUMBAI (BOM)', 'DELHI (DEL)');

-- SELECT ALL FLIGHTS DEPARTING FROM DELHI (DEL), CHENNAI (MAA), OR BANGALORE (BLR)
SELECT * FROM FLIGHTS
WHERE DEPARTURE_AIRPORT IN ('DELHI (DEL)', 'CHENNAI (MAA)', 'BANGALORE (BLR)');

-- Select flights with specific flight numbers AI101, AI102, and AI103
SELECT * 
FROM Flights 
WHERE Flight_Number IN ('AI101', 'AI102', 'AI103');

-- Select all flights that are either Delayed or Cancelled
SELECT * 
FROM Flights 
WHERE Status IN ('Delayed', 'Cancelled');

-- Select flights that use either Boeing 737 or Airbus A320 aircraft
SELECT * 
FROM Flights 
WHERE Aircraft_Type IN ('Boeing 737', 'Airbus A320');

-- Select flights that depart at specific times
SELECT * 
FROM Flights 
WHERE Departure_Time IN ('2023-10-01 06:00:00', '2023-10-01 09:00:00');

-- Select flights that have a duration of either 120 or 150 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration IN (120, 150);

-- Select flights that have either 30 or 50 available seats
SELECT * 
FROM Flights 
WHERE Seats_Available IN (30, 50);

-- Select flights arriving at major cities: Mumbai, Delhi, Kolkata, or Chennai
SELECT * 
FROM Flights 
WHERE Arrival_Airport IN ('Mumbai (BOM)', 'Delhi (DEL)', 'Kolkata (CCU)', 'Chennai (MAA)');

-- Select flights that arrive at specific times
SELECT * 
FROM Flights 
WHERE Arrival_Time IN ('2023-10-01 08:00:00', '2023-10-01 10:30:00');


-- 13. BETWEEN CLAUSE

-- SELECT * FLIGHTS WITH A DURATION BETWEEN 120 AND 150 MINUTES
SELECT * FROM FLIGHTS
WHERE FLIGHT_DURATION BETWEEN 120 AND 150;

-- SELECT FLIGHTS THAT DEPARTS BETWEEN 8 AM AND 12 PM ON OCTOBER 1, 2023
SELECT * FROM FLIGHTS 
WHERE DEPARTURE_TIME BETWEEN '2023-10-01 08:00:00' AND '2023-10-01 12:00:00';

-- Select flights that arrive between 10 AM and 2 PM on October 1, 2023
SELECT * 
FROM Flights 
WHERE Arrival_Time BETWEEN '2023-10-01 10:00:00' AND '2023-10-01 14:00:00';

-- Select flights that have between 20 and 60 available seats
SELECT * 
FROM Flights 
WHERE Seats_Available BETWEEN 20 AND 60;

-- Select flights with Flight_IDs between 5 and 10
SELECT * 
FROM Flights 
WHERE Flight_ID BETWEEN 5 AND 10;

-- Select flights with a duration less than 90 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration < 90;  -- Using < instead of BETWEEN for clarity

-- Select flights that depart between 12 PM and 6 PM on October 1, 2023
SELECT * 
FROM Flights 
WHERE Departure_Time BETWEEN '2023-10-01 12:00:00' AND '2023-10-01 18:00:00';

-- Select flights that arrive between 6 PM and 10 PM on October 1, 2023
SELECT * 
FROM Flights 
WHERE Arrival_Time BETWEEN '2023-10-01 18:00:00' AND '2023-10-01 22:00:00';

-- Select flights with a duration greater than 180 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration > 180;  -- Using > instead of BETWEEN for clarity

-- Select flights that were scheduled to depart between 1 PM and 3 PM
SELECT * 
FROM Flights 
WHERE Departure_Time BETWEEN '2023-10-01 13:00:00' AND '2023-10-01 15:00:00';


-- 14. LIKE CLAUSE

-- SELECT ALL FLIGHTS WHERE THE FLIGHT NUMBER STARTS WITH 'AI'
SELECT * FROM FLIGHTS
WHERE FLIGHT_NUMBER LIKE 'AI%';

-- Select all flights where the flight number ends with '101'
SELECT * 
FROM Flights 
WHERE Flight_Number LIKE '%101';

-- Select all flights where the flight number contains '10'
SELECT * 
FROM Flights 
WHERE Flight_Number LIKE '%10%';

-- Select all flights departing from airports that have 'Delhi' in their name
SELECT * 
FROM Flights 
WHERE Departure_Airport LIKE '%Delhi%';

-- Select all flights arriving at airports that have 'BOM' in their code
SELECT * 
FROM Flights 
WHERE Arrival_Airport LIKE '%BOM%';

-- Select all flights that use aircraft types starting with 'Airbus'
SELECT * 
FROM Flights 
WHERE Aircraft_Type LIKE 'Airbus%';

-- Select all flights where the status contains the word 'Delayed'
SELECT * 
FROM Flights 
WHERE Status LIKE '%Delayed%';

-- Select all flights where the flight number matches the pattern 'AI1__'
-- (where '_' represents a single character)
SELECT * 
FROM Flights 
WHERE Flight_Number LIKE 'AI1__';

-- Select all flights departing from airports that have 'MAA' in their code
SELECT * 
FROM Flights 
WHERE Departure_Airport LIKE '%MAA%';

-- Select all flights arriving at airports that start with the letter 'K'
SELECT * 
FROM Flights 
WHERE Arrival_Airport LIKE 'K%';


-- 15. EXISTS CLAUSE

-- SELECT ALL FLIGHTS WHERE THERE EXISTS AT LEAST ONE CANCELLED FLIGHT TO THE SAME ARRIVAL AIRPORT
SELECT * FROM FLIGHTS F
WHERE EXISTS ( SELECT 1 FROM FLIGHTS WHERE STATUS = 'CANCELLED' AND ARRIVAL_AIRPORT = F.ARRIVAL_AIRPORT );

-- Select all flights where there exists at least one delayed flight from the same departure airport
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Status = 'Delayed' AND Departure_Airport = f.Departure_Airport
);

-- Select all flights where there exists at least one flight to the same destination with available seats
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Arrival_Airport = f.Arrival_Airport AND Seats_Available > 0
);

-- Select all flights where there exists at least one flight departing at the same time
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Departure_Time = f.Departure_Time
);

-- Select all flights where there exists at least one flight using the same aircraft type
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Aircraft_Type = f.Aircraft_Type
);

-- Select all flights where there exists at least one flight arriving at the same airport
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Arrival_Airport = f.Arrival_Airport
);

-- Select all flights where there exists at least one flight scheduled on the same day
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE DATE(Departure_Time) = DATE(f.Departure_Time)
);

-- Select all flights where there exists at least one flight with the same flight number
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Flight_Number = f.Flight_Number
);

-- Select all flights where there exists at least one flight with a similar duration (within 10 minutes)
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE ABS(Flight_Duration - f.Flight_Duration) <= 10
);

-- Select all flights where there exists at least one flight with the same status
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Status = f.Status
);


-- 16. AS CLAUSE

-- CREATE A NEW TABLE WITH FLIGHT DATAILS
CREATE TABLE FLIGHT_SUMMARY AS 
SELECT FLIGHT_ID, FLIGHT_NUMBER, DEPARTURE_AIRPORT, ARRIVAL_AIRPORT
FROM FLIGHTS;

SELECT * FROM FLIGHT_SUMMARY;

-- SELECT FLIGHT_NUMBER AND GIVE THEM A CUSTOM ALIAS
SELECT FLIGHT_NUMBER AS FLIGHTCODE
FROM FLIGHTS;

-- SELECT FLIGHT DURATION IN HOURS AND GIVE IT A CUSTOM ALIAS 
SELECT FLIGHT_NUMBER, FLIGHT_DURATION / 60 AS DURATION_HOURS
FROM FLIGHTS;

-- Select departure and arrival airports with custom aliases
SELECT Departure_Airport AS Departure, Arrival_Airport AS Arrival 
FROM Flights;

-- Select flight status and give it a custom alias
SELECT Flight_Number, Status AS Current_Status 
FROM Flights;

-- Create a new table with average flight duration per departure airport
CREATE TABLE Average_Flight_Duration AS 
SELECT Departure_Airport, AVG(Flight_Duration) AS Average_Duration 
FROM Flights 
GROUP BY Departure_Airport;

-- Select available seats and give it a custom alias
SELECT Flight_Number, Seats_Available AS Available_Seats 
FROM Flights;

-- Select flight ID and aircraft type with custom aliases
SELECT Flight_ID AS ID, Aircraft_Type AS Plane_Type 
FROM Flights;

-- Select flights with custom aliases for departure and arrival times
SELECT Flight_Number, Departure_Time AS Depart_Time, Arrival_Time AS Arrive_Time 
FROM Flights;

-- Create a new table summarizing flight status counts
CREATE TABLE Flight_Status_Summary AS 
SELECT Status AS Flight_Status, COUNT(*) AS Total_Flights 
FROM Flights 
GROUP BY Status;


-- ------------------------------------------------------------TASK------------------------------------------------------------

-- ADD A COLUMN THEN WRITE A QUERY TO ENTER ALL DETAILS AT 1 TIME
ALTER TABLE FLIGHTS ADD FLIGHT_STATUS VARCHAR(20);

SELECT * FROM FLIGHTS;

-- INSERT SAME VALUE IN A TABLE COLUMN 
UPDATE FLIGHTS 
SET FLIGHT_STATUS = 'SCHEDULED'
WHERE FLIGHT_ID IN ( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 );

-- INSERT DIFFERENT VALUE IN A TABLE COUMN
UPDATE FLIGHTS SET FLIGHT_STATUS = 
	CASE
		WHEN FLIGHT_ID IN ( 1, 2, 3 ) THEN 'SCHEDULED'
        WHEN FLIGHT_ID IN ( 4, 5 ) THEN 'DEPARTED'
        WHEN FLIGHT_ID IN ( 6, 11, 13 ) THEN 'ARRIVED'
        WHEN FLIGHT_ID IN ( 7, 12 ) THEN 'DELAYED'
        WHEN FLIGHT_ID IN ( 8, 14, 15 ) THEN 'CANCELLED'
        WHEN FLIGHT_ID IN ( 9 ) THEN 'DIVERTED'
        WHEN FLIGHT_ID IN ( 10 ) THEN 'HELD'
        ELSE 'UNKNOWN'
	END
    WHERE FLIGHT_ID BETWEEN 1 AND 15;
    
    
-- OPERATORS-----------------------------------------------------------------------------
/*
In MySQL, operators are special symbols or keywords that are used to perform operations on one or more operands
 (values or variables). Operators are fundamental to constructing SQL queries, as they allow you to manipulate 
 data, compare values, and perform calculations. MySQL supports several types of operators, which can be 
 categorized as follows:
*/

-- ARITHMETIC OPERATORS: +, -, *, /, %

-- CALCULATE THE TOTAL FLIGHT DURATION FOR FLIGHT AI101, ADDING 30 MINUTES FOR A LAYOVER
SELECT FLIGHT_NUMBER, FLIGHT_DURATION + 30 AS TOTAL_DURATION
FROM FLIGHTS
WHERE FLIGHT_NUMBER = 'AI101';

-- Calculate the remaining seats after booking 10 seats for Flight AI102
SELECT Flight_Number, Seats_Available - 10 AS Remaining_Seats 
FROM Flights 
WHERE Flight_Number = 'AI102';

-- Calculate the total available seats for all flights by summing the Seats_Available column
SELECT SUM(Seats_Available) AS Total_Available_Seats 
FROM Flights;

-- Calculate the average flight duration across all flights
SELECT AVG(Flight_Duration) AS Average_Flight_Duration 
FROM Flights;

-- Calculate the flight duration in hours for each flight
SELECT Flight_Number, Flight_Duration / 60 AS Duration_Hours 
FROM Flights;

-- Calculate the percentage of available seats for each flight based on a total of 100 seats
SELECT Flight_Number, 
       (Seats_Available / 100.0) * 100 AS Percentage_Available 
FROM Flights;

-- Calculate the remaining flight duration after 30 minutes for each flight
SELECT Flight_Number, 
       Flight_Duration - 30 AS Remaining_Duration 
FROM Flights 
WHERE Flight_Duration > 30;  -- Ensure we don't get negative durations

-- Calculate the total number of seats for flights that have more than 50 available seats
SELECT SUM(Seats_Available) AS Total_Seats 
FROM Flights 
WHERE Seats_Available > 50;

-- Calculate the total duration of flights that are delayed
SELECT SUM(Flight_Duration) AS Total_Duration_Delayed 
FROM Flights 
WHERE Status = 'Delayed';

-- Calculate the total flight time for flights departing from Delhi
SELECT SUM(Flight_Duration) AS Total_Flight_Time 
FROM Flights 
WHERE Departure_Airport = 'Delhi (DEL)';

-- Assuming a hypothetical cost of $2 per minute, calculate total cost for each flight
SELECT Flight_Number, 
       Flight_Duration * 2 AS Total_Cost 
FROM Flights;

-- Calculate the total available seats for flights with a duration greater than 120 minutes
SELECT SUM(Seats_Available) AS Total_Seats_Over_120 
FROM Flights 
WHERE Flight_Duration > 120;

-- Calculate remaining seats after booking 5 seats for each flight
SELECT Flight_Number, 
       Seats_Available - 5 AS Remaining_After_Booking 
FROM Flights;

-- Calculate total revenue from flights assuming a ticket price of $100 per seat
SELECT Flight_Number, 
       Seats_Available * 100 AS Total_Revenue 
FROM Flights;

-- Calculate the total flight duration for flights arriving in Mumbai
SELECT SUM(Flight_Duration) AS Total_Duration_Mumbai 
FROM Flights 
WHERE Arrival_Airport = 'Mumbai (BOM)';

-- Calculate the total number of available seats for flights that are on time
SELECT SUM(Seats_Available) AS Total_Seats_On_Time 
FROM Flights 
WHERE Status = 'On Time';

-- Calculate the total flight duration for flights that have more than 100 available seats
SELECT SUM(Flight_Duration) AS Total_Duration_Over_100 
FROM Flights 
WHERE Seats_Available > 100;

-- Calculate the percentage of flights that are delayed compared to total flights
SELECT (COUNT(CASE WHEN Status = 'Delayed' THEN 1 END) * 100) / COUNT(*) AS Percentage_Delayed 
FROM Flights;

-- Calculate the total number of seats for flights with a duration of less than 30 minutes
SELECT SUM(Seats_Available) AS Total_Seats_Under_30 
FROM Flights 
WHERE Flight_Duration < 30; 


-- COMPARISON OPERATOR: =, <, >, <=, >=, != OR <> (NOT EQUAL TO)

-- SELECT ALL DETAILS FOR THE FLIGHT WITH FLIGHT NUMBER 'AI101'
SELECT * 
FROM FLIGHTS
WHERE FLIGHT_NUMBER = 'AI101'; -- USING = OPERATOR

-- SELECT ALL FLIGHTS WITH A DURATION LESS THAN 120 MINUTES
SELECT * 
FROM FLIGHTS 
WHERE FLIGHT_DURATION < 120; -- USING < OPERATOR

-- Select all flights with a duration greater than 150 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration > 150;  -- Using '>' operator

-- Select all flights with a duration less than or equal to 90 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration <= 90;  -- Using '<=' operator

-- Select all flights with a duration greater than or equal to 180 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration >= 180;  -- Using '>=' operator

-- Select all flights that are not arriving at Delhi (DEL)
SELECT * 
FROM Flights 
WHERE Arrival_Airport != 'Delhi (DEL)';  -- Using '!=' operator

-- Select all flights where the status is not equal to 'Cancelled'
SELECT * 
FROM Flights 
WHERE Status <> 'Cancelled';  -- Using '<>' operator

-- Select all flights departing from Mumbai (BOM)
SELECT * 
FROM Flights 
WHERE Departure_Airport = 'Mumbai (BOM)';  -- Using '=' operator

-- Select all flights that have more than 50 available seats
SELECT * 
FROM Flights 
WHERE Seats_Available > 50;  -- Using '>' operator

-- Select all flights that have fewer than 30 available seats
SELECT * 
FROM Flights 
WHERE Seats_Available < 30;  -- Using '<' operator

-- Select all flights that have exactly 60 available seats
SELECT * 
FROM Flights 
WHERE Seats_Available = 60;  -- Using '=' operator

-- Select all flights that do not have a duration of 150 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration != 150;  -- Using '!=' operator

-- Select all flights with a duration greater than 120 and less than 180 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration > 120 AND Flight_Duration < 180;  -- Using '>' and '<' operators

-- Select all flights that are currently 'On Time'
SELECT * 
FROM Flights 
WHERE Status = 'On Time';  -- Using '=' operator

-- Select all flights that arrive after October 1, 2023
SELECT * 
FROM Flights 
WHERE Arrival_Time > '2023-10-01 00:00:00';  -- Using '>' operator

-- Select all flights that depart before October 1, 2023
SELECT * 
FROM Flights 
WHERE Departure_Time < '2023-10-01 00:00:00';  -- Using '<' operator

-- Select all flights that have seats available greater than or equal to 40
SELECT * 
FROM Flights 
WHERE Seats_Available >= 40;  -- Using '>=' operator

-- Select all flights that have seats available less than or equal to 20
SELECT * 
FROM Flights 
WHERE Seats_Available <= 20;  -- Using '<=' operator

-- Select all flights with a duration between 60 and 120 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration >= 60 AND Flight_Duration <= 120;  -- Using '>=' and '<=' operators

-- Select all flights where the status is not equal to 'Delayed'
SELECT * 
FROM Flights 
WHERE Status <> 'Delayed';  -- Using '<>' operator


-- LOGICAL OPERATORS: AND, OR, NOT

-- FIND FLIGHTS FROM DELHI TO MUMBAI THAT ARE ON TIME AND HAVE AVAILABLE SEATS.
SELECT * FROM FLIGHTS
WHERE DEPARTURE_AIRPORT = 'DELHI (DEL)'
AND ARRIVAL_AIRPORT = 'MUMBAI (BOM)'
AND STATUS = 'ON TIME'
AND SEATS_AVAILABLE > 0;

-- FIND FLIGHTS THAT EITHER DEPART FROM DELHI OR ARRIVE DELHI
SELECT * FROM FLIGHTS
WHERE DEPARTURE_AIRPORT = 'DELHI (DEL)'
OR ARRIVAL_AIRPORT = 'DELHI (DEL)';

-- Find flights that are not delayed.
SELECT * FROM Flights 
WHERE NOT Status = 'Delayed';

-- Find all unique arrival airports for flights that are on time and have more than 50 seats available.
SELECT DISTINCT Arrival_Airport FROM Flights 
WHERE Status = 'On Time' 
AND Seats_Available > 50;

-- Find all unique departure airports for flights that are either delayed or cancelled.
SELECT DISTINCT Departure_Airport FROM Flights 
WHERE Status IN ('Delayed', 'Cancelled');

-- Find flights that either depart from Bangalore or arrive in Kolkata, but are not on time.
SELECT * FROM Flights 
WHERE (Departure_Airport = 'Bangalore (BLR)' OR Arrival_Airport = 'Kolkata (CCU)') 
AND NOT Status = 'On Time';

-- Find flights that are on time and have a flight duration of more than 120 minutes.
SELECT * FROM Flights 
WHERE Status = 'On Time' 
AND Flight_Duration > 120;

-- Find flights that are not departing from Delhi and are either arriving in Mumbai or Chennai.
SELECT * FROM Flights 
WHERE NOT Departure_Airport = 'Delhi (DEL)' 
AND (Arrival_Airport = 'Mumbai (BOM)' OR Arrival_Airport = 'Chennai (MAA)');

-- Find flights that are either delayed or cancelled, and have less than 30 seats available.
SELECT * FROM Flights 
WHERE (Status = 'Delayed' OR Status = 'Cancelled') 
AND Seats_Available < 30;

-- Find flights from Delhi to any destination that are either on time or have more than 50 seats available.
SELECT * FROM Flights 
WHERE Departure_Airport = 'Delhi (DEL)' 
AND (Status = 'On Time' OR Seats_Available > 50);


-- STRING OPERATORS: LIKE, REGEXP, NOT LIKE

-- FIND FLIGHTS WITH FLIGHT NUMBERS STARTING WITH AI
SELECT * FROM FLIGHTS
WHERE FLIGHT_NUMBER LIKE 'AI%';

-- FIND FLIGHTS THAT HAVE 'DELHI' IN EITHER THE DEPARTURE OR ARRIVAL AIRPORT.
SELECT * FROM FLIGHTS
WHERE DEPARTURE_AIRPORT REGEXP 'DELHI'
OR ARRIVAL_AIRPORT REGEXP 'DELHI';

-- FIND FLIGHTS THAT DO NOT GO TO CHENNAI.
SELECT * FROM FLIGHTS 
WHERE ARRIVAL_AIRPORT NOT LIKE 'CHENNAI (MAA)';

-- Find flights that do not have '737' in the aircraft type.
SELECT * FROM Flights 
WHERE Aircraft_Type NOT LIKE '%737%';

-- Find flights that have 'Bangalore' in either the departure or arrival airport.
SELECT * FROM Flights 
WHERE Departure_Airport REGEXP 'Bangalore' 
OR Arrival_Airport REGEXP 'Bangalore';
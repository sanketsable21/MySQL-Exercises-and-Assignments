CREATE DATABASE zoom;
USE zoom;

-- User Defined Functions
/*
User-defined functions (UDFs) in MySQL allow you to create your own functions
that can be used in SQL statements, just like built-in functions. UDFs can encapsulate
complex logic, perform calculations, or manipulate data, making your SQL queries
cleaner and more efficient.

To create a user-defined function in MySQL, you use the CREATE FUNCTION statement.

Syntax:

DELIMITER //
CREATE FUNCTION function_name (parameters)
RETURNS return_data_type
DETERMINISTIC
BEGIN

	-- Function logic goes here
    RETURN value;
END
//DELIMITER;

DELIMITER //:
Changes the statement delimiter to // so that MySQL can recognize the end of the function definition.
*/

-- This function adds two integers and returns the sum.
DELIMITER //
CREATE FUNCTION add_numbers (a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN a + b;
END //

DELIMITER ;

-- Use the Function
SELECT add_numbers (5, 10) AS sum; -- Returns 15

-- This function subtract two integers and returns the sub.
DELIMITER //
CREATE FUNCTION sub_numbers (a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN a - b;
END //

DELIMITER ;

-- Use the Functions
SELECT sub_numbers (13, 8) AS sub; -- Returns 5

-- This function multiply two integers and returns the mult.
DELIMITER //
CREATE FUNCTION mult_numbers (a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN a * b;
END //

DELIMITER ;

-- Use the Functions
SELECT mult_numbers (10, 8) AS mult; -- Returns 80

-- This function divide two integers and returns the div.
DELIMITER //
CREATE FUNCTION divi_numbers (a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN a / b;
END //

DELIMITER ;

-- Use the Functions
SELECT divi_numbers (16, 8) AS divi; -- Returns 2
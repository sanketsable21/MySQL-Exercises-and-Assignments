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

-- This function concatenates a first name and a last name into a full name.
DELIMITER //

CREATE FUNCTION full_name(first_name VARCHAR(50), last_name VARCHAR(50))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	RETURN CONCAT(first_name, '  ' , last_name);
END //

DELIMITER ;

-- Use the Function
SELECT full_name('John', 'Doe') AS name; -- Returns 'John Doe'

-- This function calculates the age of a person based on their birthdate.
DELIMITER //

CREATE FUNCTION calculate_age(birthdate DATE)
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN YEAR(CURDATE()) - YEAR (birthdate) - (DATE_FORMAT(CURDATE(), '%m%d')
    < DATE_FORMAT(birthdate, '%m%d'));
END //

DELIMITER ;

-- Use the Function
SELECT calculate_age('2005-05-21') AS age; -- Returns the age based on the current date

-- This functions checks if a number is even or odd
DELIMITER //

CREATE FUNCTION is_even_or_odd(num INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN 
	IF num % 2 = 0 THEN
		RETURN 'EVEN';
	ELSE
		RETURN 'ODD';
	END IF;
END //

DELIMITER ;

-- Use the Function
SELECT is_even_or_odd(7) AS result;  -- odd
SELECT is_even_or_odd(8) AS result; -- even


-- This function calculates the discounted price based on the original price and discount percentage.
DELIMITER //

CREATE FUNCTION discounted_price(original_price DECIMAL (10, 2), discount_percentage DECIMAL (5, 2))
RETURNS DECIMAL (10, 2)
DETERMINISTIC
BEGIN
	RETURN original_price * (1 - discount_percentage / 100);
END //

DELIMITER ;

-- Use the Function
SELECT discounted_price(100, 20) AS final_price; -- Returns 80.00
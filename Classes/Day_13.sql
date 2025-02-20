USE zoom;

-- Stored Procedure
/*
A Stored Procedure is a precompiled collection of one or more SQL statements that can be executed 
as a single unit. Stored procedures are stored in the database and can be called by applications 
or other SQL statements. They help in encapsulating business logic, improving performance, and 
enhancing security by controlling access to data

Types of Stored Procedures
1. Simple Stored Procedures: These perform basic operations like inserting, updating, or deleting records.
2. Parameterized Stored Procedures: These accept parameters to perform operations based on input values.
3. Stored Procedures with Output Parameters: These return values to the caller, allowing for more complex
operations.
4. Stored Procedures with Cursors: These are used to process multiple rows returned by a query one at a time.

Basic Syntax for Creating a Stored Procedure:

DELIMITER //

CREATE PROCEDURE procedure_name (IN parameter_name datatype)

BEGIN
	-- SQL statements
END //

DELIMITER;

*/

-- Create the Stored Procedure:
DELIMITER //

CREATE PROCEDURE GetEmployeesByDepartment (IN dept_id INT)
BEGIN
	SELECT * FROM employees WHERE department_id = dept_id;
END //

DELIMITER ;

select * from employees;

-- call the procedure
CALL GetEmployeesByDepartment(10);

-- drop procedure
DROP PROCEDURE IF EXISTS GetEmployeesByDepartment;

-- Modifying a Stored Procedure:
DELIMITER //

CREATE PROCEDURE GetEmployeesByDepartment (IN dept_id INT)
BEGIN
	SELECT employee_id, first_name FROM employees WHERE department_id = dept_id;
END // 

DELIMITER ;

CALL GetEmployeesByDepartment(30);


/*
Stored Procedures- are best for executing complex logic, managing transactions, and modifying data

Stored Procedures are best for executing complex logic, managing transactions, and modifying data. 

User Defined Functions- are ideal for calculations and transformations that can be reused in SQL expressions. 


When to Use Each---

Use Stored Procedures When: 

1. You need to perform complex operations that involve multiple SQL statements. 
2. You want to manage transactions. 
3. You need to encapsulate business logic that modifies data. 
4. You want to return multiple result sets. 

Use User-Defined Functions When: 

1. You need to perform calculations or transformations that can be reused in SQL queries.
2. You want to return a single value or a table. 
3. You need to use the function in a SELECT statement, WHERE clause, or other SQL expressions. 
/*
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

*/


-- Example of a Stored Procedure
DELIMITER //
CREATE PROCEDURE GetEmployeeDetails(IN empId INT)  -- IN Stand for (input) in the stored procedure...........................................
BEGIN
    SELECT * FROM Employees WHERE Employee_id = empId;
END //
DELIMITER ;

-- Usage:
CALL GetEmployeeDetails(4);

-- Example of a User-Defined Function
DELIMITER //
CREATE FUNCTION GetEmployeeFullName(empId INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE fullName VARCHAR(100);
    SELECT CONCAT(First_name, ' ', Last_name) INTO fullName
    FROM Employees WHERE Employee_ID = empId;
    RETURN fullName;
END //
DELIMITER ;


drop function if exists getemployeefullname;

-- Usage:
SELECT GetEmployeeFullName(1);

select * from employees;

-- Example 1: Simple Stored Procedure
DELIMITER //
CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END //
DELIMITER ;

-- Usage:
CALL GetAllProducts();

-- delete it
DROP PROCEDURE IF EXISTS GetAllProducts;


-- Example 2: Parameterized Stored Procedure
DELIMITER //
CREATE PROCEDURE GetProductsByCategory(IN categoryName VARCHAR(50))
BEGIN
    SELECT * FROM Products WHERE Category = categoryName;
END //
DELIMITER ;

-- Usage:
CALL GetProductsByCategory('Electronics');


-- Example 3: Stored Procedure with Output Parameter
DELIMITER //
CREATE PROCEDURE GetTotalSales(IN productId INT, OUT totalSales DECIMAL(10, 2))
BEGIN
    SELECT SUM(Quantity * Price) INTO totalSales
    FROM Orders
    WHERE ProductID = productId;
END //
DELIMITER ;

select * from Orders;

-- price does not exist in orders table
-- add column price in orders table
-- insert price values according to condition.

-- ALTER TABLE ORDER
ALTER TABLE ORDERS ADD COLUMN PRICE DECIMAL(10,2);

-- UPDATE TABLE ORDERS
UPDATE ORDERS SET PRICE = CASE
WHEN Product_ID = 1 THEN 10.00
    WHEN Product_ID = 2 THEN 15.50
    WHEN Product_ID = 3 THEN 20.00
    WHEN Product_ID = 4 THEN 25.00
    -- Add more conditions as needed
 ELSE 0.00  -- Default price if no condition matches
END;

SET SQL_SAFE_UPDATES=0;

-- Usage:
SET @totalSales = 0;
CALL GetTotalSales(4, @totalSales);
SELECT @totalSales AS TotalSales;  -- Output: Total sales for product with ID 1



-- Example-4 Stored Procedures with Cursors
-- Step 1: Create the Products Table
CREATE TABLE Product1 (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Product VARCHAR(100) NOT NULL
);

-- Step 2: Insert Sample Data
INSERT INTO Product1 (Product) VALUES
('Apple'),
('Banana'),
('Cherry'),
('Date'),
('Elderberry');

select * from product1;


-- Step 3: Create the Stored Procedure
DELIMITER //

CREATE PROCEDURE PrintProductNames()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE product VARCHAR(100);
    DECLARE productCursor CURSOR FOR SELECT Product FROM Product1 WHERE Product IS NOT NULL;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN productCursor;
read_loop: LOOP
        FETCH productCursor INTO product;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT product AS ProductName;  -- Print the product name
    END LOOP;

    CLOSE productCursor;
END //

DELIMITER ;

-- Call the Stored Procedure
CALL PrintProductNames();

-- Drop the Procedure after Execution
DROP PROCEDURE IF EXISTS PrintProductNames;

-- Verify Table Data
SELECT * FROM Product1;

-- Next Examples for better understanding
SELECT * FROM Products;

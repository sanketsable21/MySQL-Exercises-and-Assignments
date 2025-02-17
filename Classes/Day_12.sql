USE zoom;
-- Views, CTE

/*

1. Views
Definition: A view is a virtual table in database that is based on the result of a SELECT query.
It does not store data itself but provides a way to represent data from one or more tables in a 
structure format. Views can simplify complex queries, enhance security by restricting access to 
specific data, and provide a consistent interface of data

Key Features of Views
1. Simplification: Views can simplify complex queries by encapsulating them.
2. Security: They can restrict access to specific rows or columns of data.
3. Reusability: Once created, views can be reused in other queries.

*/

-- Example 1: Employee Management System

-- Step 1: Create the Employee table
CREATE TABLE employee(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    active BOOLEAN NOT NULL,
    status VARCHAR(20) NOT NULL
);

-- Step 2: Insert sample data into employees
INSERT INTO employee (name, position, active, status) VALUES
('John Doe', 'Manager', TRUE, 'active'),
('Jane Smith', 'Developer', TRUE, 'active'),
('Bob Johnson', 'Designer', FALSE, 'inactive');

TRUNCATE employee;

SELECT * FROM employee;

-- Step 3: Create a view for active employee
CREATE VIEW EmployeeView AS
SELECT id, name, position
FROM Employee
WHERE active = 1;

-- Step 4: Use the view
SELECT * FROM EmployeeView;


-- Step 5: Update the view
CREATE OR REPLACE VIEW ActiveEmployees AS
SELECT id, name, position
FROM Employee
WHERE status= 'active';

-- Step 6: Use the updated view
SELECT * FROM ActiveEmployees;

-- Step 7: Delete the view
DROP VIEW IF EXISTS EmployeeView;

-- Optionally, delete the updated view
DROP VIEW IF EXISTS ActiveEmployees;


-- Example 2: Product Management System
-- Step 1: Create the Products Table
CREATE TABLE Products (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL (10, 2) NOT NULL,
    stock INT NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- Step 2: Insert Sample Data into Products
INSERT INTO Products (name, price, stock, category) VALUES 
('Laptop', 999.99, 10, 'Electronics'),
('Smartphone', 499.99, 20, 'Electronics'),
('Desk', 199.99, 15, 'Furniture'),
('Chair', 89.99, 30, 'Furniture'),
('Headphones', 149.99, 25, 'Electronics');

-- Step 3: Create a View for Available Products
CREATE VIEW AvailableProducts AS
SELECT id, name, price, stock
FROM Products
WHERE stock > 0;

-- Step 4: Use the View
SELECT * FROM AvailableProducts;

-- Step 5: Update the View to Include Category
CREATE OR REPLACE VIEW AvailableProductsWithCategory AS
SELECT id, name, price, stock, category
FROM Products
WHERE stock > 0;

-- Step 6: Use the Updated View
SELECT * FROM AvailableProductsWithCategory;

-- Step 7: Delete the Views
DROP VIEW IF EXISTS AvailableProducts;
DROP VIEW IF EXISTS AvailableProductsWithCategory;


/*
2. Common Table Expressions (CTE)
Definition:
A CTE is a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement.
It is defined using the WITH clause.

Key Features of CTEs
1. Readability: CTEs can make complex queries easier to read and maintain.
2. Recursion: CTEs can be recursive, allowing for hierarchical data traversal.
3. Modularity: They can be defined once and referenced multiple times within the same query.
*/

-- Example 1: Employee Management System With CTE
-- Step 3: Use a CTE to get Active Employees
WITH ActiveEmployees AS (
	SELECT id, name, position
    FROM Employee
    WHERE active = 1
)
SELECT * FROM ActiveEmployees;

-- Step 4: Use a CTE to Count Active Employees by Position
WITH ActiveEmployeeCounts AS (
	SELECT position, COUNT(*) AS count
	FROM Employee
	WHERE active = 1
    GROUP BY position
)
SELECT * FROM ActiveEmployeeCounts;

-- Step 5: Use a CTE to Get Inactive Employees
WITH InactiveEmployees AS (
	SELECT id, name, position
	FROM Employee
	WHERE active = 0
)
SELECT * FROM InactiveEmployees;

-- Step 6: Use a CTE to Get Employees with Status Counts
WITH EmployeeStatusCounts AS (
	SELECT status, COUNT(*) AS count
    FROM Employee
    GROUP BY status
)
SELECT * FROM EmployeeStatusCounts;

-- Step 7: Use a CTE to Delete Inactive Employees
WITH InactiveEmployees AS (
	SELECT id
    FROM Employee
    WHERE active = 0
)
DELETE FROM Employee
WHERE id IN (SELECT id FROM InactiveEmployees);

SET SQL_SAFE_UPDATES = 0;


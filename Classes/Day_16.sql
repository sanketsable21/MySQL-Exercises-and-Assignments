use zoom;

-- Window Functions
/*
Definition:
Window functions are a type of SQL function that perform calculations across a set of table rows
that are somehow related to the current row. Unlike regular aggregate functions, which return a single
value for a group of rows, window functions return a value for each row in the result set.

Key Characteristics:
1. They do not collapse rows; each row retains its identity.
2. They are often used for running totals, moving averages, ranking, and other calculations
that require access to multiple rows.

Types of Window Functions :
1. Aggregate Functions: These functions perform calculations across a set of rows and return a single value.
Examples include SUM(), AVG(), COUNT(), etc.

2. Ranking Functions: These functions assign a rank to each row within a partition of a result set.
Examples include ROW_NUMBER(), RANK(), and DENSE_RANK().

3. Value Functions: These functions return a value from a specific row in the result set.
Examples include LEAD(), LAG(), FIRST_VALUE(), and LAST_VALUE().

4. Analytic Functions: These functions perform calculations across a set of rows related to the current row,
similar to aggregate functions but without collapsing the result set. Examples include NTILE().

The general syntax for a window function is as follows:
function_name(column_name) OVER (
    [PARTITION BY partition_expression]
    [ORDER BY order_expression]
    [ROWS or RANGE frame_specification]
)

Note ---
Window functions are powerful tools in SQL that enable advanced data analysis without losing
the context of individual rows. They are particularly useful in reporting and analytical queries.

*/

-- Step 1: Create the emp11 Table
CREATE TABLE emp11 (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Step 2: Insert 10 Records into emp11
INSERT INTO emp11 (employee_name, department, salary) VALUES
('Alice Johnson', 'HR', 60000.00),
('Bob Smith', 'IT', 75000.00),
('Charlie Brown', 'IT', 80000.00),
('David Wilson', 'Finance', 70000.00),
('Eva Green', 'HR', 65000.00),
('Frank White', 'Finance', 72000.00),
('Grace Lee', 'IT', 78000.00),
('Hannah Scott', 'Marketing', 50000.00),
('Ian Black', 'Marketing', 52000.00),
('Jack Brown', 'Finance', 71000.00);               

select * from emp11;

-- Step 3: Write Queries Using Window Functions

-- Example 1: Using ROW_NUMBER()
-- Assign a unique sequential integer to each row within a partition of a result set.
SELECT
    employee_id,
    employee_name,
    department,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS ranks
FROM
    emp11;
    
-- Example 2: Using RANK()
-- Rank employees within each department based on their salary. 
-- If two employees have the same salary, they receive the same rank, and the next rank is skipped.
SELECT
    employee_id,
    employee_name,
    department,
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
FROM
    emp11;
    
-- Example 3: Using DENSE_RANK()
-- Similar to RANK(), but without gaps in the ranking.
SELECT
    employee_id,
    employee_name,
    department,
    salary,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_salary_rank
FROM
    emp11;
   
-- Example 4: Using LAG()
-- Get the salary of the previous employee in the same department.
SELECT
    employee_id,
    employee_name,
     department,
    salary,
    LAG(salary, 1) OVER (PARTITION BY department ORDER BY salary) AS previous_salary
FROM
    emp11;
    
-- Example 5: Using LEAD()
-- Get the salary of the next employee in the same department.
SELECT
    employee_id,
    employee_name,
     department,
    salary,
    LEAD(salary, 1) OVER (PARTITION BY department ORDER BY salary) AS next_salary
FROM
    emp11;
    
-- Example 6: Using SUM()
-- Calculate a running total of salaries within each department.
SELECT
    employee_id,
    employee_name,
     department,
    salary,
    SUM(salary) OVER (PARTITION BY department ORDER BY employee_id) AS running_total
FROM
    emp11;
   
-- Example 7: Using AVG()
-- Calculate the average salary within each department.
SELECT
    employee_id,
    employee_name,
     department,
    salary,
    AVG(salary) OVER (PARTITION BY department) AS average_salary
FROM
    emp11;
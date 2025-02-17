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
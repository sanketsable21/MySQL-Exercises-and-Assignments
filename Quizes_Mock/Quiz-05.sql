/*
1) Create a Database - Travel Agency
2) Create 3 tables using minimum 5 attributes, 10 records, use all possible datatypes & constraints
3) Do proper documentation & avoid internet, discussion or any references
4) Write complex & misileneous queries using these concepts -
	a) ddl, dml, dql, dcl & tcl, operators, indexing, clauses & commands, cascades including all basic operations {20 queries}
    b) Function (built-in & user defined) {10 queries}
    c) Views & CTE {10 queries} 
    d) Stored procedure {5 Queries}
    e) Triggers {5 queries}
    f) Window functions {5 queries}
    g) Joins & Alias {5 queries}
    h) Subqueries {10 queries}
*/

-- Step 1: Create Database--------------------------------------------------------------------------------------------------------------------------
CREATE DATABASE TravelAgency;
USE TravelAgency;

-- Drop Database
DROP TABLE TravelAgency;

-- Step 2: Create Customers Table--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    DOB DATE
);

-- Insert Sample Data into Customers Table
INSERT INTO Customers (FullName, Email, PhoneNumber, DOB) VALUES
('Rahul Sharma', 'rahul.sharma@example.com', '9876543210', '1995-04-15'),
('Priya Singh', 'priya.singh@example.com', '9876543211', '1993-08-22'),
('Amit Mehta', 'amit.mehta@example.com', '9876543212', '1990-06-10'),
('Neha Verma', 'neha.verma@example.com', '9876543213', '1997-02-18'),
('Arjun Rao', 'arjun.rao@example.com', '9876543214', '1992-09-30'),
('Meera Iyer', 'meera.iyer@example.com', '9876543215', '1991-12-25'),
('Suresh Kumar', 'suresh.kumar@example.com', '9876543216', '1989-11-12'),
('Kavita Joshi', 'kavita.joshi@example.com', '9876543217', '1996-07-05'),
('Rohit Bansal', 'rohit.bansal@example.com', '9876543218', '1994-05-20'),
('Anjali Nair', 'anjali.nair@example.com', '9876543219', '1998-01-15');

-- Step 3: Create Packages Table--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Packages (
    PackageID INT PRIMARY KEY AUTO_INCREMENT,  
    PackageName VARCHAR(100) NOT NULL,  
    Destination VARCHAR(100) NOT NULL,  
    Price DECIMAL(10,2) CHECK (Price > 0),  
    DurationDays INT CHECK (DurationDays > 0)  
);

-- Insert Sample Data into Packages Table
INSERT INTO Packages (PackageName, Destination, Price, DurationDays) VALUES
('Goa Beach Tour', 'Goa', 15000.00, 5),
('Manali Adventure', 'Manali', 18000.00, 7),
('Kerala Backwaters', 'Kerala', 20000.00, 6),
('Jaipur Heritage', 'Jaipur', 12000.00, 4),
('Andaman Island', 'Andaman', 25000.00, 7),
('Kashmir Paradise', 'Kashmir', 30000.00, 8),
('Leh-Ladakh Trip', 'Leh-Ladakh', 35000.00, 10),
('Rajasthan Desert Safari', 'Rajasthan', 22000.00, 6),
('Sikkim Himalayan Tour', 'Sikkim', 27000.00, 9),
('Ooty & Kodaikanal', 'Tamil Nadu', 16000.00, 5);

-- Step 4: Create Bookings Table--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,  
    CustomerID INT,  
    PackageID INT,  
    BookingDate DATE,  
    Status ENUM('Confirmed', 'Pending', 'Cancelled') DEFAULT 'Pending',  
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (PackageID) REFERENCES Packages(PackageID) ON DELETE CASCADE
);

-- Insert Sample Data into Bookings Table
INSERT INTO Bookings (CustomerID, PackageID, BookingDate, Status) VALUES
(1, 3, '2025-03-20', 'Confirmed'),
(2, 5, '2025-03-21', 'Pending'),
(3, 1, '2025-03-22', 'Cancelled'),
(4, 4, '2025-03-23', 'Confirmed'),
(5, 2, '2025-03-24', 'Pending'),
(6, 6, '2025-03-25', 'Confirmed'),
(7, 7, '2025-03-26', 'Pending'),
(8, 8, '2025-03-27', 'Cancelled'),
(9, 9, '2025-03-28', 'Confirmed'),
(10, 10, '2025-03-29', 'Pending');

-- Step 5: DDL, DML, DQL, DCL, TCL etc queries--------------------------------------------------------------------------------------------------------------------------

-- 1. Create an Index for Faster Searches
CREATE INDEX idx_customer_email ON Customers (Email);

-- ==============================================================

-- 2. Add a New Column to Customers Table
ALTER TABLE Customers ADD Address VARCHAR(255);

-- ==============================================================

-- 3. Update a Customer's Address
UPDATE Customers SET Address = 'Mumbai, India' WHERE CustomerID = 1;

-- ==============================================================

-- 4. Select Customers Who Have Confirmed Bookings
SELECT c.FullName, c.Email FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
WHERE b.Status = 'Confirmed';

-- ==============================================================

-- 5. Count Total Bookings for Each Package
SELECT p.PackageName, COUNT(b.BookingID) AS TotalBookings
FROM Packages p
LEFT JOIN Bookings b ON p.PackageID = b.PackageID
GROUP BY p.PackageName;

-- ==============================================================

-- 6. Delete a Customer and Cascade Bookings
DELETE FROM Customers WHERE CustomerID = 3;

-- ==============================================================

-- 7. Grant Select Permission to a User
GRANT SELECT ON TravelAgency.* TO 'readonly_user'@'localhost';

-- ==============================================================

-- 8. Revoke Permissions
REVOKE SELECT ON TravelAgency.* FROM 'readonly_user'@'localhost';

-- ==============================================================

-- 9. Show Bookings Made in March 2025
SELECT * FROM Bookings WHERE BookingDate BETWEEN '2025-03-01' AND '2025-03-31';

-- ==============================================================

-- 10. Find Most Expensive Package
SELECT * FROM Packages ORDER BY Price DESC LIMIT 1;

-- ==============================================================

-- 11. Start Transaction for Booking Cancellation
START TRANSACTION;
UPDATE Bookings SET Status = 'Cancelled' WHERE BookingID = 2;
COMMIT;

-- ==============================================================

-- 12. Rollback a Change
START TRANSACTION;
UPDATE Bookings SET Status = 'Pending' WHERE BookingID = 5;
ROLLBACK;

-- ==============================================================

-- 13. View Customer Booking Details
CREATE VIEW CustomerBookings AS
SELECT c.FullName, p.PackageName, b.BookingDate, b.Status
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
JOIN Packages p ON b.PackageID = p.PackageID;

-- ==============================================================

-- 14. Find Customers Without Bookings
SELECT * FROM Customers WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Bookings);

-- ==============================================================

-- 15. Drop the View
DROP VIEW CustomerBookings;

-- ==============================================================

-- 16. Find total number of bookings
SELECT COUNT(*) AS TotalBookings FROM Bookings;

-- ==============================================================

-- 17. Find the average price of all packages
SELECT AVG(Price) AS AveragePackagePrice FROM Packages;

-- ==============================================================

-- 18. Get customers born before the year 1995
SELECT * FROM Customers WHERE YEAR(DOB) < 1995;

-- ==============================================================

-- 19. Find packages that cost more than 20000
SELECT * FROM Packages WHERE Price > 20000;

-- ==============================================================

SET SQL_SAFE_UPDATES=0;

-- 20. Update all bookings with 'Pending' status to 'Confirmed'
UPDATE Bookings SET Status = 'Confirmed' WHERE Status = 'Pending';

-- ==============================================================

-- 21. Delete bookings made before 2025-03-25
DELETE FROM Bookings WHERE BookingDate < '2025-03-25';


-- Step 6: Function (built-in & user defined)--------------------------------------------------------------------------------------------------------------------------

-- 1. Total Number of Customers
SELECT COUNT(*) AS TotalCustomers FROM Customers;

-- ==============================================================

-- 2. Average price of packages
SELECT AVG(Price) AS AveragePrice FROM Packages;

-- ==============================================================

-- 3. Most expensive package
SELECT MAX(Price) AS MostExpensivePackage FROM Packages;

-- ==============================================================

-- 4. Cheapest package
SELECT MIN(Price) AS CheapestPackage FROM Packages;

-- ==============================================================

-- 5. Total revenue from all bookings
SELECT SUM(p.Price) AS TotalRevenue
FROM Bookings b
JOIN Packages p ON b.PackageID = p.PackageID
WHERE b.Status = 'Confirmed';

-- ==============================================================

-- 6. Get customer age
DELIMITER //
CREATE FUNCTION GetCustomerAge(dob DATE) RETURNS INT DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, dob, CURDATE());
END //
DELIMITER ;

SELECT CustomerID, FullName, GetCustomerAge(DOB) AS Age FROM Customers;

-- ==============================================================

-- 7. Calculate final price with discount
DELIMITER //
CREATE FUNCTION FinalPrice(price DECIMAL(10,2), discount DECIMAL(10,2)) RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    RETURN price - (price * discount / 100);
END //
DELIMITER ;

SELECT PackageName, Price, FinalPrice(Price, 15) AS Discounted_Price FROM Packages;

-- ==============================================================

-- 8. Get booking status in full form
DELIMITER //
CREATE FUNCTION BookingStatusFull(status ENUM('Confirmed', 'Pending', 'Cancelled')) RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
    CASE status
        WHEN 'Confirmed' THEN RETURN 'Booking is Confirmed';
        WHEN 'Pending' THEN RETURN 'Booking is Pending';
        WHEN 'Cancelled' THEN RETURN 'Booking is Cancelled';
        ELSE RETURN 'Unknown Status';
    END CASE;
END //
DELIMITER ;

SELECT BookingID, BookingStatusFull(Status) AS Full_Status FROM Bookings;

-- ==============================================================

-- 9. Get customer's First Name
DELIMITER //
CREATE FUNCTION GetFirstName(fullname VARCHAR(100)) RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
    RETURN SUBSTRING_INDEX(fullname, ' ', 1);
END //
DELIMITER ;

SELECT CustomerID, FullName, GetFirstName(FullName) AS First_Name FROM Customers;


-- Step 7: Views & CTE--------------------------------------------------------------------------------------------------------------------------

-- 1. Get customer above 30 years
WITH CustomersAbove30 AS (
    SELECT CustomerID, FullName, DOB, TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS Age
    FROM Customers
    WHERE TIMESTAMPDIFF(YEAR, DOB, CURDATE()) > 30
)
SELECT * FROM CustomersAbove30;

-- ==============================================================

-- 2. Calculate total revenue from each destination
WITH DestinationRevenue AS (
    SELECT p.Destination, SUM(p.Price) AS TotalRevenue
    FROM Packages p
    JOIN Bookings b ON p.PackageID = b.PackageID
    GROUP BY p.Destination
)
SELECT * FROM DestinationRevenue;

-- ==============================================================

-- 3. Find the most expensive package
WITH ExpensivePackage AS (
    SELECT PackageName, Price
    FROM Packages
    WHERE Price = (SELECT MAX(Price) FROM Packages)
)
SELECT * FROM ExpensivePackage;

-- ==============================================================

-- 4. Count total bookings per customer
WITH CustomerBookings AS (
    SELECT c.CustomerID, c.FullName, COUNT(b.BookingID) AS TotalBookings
    FROM Customers c
    LEFT JOIN Bookings b ON c.CustomerID = b.CustomerID
    GROUP BY c.CustomerID, c.FullName
)
SELECT * FROM CustomerBookings;

-- ==============================================================

-- 5. For all confirmed booking
CREATE VIEW ConfirmedBookings AS
SELECT b.BookingID, c.FullName, p.PackageName, b.BookingDate
FROM Bookings b
JOIN Customers c ON b.CustomerID = c.CustomerID
JOIN Packages p ON b.PackageID = p.PackageID
WHERE b.Status = 'Confirmed';

SELECT * FROM ConfirmedBookings;

-- ==============================================================

-- 6. Total revenue per destination
CREATE VIEW RevenueByDestination AS
SELECT p.Destination, SUM(p.Price) AS TotalRevenue
FROM Packages p
JOIN Bookings b ON p.PackageID = b.PackageID
GROUP BY p.Destination;

SELECT * FROM RevenueByDestination;

-- ==============================================================

-- 7. Customers with their booking
CREATE VIEW CustomerBookings AS
SELECT c.CustomerID, c.FullName, p.PackageName, b.BookingDate, b.Status
FROM Customers c
LEFT JOIN Bookings b ON c.CustomerID = b.CustomerID
LEFT JOIN Packages p ON b.PackageID = p.PackageID;

SELECT * FROM CustomerBookings;

-- ==============================================================

-- 8. Premium packages (price > 25000)
CREATE VIEW PremiumPackages AS
SELECT PackageID, PackageName, Destination, Price, DurationDays
FROM Packages
WHERE Price > 25000;

SELECT * FROM PremiumPackages;


-- Step 8: Stored procedure--------------------------------------------------------------------------------------------------------------------------

-- 1. To get customer details by ID
DELIMITER //
CREATE PROCEDURE GetCustomerDetails(IN custID INT)
BEGIN
    SELECT * FROM Customers WHERE CustomerID = custID;
END //
DELIMITER ;

CALL GetCustomerDetails(3);

-- ==============================================================

-- 2. To add a new booking
DELIMITER //
CREATE PROCEDURE AddBooking(IN custID INT, IN pkgID INT, IN bookStatus ENUM('Confirmed', 'Pending', 'Cancelled'))
BEGIN
    INSERT INTO Bookings (CustomerID, PackageID, BookingDate, Status)
    VALUES (custID, pkgID, CURDATE(), bookStatus);
END //
DELIMITER ;

CALL AddBooking(5, 2, 'Confirmed');

-- ==============================================================

-- 3. To update booking status
DELIMITER //
CREATE PROCEDURE UpdateBookingStatus(IN bookID INT, IN newStatus ENUM('Confirmed', 'Pending', 'Cancelled'))
BEGIN
    UPDATE Bookings SET Status = newStatus WHERE BookingID = bookID;
END //
DELIMITER ;

CALL UpdateBookingStatus(3, 'Confirmed');

-- ==============================================================

-- 4. To calculate total revenue
DELIMITER //
CREATE PROCEDURE GetTotalRevenue(OUT totalRevenue DECIMAL(10,2))
BEGIN
    SELECT SUM(p.Price) INTO totalRevenue
    FROM Packages p
    JOIN Bookings b ON p.PackageID = b.PackageID;
END //
DELIMITER ;

CALL GetTotalRevenue(@revenue);
SELECT @revenue AS Total_Revenue;


-- Step 9: Triggers--------------------------------------------------------------------------------------------------------------------------

-- 1. Trigger to log new bookings
-- Create a log table
CREATE TABLE BookingLogs (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    CustomerID INT,
    PackageID INT,
    BookingDate DATE,
    Status ENUM('Confirmed', 'Pending', 'Cancelled'),
    LogTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the trigger
DELIMITER //
CREATE TRIGGER LogNewBooking
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    INSERT INTO BookingLogs (BookingID, CustomerID, PackageID, BookingDate, Status)
    VALUES (NEW.BookingID, NEW.CustomerID, NEW.PackageID, NEW.BookingDate, NEW.Status);
END //
DELIMITER ;

INSERT INTO Bookings (CustomerID, PackageID, BookingDate, Status) 
VALUES (1, 3, CURDATE(), 'Confirmed');

SELECT * FROM BookingLogs;

-- ==============================================================

-- 2. Trigger to prevent booking cancellation 
DELIMITER //
CREATE TRIGGER PreventOldCancellation
BEFORE UPDATE ON Bookings
FOR EACH ROW
BEGIN
    IF OLD.Status != 'Cancelled' AND NEW.Status = 'Cancelled' AND DATEDIFF(CURDATE(), OLD.BookingDate) > 7 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot cancel bookings older than 7 days.';
    END IF;
END //
DELIMITER ;

UPDATE Bookings SET Status = 'Cancelled' WHERE BookingID = 1;

-- ==============================================================

-- 3. Trigger to update package availability
-- Add an availability column to Packages
ALTER TABLE Packages ADD COLUMN AvailableSlots INT DEFAULT 20;

-- Create the trigger
DELIMITER //
CREATE TRIGGER ReducePackageAvailability
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    UPDATE Packages SET AvailableSlots = AvailableSlots - 1 WHERE PackageID = NEW.PackageID;
END //
DELIMITER ;

INSERT INTO Bookings (CustomerID, PackageID, BookingDate, Status) 
VALUES (2, 5, CURDATE(), 'Confirmed');

SELECT PackageID, PackageName, AvailableSlots FROM Packages;

-- ==============================================================

-- 4. Trigger to automatically set bookingstatus to pending if null
DELIMITER //
CREATE TRIGGER DefaultBookingStatus
BEFORE INSERT ON Bookings
FOR EACH ROW
BEGIN
    IF NEW.Status IS NULL THEN
        SET NEW.Status = 'Pending';
    END IF;
END //
DELIMITER ;

INSERT INTO Bookings (CustomerID, PackageID, BookingDate) 
VALUES (3, 2, CURDATE());

SELECT * FROM Bookings WHERE CustomerID = 3;


-- Step 10: Window Functions----------------------------------------------------------------------------------------------------------------------------------

-- 1. Rank customer based on booking count
SELECT 
    c.CustomerID, 
    c.FullName, 
    COUNT(b.BookingID) AS TotalBookings,
    RANK() OVER (ORDER BY COUNT(b.BookingID) DESC) AS BookingRank
FROM Customers c
LEFT JOIN Bookings b ON c.CustomerID = b.CustomerID
GROUP BY c.CustomerID, c.FullName;

-- ==============================================================

-- 2. Running total of revenue from bookings
SELECT 
    b.BookingID,
    p.PackageName,
    p.Price,
    SUM(p.Price) OVER (ORDER BY b.BookingDate) AS RunningTotalRevenue
FROM Bookings b
JOIN Packages p ON b.PackageID = p.PackageID;

-- ==============================================================

-- 3. Find the previous and next booking for each customer
SELECT 
    CustomerID, 
    BookingID, 
    BookingDate,
    LAG(BookingDate) OVER (PARTITION BY CustomerID ORDER BY BookingDate) AS PreviousBooking,
    LEAD(BookingDate) OVER (PARTITION BY CustomerID ORDER BY BookingDate) AS NextBooking
FROM Bookings;

-- ==============================================================

-- 4. Find the Most Expensive and Least Expensive Package for Each Destination
SELECT 
    Destination,
    PackageName,
    Price,
    MAX(Price) OVER (PARTITION BY Destination) AS MostExpensive,
    MIN(Price) OVER (PARTITION BY Destination) AS LeastExpensive
FROM Packages;


-- Step 11: Joins & Alias----------------------------------------------------------------------------------------------------------------------------------

-- 1. Get Customer Details with Their Booked Packages
SELECT 
    c.CustomerID AS ID, 
    c.FullName AS Customer_Name, 
    p.PackageName AS Booked_Package, 
    b.BookingDate AS Date
FROM Bookings b
JOIN Customers c ON b.CustomerID = c.CustomerID
JOIN Packages p ON b.PackageID = p.PackageID;

-- ==============================================================

-- 2. Find Customers Who Haven’t Made a Booking Yet
SELECT 
    c.CustomerID AS ID, 
    c.FullName AS Customer_Name, 
    IFNULL(p.PackageName, 'No Booking') AS Booked_Package
FROM Customers c
LEFT JOIN Bookings b ON c.CustomerID = b.CustomerID
LEFT JOIN Packages p ON b.PackageID = p.PackageID;

-- ==============================================================

-- 3. Count Bookings for Each Package
SELECT 
    p.PackageID AS ID, 
    p.PackageName AS Package, 
    COUNT(b.BookingID) AS Total_Bookings
FROM Packages p
LEFT JOIN Bookings b ON p.PackageID = b.PackageID
GROUP BY p.PackageID, p.PackageName;

-- ==============================================================

-- 4. List Packages with Customer Details 
SELECT 
    c.FullName AS Customer_Name, 
    p.PackageName AS Package, 
    b.Status AS Booking_Status
FROM Bookings b
JOIN Customers c ON b.CustomerID = c.CustomerID
JOIN Packages p ON b.PackageID = p.PackageID
ORDER BY b.Status DESC;


-- Step 12: Subqueries----------------------------------------------------------------------------------------------------------------------------

-- 1. Get Customers Who Have Booked the Most Expensive Package
SELECT FullName 
FROM Customers 
WHERE CustomerID IN (
    SELECT CustomerID 
    FROM Bookings 
    WHERE PackageID = (SELECT PackageID FROM Packages ORDER BY Price DESC LIMIT 1)
);

-- ==============================================================

-- 2. Find Customers Who Haven't Made Any Booking
SELECT FullName 
FROM Customers 
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Bookings);

-- ==============================================================

-- 3. Get Packages That Were Never Booked
SELECT PackageName 
FROM Packages 
WHERE PackageID NOT IN (SELECT DISTINCT PackageID FROM Bookings);

-- ==============================================================

-- 4. Find the Most Expensive Booking for Each Customer
SELECT FullName, 
       (SELECT MAX(Price) FROM Packages WHERE PackageID IN 
        (SELECT PackageID FROM Bookings WHERE Customers.CustomerID = Bookings.CustomerID)) AS MaxBookedPrice
FROM Customers;

-- ==============================================================

-- 5. Get Customers Who Booked a Package in March 2025
SELECT FullName 
FROM Customers 
WHERE CustomerID IN (
    SELECT CustomerID 
    FROM Bookings 
    WHERE MONTH(BookingDate) = 3 AND YEAR(BookingDate) = 2025
);

-- ==============================================================

-- 6. Find Packages with Price Higher Than the Average Package Price
SELECT PackageName, Price 
FROM Packages 
WHERE Price > (SELECT AVG(Price) FROM Packages);
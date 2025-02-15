-- create database
CREATE DATABASE Bus_Tickets_Booking_System;

-- drop database
DROP DATABASE Bus_Tickets_Booking_System;

-- use database
USE Bus_Tickets_Booking_System;

-- Table 01---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create table
CREATE TABLE Users(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(255),
	password VARCHAR(255),
	email VARCHAR(255),
	phone VARCHAR(255),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Drop table
DROP TABLE Users;


-- Insert values in table
INSERT INTO Users (username, password, email, phone)
VALUES
	('sanketsable2105','sanketsable2105','sanketsable738@gmail.com','8291621013'),
	('nupurlotekar26','nupurlotekar21','nupurlotekar2604@gmail.com','7715821977'),
	('rohitthorat28','rohitthorat28','rohitthorat2809@gmail.com','8754324589'),
	('karankhegade12','karankhegade12','karankhegade1207@gmail.com','9004178250'),
	('tanaykadam02','tanaykadam02','tanaykadam0203@gmail.com','9845326578'),
	('sohamchaudhary06','sohamchaudhary06','sohamchaudhary0610@gmail.com','8520149663'),
	('swarupchikane19','swarupchikane19','swarupchikane1908@gmail.com','8426971352'),
	('rushibambarde27','rushibambarde27','rushibambarde2710@gmail.com','7447313953'),
	('samadhangadhe12','samadhangadhe12','samadhangadhe1212@gmail.com','9356832018'),
	('pavangadekar14','pavangadekar14','pavangadekar1412@gmail.com','7878464338');
    
    
-- Select for show data
SELECT * FROM Users;

    
-- Select column from table
SELECT username, email, phone FROM Users;

-- Select query using where clause
SELECT * FROM Users WHERE created_at = '2025-02-14 20:10:04';


-- Add new column
ALTER TABLE Users
ADD COLUMN gender VARCHAR(20) DEFAULT 'Male';

-- Drop column
ALTER TABLE Users
DROP COLUMN gender;


SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS = 0;


-- Delete a specific record
DELETE FROM Users
WHERE phone = '9356832018';

-- Delete records based on condition
DELETE FROM Users
WHERE password = 'rohitthorat28';


-- Rename table
ALTER TABLE Users RENAME TO User;

-- Again rename table
ALTER TABLE User RENAME TO Users;


-- Update a specific record 
UPDATE Users 
SET phone = '9890891719'
WHERE username = 'swarupchikane19';

-- update records
UPDATE Users
SET username = 'bhausahebpatil12', password = 'bhausahebpatil12', email = 'bhausahebpatil1209@gmail.com'
WHERE phone = '9890891719';


-- Table 02---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create table
CREATE TABLE Buses(
	bus_id INT AUTO_INCREMENT PRIMARY KEY,
	bus_number VARCHAR(255),
	bus_name VARCHAR(255),
	capacity INT NOT NULL,
	bus_type ENUM('AC','NON-AC') DEFAULT'NON-AC',
	operator_name VARCHAR(255),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Drop table
DROP TABLE Buses;

-- Insert values in table
INSERT INTO Buses (bus_number, bus_name, capacity, operator_name)
VALUES
	('MH12AB1234','Green Express','50','Green Travels'),
	('MH14XY5678','Blue Horizon','40','Blue Line Bus Co'),
	('MH15PQ4321','Red Falcon','55','Falcon Bus Services'),
	('MH11ZX9876','Silver Star','60','Silver Travels'),
	('MH10LM5678','Speed Rider','45','Speed Bus Co'),
	('MH13GH7654','Orange Cruiser','48','Orange Travels'),
	('MH16JK2468','Coastal Voyager','42','Coastal Travels'),
	('MH17UV1357','Mountain Explorer','50','Mountain Bus Lines'),
	('MH18OP8642','City Commuter','38','Cityline Buses'),
	('MH19RT9753','Metro Runner','52','Metro Travels');
    

-- Select for show data
SELECT * FROM Buses;


-- Select Buses with capacity greater than certain amount
SELECT * FROM Buses WHERE capacity > 45;

-- Select Users created_at in a date
SELECT * FROM Buses WHERE DATE(created_at) = '2025-02-14';


-- Modify an existing column
ALTER TABLE Buses 
MODIFY COLUMN capacity DECIMAL(10,2);

-- Rename a column
ALTER TABLE Buses 
CHANGE COLUMN capacity bus_capacity VARCHAR(255);


-- Delete record using condition
DELETE FROM Buses 
WHERE bus_capacity > 55.00;



    

-- Table 03---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create table
CREATE TABLE Routes(
	route_id INT AUTO_INCREMENT PRIMARY KEY,
	source VARCHAR(255),
	destination VARCHAR(255),
	distance INT,
	estimated_time TIME,
	fare DECIMAL(10,2)
);

-- Select for show data
SELECT * FROM Routes;

-- Drop table
DROP TABLE Routes;

-- Insert values in table
INSERT INTO Routes (source, destination, distance, estimated_time, fare)
VALUES
	('Dombivali','Thane','25','00:45:00','50.00'),
	('Thane','Mumbai CST','35','01:30:00','100.00'),
	('Pune','Mumbai','150','03:30:00','500.00'),
	('Dadar','Borivali','20','00:45:00','60.00'),
	('Mumbai','Nashik','200','05:00:00','600.00'),
	('Nashik','Shirdi','85','02:30:00','250.00'),
	('Chh.Sambhaji Nagar','Shirdi','100','02:45:00','300'),
	('Pune','Lonavala','65','01:30:00','150'),
	('Mumbai','Goa','600','10:00:00','1200'),
	('Mumbai','Surat','275','06:30:00','800');

-- Table 04---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create table
CREATE TABLE Trips(
	trip_id INT PRIMARY KEY AUTO_INCREMENT,
    bus_id INT,
    route_id INT,
    departure_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    arrival_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    available_seats INT,
    status ENUM('Scheduled','Completed','Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY(bus_id) REFERENCES Buses(bus_id),
    FOREIGN KEY(route_id) REFERENCES Routes(route_id)
);

-- Select for show data
SELECT * FROM Trips;

-- Drop table
DROP TABLE Trips;

-- Insert values in table
INSERT INTO Trips (bus_id, route_id, available_seats)
VALUES
	(1, 1, 45),
	(2, 2, 38),
	(3, 3, 40),
	(4, 4, 35),
	(5, 5, 47),
	(6, 6, 39),
	(7, 7, 42),
	(8, 8, 36),
	(9, 9, 46),
	(10, 10, 37);

-- Table 05---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create table
CREATE TABLE Bookings(
	booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    trip_id INT,
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_fare DECIMAL(10,2),
    status ENUM('Confirmed', 'Cancelled') DEFAULT 'Confirmed',
    FOREIGN KEY(user_id) REFERENCES Users(user_id),
    FOREIGN KEY(trip_id) REFERENCES Trips(trip_id)
);

-- Select for show data
SELECT * FROM Bookings;

-- Drop table
DROP TABLE Bookings;

-- Insert values in table
INSERT INTO Bookings (user_id, trip_id, total_fare)
VALUES
	(1, 1, 500),
	(2, 2, 500),
	(3, 3, 750),
	(4, 4, 750),
	(5, 5, 650),
	(6, 6, 650),
	(7, 7, 1200),
	(8, 8, 1200),
	(9, 9, 300),
	(10, 10, 300);
    
-- Table 06---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create table
CREATE TABLE Payments(
	payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT, 
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_amount DECIMAL(10,2),
    payment_method ENUM('Credit Card', 'Debit Card', 'Net Banking', 'UPI', 'Cash'),
    payment_status ENUM('Paid', 'Failed', 'Pending') DEFAULT 'Pending',
	FOREIGN KEY(booking_id) REFERENCES Bookings(booking_id)
);

-- Select for show data
SELECT * FROM Payments;

-- Drop table
DROP TABLE Payments;

-- Insert values in table
INSERT INTO Payments (booking_id, payment_amount, payment_method)
VALUES
	(1, 500, 'Credit Card'),
	(2, 650, 'Debit Card'),
	(3, 750, 'Net Banking'),
	(4, 400, 'UPI'),
	(5, 1200, 'Credit Card'),
	(6, 800, 'Debit Card'),
	(7, 300, 'UPI'),
	(8, 950, 'Cash'),
	(9, 1300, 'Net Banking'),
	(10, 1000, 'UPI');
    
-- Table 07---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create table
CREATE TABLE Feedback(
	feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    trip_id INT,
    rating INT,
    comments VARCHAR(255),
    feedback_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(user_id) REFERENCES Users(user_id),
    FOREIGN KEY(trip_id) REFERENCES Trips(trip_id)
);

-- Select for show data
SELECT * FROM Feedback;

-- Drop table
DROP TABLE Feedback;

-- Insert values in table
INSERT INTO Feedback( user_id, trip_id, rating, comments)
VALUES
	(1, 1, 5, 'Excellent service! Comfortable ride.'),
	(2, 2, 4, 'Good experience, but bus was 10 mins late.'),
	(3, 3, 3, 'Average ride. AC was not working.'),
	(4, 4, 5, 'Very punctual and clean bus.'),
	(5, 5, 2, 'Driver was rude. Won’t recommend.'),
	(6, 6, 4, 'Good trip, but could improve seating.'),
	(7, 7, 1, 'Worst experience ever. Bus was cancelled.'),
	(8, 8, 5, 'Loved the ride! Very smooth journey.'),
	(9, 9, 4, 'Comfortable trip, but delayed 15 mins.'),
	(10, 10, 3, 'Seats were not very comfortable.');
    
-- Table 08---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create table
CREATE TABLE Bus_Schedules(
	schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    bus_id INT,
    route_id INT,
    departure_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    arrival_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    schedule_days SET('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'),
    status ENUM('Active', 'Inactive') DEFAULT 'Active',
    FOREIGN KEY(bus_id) REFERENCES Buses(bus_id),
    FOREIGN KEY(route_id) REFERENCES Routes(route_id)
);

-- Select for show data
SELECT * FROM Bus_Schedules;

-- Drop table
DROP TABLE Bus_Schedules;

-- Insert values in table
INSERT INTO Bus_Schedules( bus_id, route_id, schedule_days)
VALUES
	(1, 1, 'Monday,Tuesday,Wednesday,Thursday,Friday'),
	(2, 2, 'Saturday,Sunday'),
	(3, 3, 'Monday,Wednesday,Friday'),
	(4, 4, 'Monday,Tuesday,Wednesday,Thursday'),
	(5, 5, 'Saturday,Sunday'),
	(6, 6, 'Monday,Wednesday,Friday'),
	(7, 7, 'Tuesday,Thursday'),
	(8, 8, 'Friday,Saturday'),
	(9, 9, 'Friday'),
	(10, 10, 'Sunday');
    
-- Table 09---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create table
CREATE TABLE Cancellations(
	cancellation_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    cancellation_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    cancellation_reason VARCHAR(255),
    refund_amount DECIMAL(10,2),
    status ENUM('Refunded', 'Pending', 'No Refund') DEFAULT 'Pending'
);

-- Select for show data
SELECT * FROM Cancellations;

-- Drop table
DROP TABLE Cancellations;

-- Insert values in table
INSERT INTO Cancellations( booking_id, cancellation_reason, refund_amount)
VALUES
	(1, 'Personal reasons', 500),
    (2, 'Bus was delayed too long', 650),
    (3, 'Changed travel plans', 750),
    (4, 'Incorrect booking', 0),
    (5, 'Illness', 1200),
    (6, 'Bus service canceled by operator', 800),
    (7, 'Found a cheaper alternative', 0),
    (8, 'Missed the bus', 0),
    (9, 'Weather issues', 1300),
    (10, 'Bus breakdown', 1000);


-- Table 10---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create table
CREATE TABLE Bus_Stops(
	stop_id INT PRIMARY KEY AUTO_INCREMENT,
    route_id INT,
    stop_name VARCHAR(255),
    stop_order INT,
    arrival_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    departure_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(route_id) REFERENCES Routes(route_id)
);

-- Select for show data
SELECT * FROM Bus_Stops;

-- Drop table
DROP TABLE Bus_Stops;

-- Insert values in table
INSERT INTO Bus_Stops( route_id, stop_name, stop_order)
VALUES
(1, 'Dombivli Depot', 1),
(2, 'Thane Station', 2),
(3, 'Mulund Checkpost', 3),
(4, 'Sion Bus Stand', 4),
(5, 'Dadar TT', 5),
(6, 'Pune Station', 1),
(7, 'Chinchwad', 2),
(8, 'Talegaon', 3),
(9, 'Lonavala', 4),
(10, 'Khandala', 5);
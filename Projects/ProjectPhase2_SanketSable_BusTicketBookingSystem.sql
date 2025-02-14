CREATE DATABASE Bus_Tickets_Booking_System;

DROP DATABASE Bus_Tickets_Booking_System;

USE Bus_Tickets_Booking_System;

-- Table 01---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Users(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(255),
	password VARCHAR(255),
	email VARCHAR(255),
	phone VARCHAR(255),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM Users;

DROP TABLE Users;

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


-- Table 02---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Buses(
	bus_id INT AUTO_INCREMENT PRIMARY KEY,
	bus_number VARCHAR(255),
	bus_name VARCHAR(255),
	capacity INT NOT NULL,
	bus_type ENUM('AC','NON-AC') DEFAULT'NON-AC',
	operator_name VARCHAR(255),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM Buses;

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

-- Table 03---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Routes(
	route_id INT AUTO_INCREMENT PRIMARY KEY,
	source VARCHAR(255),
	destination VARCHAR(255),
	distance INT,
	estimated_time TIME,
	fare DECIMAL(10,2)
);

SELECT * FROM Routes;

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
    
SELECT * FROM Trips;

DROP TABLE Trips;

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

SELECT * FROM Bookings;

DROP TABLE Bookings;

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
CREATE TABLE Payments(
	payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT, 
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_amount DECIMAL(10,2),
    payment_method ENUM('Credit Card', 'Debit Card', 'Net Banking', 'UPI', 'Cash'),
    payment_status ENUM('Paid', 'Failed', 'Pending') DEFAULT 'Pending',
	FOREIGN KEY(booking_id) REFERENCES Bookings(booking_id)
);

SELECT * FROM Payments;

DROP TABLE Payments;

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
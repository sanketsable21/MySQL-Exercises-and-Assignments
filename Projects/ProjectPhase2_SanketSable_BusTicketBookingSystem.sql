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
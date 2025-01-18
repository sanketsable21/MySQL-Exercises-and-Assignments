create database Travel_Agent;
show databases;

create database if not exists Travel_Agent21;
drop database Travel_Agent;
drop database if exists Travel_Agent21;

use Travel_Agent;

-- Table-1-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create the countries table
create table countries (
-- unique identifier for each country
id int primary key auto_increment,
-- Name of the country
name varchar(50) not null unique,
-- Description of the country
description text,
-- Capital city of the country
capital_city varchar(50) not null,
-- Currency of the country
currency varchar(20) not null
);

-- Insert records into the countries table
INSERT INTO countries (name, description, capital_city, currency) VALUES
('United States', 'A country in North America known for its diverse culture and economy.', 'Washington, D.C.', 'USD'),
('Canada', 'A country in North America known for its natural beauty and multicultural society.', 'Ottawa', 'CAD'),
('United Kingdom', 'A country in Europe consisting of England, Scotland, Wales, and Northern Ireland.', 'London', 'GBP'),
('Australia', 'A country and continent surrounded by the Indian and Pacific oceans.', 'Canberra', 'AUD'),
('Germany', 'A country in Central Europe known for its history, culture, and engineering.', 'Berlin', 'EUR'),
('France', 'A country in Western Europe known for its art, fashion, and cuisine.', 'Paris', 'EUR'),
('Japan', 'An island country in East Asia known for its technology and traditional culture.', 'Tokyo', 'JPY'),
('India', 'A country in South Asia known for its rich history and diverse culture.', 'New Delhi', 'INR'),
('Brazil', 'The largest country in South America known for its Amazon rainforest and carnival festival.', 'Brasília', 'BRL'),
('South Africa', 'A country at the southern tip of Africa known for its varied topography and cultural diversity.', 'Pretoria', 'ZAR');

-- 1. Select all columns from the Countries table
select * from countries;

-- 2. Select specific columns
select name, capital_city from countries;

-- 3. Select a country by name
select * from countries where name = 'India';

-- 4. Select countries with a specific currency
select * from countries where currency = 'EUR';

-- 5. Count the number of Countries
select count(*) as total_countries from countries;

-- Table-2------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create the cities table
CREATE TABLE cities (
  -- Unique identifier for each city
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Name of the city
  name VARCHAR(50) NOT NULL,
  -- Description of the city
  description TEXT,
  -- Country ID of the city
  country_id INT NOT NULL,
  -- Foreign key constraint to link cities to countries
  FOREIGN KEY (country_id) REFERENCES countries(id)
);

-- Insert records into the cities table for Indian cities
INSERT INTO cities (name, description, country_id) VALUES
('Mumbai', 'The financial capital of India, known for its bustling city life and Bollywood film industry.', 8),  -- India
('Delhi', 'The capital city of India, known for its historical landmarks and vibrant culture.', 8),  -- India
('Bengaluru', 'Known as the Silicon Valley of India, famous for its IT industry and pleasant climate.', 8),  -- India
('Chennai', 'A major cultural and economic center in South India, known for its classical music and dance.', 8),  -- India
('Kolkata', 'Known for its rich cultural heritage and historical significance, formerly known as Calcutta.', 8),  -- India
('Hyderabad', 'Famous for its historical sites and as a major center for the technology industry.', 8),  -- India
('Ahmedabad', 'Known for its rich history and as a major economic hub in Gujarat.', 8),  -- India
('Pune', 'Known for its educational institutions and as a growing IT hub.', 8),  -- India
('Jaipur', 'The capital city of Rajasthan, known for its historic palaces and vibrant culture.', 8),  -- India
('Varanasi', 'One of the oldest cities in the world, known for its spiritual significance and ghats along the Ganges.', 8);  -- India

-- 1. Select all columns from the cities table
select * from cities;

-- 2. Select specific columns
select name, country_id from cities;

-- 3. Select a city by name
select * from cities where name = 'Mumbai';

-- 4. Select cities with a specific id
select * from cities where id = 5;

-- 5. Count the number of cities
select count(*) as total_cities from cities;

-- Table-3------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create the airports table
CREATE TABLE airports (
  -- Unique identifier for each airport
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Name of the airport
  name VARCHAR(50) NOT NULL,
  -- Description of the airport
  description TEXT,
  -- City ID of the airport
  city_id INT NOT NULL,
  -- Foreign key constraint to link airports to cities
  FOREIGN KEY (city_id) REFERENCES cities(id)
);

Drop table airports;

-- Insert records into the airports table for Indian airports
INSERT INTO airports (name, description, city_id) VALUES
('Chhatrapati Shivaji Maharaj International Airport', 'The main international airport serving Mumbai, known for its modern facilities.', 1),  -- Mumbai
('Indira Gandhi International Airport', 'The primary airport serving Delhi, one of the busiest airports in India.', 2),  -- Delhi
('Kempegowda International Airport', 'An international airport serving Bengaluru, known for its efficient services.', 3),  -- Bengaluru
('Chennai International Airport', 'The main airport serving Chennai, known for its domestic and international flights.', 4),  -- Chennai
('Netaji Subhas Chandra Bose International Airport', 'The main airport serving Kolkata, known for its historical significance.', 5),  -- Kolkata
('Rajiv Gandhi International Airport', 'An international airport serving Hyderabad, known for its modern infrastructure.', 6),  -- Hyderabad
('Sardar Vallabhbhai Patel International Airport', 'The main airport serving Ahmedabad, known for its growing passenger traffic.', 7),  -- Ahmedabad
('Pune International Airport', 'An airport serving Pune, known for its proximity to the IT hubs.', 8),  -- Pune
('Jaipur International Airport', 'The main airport serving Jaipur, known for its beautiful architecture.', 9),  -- Jaipur
('Lal Bahadur Shastri International Airport', 'An airport serving Varanasi, known for its cultural significance.', 10);  -- Varanasi

-- 1. Select all columns from the airports table
select * from airports;

-- 2. Select specific columns
select name, description from cities;

-- 3. Select a airport by name
select * from airports where name = 'Pune International Airport';

-- 4. Select airport with a specific city_id
select * from airports where city_id = 6;

-- 5. Count the number of airport
select count(*) as total_airports from airports;


-- Table-4------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create the airlines table
CREATE TABLE airlines (
  -- Unique identifier for each airline
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Name of the airline
  name VARCHAR(50) NOT NULL UNIQUE,
  -- Description of the airline
  description TEXT,
  -- Country ID of the airline
  country_id INT NOT NULL,
  -- Foreign key constraint to link airlines to countries
  FOREIGN KEY (country_id) REFERENCES countries(id)
);

-- Insert records into the airlines table for Indian airlines
INSERT INTO airlines (name, description, country_id) VALUES
('IndiGo', 'A low-cost airline based in India, known for its punctuality and extensive domestic network.', 8),  -- India
('Air India', 'The flag carrier airline of India, offering both domestic and international flights.', 8),  -- India
('SpiceJet', 'A low-cost airline that provides domestic and international services.', 8),  -- India
('GoAir', 'A low-cost airline that operates domestic flights and some international routes.', 8),  -- India
('Vistara', 'A full-service airline that is a joint venture between Tata Sons and Singapore Airlines.', 8),  -- India
('AirAsia India', 'A low-cost airline that is a subsidiary of AirAsia, offering domestic flights.', 8),  -- India
('Jet Airways', 'A major airline that operated domestic and international flights, now in the process of revival.', 8),  -- India
('Alliance Air', 'A regional airline that operates domestic flights, a subsidiary of Air India.', 8),  -- India
('Air India Express', 'A low-cost airline that operates international flights to the Middle East and Southeast Asia.', 8),  -- India
('Zoom Air', 'A regional airline that operates domestic flights in India.', 8);  -- India

-- 1. Select all columns from the airlines table
select * from airlines;

-- 2. Select specific columns
select name, country_id from airlines;

-- 3. Select a airlines by name
select * from airlines where name = 'Vistara';

-- 4. Select airlines with a specific country_id
select * from airlines where country_id = 8;

-- 5. Count the number of airlines
select count(*) as total_airlines from airlines;

-- Table-5------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create the flights table
CREATE TABLE flights (
  -- Unique identifier for each flight
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Airline ID of the flight
  airline_id INT NOT NULL,
  -- Departure airport ID of the flight
  departure_airport_id INT NOT NULL,
  -- Arrival airport ID of the flight
  arrival_airport_id INT NOT NULL,
  -- Departure date of the flight
  departure_date DATE NOT NULL,
  -- Departure time of the flight
  departure_time TIME NOT NULL,
  -- Arrival date of the flight
  arrival_date DATE NOT NULL,
  -- Arrival time of the flight
  arrival_time TIME NOT NULL,
  -- Foreign key constraint to link flights to airlines
  FOREIGN KEY (airline_id) REFERENCES airlines(id),
  -- Foreign key constraint to link flights to departure airports
  FOREIGN KEY (departure_airport_id) REFERENCES airports(id),
  -- Foreign key constraint to link flights to arrival airports
  FOREIGN KEY (arrival_airport_id) REFERENCES airports(id)
);

-- Insert records into the flights table
INSERT INTO flights (airline_id, departure_airport_id, arrival_airport_id, departure_date, departure_time, arrival_date, arrival_time) VALUES
(1, 1, 2, '2023-10-01', '10:00:00', '2023-10-01', '12:00:00'),  -- IndiGo: Mumbai to Delhi
(2, 2, 3, '2023-10-02', '15:30:00', '2023-10-02', '17:30:00'),  -- Air India: Delhi to Bengaluru
(3, 3, 4, '2023-10-03', '08:15:00', '2023-10-03', '10:15:00'),  -- SpiceJet: Bengaluru to Chennai
(4, 4, 5, '2023-10-04', '14:45:00', '2023-10-04', '16:45:00'),  -- GoAir: Chennai to Kolkata
(5, 5, 1, '2023-10-05', '09:00:00', '2023-10-05', '11:00:00'),  -- Vistara: Kolkata to Mumbai
(1, 2, 4, '2023-10-06', '11:30:00', '2023-10-06', '13:30:00'),  -- IndiGo: Delhi to Chennai
(2, 3, 1, '2023-10-07', '16:00:00', '2023-10-07', '18:00:00'),  -- Air India: Bengaluru to Mumbai
(3, 5, 2, '2023-10-08', '07:45:00', '2023-10-08', '09:45:00'),  -- SpiceJet: Kolkata to Delhi
(4, 1, 3, '2023-10-09', '13:15:00', '2023-10-09', '15:15:00'),  -- GoAir: Mumbai to Bengaluru
(5, 2, 5, '2023-10-10', '18:30:00', '2023-10-10', '20:30:00');  -- Vistara: Delhi to Kolkata

-- 1. Select all columns from the flights table
select * from flights;

-- 2. Select specific columns
select departure_airport_id, arrival_airport_id from flights;

-- 3. Select a flight by id
select * from flights where airline_id = 5;

-- 4. Select flight with a specific airline_id
select * from flights where airline_id = 8;

-- 5. Count the number of flights
select count(*) as total_flights from flights;

-- Table-6------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create the hotels table
CREATE TABLE hotels (
  -- Unique identifier for each hotel
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Name of the hotel
  name VARCHAR(50) NOT NULL,
  -- Description of the hotel
  description TEXT,
  -- City ID of the hotel
  city_id INT NOT NULL,
  -- Foreign key constraint to link hotels to cities
  FOREIGN KEY (city_id) REFERENCES cities(id)
);

-- Insert records into the hotels table for Indian hotels
INSERT INTO hotels (name, description, city_id) VALUES
('Taj Mahal Palace', 'A luxury hotel in Mumbai, known for its iconic architecture and rich history.', 1),  -- Mumbai
('The Oberoi', 'A luxury hotel in Delhi, offering world-class amenities and services.', 2),  -- Delhi
('The Leela Palace', 'A five-star hotel in Bengaluru, known for its opulence and hospitality.', 3),  -- Bengaluru
('ITC Grand Chola', 'A luxury hotel in Chennai, known for its grand architecture and fine dining.', 4),  -- Chennai
('The Westin Kolkata Rajarhat', 'A luxury hotel in Kolkata, offering modern amenities and comfort.', 5),  -- Kolkata
('Hyatt Hyderabad Gachibowli', 'A luxury hotel in Hyderabad, known for its contemporary design and services.', 6),  -- Hyderabad
('Radisson Blu', 'A premium hotel in Ahmedabad, offering comfortable accommodations and dining options.', 7),  -- Ahmedabad
('JW Marriott Pune', 'A luxury hotel in Pune, known for its elegant design and exceptional service.', 8),  -- Pune
('Rambagh Palace', 'A heritage hotel in Jaipur, known for its royal architecture and rich history.', 9),  -- Jaipur
('BrijRama Palace', 'A heritage hotel in Varanasi, located on the banks of the Ganges with historical significance.', 10);  -- Varanasi

-- 1. Select all columns from the hotels table
select * from hotels;

-- 2. Select specific columns
select name, description from hotels;

-- 3. Select a hotels by id
select * from hotels where name = 'BrijRama Palace';

-- 4. Select hotels with a specific city_id
select * from hotels where city_id = 8;

-- 5. Count the number of hotels
select count(*) as total_hotels from hotels;

-- Table-7------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create the packages table
CREATE TABLE packages (
  -- Unique identifier for each package
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Name of the package
  name VARCHAR(50) NOT NULL,
  -- Description of the package
  description TEXT,
  -- Price of the package
  price DECIMAL(10, 2) NOT NULL,
  -- Duration of the package
  duration INT NOT NULL,
  -- Foreign key constraint to link packages to hotels
  hotel_id INT NOT NULL,
  -- Foreign key constraint to link packages to flights
  flight_id INT NOT NULL,
  -- Foreign key constraint to link packages to hotels
  FOREIGN KEY (hotel_id) REFERENCES hotels(id),
  -- Foreign key constraint to link packages to flights
  FOREIGN KEY (flight_id) REFERENCES flights(id)
);

-- Insert records into the packages table
INSERT INTO packages (name, description, price, duration, hotel_id, flight_id) VALUES
('Mumbai to Delhi Getaway', 'Enjoy a luxurious stay at Taj Mahal Palace with a round trip flight to Delhi.', 15000.00, 3, 1, 1),  -- Package 1
('Delhi Business Trip', 'Stay at The Oberoi with a flight to Bengaluru for your business meetings.', 20000.00, 2, 2, 2),  -- Package 2
('Bengaluru Relaxation Package', 'Relax at The Leela Palace with a flight to Chennai.', 18000.00, 4, 3, 3),  -- Package 3
('Chennai Cultural Experience', 'Experience the culture of Chennai with a stay at ITC Grand Chola and a flight to Kolkata.', 22000.00, 5, 4, 4),  -- Package 4
('Kolkata Heritage Tour', 'Stay at The Westin Kolkata Rajarhat and enjoy a flight back to Mumbai.', 16000.00, 3, 5, 5),  -- Package 5
('Delhi to Bengaluru Adventure', 'Explore Bengaluru with a stay at a luxury hotel and a flight from Delhi.', 19000.00, 4, 2, 2),  -- Package 6
('Chennai to Kolkata Package', 'Enjoy a cultural trip from Chennai to Kolkata with a stay at a premium hotel.', 17000.00, 3, 4, 4),  -- Package 7
('Mumbai to Jaipur Getaway', 'Experience the royal heritage of Jaipur with a flight from Mumbai.', 25000.00, 5, 9, 1);  -- Package 8

-- 1. Select all columns from the packages table
select * from packages;

-- 2. Select specific columns
select name, price from packages;

-- 3. Select a packages by name
select * from packages where name = 'Mumbai to Jaipur Getaway';

-- 4. Select packages with a specific hotel_id
select * from packages where price = 20000;

-- 5. Count the number of packages
select count(*) as total_packages from packages;

-- Table-8------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create the customers table
CREATE TABLE customers (
  -- Unique identifier for each customer
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- First name of the customer
  first_name VARCHAR(50) NOT NULL,
  -- Last name of the customer
  last_name VARCHAR(50) NOT NULL,
  -- Email address of the customer
  email VARCHAR(100) NOT NULL UNIQUE,
  -- Phone number of the customer
  phone VARCHAR(20) NOT NULL,
  -- Address of the customer
  address VARCHAR(100) NOT NULL
);

-- Insert records into the customers table with Indian values
INSERT INTO customers (first_name, last_name, email, phone, address) VALUES
('Aarav', 'Sharma', 'aarav.sharma@example.com', '9876543210', '123 MG Road, Mumbai, Maharashtra'),  -- Customer 1
('Vivaan', 'Patel', 'vivaan.patel@example.com', '8765432109', '456 Sardar Patel Nagar, Ahmedabad, Gujarat'),  -- Customer 2
('Aditya', 'Verma', 'aditya.verma@example.com', '7654321098', '789 Brigade Road, Bengaluru, Karnataka'),  -- Customer 3
('Anaya', 'Iyer', 'anaya.iyer@example.com', '6543210987', '101 Anna Salai, Chennai, Tamil Nadu'),  -- Customer 4
('Diya', 'Reddy', 'diya.reddy@example.com', '5432109876', '202 Banjara Hills, Hyderabad, Telangana'),  -- Customer 5
('Kabir', 'Khan', 'kabir.khan@example.com', '4321098765', '303 Connaught Place, Delhi'),  -- Customer 6
('Meera', 'Nair', 'meera.nair@example.com', '3210987654', '404 Marine Drive, Mumbai, Maharashtra'),  -- Customer 7
('Rohan', 'Singh', 'rohan.singh@example.com', '2109876543', '505 Juhu Beach, Mumbai, Maharashtra'),  -- Customer 8
('Saanvi', 'Gupta', 'saanvi.gupta@example.com', '1098765432', '606 Hiranandani Gardens, Mumbai, Maharashtra'),  -- Customer 9
('Kavya', 'Chopra', 'kavya.chopra@example.com', '0987654321', '707 Vasant Kunj, Delhi');  -- Customer 10

-- 1. Select all columns from the customers table
select * from customers;

-- 2. Select specific columns
select first_name, phone from customers;

-- 3. Select a address by name
select * from customers where first_name = 'Kavya';

-- 4. Select email_id with a specific email
select * from customers where email = 'kavya.chopra@example.com';

-- 5. Count the number of customers
select count(*) as total_customers from customers;

-- Table-9------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create the bookings table
CREATE TABLE bookings (
  -- Unique identifier for each booking
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Customer ID of the booking
  customer_id INT NOT NULL,
  -- Package ID of the booking
  package_id INT NOT NULL,
  -- Booking date of the booking
  booking_date DATE NOT NULL,
  -- Total cost of the booking
  total_cost DECIMAL(10, 2) NOT NULL,
  -- Status of the booking
  status VARCHAR(20) NOT NULL CHECK (status IN ('pending', 'confirmed', 'cancelled')),
  -- Foreign key constraint to link bookings to customers
  FOREIGN KEY (customer_id) REFERENCES customers(id)
  -- Foreign key constraint to link bookings to packages
  -- FOREIGN KEY (package_id) REFERENCES packages(id)
);
drop table bookings;

-- Insert records into the bookings table
INSERT INTO bookings (customer_id, package_id, booking_date, total_cost, status) VALUES
(1, 1, '2023-10-01', 15000.00, 'confirmed'),  -- Aarav Sharma: Mumbai to Delhi Getaway
(2, 2, '2023-10-02', 20000.00, 'pending'),    -- Vivaan Patel: Delhi Business Trip
(3, 3, '2023-10-03', 18000.00, 'confirmed'),  -- Aditya Verma: Bengaluru Relaxation Package
(4, 4, '2023-10-04', 22000.00, 'cancelled'),  -- Anaya Iyer: Chennai Cultural Experience
(5, 5, '2023-10-05', 16000.00, 'confirmed'),  -- Diya Reddy: Kolkata Heritage Tour
(6, 6, '2023-10-06', 19000.00, 'pending'),     -- Kabir Khan: Delhi to Bengaluru Adventure
(7, 7, '2023-10-07', 17000.00, 'confirmed'),   -- Meera Nair: Chennai to Kolkata Package
(8, 8, '2023-10-08', 25000.00, 'cancelled'),   -- Rohan Singh: Mumbai to Jaipur Getaway
(9, 9, '2023-10-09', 18000.00, 'confirmed'),   -- Saanvi Gupta: Bengaluru Relaxation Package
(10, 10, '2023-10-10', 20000.00, 'pending');    -- Kavya Chopra: Delhi Business Trip

-- 1. Select all columns from the bookings table
select * from bookings;

-- 2. Select specific columns
select customer_id, status from bookings;

-- 3. Select a cost by customer_id
select * from bookings where customer_id = 5;

-- 4. Select status with a id
select * from bookings where id = 8;

-- 5. Count the number of bookings
select count(*) as total_bookings from bookings;

-- Table-10------------------------------------------------------------------------------------------------------------------------------------------------------------
-- create the payment table
create table payments(
-- Unique identifier for each payment
id int primary key auto_increment,
-- Booking id of the payment
booking_id int not null,
-- Payment method of the payment
payment_method varchar(20) not null check (payment_method in ('credit_card','paypal','bank_transfer')),
-- Payment date of the payment
payment_date date not null,
-- Amount of the payment
amount decimal(10, 2) not null
-- Foreign key constraint to link payments to bookings
-- foreign key (booking_id) references bookings(id)
);

-- Insert records into the payments table
INSERT INTO payments (booking_id, payment_method, payment_date, amount) VALUES
(1, 'credit_card', '2023-10-01', 15000.00),  -- Payment for Booking 1
(2, 'paypal', '2023-10-02', 20000.00),       -- Payment for Booking 2
(3, 'bank_transfer', '2023-10-03', 18000.00), -- Payment for Booking 3
(4, 'credit_card', '2023-10-04', 22000.00),  -- Payment for Booking 4 (cancelled, but recorded)
(5, 'paypal', '2023-10-05', 16000.00),       -- Payment for Booking 5
(6, 'bank_transfer', '2023-10-06', 19000.00), -- Payment for Booking 6
(7, 'credit_card', '2023-10-07', 17000.00),  -- Payment for Booking 7
(8, 'paypal', '2023-10-08', 25000.00),       -- Payment for Booking 8 (cancelled, but recorded)
(9, 'bank_transfer', '2023-10-09', 18000.00), -- Payment for Booking 9
(10, 'credit_card', '2023-10-10', 20000.00);  -- Payment for Booking 10

-- 1. Select all columns from Payments table
select * from payments;

-- 2. Select specific columns
select booking_id, payment_date from payments;

-- 3. Select a Payments by Payment_method
select * from payments where payment_method = 'bank_transfer';

-- 4. Select Payments with a specific amount
select * from payments where amount = '20000';  

-- 5. Count the number of payment_method
select count(*) as total_payment_method from payments;

-- Table-11------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create the reviews table
CREATE TABLE reviews (
  -- Unique identifier for each review
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Customer ID of the review
  customer_id INT NOT NULL,
  -- Package ID of the review
  package_id INT NOT NULL,
  -- Review date of the review
  review_date DATE NOT NULL,
  -- Rating of the review
  rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
  -- Review text of the review
  review_text TEXT
  -- Foreign key constraint to link reviews to customers
  -- FOREIGN KEY (customer_id) REFERENCES customers(id)
  -- Foreign key constraint to link reviews to packages
  -- FOREIGN KEY (package_id) REFERENCES packages(id)
);

-- Insert records into the reviews table
INSERT INTO reviews (customer_id, package_id, review_date, rating, review_text) VALUES
(1, 1, '2023-10-02', 5, 'Amazing experience! The hotel was luxurious and the service was top-notch.'),  -- Review 1
(2, 2, '2023-10-03', 4, 'Good trip overall, but the flight was delayed.'),                             -- Review 2
(3, 3, '2023-10-04', 5, 'Absolutely loved the relaxation package! Highly recommend.'),                 -- Review 3
(4, 4, '2023-10-05', 3, 'The cultural experience was nice, but the itinerary could be improved.'),      -- Review 4
(5, 5, '2023-10-06', 4, 'Great heritage tour! The guide was very knowledgeable.'),                     -- Review 5
(6, 6, '2023-10-07', 2, 'Not satisfied with the service during the trip. Expected better.'),            -- Review 6
(7, 7, '2023-10-08', 5, 'Fantastic package! Everything was well organized and enjoyable.'),            -- Review 7
(8, 8, '2023-10-09', 1, 'Very disappointed with the experience. Would not recommend.'),                -- Review 8
(9, 9, '2023-10-10', 4, 'Overall a good experience, but some activities were not as described.'),      -- Review 9
(10, 10, '2023-10-11', 5, 'Loved every moment of the trip! Will definitely book again.');            -- Review 10

-- 1. Select all columns from reviews table
select * from reviews;

-- 2. Select specific columns
select id, rating, review_text from reviews;

-- 3. Select a Reviews by Customer_id
select * from reviews where customer_id = 1;

-- 4. Select customer with a review
select * from reviews where review_text = 'Very disappointed with the experience. Would not recommend.';  

-- 5. Count the number of Reviews
select count(*) as total_reviews from reviews;

-- Table-12------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create the travel_agents table
CREATE TABLE travel_agents (
  -- Unique identifier for each travel agent
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Name of the travel agent
  name VARCHAR(50) NOT NULL,
  -- Description of the travel agent
  description TEXT,
  -- Contact information of the travel agent
  contact_info VARCHAR(100) NOT NULL,
  -- Foreign key constraint to link travel agents to packages
  package_id INT NOT NULL,
  -- Foreign key constraint to link travel agents to packages
  FOREIGN KEY (package_id) REFERENCES packages(id)
);

-- Insert records into the travel_agents table
INSERT INTO travel_agents (name, description, contact_info, package_id) VALUES
('Travel Guru', 'Expert in customized travel packages for families and groups.', 'contact@travelguru.com', 1),  -- Travel Agent 1
('Wanderlust Travels', 'Specializes in adventure and eco-tourism packages.', 'info@wanderlusttravels.com', 2),  -- Travel Agent 2
('Explore India', 'Offers cultural and heritage tours across India.', 'support@exploreindia.com', 3),  -- Travel Agent 3
('Luxury Escapes', 'Focuses on luxury travel experiences and high-end accommodations.', 'hello@luxuryescapes.com', 4),  -- Travel Agent 4
('Budget Travelers', 'Provides affordable travel options for budget-conscious travelers.', 'info@budgettravelers.com', 5);  -- Travel Agent 5

-- 1. Select all columns from travel_agents table
select * from travel_agents;

-- 2. Select specific columns
select id, name, contact_info from travel_agents;

-- 3. Select a description by name
select * from travel_agents where name = 'Luxury Escapes';

-- 4. Select package_id with a contact_info
select * from travel_agents where contact_info = 'support@exploreindia.com';  

-- 5. Count the number of travel_agents
select count(*) as total_travel_agents from travel_agents;

-- Table-13------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create the destinations table
CREATE TABLE destinations (
  -- Unique identifier for each destination
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Name of the destination
  name VARCHAR(50) NOT NULL,
  -- Description of the destination
  description TEXT,
  -- Location of the destination
  location VARCHAR(100) NOT NULL,
  -- Foreign key constraint to link destinations to packages
  package_id INT NOT NULL,
  -- Foreign key constraint to link destinations to packages
  FOREIGN KEY (package_id) REFERENCES packages(id)
);

-- Insert records into the destinations table
INSERT INTO destinations (name, description, location, package_id) VALUES
('Mumbai', 'The city that never sleeps, known for its vibrant culture and Bollywood.', 'Maharashtra, India', 1),  -- Destination 1
('Delhi', 'The capital city, rich in history and modernity, with numerous monuments.', 'Delhi, India', 2),  -- Destination 2
('Bengaluru', 'Known as the Silicon Valley of India, famous for its parks and nightlife.', 'Karnataka, India', 3),  -- Destination 3
('Chennai', 'A major cultural hub, known for its classical music and dance forms.', 'Tamil Nadu, India', 4),  -- Destination 4
('Kolkata', 'The cultural capital of India, famous for its art, literature, and festivals.', 'West Bengal, India', 5);  -- Destination 5

-- 1. Select all columns from destination table
select * from destinations;

-- 2. Select specific columns
select id, name, location from destinations;

-- 3. Select a Location by id
select * from destinations where id = 4;

-- 4. Select description with a location
select * from destinations where location = 'Delhi, India';  

-- 5. Count the number of destinations
select count(*) as total_destinations from destinations;


-- Table-14------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create the activities table
CREATE TABLE activities (
  -- Unique identifier for each activity
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Name of the activity
  name VARCHAR(50) NOT NULL,
  -- Description of the activity
  description TEXT,
  -- Location of the activity
  location VARCHAR(100) NOT NULL,
  -- Foreign key constraint to link activities to packages
  package_id INT NOT NULL,
  -- Foreign key constraint to link activities to packages
  FOREIGN KEY (package_id) REFERENCES packages(id)
);

-- Insert records into the activities table
INSERT INTO activities (name, description, location, package_id) VALUES
('City Tour', 'A guided tour of the city\'s major attractions and landmarks.', 'Mumbai', 1),  -- Activity 1
('Business Meetings', 'Scheduled meetings with local businesses and partners.', 'Delhi', 2),  -- Activity 2
('Spa Day', 'A relaxing day at a luxury spa with various treatments.', 'Bengaluru', 3),  -- Activity 3
('Cultural Dance Show', 'Experience traditional dance performances by local artists.', 'Chennai', 4),  -- Activity 4
('Heritage Walk', 'A guided walk through the historical sites of the city.', 'Kolkata', 5);  -- Activity 5

-- 1. Select all columns from activities table
select * from activities;

-- 2. Select specific columns
select id, name, location from activities;

-- 3. Select a Location by id
select * from activities where id = 4;

-- 4. Select description with a location
select * from activities where location = 'Bengaluru';  

-- 5. Count the number of activities
select count(*) as total_activities from activities;

-- Table-15------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create the transportation table
CREATE TABLE transportation (
  -- Unique identifier for each transportation
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Name of the transportation
  name VARCHAR(50) NOT NULL,
  -- Description of the transportation
  description TEXT,
  -- Location of the transportation
  location VARCHAR(100) NOT NULL,
  -- Foreign key constraint to link transportation to packages
  package_id INT NOT NULL,
  -- Foreign key constraint to link transportation to packages
  FOREIGN KEY (package_id) REFERENCES packages(id)
);

-- Insert records into the transportation table
INSERT INTO transportation (name, description, location, package_id) VALUES
('Private Car', 'A comfortable private car for airport transfers and local travel.', 'Mumbai', 1),  -- Transportation 1
('Luxury Coach', 'A luxury coach for group travel with amenities.', 'Delhi', 2),  -- Transportation 2
('Airport Shuttle', 'Convenient shuttle service from the airport to the hotel.', 'Bengaluru', 3),  -- Transportation 3
('Private Van', 'A spacious van for family travel and sightseeing.', 'Chennai', 4),  -- Transportation 4
('Rickshaw Ride', 'Experience the local culture with a rickshaw ride through the city.', 'Kolkata', 5);  -- Transportation 5

-- 1. Select all columns from transportation table
select * from transportation;

-- 2. Select specific columns
select id, name, description from transportation;

-- 3. Select a Location by id
select * from transportation where id = 4;

-- 4. Select description with a location
select * from transportation where location = 'Mumbai';  

-- 5. Count the number of transportation
select count(*) as total_transportation from transportation;


-- Table-16------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create the accommodations table
CREATE TABLE accommodations (
  -- Unique identifier for each accommodation
  id INT PRIMARY KEY AUTO_INCREMENT,
  -- Name of the accommodation
  name VARCHAR(50) NOT NULL,
  -- Description of the accommodation
  description TEXT,
  -- Location of the accommodation
  location VARCHAR(100) NOT NULL,
  -- Foreign key constraint to link accommodations to packages
  package_id INT NOT NULL,
  -- Foreign key constraint to link accommodations to packages
  FOREIGN KEY (package_id) REFERENCES packages(id)
);

-- Insert records into the accommodations table
INSERT INTO accommodations (name, description, location, package_id) VALUES
('The Taj Mahal Palace', 'A luxury hotel offering stunning views of the Arabian Sea.', 'Mumbai', 1),  -- Accommodation 1
('The Oberoi', 'A five-star hotel known for its exceptional service and fine dining.', 'Delhi', 2),  -- Accommodation 2
('The Leela Palace', 'An opulent hotel with lavish rooms and world-class amenities.', 'Bengaluru', 3),  -- Accommodation 3
('ITC Grand Chola', 'A luxury hotel that reflects the grandeur of South Indian architecture.', 'Chennai', 4),  -- Accommodation 4
('The Westin Kolkata', 'A modern hotel with spacious rooms and a relaxing atmosphere.', 'Kolkata', 5);  -- Accommodation 5

-- 1. Select all columns from accomodations table
select * from accommodations;

-- 2. Select specific columns
select id, description, location from accommodations;

-- 3. Select a Location by id
select * from accommodations where id = 4;

-- 4. Select description with a location
select * from accommodations where location = 'Kolkata';  

-- 5. Count the number of accommodations
select count(*) as total_accommodations from accommodations;


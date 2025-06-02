create database agencysystem;
use agencysystem;

CREATE TABLE Customers (
    CustomerID varchar(4) PRIMARY KEY,
    c_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Phone CHAR(15) NOT NULL,
    Address char(25)
);
CREATE TABLE TravelPackages (
    PackageID varchar(4) PRIMARY KEY,
    p_Name VARCHAR(100) NOT NULL,
    PackageDescription TEXT,
    Priceperperson DECIMAL(8, 2) NOT NULL,
    Duration TINYINT NOT NULL, -- in days
    Start_Date date,
    End_Date date
);
CREATE TABLE Bookings (
    BookingID varchar(4) PRIMARY KEY,
    CustomerID varchar(4) NOT NULL,
    PackageID varchar(4) NOT NULL,
    BookingDate DATETIME NOT NULL,
    BookingStatus VARCHAR(20) CHECK (BookingStatus IN ('Confirmed', 'Pending', 'Cancelled')),
    TotalCost DECIMAL(10, 2), 
    TravelersNumber INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (PackageID) REFERENCES TravelPackages(PackageID)
);

CREATE TABLE Itineraries (
    ItineraryID varchar(4)  PRIMARY KEY,
    BookingID varchar(4) NOT NULL,
    Days TINYINT NOT NULL, -- Day of the itinerary
    Activity VARCHAR(255) NOT NULL,
    Location VARCHAR(255),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

CREATE TABLE Payments (
      PaymentID varchar(4) PRIMARY KEY,
    BookingID varchar(4) NOT NULL,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    Method VARCHAR(50) CHECK (Method IN ('Credit Card', 'PayPal', 'Bank Transfer', 'No Payment')),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

INSERT INTO Customers (CustomerID, c_Name, Email, Phone, Address) VALUES
('c1', 'Abebe Kebede', 'abebe.ke@gmail.com', '0912345678', 'Addis Ababa, Ethiopia'),
('c2', 'Alem Tesfaye', 'alem.tes@gmail.com', '0923456789', 'Bahir Dar, Ethiopia'),
('c3', 'Mekdes Wolde', 'mekdes@gmail.com', '0934567890', 'Mekelle, Ethiopia'),
('c4', 'Biruk Tadesse', 'biruk.tadesse@gmail.com', '0945678901', 'Gonder, Ethiopia'),
('c5', 'Hana Gebremedhin', 'hana.gebremedhin@gmail.com', '0956789012', 'Dire Dawa, Ethiopia'),
('c6', 'Yonas Alemu', 'yonas.alemu@gmail.com', '0967890123', 'Hawassa, Ethiopia'),
('c7', 'Tigist Bekele', 'tigist.bekele@gmail.com', '0978901234', 'Jimma, Ethiopia'),
('c8', 'Fitsum Demeke', 'fitsum.demeke@gmail.com', '0989012345', 'Menz, Ethiopia'),
('c9', 'Selam Yared', 'selam.yared@gmail.com', '0990123456', 'Shashemene, Ethiopia'),
('c10', 'Tamrat Hailu', 'tamrat.hailu@gmail.com', '0911223344', 'Addis Ababa, Ethiopia');


INSERT INTO TravelPackages (PackageID, p_Name, PackageDescription, Priceperperson, Duration, Start_Date, End_Date) VALUES
('p1', 'Lalibela Pilgrimage', 'A 3-day visit to the historic rock-hewn churches of Lalibela.', 3000.00, 3, '2025-02-01', '2025-02-03'),
('p2', 'Bale Mountains Trek', '7-day trekking adventure in Bale Mountains National Park.', 7000.00, 7, '2025-03-10', '2025-03-16'),
('p3', 'Addis Ababa City Tour', 'A 2-day tour of the vibrant city of Addis Ababa.', 2000.00, 2, '2025-04-01', '2025-04-02'),
('p4', 'Lake Tana & Blue Nile Falls', '4-day exploration of Lake Tana monasteries and Blue Nile Falls.', 4000.00, 4, '2025-05-05', '2025-05-08'),
('p5', 'Danakil Depression Expedition', '5-day adventure to the Danakil Depression.', 5000.00, 5, '2025-06-01', '2025-06-05'),
('p6', 'Simien Mountains Hiking', '6-day hiking trip in Simien Mountains National Park.', 6000.00, 6, '2025-07-10', '2025-07-15'),
('p7', 'Awash National Park Safari', '3-day wildlife safari in Awash National Park.', 3500.00, 3, '2025-08-20', '2025-08-22'),
('p8', 'Harar Historical Tour', '2-day exploration of the historic city of Harar.', 2500.00, 2, '2025-09-05', '2025-09-06'),
('p9', 'Axum Heritage Tour', '3-day heritage tour of the ancient city of Axum.', 3000.00, 3, '2025-10-01', '2025-10-03'),
('p10', 'Omo Valley Cultural Experience', '5-day cultural tour of Omo Valley tribes.', 5000.00, 5, '2025-11-10', '2025-11-14');


INSERT INTO Bookings (BookingID, CustomerID, PackageID, BookingDate, BookingStatus, TotalCost, TravelersNumber) VALUES
('b5', 'c1', 'p1', '2024-12-01 10:30:00', 'Confirmed', 6000, 2),
('b2', 'c2', 'p2', '2024-12-03 14:45:00', 'Confirmed', 28000, 4),
('b9', 'c3', 'p3', '2024-12-05 09:15:00', 'Cancelled', 2000, 1),
('b4', 'c4', 'p4', '2024-12-07 16:00:00', 'Confirmed', 12000, 3),
('b8', 'c5', 'p5', '2024-12-09 11:20:00', 'Confirmed', 25000, 5),
('b1', 'c6', 'p6', '2024-12-11 13:10:00', 'Pending', 12000, 2),
('b7', 'c7', 'p7', '2024-12-13 08:50:00', 'Confirmed', 14000, 4),
('b3', 'c8', 'p8', '2024-12-15 17:30:00', 'Confirmed', 5000, 2),
('b10', 'c9', 'p9', '2024-12-17 15:00:00', 'Cancelled', 3000, 1),
('b6', 'c10', 'p10', '2024-12-19 12:40:00', 'Pending', 15000, 3);


INSERT INTO Itineraries (ItineraryID, BookingID, Days, Activity, Location) VALUES
('i3', 'b1', 1, 'Arrival and Welcome', 'Lalibela Airport'),
('i7', 'b1', 2, 'Visit Rock-hewn Churches', 'Lalibela'),
('i1', 'b2', 1, 'Start Trekking', 'Bale Mountains Base'),
('i8', 'b2', 2, 'Explore Sanetti Plateau', 'Bale Mountains'),
('i5', 'b3', 1, 'City Tour', 'Addis Ababa'),
('i10', 'b4', 1, 'Boat Ride on Lake Tana', 'Lake Tana'),
('i6', 'b5', 1, 'Visit Sulphur Fields', 'Danakil Depression'),
('i2', 'b6', 1, 'Hiking to the Peak', 'Simien Mountains'),
('i9', 'b7', 1, 'Wildlife Safari', 'Awash National Park'),
('i4', 'b8', 1, 'Visit Old Town', 'Harar');

INSERT INTO Payments (PaymentID, BookingID, PaymentDate, Amount, Method) VALUES
('pa3', 'b1', '2024-11-20', 3000.00, 'Credit Card'),
('pa7', 'b2', '2024-11-22', 7000.00, 'PayPal'),
('pa1', 'b4', '2024-11-25', 4000.00, 'Credit Card'),
('pa8', 'b5', '2024-11-30', 5000.00, 'Bank Transfer'),
('pa5', 'b7', '2024-12-02', 3500.00, 'Credit Card'),
('pa10', 'b8', '2024-12-05', 2500.00, 'PayPal'),
('pa2', 'b6', '2024-12-08', 6000.00, 'Credit Card'),
('pa6', 'b10', '2024-12-10', 5000.00, 'PayPal'),
('pa9', 'b9', '2024-12-12', 0.00, 'No Payment'),
('pa4', 'b3', '2024-12-14', 0.00, 'No Payment');

-- Queries for the Travel Agency System
-- 1. View all customers
SELECT * FROM Customers;

-- 2. View all bookings with 'Confirmed' status
SELECT * 
FROM Bookings
WHERE BookingStatus= 'Confirmed';

-- 3. View total payment amounts grouped by payment method
SELECT Method, SUM(Amount) AS TotalAmount
FROM Payments
GROUP BY Method;

-- 4. View all bookings with customer and package details
SELECT 
    b.BookingID, 
    c.c_Name AS CustomerName, 
    p.p_Name AS PackageName, 
    b.BookingDate, 
    b.BookingStatus
FROM Bookings b
JOIN Customers c ON b.CustomerID = c.CustomerID
JOIN TravelPackages p ON b.PackageID = p.PackageID;

-- 5. View itinerary details for a specific booking
SELECT * 
FROM Itineraries
WHERE BookingID = 1;

-- 6. View all travel packages ordered by price (descending)
SELECT * 
FROM TravelPackages
ORDER BY priceperperson DESC;

-- 7. View customers with pending bookings and the associated package details
SELECT 
    c.c_Name, 
    b.BookingDate, 
    p.p_Name AS PackageName
FROM Bookings b
JOIN Customers c ON b.CustomerID = c.CustomerID
JOIN TravelPackages p ON b.PackageID = p.PackageID
WHERE b.BookingStatus = 'Pending';

-- 8. View total earnings for a specific travel package
SELECT 
    p.p_Name AS PackageName, 
    SUM(py.Amount) AS TotalEarnings
FROM Payments py
JOIN Bookings b ON py.BookingID = b.BookingID
JOIN TravelPackages p ON b.PackageID = p.PackageID
GROUP BY p.PackageID;

-- 9. View the most booked travel packages
SELECT 
    p.p_Name AS PackageName, 
    COUNT(b.PackageID) AS BookingCount
FROM Bookings b
JOIN TravelPackages p ON b.PackageID = p.PackageID
GROUP BY b.PackageID
ORDER BY BookingCount DESC;
-- 10. View customers who have made no payments
SELECT 
    c.c_Name AS CustomerName, 
    b.BookingID
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
LEFT JOIN Payments py ON b.BookingID = py.BookingID
WHERE py.Amount IS NULL OR py.Amount = 0;




-- 13. View total number of bookings per status
SELECT 
    BookingStatus, 
    COUNT(*) AS BookingCount
FROM Bookings
GROUP BY BookingStatus;

-- 14. View total price of travel packages
SELECT SUM(Priceperperson) AS totalPackagePrice
FROM TravelPackages;

-- 15. View the most active customers based on the number of bookings
SELECT 
    c.c_Name AS CustomerName, 
    COUNT(b.BookingID) AS TotalBookings
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalBookings DESC;
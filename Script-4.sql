 use SaleOrderQuiz;
 


CREATE TABLE Customer (
    CustomerID INT NOT NULL PRIMARY KEY,
    CustomerFirstName VARCHAR(50) NOT NULL,
    CustomerLastName VARCHAR(50) NOT NULL,
    CustomerAddress VARCHAR(50) NOT NULL,
    CustomerCity VARCHAR(50) NOT NULL,
    CustomerPostCode CHAR(4) NULL,
    CustomerPhoneNumber CHAR(12) NULL
);


CREATE TABLE Inventory (
    InventoryID TINYINT NOT NULL PRIMARY KEY,
    InventoryName VARCHAR(50) NOT NULL,
    InventoryDescription VARCHAR(255) NULL
);


CREATE TABLE Employee (
    EmployeeID TINYINT NOT NULL PRIMARY KEY,
    EmployeeFirstName VARCHAR(50) NOT NULL,
    EmployeeLastName VARCHAR(50) NOT NULL,
    EmployeeExtension CHAR(4) NULL
);




CREATE TABLE Sale (
    SaleID TINYINT NOT NULL PRIMARY KEY,
    CustomerID INT NOT NULL,
    InventoryID TINYINT NOT NULL,
    EmployeeID TINYINT NOT NULL,
    SaleDate DATE NOT NULL,
    SaleQuantity INT NOT NULL,
    SaleUnitPrice int NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

INSERT INTO Customer (CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerCity, CustomerPostCode, CustomerPhoneNumber)
VALUES
(1, 'Ahmed', 'El Alaoui', '123 Rue Casablanca', 'Casablanca', '2000', '0612345678'),
(2, 'Sara', 'Benjelloun', '45 Avenue Rabat', 'Rabat', '1000', '0623456789'),
(3, 'Youssef', 'Mouline', '78 Bd Marrakech', 'Marrakech', '4000', '0634567890');


select * from customer;

INSERT INTO Inventory (InventoryID, InventoryName, InventoryDescription)
VALUES
(1, 'Laptop', 'High-performance laptop for professionals'),
(2, 'Mouse', 'Ergonomic wireless mouse'),
(3, 'Keyboard', 'Mechanical keyboard with RGB lighting');

select * from inventory;


INSERT INTO Employee (EmployeeID, EmployeeFirstName, EmployeeLastName, EmployeeExtension)
VALUES
(1, 'Hassan', 'Naji', '1001'),
(2, 'Fatima', 'Zahra', '1002'),
(3, 'Khalid', 'Berrada', '1003');

select * from employee;

INSERT INTO Sale (SaleID, CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
VALUES
(1, 1, 1, 1, '2024-12-01', 2, 1200.00),
(2, 2, 2, 2, '2024-12-02', 1, 50.00),
(3, 3, 3, 3, '2024-12-03', 3, 75.00);

select * from sale;

SELECT  SaleID,  (SaleQuantity * SaleUnitPrice) AS TotalAmount
FROM Sale
ORDER BY TotalAmount DESC;


SELECT 
    EmployeeID, 
    SUM(SaleQuantity * SaleUnitPrice) AS TotalSales
FROM Sale
GROUP BY EmployeeID;



ALTER TABLE Customer
ADD CustomerEmail VARCHAR(100);

UPDATE Customer
SET CustomerEmail = 'ahmed.elalaoui@example.com'
WHERE CustomerID = 1;



DELETE FROM Customer
WHERE CustomerCity = 'New York';


SELECT * FROM Sale
WHERE SaleDate >= CURDATE() - INTERVAL 30 DAY;





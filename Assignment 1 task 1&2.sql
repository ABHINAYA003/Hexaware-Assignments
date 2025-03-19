task 1
CREATE DATABASE TechShop;
GO
USE TechShop;
GO
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50),
    Phone VARCHAR(20),
    Address VARCHAR(200)
);
GO

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description VARCHAR(200),
    Price INT
);
GO

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount INT DEFAULT 0,
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);
GO

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    CONSTRAINT FK_OrderDetails_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT UNIQUE,
    QuantityInStock INT,
    LastStockUpdate DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Inventory_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO

exec sp_columns Customers;
exec sp_columns Orders;
exec sp_columns OrderDetails;
exec sp_columns Inventory;
exec sp_columns Products;
GO


INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES 
(1, 'John', 'Doe', 'john.doe@email.com', '1234567890', '123 Elm Street'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '0987654321', '456 Oak Avenue'),
(3, 'Alice', 'Brown', 'alice.brown@email.com', '5678901234', '789 Pine Lane'),
(4, 'Bob', 'Johnson', 'bob.johnson@email.com', '2345678901', '101 Maple Street'),
(5, 'Charlie', 'Davis', 'charlie.davis@email.com', '3456789012', '202 Cedar Avenue'),
(6, 'David', 'Wilson', 'david.wilson@email.com', '4567890123', '303 Birch Road'),
(7, 'Emily', 'Clark', 'emily.clark@email.com', '5678901234', '404 Oakwood Drive'),
(8, 'Frank', 'White', 'frank.white@email.com', '6789012345', '505 Spruce Lane'),
(9, 'Grace', 'Harris', 'grace.harris@email.com', '7890123456', '606 Redwood Blvd'),
(10, 'Henry', 'Moore', 'henry.moore@email.com', '8901234567', '707 Aspen Avenue');
GO

INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES 
(1, 'Laptop', 'High-performance laptop', 1200),
(2, 'Smartphone', 'Latest model smartphone', 800),
(3, 'Tablet', '10-inch screen tablet', 600),
(4, 'Smartwatch', 'Wearable smartwatch', 250),
(5, 'Headphones', 'Noise-canceling headphones', 150),
(6, 'Keyboard', 'Mechanical keyboard', 100),
(7, 'Mouse', 'Wireless mouse', 50),
(8, 'Monitor', '24-inch LED monitor', 200),
(9, 'Speakers', 'Bluetooth speakers', 180),
(10, 'External HDD', '1TB external hard drive', 90);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES 
(1, 1, '2025-03-01', 2400),
(2, 2, '2025-03-02', 1600),
(3, 3, '2025-03-03', 800),
(4, 4, '2025-03-04', 250),
(5, 5, '2025-03-05', 300),
(6, 6, '2025-03-06', 1200),
(7, 7, '2025-03-07', 400),
(8, 8, '2025-03-08', 500),
(9, 9, '2025-03-09', 150),
(10, 10, '2025-03-10', 90);
go

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES 
(1, 1, 1, 2),  
(2, 2, 2, 2), 
(3, 3, 3, 1), 
(4, 4, 4, 1), 
(5, 5, 5, 2),  
(6, 6, 1, 1),  
(7, 7, 6, 2),  
(8, 8, 7, 5), 
(9, 9, 5, 1), 
(10, 10, 10, 1); 
GO

INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate)
VALUES 
(1, 1, 50, '2025-03-01'),
(2, 2, 100, '2025-03-02'),
(3, 3, 30, '2025-03-03'),
(4, 4, 25, '2025-03-04'),
(5, 5, 60, '2025-03-05'),
(6, 6, 70, '2025-03-06'),
(7, 7, 90, '2025-03-07'),
(8, 8, 40, '2025-03-08'),
(9, 9, 55, '2025-03-09'),
(10, 10, 80, '2025-03-10');
GO

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Inventory;
GO

task 2

1. SELECT FirstName, LastName, Email FROM Customers;

2. SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName 
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

3. INSERT INTO Customers (CustomerID,FirstName, LastName, Email, Phone, Address) 
VALUES (11,'Abhinaya', 'Mohan', 'abhinayamohan492@gmail.com', '8438592917', '123 Main St, City, Country');

4. UPDATE Products 
SET Price = Price * 1.10 
WHERE Description LIKE '%electronic%';

5. DELETE FROM dbo.OrderDetails  
WHERE OrderID = 3;  

DELETE FROM dbo.Orders  
WHERE OrderID = 3;

6. insert into Orders(OrderID, CustomerID, OrderDate, TotalAmount)
values
(10, 10, '2025-03-10', 90.87);

7. update dbo.Customers
set Email='jabajaba@example.com',
	Address= '123 New Street, Jandy, Jordan'
	where CustomerID=1;

8. UPDATE Orders 
SET TotalAmount = (
    SELECT SUM(Products.Price * OrderDetails.Quantity) 
    FROM OrderDetails 
    JOIN Products ON OrderDetails.ProductID = Products.ProductID 
    WHERE OrderDetails.OrderID = Orders.OrderID
);

9. DELETE FROM OrderDetails WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = 101);
DELETE FROM Orders WHERE CustomerID = 101;

10. INSERT INTO Products (ProductID,ProductName,Description, Price) 
VALUES (11,'Smartphone X', 'Latest electronic smartphone with AI features', 799.99);

11. UPDATE Orders 
SET TotalAmount = '90'
WHERE OrderID = '10';

12. UPDATE Customers 
SET FirstName = (
    SELECT COUNT(*) 
    FROM Orders 
    WHERE Orders.CustomerID = Customers.CustomerID
);








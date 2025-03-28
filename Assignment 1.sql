--creating database TechShop
CREATE DATABASE TechShop;
GO
USE TechShop;
GO
--task 1:
--creating table customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50),
    Phone VARCHAR(20),
    Address VARCHAR(200)
);
GO
DROP TABLE Customers;

--creating table products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description VARCHAR(200),
    Price INT
);
GO

--creating table orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount INT DEFAULT 0,
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);
GO
DROP TABLE Orders;

--creating table orderdetails
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    CONSTRAINT FK_OrderDetails_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO
DROP TABLE OrderDetails;

--creating table inventory
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT UNIQUE,
    QuantityInStock INT,
    LastStockUpdate DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Inventory_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO

--inserting records into customers
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
DROP TABLE Customers;

--inserting records into products
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
DROP TABLE Products;

--inserting records into orders
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
DROP TABLE Orders;

--inserting records into orderdetails
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
DROP TABLE OrderDetails;

--inserting records into inventory
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
DROP TABLE Inventory;

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Inventory;
GO

--task 2:
--retrieving details from customers table
1. SELECT FirstName, LastName, Email FROM Customers;

--displaying order dates with coressponding customer names
2. SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName 
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--inserting a record into customers table 
3. INSERT INTO Customers (CustomerID,FirstName, LastName, Email, Phone, Address) 
VALUES (11,'Abhinaya', 'Mohan', 'abhinayamohan492@gmail.com', '8438592917', '123 Main St, City, Country');
SELECT * FROM Customers;

--increasing the price of gadgets in product table by 10 percent 
4. UPDATE Products
SET Price = Price * 1.10
WHERE ProductName IN ('Laptop', 'Smartphone', 'Tablet', 'Smartwatch', 'Headphones', 'Keyboard', 'Mouse', 'Monitor', 'Speakers', 'External HDD');
SELECT * FROM Products;

--delete a data with order id from orderdetails table
5. DELETE FROM dbo.OrderDetails  
WHERE OrderID = 3;  
SELECT * FROM OrderDetails;
--deleting a data with order id from orders table
DELETE FROM dbo.Orders  
WHERE OrderID = 3;
SELECT *FROM Orders;

--inserting a data into orders table
6. insert into Orders(OrderID, CustomerID, OrderDate, TotalAmount)
values(11, 11, '2025-03-10', 90.87);
DROP table Orders;
SELECT * FROM Orders;

--updating the email and address of specific customer id
7. update dbo.Customers
set Email='jabajaba@example.com',
	Address= '123 New Street, Jandy, Jordan'
	where CustomerID=1;
	SELECT * FROM Customers;
	DROP TABLE Customers;

--updating the total amount from orders table based on quantity from order details table
8. UPDATE Orders 
SET TotalAmount = (
    SELECT SUM(Products.Price * OrderDetails.Quantity) 
    FROM OrderDetails 
    JOIN Products ON OrderDetails.ProductID = Products.ProductID 
    WHERE OrderDetails.OrderID = Orders.OrderID
);
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

--deteting order in orders and orderdetails tables with specific customerId
9. DELETE FROM OrderDetails WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = 9);
DELETE FROM Orders WHERE CustomerID = 9;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

--inserting a data into products table
10. INSERT INTO Products (ProductID,ProductName,Description, Price) 
VALUES (11,'Smartphone X', 'Latest electronic smartphone with AI features', 799.99);
SELECT * FROM Products;

--adding a new column in orders table
11. ALTER TABLE Orders ADD Status VARCHAR(50) DEFAULT 'Pending';
--updatating status with order id
UPDATE Orders
SET Status = 'Shipped'
WHERE OrderID = 3;
SELECT * FROM Orders;

--adding a new column numbe of orders 
12. ALTER TABLE Customers ADD NumberOfOrders INT DEFAULT 0;
--updating number of orders in customer table
UPDATE Customers
SET NumberOfOrders = (
    SELECT COUNT(*) 
    FROM Orders 
    WHERE Orders.CustomerID = Customers.CustomerID
);
SELECT *FROM Customers;


--task 3:
--Write an SQL query to retrieve a list of all orders along with customer information (e.g., 
--customer name) for each order.
1. SELECT o.OrderID, c.FirstName, c.LastName, c.Email, o.OrderDate, o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

--Write an SQL query to find the total revenue generated by each electronic gadget product. 
--Include the product name and the total revenue.
2.  SELECT p.ProductName, SUM(od.Quantity * p.Price) AS TotalRevenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;

--Write an SQL query to list all customers who have made at least one purchase. Include their 
--names and contact information.
3. SELECT DISTINCT c.CustomerID, c.FirstName, c.LastName, c.Email, c.Phone
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;


--Write an SQL query to find the most popular electronic gadget, which is the one with the highest 
--total quantity ordered. Include the product name and the total quantity ordered.
4. SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantityOrdered DESC;


--Write an SQL query to retrieve a list of electronic gadgets along with their corresponding 
--categories.
5. SELECT ProductName, Description
FROM Products;


--Write an SQL query to calculate the average order value for each customer. Include the 
--customer's name and their average order value.
6. SELECT c.FirstName, c.LastName, AVG(o.TotalAmount) AS AverageOrderValue
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

--Write an SQL query to find the order with the highest total revenue. Include the order ID, 
--customer information, and the total revenue
7. SELECT o.OrderID, c.FirstName, c.LastName, c.Email, SUM(od.Quantity * p.Price) AS TotalRevenue
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY o.OrderID, c.FirstName, c.LastName, c.Email
ORDER BY TotalRevenue DESC;

--Write an SQL query to list electronic gadgets and the number of times each product has been 
--ordered.
8. SELECT p.ProductName, COUNT(od.OrderID) AS NumberOfOrders
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;

--Write an SQL query to find customers who have purchased a specific electronic gadget product. 
--Allow users to input the product name as a parameter
9. SELECT DISTINCT c.CustomerID, c.FirstName, c.LastName, c.Email, c.Phone
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Laptop';


--Write an SQL query to calculate the total revenue generated by all orders placed within a 
--specific time period. Allow users to input the start and end dates as parameters.
10. SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE OrderDate BETWEEN  '2025-03-01' AND  '2025-03-03';

--task 4:

--Write an SQL query to find out which customers have not placed any orders.
1. SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, c.Phone
FROM Customers c
WHERE c.CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Orders);

--Write an SQL query to find the total number of products available for sale.
2. SELECT COUNT(*) AS TotalProducts FROM Products;

--Write an SQL query to calculate the total revenue generated by TechShop
3. SELECT SUM(o.TotalAmount) AS TotalRevenue FROM Orders o;

--. Write an SQL query to calculate the average quantity ordered for products in a specific category. 
--Allow users to input the category name as a parameter.
4. SELECT AVG(od.Quantity) AS AvgQuantityOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Keyboard';

--Write an SQL query to calculate the total revenue generated by a specific customer. Allow users 
--to input the customer ID as a parameter.
5. SELECT c.CustomerID, c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.CustomerID = '3'
GROUP BY c.CustomerID, c.FirstName, c.LastName;

--Write an SQL query to find the customers who have placed the most orders. List their names 
--and the number of orders they've placed.
6. SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY OrderCount DESC;

--Write an SQL query to find the most popular product category, which is the one with the highest 
--total quantity ordered across all orders
7. SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantityOrdered DESC;

--Write an SQL query to find the customer who has spent the most money (highest total revenue) 
--on electronic gadgets. List their name and total spending.
8. SELECT c.CustomerID, c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpent DESC;

--Write an SQL query to calculate the average order value (total revenue divided by the number of 
--orders) for all customers.
9. SELECT AVG(TotalAmount) AS AvgOrderValue FROM Orders;

--Write an SQL query to find the total number of orders placed by each customer and list their 
--names along with the order count.
10. SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(o.OrderID) AS OrderCount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY OrderCount DESC;






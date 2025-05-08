-- Question 1 
SELECT CategoryName,Description
FROM Categories
ORDER BY CategoryName;

-- Question 2
SELECT ContactName, CompanyName, ContactTitle, Phone
FROM Customers
ORDER BY Phone;

-- Question 3
SELECT UPPER(FirstName) AS FirstName , UPPER(LastName) AS LastName, HireDate
FROM Employees
ORDER BY HireDate DESC;

-- Question 4
SELECT OrderID, OrderDate, ShippedDate, CustomerID, Freight
FROM Orders
ORDER BY Freight DESC
LIMIT 10;

-- Question 5
SELECT LOWER(CustomerID) AS CustomerID
FROM Customers;

-- Question 6
SELECT CompanyName, Fax, Phone, Country, HomePage
FROM Suppliers
ORDER BY Country DESC;

SELECT CompanyName, Fax, Phone, Country, HomePage
FROM Suppliers
ORDER BY CompanyName ASC;

-- Question 7
SELECT CompanyName, ContactName, City
FROM Customers
WHERE City = 'Buenos Aires';

-- Question 8
SELECT ProductName, UnitPrice, QuantityPerUnit, UnitsInStock
FROM Products
WHERE UnitsInStock = 0;

-- Question 9
SELECT ContactName, Address, City
FROM Customers
WHERE Country NOT IN('Germany','Mexico','Spain');

-- Question 10
SELECT OrderDate, ShippedDate, CustomerID, Freight
FROM Orders
WHERE OrderDate = '1996-08-21';

-- Question 11
SELECT FirstName, LastName, Country
FROM Employees
WHERE Country NOT IN ('USA');

-- Question 12
SELECT EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate
FROM Orders
WHERE ShippedDate > RequiredDate;

-- Question 13
SELECT City, CompanyName, ContactName
FROM Customers
WHERE City LIKE 'A%' OR City LIKE 'B%';

-- Question 14
SELECT OrderID
FROM Orders
WHERE OrderID % 2 = 0;

-- Question 15
SELECT OrderID, Freight 
FROM Orders
WHERE Freight > 500;

-- Question 16
SELECT ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel 
FROM Products
WHERE ReorderLevel = 0;

-- Question 17
SELECT CompanyName,ContactName, Fax
FROM Customers
WHERE Fax IS NULL;

-- Question 18
SELECT FirstName, LastName
FROM Employees
WHERE ReportsTo IS NULL;

-- Question 19
SELECT OrderID 
FROM Orders
WHERE OrderID % 2 = 1; 

-- Question 20
SELECT  CompanyName, ContactName, Fax
FROM Customers
WHERE Fax IS NULL
ORDER BY ContactName;

-- Question 21
SELECT City, CompanyName, ContactName
FROM Customers
WHERE City LIKE '%L';

-- Question 22
SELECT FirstName, LastName, BirthDate
FROM Employees
WHERE BirthDate BETWEEN '1950-01-01' AND '1959-12-31';

-- Question 23
SELECT FirstName, LastName, YEAR(BirthDate) AS BirthYear
FROM Employees;

-- Question 24
SELECT OrderID, COUNT(OrderID) AS NumberofOrders
FROM `order details`
GROUP BY OrderID 
ORDER BY NumberofOrders DESC;

-- Question 25
SELECT Suppliers.SupplierID, Products.ProductName, Suppliers.CompanyName
FROM Suppliers
INNER JOIN Products ON Suppliers.SupplierID = Products.SupplierID
WHERE CompanyName IN('Exotic Liquids','Specialty Biscuits, Ltd.','Escargots Nouveaux')
ORDER BY SupplierID;

-- Question 26
SELECT ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress
FROM Orders
WHERE ShipPostalCode = '98124';

-- Question 27
SELECT ContactName, ContactTitle, CompanyName
FROM Customers
WHERE ContactTitle NOT LIKE '%Sales%';

-- Question 28
SELECT FirstName, LastName, City
FROM Employees
WHERE City NOT IN ('Seattle');

-- Question 29
SELECT  CompanyName, ContactTitle, City, Country 
FROM Customers
WHERE Country IN('Mexico','Spain') AND City NOT IN ('Madrid');

-- Question 30
SELECT CONCAT(FirstName,LastName, 'can be reached at ','x',Extension) AS ContactInfo
FROM Employees;

-- Question 31
SELECT ContactName
FROM Customers
WHERE ContactName NOT LIKE '_A%';

-- Question 32
SELECT ROUND(AVG(UnitPrice),0) AS AveragePrice, 
SUM(UnitsInStock) AS TotalStock, 
MAX(UnitsOnOrder) AS MaxOrder
FROM Products;

-- Question 33
SELECT Suppliers.SupplierID, Suppliers.CompanyName, Categories.CategoryName, Products.ProductName, Products.UnitPrice 
FROM Products
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID 
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;

-- Question 34
SELECT CustomerID, SUM(Freight) AS Freight
FROM Orders
GROUP BY CustomerID
HAVING Freight > 200;

-- Question 35
SELECT Orders.OrderID, Customers.ContactName, od.UnitPrice, od.Quantity, od.Discount
FROM `order details` AS od
INNER JOIN Orders ON Orders.OrderID = od.OrderID
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Discount > 0;

-- Question 36
SELECT a.EmployeeID,
CONCAT(a.FirstName,' ',a.LastName) AS Employee,
CONCAT(b.FirstName,' ',b.LastName) AS Manager
FROM Employees AS a
LEFT JOIN Employees AS b ON b.EmployeeID = a.ReportsTo;

-- Question 37
SELECT AVG(UnitPrice) AS AveragePrice,
	   MIN(UnitPrice) AS MinimumPrice,
	   MAX(UnitPrice) AS MaximumPrice
FROM Products; 

-- Question 38
CREATE VIEW CustomerInfo AS
SELECT Customers.CustomerID, CompanyName, ContactName, ContactTitle, Address, City,
Country, Phone, OrderDate, RequiredDate, ShippedDate
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

--  ELECT * FROM CustomerInfo;

-- Question 39
CREATE VIEW CustomerDetails AS
SELECT Customers.CustomerID, CompanyName, ContactName, ContactTitle, Address, City,
Country, Phone, OrderDate, RequiredDate, ShippedDate
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- SELECT * FROM CustomerDetails;

-- Question 40
CREATE VIEW ProductDetails AS
SELECT ProductID, CompanyName, ProductName, CategoryName, Description, QuantityPerUnit, UnitPrice, UnitsInStock,
	   UnitsOnOrder, ReorderLevel, Discontinued
FROM Suppliers
INNER JOIN Products ON Products.SupplierID = Suppliers.SupplierID
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;

-- SELECT * FROM ProductDetails;

-- Question 41
DROP VIEW IF EXISTS CustomerDetails;

-- Question 42
SELECT SUBSTRING(CategoryName,1,5) AS ShortInfo
FROM Categories;

-- SELECT CategoryName AS ShortInfo
-- FROM categories
-- HAVING ShortInfo  LIKE '_____%';

-- Question 43
CREATE TABLE shippers_duplicate  LIKE shippers;
INSERT INTO shippers_duplicate SELECT * FROM shippers; 

-- SELECT * FROM shippers_duplicate;

-- Question 44
ALTER TABLE shippers_duplicate
ADD COLUMN Email varchar(50);

UPDATE shippers_duplicate
SET Email = 'speedyexpress@gmail.com'
WHERE ShipperID = 1;

UPDATE shippers_duplicate
SET Email = 'unitedpackage@gmail.com'
WHERE ShipperID = 2;

UPDATE shippers_duplicate
SET Email = 'federalshipping@gmail.com'
WHERE ShipperID = 3;

-- SELECT * FROM shippers_duplicate;

-- Question 45
SELECT s.CompanyName, p.ProductName, CategoryName
FROM  Categories AS c
INNER JOIN  Products AS p ON p.CategoryID = c.CategoryID
INNER JOIN  Suppliers AS s  ON s.SupplierID = p.SupplierID
WHERE CategoryName = 'Seafood';

-- Question 46
SELECT c.CategoryID, s.CompanyName, p.ProductName
FROM Categories AS c
INNER JOIN Products AS p ON p.CategoryID = c.CategoryID
INNER JOIN  Suppliers AS s ON s.SupplierID = p.SupplierID
WHERE c.CategoryID = 5;

-- Question 47
DROP TABLE IF EXISTS shippers_duplicate;

-- Question 48
SELECT LastName, FirstName, Title, DATE_FORMAT(FROM_DAYS(DATEDIFF(CURRENT_DATE,BirthDate)),'%y Years') AS Age
FROM Employees;

-- Question 49
SELECT c.CompanyName, COUNT(c.CustomerID) AS NumberOfOrders
FROM Customers AS c
INNER JOIN Orders AS o ON o.CustomerID = c.CustomerID
WHERE o.OrderDate >= '1994-12-31'
GROUP BY CompanyName
HAVING NumberOfOrders > 10;

-- Question 50
SELECT CONCAT(ProductName,' ','weighs/is',QuantityPerUnit,'and cost',' ','$',UnitPrice) AS ProductInfo
FROM Products;

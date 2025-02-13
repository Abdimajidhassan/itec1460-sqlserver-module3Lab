SELECT c.companyName, O.OrderDate from Customers AS 
c JOIN AS o ON c.customerID = o.CustormerID;
-- query to see all the customers info-- 
SELECT c.CustomerID, c.CompanyName, o.OrderID, o.OrderDate 
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;


select orderID, ROUND(sum(UnitPrice * Quantity * 
(1 - Discount)),2) AS TotalValue, COUNT(*) AS 
Numberofitems from [order Details] GROUP BY 
OrderID ORDER BY TotalValue DESC; 

 

SELECT c.CustomerID, c.CompanyName, o.OrderID, o.OrderDate 
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;



SELECT p.ProductID, p.ProductName, COUNT(od.OrderID) AS TimesOrdered 
FROM Products p INNER JOIN [Order Details] od ON p.ProductID = od.ProductID 
GROUP BY p.ProductID, p.ProductName 
HAVING COUNT(od.OrderID) > 10 
ORDER BY TimesOrdered DESC;



SELECT ProductName, UnitPrice FROM Products 
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)
ORDER BY UnitPrice;



SELECT TOP 5 
c.CustomerID, c.CompanyName, 
ROUND(SUM( od.UnitPrice * od.Quantity * (1 - od.Discount)),2) AS TotalPurchase 
FROM Customers c 
INNER JOIN Orders o ON c.CustomerID = o.CustomerID 
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID 
WHERE YEAR(o.OrderDate) = 1997  
GROUP BY c.CustomerID, c.CompanyName 
ORDER BY TotalPurchase DESC;

SELECT TOP 10 c.CustomerID, ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),2) 
AS TotalPurchase FROM Custormers c JOIN orders o ON c.CustomerID = o.CustormerID 
JOIN [Order Details] od ON o.OrderID = o.orderID 
WHERE YEAR (o.OrderDate) = 1997 GROUP BY c.CustormerID, c.companyName ORDER BY TotalPurchase DESC;



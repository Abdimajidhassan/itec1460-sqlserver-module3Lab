sqlq "INSERT INTO Customers (CustomerID, CompanyName, ContactName, Country) 
VALUES ('STUD3', 'Student Company', 'Mary Lebens', 'USA');"
sqlq "SELECT CustomerID, CompanyName FROM Customers WHERE CustomerID = 'STUDE';"
sqlq "INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, ShipCountry) 
VALUES ('STUDE', 1, GETDATE(), 'USA');"
sqlq "SELECT TOP 1 OrderID FROM Orders WHERE CustomerID = 'STUDE' ORDER BY OrderID DESC;"
sqlq "UPDATE Customers SET ContactName = 'New Contact Name' WHERE CustomerID = 'STUDE';"
sqlq "SELECT ContactName FROM Customers WHERE CustomerID = 'STUDE';"
sqlq "UPDATE Orders SET ShipCountry = 'New Country' WHERE CustomerID = 'STUDE';"
sqlq "SELECT ShipCountry FROM Orders WHERE CustomerID = 'STUDE';"
sqlq "DELETE FROM Orders WHERE CustomerID = 'STUDE';"
sqlq "SELECT OrderID, CustomerID FROM Orders WHERE CustomerID = 'STUDE';"
sqlq "DELETE FROM Customers WHERE CustomerID = 'STUDE';"
sqlq "SELECT CustomerID, CompanyName FROM Customers WHERE CustomerID = 'STUDE';"

--PART 2
sqlq "INSERT INTO Customers (CustomerID, CompanyName, ContactName, Country)
VALUES ('Pop-up Foods', 'ABDI Company', 'Majid Hassan', 'Somalia');"
sqlq "SELECT CustomerID, CompanyName FROM Customers WHERE CustomerID = 'Pop-up Foods';"
sqlq "INSERT INTO Orders(ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock) 
VALUES ('House Special Pizza', 'Pop-up Foods', '2', '15.99', '50');"
sqlq "SELECT TOP 1 OrderID FROM Orders WHERE CustomerID = 'Pop-up Foods' ORDER BY OrderID DESC;"
sqlq "UPDATE Products SET UnitPrice = '17.99' WHERE ProductName = 'loopyPizza';"
sqlq "SELECT UnitPrice FROM Products WHERE ProductName = 'loopyPizza';"
sqlq "DELETE FROM Product WHERE productName ='loopyPizza';"







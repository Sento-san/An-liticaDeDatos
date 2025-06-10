USE stage_northwind;

SELECT EmployeeID, FirstName, 
LastName, HireDate
FROM Northwind.dbo.Employees;

SELECT CategoryID, CategoryName 
FROM Northwind.dbo.Categories;

SELECT * FROM stage_northwind.dbo.empleados;

TRUNCATE TABLE stage_northwind.dbo.empleados;

SELECT CustomerID, CompanyName,
isnull(city, 'SC') as City, isnull(region, 'SR') as Region, 
isnull(PostalCode,'SPC') as CodigoPostal,
isnull(country, 'SC') as Country
FROM Northwind.dbo.Customers;

SELECT * FROM stage_northwind.dbo.clientes;
TRUNCATE TABLE stage_northwind.dbo.clientes;

SELECT c.CustomerID, e.EmployeeID, p.ProductID,
o.OrderDate, (od.Quantity*od.UnitPrice*(1 - od.Discount)) as 'Monto',
od.Quantity, od.UnitPrice, od.Discount
FROM Northwind.dbo.Customers as c
INNER JOIN Northwind.dbo.Orders as o
on c.CustomerID = o.CustomerID
INNER JOIN Northwind.DBO.Employees as e
on e.EmployeeID = o.EmployeeID
INNER JOIN Northwind.DBO.[Order Details] AS od
on o.OrderID = od.OrderID
INNER JOIN Northwind.dbo.Products as p
on od.ProductID = p.ProductID;

SELECT * FROM 
stage_northwind.dbo.ventas;

SELECT ProductID, ProductName, UnitPrice
FROM Northwind.dbo.Products;

SELECT * FROM 
stage_northwind.dbo.producto;

SELECT SupplierID, CompanyName, 
City, isnull(region, 'SR') AS Region, Country
FROM Northwind.dbo.Suppliers;

SELECT * FROM 
stage_northwind.dbo.proveedor;


TRUNCATE TABLE [dbo].[Categorias];
TRUNCATE TABLE [dbo].[clientes];
TRUNCATE TABLE [dbo].[empleados];
TRUNCATE TABLE [dbo].[producto];
TRUNCATE TABLE [dbo].[proveedor];
TRUNCATE TABLE [dbo].[ventas];
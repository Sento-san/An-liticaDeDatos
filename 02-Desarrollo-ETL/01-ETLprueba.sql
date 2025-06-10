CREATE DATABASE bdpruebaetl;
USE bdpruebaetl;

SELECT TOP 0 p.ProductID, p.ProductName, 
c.CategoryName, p.UnitPrice,
p.UnitsInStock, (p.UnitPrice*p.UnitsInStock) as Importe
INTO tblprueba
FROM Northwind.dbo.Products as p 
INNER JOIN Northwind.dbo.Categories as c
ON p.CategoryID = c.CategoryID;

SELECT * FROM tblprueba; 

TRUNCATE TABLE tblprueba; 
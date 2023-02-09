USE Northwind

SELECT A.ContactName, A.Region, B.ContactName, B.Region
FROM Customers A, Customers B
WHERE A.Region = B.Region;

SELECT * FROM Employees;

SELECT A.FirstName, A.HireDate, B.FirstName, B.HireDate 
FROM Employees A, Employees B
WHERE DATEPART(YEAR, A.Hiredate) = DATEPART(YEAR, B.HireDate);

-- EXERCICIO 
SELECT A.ProductID, A.Discount, B.ProductID, B.Discount  
FROM [Order Details] A, [Order Details] B 
WHERE A.Discount = B.Discount
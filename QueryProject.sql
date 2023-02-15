USE Northwind;

SELECT * FROM EmployeeTerritories;

-- 1


-- 2
SELECT * FROM [Order Details] WHERE Quantity > 50;	

-- 3


-- 4
WITH vendas_por_vendedor AS (
SELECT
	emp.FirstName + ' ' + emp.LastName AS vendor,
	ROUND(SUM(ode.Quantity * UnitPrice * (1 - ode.Discount)), 2) AS valor_individual
FROM Employees AS emp
JOIN Orders AS ord ON ord.EmployeeID = emp.EmployeeID
JOIN [Order Details] AS ode ON ode.OrderID = ord.OrderID
GROUP BY emp.FirstName + ' ' + emp.LastName) SELECT
	vendor,
	valor_individual,
	ROUND((valor_individual/(SELECT SUM(valor_individual) FROM vendas_por_vendedor)) * 100, 2) AS proporcao
FROM vendas_por_vendedor
;

-- 5


-- 6
CREATE VIEW ProductDetails AS (
SELECT ProductID, CompanyName, CategoryName, 
Description, QuantityPerUnit, UnitPrice, 
UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
FROM Products, Suppliers, Categories
);

SELECT * FROM ProductDetails;

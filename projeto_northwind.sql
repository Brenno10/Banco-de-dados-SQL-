USE Northwind;

SELECT * FROM EmployeeTerritories;

-- 1
SELECT
	RegionID,
	COUNT(RegionID) AS contagem_territorios
FROM Territories
GROUP BY RegionID;

-- 2
SELECT * FROM [Order Details] WHERE Quantity > 50;

-- 3
SELECT
	ShipCity,
	AVG(DATEDIFF(day, OrderDate, ShippedDate)) AS media_dias
FROM Orders
GROUP BY ShipCity;

-- 4
SELECT
	o.EmployeeID,
	o.ShipCountry,
	COUNT(o.ShipCountry) AS contagem_vendas
FROM Orders o
GROUP BY o.ShipCountry, o.EmployeeID
ORDER BY o.EmployeeID;

-- 5
SELECT
	OrderID,
	UnitPrice,
	Discount,
	ROUND(SUM(UnitPrice - (UnitPrice * Discount)), 2) AS preco_final
FROM [Order Details]
GROUP BY OrderID, UnitPrice, Discount;

-- 6
CREATE VIEW ProductDetails AS (
	SELECT
		ProductID,
		CompanyName,
		CategoryName, 
		Description,
		QuantityPerUnit,
		UnitPrice, 
		UnitsInStock,
		UnitsOnOrder,
		ReorderLevel,
		Discontinued
	FROM Products, Suppliers, Categories
);

SELECT * FROM ProductDetails;

USE Northwind;


SELECT ShipVia, SUM(Freight) AS TotalFreight
FROM Orders
GROUP BY ShipVia;



SELECT SupplierID, CategoryID, 
COUNT(DISTINCT(ProductID)) AS ProductCount
FROM Products
WHERE Discontinued = 0
GROUP BY SupplierID, CategoryID
ORDER BY SupplierID, CategoryID;



-- Format : FORMAT(<oque formatar>, '<como formatar. ex:(yyyy-MM-dd)>')
SELECT FORMAT(o.OrderDate, 'yyyy-MM') AS Mes,
COUNT(DISTINCT(o.OrderID)) AS NumeroPedidos,
ROUND(SUM(od.Quantity*UnitPrice*(1-od.Discount)), 2) AS ValorTotalPedidos
FROM Orders AS o
JOIN [Order Details] AS od ON od.OrderID = o.OrderID
GROUP BY FORMAT(o.OrderDate, 'yyyy-MM');



-- Procedures
CREATE PROCEDURE busca_categoria
	@nome_categoria VARCHAR(20)
	AS
	SET @nome_categoria = '%' + @nome_categoria + '%'
	SELECT
	COUNT(p.ProductID) AS contagem_produto,
	c.CategoryName
	FROM Products AS p
	JOIN Categories AS c
	ON p.CategoryID = c.CategoryID
	WHERE CategoryName LIKE @nome_categoria
	GROUP BY c.CategoryName;
	
EXEC busca_categoria 'on';



-- Functions
-- retorno de uma tabela
CREATE FUNCTION EmpregadoNome(@empregado_id INT)
RETURNS TABLE
RETURN (
	SELECT FirstName, LastName, HomePhone
	FROM Employees
	WHERE EmployeeID = @empregado_id
);

SELECT * FROM EmpregadoNome(4);

-- Retorno de um valor
CREATE FUNCTION funcao_teste(@test_int INT)
RETURNS INT
AS
BEGIN
	SET @test_int = @test_int + 5
	RETURN @test_int
END

SELECT dbo.funcao_teste(5);



-- Trigger
CREATE TRIGGER tr_log
ON Categories
AFTER UPDATE, INSERT, DELETE
AS
SELECT * FROM Categories;

CREATE PROCEDURE inserir_categoria
	@nome_categoria VARCHAR(50),
	@descricao_categoria VARCHAR(255)
AS
	BEGIN
		INSERT INTO Categories (CategoryName, Description)
		VALUES (@nome_categoria, @descricao_categoria);
	END;

EXEC inserir_categoria 'Roupas', 'São umas roupas :)';


DROP PROCEDURE inserir_categoria;
DELETE FROM Categories WHERE CategoryName = 'Roupas';

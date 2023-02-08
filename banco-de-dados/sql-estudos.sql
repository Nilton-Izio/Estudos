-- -- -- AULA 02 -- -- -- 
-- PESQUISANDO DA TABELA PERSON 
SELECT *
FROM person.Person; 

--ESPECIFICANDO O NOME DA COLUNA
SELECT Title
FROM person.person; 

--SELECIONANDO O EMAIL 
SELECT * 
FROM person.EmailAddress;

--EXERCICIO 
SELECT firstName, LastName
FROM person.Person; 

-- -- -- AULA 03 -- -- -- 
--DISTINCT / OMITR OS DADOS DUPLICADOS DA TABELA 
SELECT DISTINCT FirstName 
FROM person.Person;

--EXERCICIO 
SELECT DISTINCT LastName 
FROM person.Person;


-- -- -- AULA 04 -- -- -- 
-- COMANDO WHERE

SELECT *
	FROM person.person 
	WHERE LastName = 'miller' AND FirstName = 'anna';

SELECT * FROM production.Product
	WHERE color = 'blue' OR color = 'black'; 

SELECT * FROM Production.Product
	WHERE ListPrice > 1500 AND ListPrice > 500; 

SELECT * FROM Production.Product
	WHERE color <> 'red';

-- EXERCICIO 
--1
SELECT * FROM Production.Product
	WHERE Weight > 500 AND Weight <= 700;

--2
SELECT * 
FROM HumanResources.Employee 
WHERE MaritalStatus = 'm' AND SalariedFlag = 1;

--3
SELECT * FROM Person.Person
	WHERE FirstName = 'Peter' AND LastName = 'Krebs';

-- UTILIZANDO UMA SUBQUERY
SELECT * 
FROM Person.EmailAddress
	WHERE EmailAddressID = (
		SELECT BusinessEntityID 
		FROM Person.Person
			WHERE FirstName = 'Peter' AND LastName = 'Krebs');


-- -- -- AULA 05 -- -- -- 
-- COUNT 
SELECT COUNT(DISTINCT Title)
FROM Person.Person; 

-- EXERCICIO 

--1
SELECT COUNT(ProductID) FROM Production.Product;

--2 
SELECT COUNT(DISTINCT Size) FROM Production.Product;


-- -- -- AULA 06 -- -- -- 
-- TOP 
SELECT TOP 10 *
FROM Production.Product;


-- -- -- AULA 07 -- -- -- 
-- ORDER BY 

SELECT * 
FROM Person.Person
ORDER BY FirstName ASC;

SELECT * 
FROM Person.Person
ORDER BY FirstName DESC;

SELECT FirstName, LastName
FROM Person.Person
ORDER BY FirstName ASC, LastName DESC;

SELECT FirstName, LastName
FROM Person.Person
ORDER BY MiddleName ASC;

-- EXERCICIO 
-- 1
SELECT TOP 10 ProductID
	FROM Production.Product 
	ORDER BY ListPrice DESC;

--2 
SELECT TOP 4 NAME, ProductNumber
	FROM Production.Product 
	ORDER BY ListPrice ASC;

	
-- -- -- AULA 08 -- -- -- 
--Between
-- BETWENN SUBSTITUI UMA CONSULTA USANDO O "AND" QUANDO QUER COMPARAR O MESMO CAMPO 
-- NÃO NECESSITA USAR OPERADORES 

SELECT * 
FROM Production.Product
WHERE ListPrice BETWEEN 1000 AND 1500;

-- O "NOT" FAZ O BETWEEN NÃO SER ENTRE 
SELECT * 
FROM Production.Product
WHERE ListPrice NOT BETWEEN 1000 AND 1500;

-- FORMATO DE DATA NO SQL SEGUE O PADRÃO 
-- AAAA/mm/dd -> SEMPRE É SEPARADO POR BARRA 
SELECT * 
FROM HumanResources.Employee 
WHERE HireDate BETWEEN '2009/01/01'	AND '2010/01/01';


-- -- -- AULA 09 -- -- -- 
-- IN FUCIONA JUNTO COM O "WHERE" E "OR"

SELECT * 
FROM Person.Person
WHERE BusinessEntityID IN (2,7,13);

-- USANDO O NOT FAZ O OPOSTO, MOSTRA TUDO QUE NÃO ESTIVER DENTRO DA CONDIÇÃO 

-- -- -- AULA 10 -- -- -- 
SELECT * 
FROM Person.Person
WHERE FirstName LIKE 'ovi%';

SELECT * 
FROM Person.Person
WHERE FirstName LIKE '%to';

SELECT * 
FROM Person.Person
WHERE FirstName LIKE '%essa%';

SELECT * 
FROM Person.Person
WHERE FirstName LIKE '%ro_';

-- EXERCICIO 

-- 1
SELECT COUNT(ListPrice) 
FROM Production.Product
	WHERE ListPrice  > 1500;


-- 2
SELECT COUNT(LastName) 
FROM Person.Person
	WHERE LastName LIKE 'p%';

-- 3
SELECT COUNT(DISTINCT (city)) 
FROM Person.Address;

-- 4
SELECT DISTINCT(city) 
FROM Person.Address;

-- 5
SELECT COUNT(name) 
FROM Production.Product
	WHERE Color = 'red' 
	AND ListPrice BETWEEN 500 AND 1000;


-- 6 
SELECT COUNT(name) 
FROM Production.Product
	WHERE name LIKE '%road%';


-- -- -- AULA 11 -- -- -- 
-- MIN MAX SUM AVG 
SELECT TOP 10 * 
FROM Sales.SalesOrderDetail;

SELECT TOP 10 SUM(LineTotal) as "Soma"
FROM Sales.SalesOrderDetail;

SELECT TOP 10 MIN(LineTotal)  
FROM Sales.SalesOrderDetail;

SELECT TOP 10 MAX(LineTotal)  
FROM Sales.SalesOrderDetail;

SELECT TOP 10 AVG(LineTotal)  
FROM Sales.SalesOrderDetail;

-- -- -- AULA 12 -- -- -- 
-- GROUP BY 
SELECT * 
FROM Sales.SalesOrderDetail

SELECT SpecialOfferID, SUM(UnitPrice)
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID;

SELECT ProductID, COUNT(ProductID)
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

SELECT FirstName, COUNT(FirstName) 
FROM Person.Person
GROUP BY FirstName;

-- EXERCICIO 
-- 1
SELECT MiddleName,COUNT(FirstName) 
FROM Person.Person 
GROUP BY MiddleName;

-- 2

SELECT ProductID,AVG(OrderQty)
FROM Sales.SalesOrderDetail
GROUP BY ProductID;


-- 3 
/*
	ESTÁ SELECIONANDO OS 10 PRODUTOS QUE ESTÃO NO TOPO
	AS COLUNAS QUE DEVEM SER APRESENTADAS SÃO A ProductID E A SOMA DO LineTotal
	ESTÁ AGRUPANDO A CONSULTA PELO ProductId 
	E ORDENANDO DE FORMA DESCRENCENTE A SOMA DO LineTotal 
*/

SELECT TOP 10 ProductID, SUM(LineTotal)
FROM Sales.SalesOrderDetail
	GROUP BY ProductID
	ORDER BY SUM(LineTotal) DESC;


-- 4
SELECT * FROM Production.WorkOrder;

/*
	ESTÁ SELECIONANDO O ProductID, 
	CONTANDO TODOS OS ProductID e
	FAZENDO UMA MÉDIA DO OrderQty 
	ESSA CONSULTA ESTÁ AGRUPADA PELO ProductID
*/
SELECT ProductID, COUNT(ProductID), AVG(OrderQty)
FROM Production.WorkOrder
GROUP BY ProductID; 

-- -- -- AULA 13 -- -- -- 
-- HAVING
-- FUNCIONA COMO UM WHERE PARA DADOS AGRUPADOS 

/*
SELECT coluna1, funcaoAgradeco(coluna2)
FROM nomeTabela 
GROUP BY coluna1 
HAVING condicao
*/


/*
	ESTÁ SELECIONANDO O FirstName E FAZENDO UMA CONTAGEM DELE
	ESTÁ AGRUPANDO A CONSULTA PELO FirstName 
	E FILTRA PELA CONTAGEM DO FirstName SER MAIOR QUE 10 
*/
SELECT FirstName, COUNT(FirstName)
FROM Person.Person
GROUP BY FirstName
HAVING COUNT(FirstName) > 10;

SELECT ProductID, SUM(LineTotal)
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) BETWEEN 162000 AND 500000;

SELECT FirstName, COUNT(FirstName) 
FROM Person.Person
WHERE Title = 'Mr.'
GROUP BY FirstName
HAVING COUNT(FirstName) > 10; 


;




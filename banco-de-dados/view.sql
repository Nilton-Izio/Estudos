
CREATE VIEW [Pessoas Simplificado] AS
SELECT FirstName, MiddleName, LastName 
FROM Person.Person
WHERE Title = 'Ms.'

SELECT * FROM [Pessoas Simplificadas]
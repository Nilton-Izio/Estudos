-- FUNÇÃO: ASCII, NCHAR, CHAR, CHARINDEX, CONCAT, CONCAT_WS, DIFFERENCE 

-- ASCII 
SELECT ASCII('a');
SELECT ASCII('A');


--NCHAR 
SELECT NCHAR(65); 

--CHAR 
SELECT CHAR(65);

-- CHARINDEX (Pesquisa um caractere em uma sequência de até 8.000 caracteres)
SELECT CHARINDEX('a', 'aTrovaoa')
SELECT CHARINDEX('a','malandragem',6);
SELECT CHARINDEX('Gomes', 'Nilton Gabriel Ramos Gomes'); 

--DIFFERENCE (Dá uma escala de 0 a 4 por semelhança de String)
SELECT DIFFERENCE ('Alessandro', 'ALESSANDRO');
-- FUN��O: ASCII, NCHAR, CHAR, CHARINDEX, CONCAT, CONCAT_WS, DIFFERENCE 

-- ASCII 
SELECT ASCII('a');
SELECT ASCII('A');


--NCHAR 
SELECT NCHAR(65); 

--CHAR 
SELECT CHAR(65);

-- CHARINDEX (Pesquisa um caractere em uma sequ�ncia de at� 8.000 caracteres)
SELECT CHARINDEX('a', 'aTrovaoa')
SELECT CHARINDEX('a','malandragem',6);
SELECT CHARINDEX('Gomes', 'Nilton Gabriel Ramos Gomes'); 

--DIFFERENCE (D� uma escala de 0 a 4 por semelhan�a de String)
SELECT DIFFERENCE ('Alessandro', 'ALESSANDRO');

-- CONDI��O
IF 10 > 20 
	SELECT '10 � maio que 20'
ELSE 
	SELECT '10 � menor que 20'


-- DECLARANDO UMA VAR PARA PEGAR O DIA ATUAL E FAZENDO UMA VALIDA��O POR MEIO DE IF ELSE
DECLARE @DiaAtual VARCHAR(20)
SET @DiaAtual = DATENAME(WEEKDAY, GETDATE())

IF @DiaAtual IN ('Saturday', 'Sunday')
	SELECT 'Estamos em um final de semana. Hoje � ' + @DiaAtual
ELSE 
	SELECT 'Estamos em um dia de semana. Hoje � ' + @DiaAtual
	

-- VAR�VEIS GLOBAIS DO SQL

SELECT @@SERVERNAME -- Mostra o nome do server
SELECT @@LANGUAGE -- Mostra o idioma que o servidor est� 
SELECT @@LANGID -- Mostra o idenficador desse idioma
SELECT @@TRANCOUNT -- Mostra a contagem de transa��es que est�o ativas 

-- EST� VERIFICANDO SE O LOCAL QUE O SERVER O IDIOMA � INGL�S (0) 
IF @@LANGID = 0 
	SELECT 'Good Morning'
ELSE 
	SELECT 'Bom dia'
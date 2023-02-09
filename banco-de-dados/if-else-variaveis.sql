
-- CONDIÇÃO
IF 10 > 20 
	SELECT '10 é maio que 20'
ELSE 
	SELECT '10 é menor que 20'


-- DECLARANDO UMA VAR PARA PEGAR O DIA ATUAL E FAZENDO UMA VALIDAÇÃO POR MEIO DE IF ELSE
DECLARE @DiaAtual VARCHAR(20)
SET @DiaAtual = DATENAME(WEEKDAY, GETDATE())

IF @DiaAtual IN ('Saturday', 'Sunday')
	SELECT 'Estamos em um final de semana. Hoje é ' + @DiaAtual
ELSE 
	SELECT 'Estamos em um dia de semana. Hoje é ' + @DiaAtual
	

-- VARÁVEIS GLOBAIS DO SQL

SELECT @@SERVERNAME -- Mostra o nome do server
SELECT @@LANGUAGE -- Mostra o idioma que o servidor está 
SELECT @@LANGID -- Mostra o idenficador desse idioma
SELECT @@TRANCOUNT -- Mostra a contagem de transações que estão ativas 

-- ESTÁ VERIFICANDO SE O LOCAL QUE O SERVER O IDIOMA É INGLÊS (0) 
IF @@LANGID = 0 
	SELECT 'Good Morning'
ELSE 
	SELECT 'Bom dia'
-- CRIANDO TABELAS TEMPORARIAS 
CREATE TABLE #tmp_dados(
	nome VARCHAR(50),
	idade INT
);

INSERT INTO #tmp_dados VALUES ('Nilton', 19);

SELECT * FROM #tmp_dados;

SELECT *
INTO #tmp_essa
FROM #tmp_dados
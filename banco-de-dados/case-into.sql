
-- ENTENDO COMO TRABALHAR MELHOR COM O THEN E O ELSE
SELECT 
	CASE WHEN LEN('Bananinha') <= 10 THEN 1 ELSE 0 END

/*
O INTO TRANSPORTA OS DADOS DO SELECT PARA UMA TABELA TEMPORARIA 

NESSE CASO TODOS OS CAMPOS DA TABELA Canal FORAM PARA A TABELA CanaisLegais
*/
SELECT CanalID, Nome
INTO #CanaisLegais
FROM Canal;

SELECT * FROM #CanaisLegais;


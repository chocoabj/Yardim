--Criação da tabela de clientes
CREATE TABLE Cliente (
    nome NVARCHAR(100),
    idade INT,
    cidade NVARCHAR(255)
);

--Busca de dados no arquivo Json
INSERT INTO Cliente (nome, idade, cidade)
SELECT dados.*
FROM OPENROWSET(BULK 'C:\cliente.json', SINGLE_CLOB) AS j
CROSS APPLY OPENJSON(BulkColumn) WITH (
    nome NVARCHAR(100),
    idade INT,
    cidade NVARCHAR(100)
) AS dados

--Geração do arquivo CSV
select 'nome;'+'idade;'+'cidade'
union all
SELECT 
nome+';'+cast(idade as nvarchar)+';'+cidade
from Cliente

--select * from cliente


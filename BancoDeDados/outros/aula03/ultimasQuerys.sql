SELECT bairros.f0149idbairro, bairros.f0149nome
FROM APUMinasPneus.dbo.t0149 bairros


SELECT top 100 COLUMN_NAME, TABLE_NAME
FROM APUMinasPneus.INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME like '%endereco%' -- Substitua pelo esquema da sua tabela
  AND TABLE_NAME = 't0050'; 

   select f0050idclifor, f0050endereco, 
	f0050cobrancaendereco, f0149idbairrocobranca, f0048idcidadecobranca, f0050cobrancacep,
	f0050entregaendereco, f0050enderecocomercial, f0050enderecocomercial
   from APUMinasPneus.dbo.t0050
   where f0050cobrancaendereco IS NOT NULL
	and f0050idclifor = 4847

	select COUNT(*) as qtde from APUMinasPneus.dbo.t0050

SELECT ec.IdCliente, ec.IdEndereco, ec.IdTipoEndereco, e.Descricao, e.IdBairro, e.IdCidade, e.Cep
FROM EnderecoPorCliente ec
	inner join Endereco e on e.IdEndereco = ec.IdEndereco
where IdTipoEndereco <> 1
ORDER BY IdCliente

SELECT ec.IdCliente, ec.IdEndereco, ec.IdTipoEndereco, e.Descricao, e.IdBairro, e.IdCidade, e.Cep
FROM EnderecoPorCliente ec
	inner join Endereco e on e.IdEndereco = ec.IdEndereco
where IdCliente = 209905
ORDER BY IdCliente

SELECT top 100 f0050fonecelular, f0050fonefax, 
f0050foneoutro, f0050fonecomercialconjuge, f0050fonecomercialconfirmado, f0050foneresidencialconfirmado
from APUMinasPneus.dbo.t0050

  select top 1 * from APUMinasPneus.dbo.t0498
  select top 1 * from APUMinasPneus.dbo.t0050 

SELECT pais.*
from APUMinasPneus.dbo.t0046 pais 

select top 100 * from APUMinasPneus.dbo.t0020 where  f0020titulo like '%tend%'
select top 100 * from APUMinasPneus.dbo.t0050;
select top 100 * from APUMinasPneus.dbo.t0658;

select f0050situacaocredito from APUMinasPneus.dbo.t0050


DECLARE @IdCliente INT;
DECLARE @NomeCliente VARCHAR(300);
DECLARE @NomePai VARCHAR(300);
DECLARE @NomeMae VARCHAR(300);
DECLARE @DataDeNascimento DATETIME;
DECLARE @NomeConjuge VARCHAR(300);

-- Cursor para percorrer os dados da tabela externa
DECLARE cursorDados CURSOR FOR
SELECT top 10000 f0050idclifor, f0050nome, f0050nomepai, f0050nomemae, f0050dtanascimento, f0050conjugenome
FROM APUMinasPneus.dbo.t0050

-- Abrir o cursor
OPEN cursorDados;

-- Variáveis para armazenar os valores lidos do cursor
FETCH NEXT FROM cursorDados INTO @IdCliente, @NomeCliente, @NomePai, @NomeMae, @DataDeNascimento, @NomeConjuge;

-- Loop para executar a stored procedure para cada linha
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Executar a stored procedure com os valores lidos do cursor
    EXEC spInserirCliente @IdCliente, @NomeCliente, @NomePai, @NomeMae, @DataDeNascimento, @NomeConjuge;

    -- Próxima linha
    FETCH NEXT FROM cursorDados INTO @IdCliente, @NomeCliente, @NomePai, @NomeMae, @DataDeNascimento, @NomeConjuge;
END

-- Fechar o cursor
CLOSE cursorDados;
DEALLOCATE cursorDados;

select * from Filiacao
select * from LogErros
select * from Cliente
select * from Telefone where IdTipoTelefone = 6
select * from Telefone
select * from DependenteCliente
select * from ValidacaoDeCredito where Status = 'p'
select * from TipoTelefone
select * from  TipoEndereco
select * from Endereco
select * from EnderecoPorCliente

SELECT *
FROM EnderecoPorCliente
where IdTipoEndereco <> 1
ORDER BY IdCliente


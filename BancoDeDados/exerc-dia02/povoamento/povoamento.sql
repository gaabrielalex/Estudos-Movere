

INSERT INTO Pais(IdPais, Nome)
(
	SELECT f0046idpais, f0046nome
	FROM  APUMinasPneus.dbo.t0046
);

INSERT INTO Estado(IdEstado, IdPais, Nome)
(
	SELECT f0047idestado, f0046idpais, f0047nome
	FROM  APUMinasPneus.dbo.t0047
);

INSERT INTO Cidade(IdCidade, IdEstado, Nome)
(
	SELECT f0048idcidade, f0047idestado, f0048nome
	FROM  APUMinasPneus.dbo.t0048
);

INSERT INTO Bairro(IdBairro, Nome)
(
	SELECT f0149idbairro, f0149nome
	FROM  APUMinasPneus.dbo.t0149
);


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

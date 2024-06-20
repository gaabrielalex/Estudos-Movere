

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


INSERT INTO TipoTelefone(IDTipoTelefone, Nome)
VALUES  (1, 'Residencial'), 
        (2, 'Comercial'), 
        (3, 'Celular'), 
        (4, 'Fax'), 
        (5, 'Outro'),
        (6, 'Conjuge')

------------------- CLIENTE -------------------
DECLARE @IdCliente INT;
DECLARE @NomeCliente VARCHAR(300);
DECLARE @SobrenomeCliente VARCHAR(100);
DECLARE @NomePai VARCHAR(300);
DECLARE @NomeMae VARCHAR(300);
DECLARE @DataDeNascimento DATETIME;
DECLARE @NomeConjuge VARCHAR(300);
DECLARE @TelefoneResidencial VARCHAR(14);
DECLARE @TelefoneComercial VARCHAR(14);
DECLARE @TelefoneCelular VARCHAR(14);
DECLARE @TelefoneFax VARCHAR(14);
DECLARE @TelefoneOutro VARCHAR(14);
DECLARE @TelefoneConjuge VARCHAR(14);

-- Cursor para percorrer os dados da tabela externa
DECLARE cursorDados CURSOR FOR
(
    SELECT top 20000
        clientes.f0050idclifor,
        SUBSTRING(clientes.f0050nome, 1, CHARINDEX(' ', clientes.f0050nome) - 1),
        SUBSTRING(clientes.f0050nome, CHARINDEX(' ', clientes.f0050nome) + 1, LEN(clientes.f0050nome)),
        clientes.f0050nomepai,
        clientes.f0050nomemae,
        clientes.f0050dtanascimento,
        clientes.f0050conjugenome,
        CursoGabrielSilva.dbo.ExtrairNumeros(clientes.f0050foneresidencialconfirmado) AS TelefoneResidencial,
        CursoGabrielSilva.dbo.ExtrairNumeros(clientes.f0050fonecom) AS TelefoneComercial,
        CursoGabrielSilva.dbo.ExtrairNumeros(clientes.f0050fonecelular) AS TelefoneCelular,
        CursoGabrielSilva.dbo.ExtrairNumeros(clientes.f0050fonefax) AS TelefoneFax,
        CursoGabrielSilva.dbo.ExtrairNumeros(clientes.f0050foneoutro) AS TelefoneOutro,
        CursoGabrielSilva.dbo.ExtrairNumeros(clientes.f0050fonecomercialconjuge) AS TelefoneConjuge
    from APUMinasPneus.dbo.t0050 clientes
    where CHARINDEX(' ', clientes.f0050nome) > 0

    union

    SELECT top 20000
        clientes.f0050idclifor,
        clientes.f0050nome,
        '',
        clientes.f0050nomepai,
        clientes.f0050nomemae,
        clientes.f0050dtanascimento,
        clientes.f0050conjugenome,
        CursoGabrielSilva.dbo.ExtrairNumeros(clientes.f0050foneresidencialconfirmado) AS TelefoneResidencial,
        CursoGabrielSilva.dbo.ExtrairNumeros(clientes.f0050fonecom) AS TelefoneComercial,
        CursoGabrielSilva.dbo.ExtrairNumeros(clientes.f0050fonecelular) AS TelefoneCelular,
        CursoGabrielSilva.dbo.ExtrairNumeros(clientes.f0050fonefax) AS TelefoneFax,
        CursoGabrielSilva.dbo.ExtrairNumeros(clientes.f0050foneoutro) AS TelefoneOutro,
        CursoGabrielSilva.dbo.ExtrairNumeros(clientes.f0050fonecomercialconjuge) AS TelefoneConjuge
    from APUMinasPneus.dbo.t0050 clientes
    where CHARINDEX(' ', clientes.f0050nome) = 0
);

-- Abrir o cursor
OPEN cursorDados;

-- Variáveis para armazenar os valores lidos do cursor
FETCH NEXT FROM cursorDados INTO @IdCliente, @NomeCliente, @SobrenomeCliente, @NomePai, @NomeMae, @DataDeNascimento, @NomeConjuge, 
                                @TelefoneResidencial, @TelefoneComercial, @TelefoneCelular, @TelefoneFax, @TelefoneOutro, @TelefoneConjuge;

-- Loop para executar a stored procedure para cada linha
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Executar a stored procedure com os valores lidos do cursor
    EXEC spInserirDadosDoCliente @IdCliente, @NomeCliente, @SobrenomeCliente, @NomePai, @NomeMae, @DataDeNascimento, @NomeConjuge, 
                                @TelefoneResidencial, @TelefoneComercial, @TelefoneCelular, @TelefoneFax, @TelefoneOutro, @TelefoneConjuge;

    -- Próxima linha
    FETCH NEXT FROM cursorDados INTO @IdCliente, @NomeCliente, @SobrenomeCliente, @NomePai, @NomeMae, @DataDeNascimento, @NomeConjuge, 
                                @TelefoneResidencial, @TelefoneComercial, @TelefoneCelular, @TelefoneFax, @TelefoneOutro, @TelefoneConjuge;
END

-- Fechar o cursor
CLOSE cursorDados;
DEALLOCATE cursorDados;



------------------- VALIDACAO CREDITO -------------------
INSERT INTO ValidacaoDeCredito (IdCliente, Data, Status)
(
	SELECT 
		f0050idclifor, 
		f0050datahorasolicitacaocredito, 
		f0050situacaocredito
	FROM 
		APUMinasPneus.dbo.t0050 AS t0050
	WHERE 
		t0050.f0050situacaocredito IS NOT NULL
		AND EXISTS (
			SELECT 1 
			FROM CursoGabrielSilva.dbo.Cliente AS c
			WHERE c.IdCliente = t0050.f0050idclifor
		)
);

------------------- DEPENDENTE CLIENTE -------------------
INSERT INTO DependenteCliente(IdDependeteCliente, IdCliente, NomeCompleto, DataDeNascimento)
(
	SELECT f0498iddependente, f0050idclifor, f0498nome, f0498datanascimento 
	FROM  APUMinasPneus.dbo.t0498
);


-- Criação de uma tabela temporária para armazenar os dados gerados
CREATE TABLE #TempDependenteCliente (
    IdDependeteCliente INT,
    IdCliente INT,
    NomeCompleto VARCHAR(100),
    DataDeNascimento DATE
);

-- Variáveis para controle do loop e geração dos dados
DECLARE @RowCount INT = 1;
DECLARE @MaxRows INT = 10000; -- Número desejado de registros a serem gerados

-- Loop para inserir os registros na tabela temporária
WHILE @RowCount <= @MaxRows
BEGIN
    -- Gerando valores fictícios para cada coluna
    DECLARE @IdDependente INT = @RowCount; -- Exemplo simples de ID sequencial
    DECLARE @IdCliente INT = FLOOR(RAND() * 1000) + 1; -- ID do cliente fictício entre 1 e 1000
    DECLARE @NomeCompleto VARCHAR(100) = 'Dependente' + CAST(@RowCount AS VARCHAR); -- Nome fictício
    DECLARE @DataNascimento DATE = GETDATE(); -- Data de nascimento fictícia (últimos 50 anos)

    -- Verifica se o IdCliente existe na tabela Clientes
    IF EXISTS (SELECT 1 FROM Cliente WHERE IdCliente = @IdCliente)
    BEGIN
        -- Inserindo os valores na tabela temporária
        INSERT INTO #TempDependenteCliente (IdDependeteCliente, IdCliente, NomeCompleto, DataDeNascimento)
        VALUES (@IdDependente, @IdCliente, @NomeCompleto, @DataNascimento);

        -- Incrementando o contador
        SET @RowCount = @RowCount + 1;
    END
    ELSE
    BEGIN
        -- Se o IdCliente não existe, aqui você pode optar por ignorar, logar o erro, ou tomar outra ação necessária
        SET @RowCount = @RowCount + 1; -- Incrementa o contador sem inserir o registro
    END
END

-- Início da transação para inserção na tabela final DependenteCliente
BEGIN TRANSACTION
BEGIN TRY
    -- Inserção dos dados gerados na tabela final DependenteCliente
    INSERT INTO DependenteCliente (IdDependeteCliente, IdCliente, NomeCompleto, DataDeNascimento)
    SELECT IdDependeteCliente, IdCliente, NomeCompleto, DataDeNascimento
    FROM #TempDependenteCliente;

    -- Confirmação da transação
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    -- Em caso de erro, rollback da transação
    ROLLBACK TRANSACTION;

    -- Captura e exibe a mensagem de erro
    PRINT ERROR_MESSAGE();
END CATCH

-- Removendo a tabela temporária
DROP TABLE #TempDependenteCliente;

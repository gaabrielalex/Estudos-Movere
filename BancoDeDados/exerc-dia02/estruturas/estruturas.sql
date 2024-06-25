-- Funcão extrair números
CREATE FUNCTION ExtrairNumeros(@input NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @resultado NVARCHAR(MAX) = '';
    DECLARE @i INT = 1;
    DECLARE @len INT = LEN(@input);
    DECLARE @char NCHAR(1);
    
    WHILE @i <= @len
    BEGIN
        SET @char = SUBSTRING(@input, @i, 1);
        IF @char LIKE '[0-9]'
        BEGIN
            SET @resultado = @resultado + @char;
        END
        SET @i = @i + 1;
    END
    
    RETURN @resultado;
END

GO

-- Criação de tabelas
CREATE TABLE Filiacao (
	IdFiliacao int IDENTITY(1,1) NOT NULL,
	NomePai varchar(300) NULL,
	NomeMae varchar(300) NULL,
	CONSTRAINT PK_Filiacao PRIMARY KEY(IdFiliacao)
);

CREATE TABLE Cliente (
	IdCliente int NOT NULL,
	IdFiliacao int NOT NULL,
	Nome varchar(300) NOT NULL,
	Sobrenome varchar(100) NOT NULL,
	DataDeNascimento datetime NULL,
	DataDeCadastro datetime NULL DEFAULT GETDATE(),
	NomeConjuge varchar(300) NULL,
	CONSTRAINT PK_Cliente PRIMARY KEY(IdCliente),
	CONSTRAINT FK_Cliente_Filiacao FOREIGN KEY(IdFiliacao) REFERENCES Filiacao (IdFiliacao)
);

CREATE TABLE DependenteCliente (
	IdDependeteCliente int NOT NULL,
	IdCliente int NOT NULL,
	NomeCompleto varchar(300) NOT NULL,
	DataDeNascimento datetime NOT NULL,
	CONSTRAINT PK_DependenteCliente PRIMARY KEY(IdDependeteCliente),
	CONSTRAINT FK_DependenteCliente_Cliente FOREIGN KEY(IdCliente) REFERENCES Cliente (IdCliente)
);

CREATE TABLE ValidacaoDeCredito (
	IdValidacaoDeCredito int IDENTITY(1,1) NOT NULL,
	IdCliente int NOT NULL,
	Data datetime NULL,
	Status char(1) NOT NULL,
	CONSTRAINT PK_ValidacaoDeCredito PRIMARY KEY(IdValidacaoDeCredito),
	CONSTRAINT FK_ValidacaoDeCredito_Cliente FOREIGN KEY(IdCliente) REFERENCES Cliente (IdCliente)
);

CREATE TABLE TipoTelefone (
	IdTipoTelefone int NOT NULL,
	Nome varchar(100) NOT NULL,
	CONSTRAINT PK_TipoTelefone PRIMARY KEY(IdTipoTelefone)
);

CREATE TABLE Telefone (
	IdCliente int NOT NULL,
	IdTipoTelefone int NOT NULL,
	Numero varchar(14) NOT NULL,
	CONSTRAINT PK_Telefone PRIMARY KEY(IdCliente, IdTipoTelefone),
	CONSTRAINT FK_Telefone_Cliente FOREIGN KEY(IdCliente) REFERENCES Cliente (IdCliente),
	CONSTRAINT FK_Telefone_TipoTelefone FOREIGN KEY(IdTipoTelefone) REFERENCES TipoTelefone (IdTipoTelefone)
);

CREATE TABLE Pais (
	IdPais int NOT NULL,
	Nome varchar(100) NOT NULL,
	CONSTRAINT PK_Pais PRIMARY KEY(IdPais)
);

CREATE TABLE Estado (
	IdEstado char(2) NOT NULL,
	IdPais int NOT NULL,
	Nome varchar(100) NOT NULL,
	CONSTRAINT PK_Estado PRIMARY KEY(IdEstado),
	CONSTRAINT FK_Estado_Pais FOREIGN KEY(IdPais) REFERENCES Pais (IdPais)
)

CREATE TABLE Cidade (
	IdCidade int NOT NULL,
	IdEstado char(2) NOT NULL,
	Nome varchar(200) NOT NULL,
	CONSTRAINT PK_Cidade PRIMARY KEY(IdCidade),
	CONSTRAINT FK_Cidade_Estado FOREIGN KEY(IdEstado) REFERENCES Estado (IdEstado)
);

CREATE TABLE Bairro (
	IdBairro int NOT NULL,
	Nome varchar(200) NOT NULL,
	CONSTRAINT PK_Bairro PRIMARY KEY(IdBairro)
);

CREATE TABLE Endereco (
	IdEndereco int IDENTITY(1,1) NOT NULL,
	IdBairro int NOT NULL,
	IdCidade int NOT NULL,
	Descricao varchar(400) NOT NULL,
	Cep varchar(12) NULL,
	CONSTRAINT PK_Endereco PRIMARY KEY(IdEndereco),
	CONSTRAINT FK_Endereco_Bairro FOREIGN KEY(IdBairro) REFERENCES Bairro (IdBairro),
	CONSTRAINT FK_Endereco_Cidade FOREIGN KEY(IdCidade) REFERENCES Cidade (IdCidade)
);

CREATE TABLE TipoEndereco (
	IdTipoEndereco int NOT NULL,
	Nome varchar(100) NOT NULL,
	CONSTRAINT PK_TipoEndereco PRIMARY KEY(IdTipoEndereco)
);

CREATE TABLE EnderecoPorCliente (
	IdCliente int NOT NULL,
	IdEndereco int NOT NULL,
	IdTipoEndereco int NOT NULL,
	CONSTRAINT PK_EnderecoPorCliente PRIMARY KEY(IdCliente,IdEndereco,IdTipoEndereco),
	CONSTRAINT FK_EnderecoPorCliente_Cliente FOREIGN KEY(IdCliente) REFERENCES Cliente (IdCliente),
	CONSTRAINT FK_EnderecoPorCliente_Endereco FOREIGN KEY(IdEndereco) REFERENCES Endereco (IdEndereco),
	CONSTRAINT FK_EnderecoPorCliente_TipoEndereco FOREIGN KEY(IdTipoEndereco) REFERENCES TipoEndereco (IdTipoEndereco)
);

GO
-- Criação Estrutura Procedure Inserir Clientes
CREATE TABLE LogErros (
    LogID INT IDENTITY(1,1),
    MensagemErro TEXT,
    DataErro DATETIME NULL DEFAULT GETDATE(),
	CONSTRAINT PK_LogErros PRIMARY KEY(LogID)
);

GO

CREATE PROCEDURE spInserirDadosDoCliente
	@IdCliente INT,
	@NomeCliente VARCHAR(300),
	@SobrenomeCliente VARCHAR(100),
    @NomePai VARCHAR(300),
    @NomeMae VARCHAR(300),
	@DataDeNascimento DATETIME,
	@NomeConjuge VARCHAR(300),
	@TelefoneResidencial VARCHAR(14),
	@TelefoneComercial VARCHAR(14),
	@TelefoneCelular VARCHAR(14),
	@TelefoneFax VARCHAR(14),
	@TelefoneOutro VARCHAR(14),
	@TelefoneConjuge VARCHAR(14),
	@DescricaoEnderecoPrincipal VARCHAR(400),
	@IdBairroEnderecoPrincipal INT,
	@IdCidadeEnderecoPrincipal INT,
	@CepEnderecoPrincipal varchar(12),
	@DescricaoEnderecoCobranca VARCHAR(400),
	@IdBairroEnderecoCobranca INT,
	@IdCidadeEnderecoCobranca INT,
	@CepEnderecoCobranca varchar(12),
	@DescricaoEnderecoEntrega VARCHAR(400),
	@IdBairroEnderecoEntrega INT,
	@IdCidadeEnderecoEntrega INT,
	@CepEnderecoEntrega varchar(12),
	@DescricaoEnderecoComercial VARCHAR(400),
	@IdBairroEnderecoComercial INT,
	@IdCidadeEnderecoComercial INT,
	@CepEnderecoComercial varchar(12),
	@DescricaoEnderecoConjuge VARCHAR(400),
	@IdBairroEnderecoConjuge INT,
	@IdCidadeEnderecoConjuge INT,
	@CepEnderecoConjuge varchar(12)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
						
		-- Inserindo Filiacao
        INSERT INTO Filiacao (NomePai, NomeMae)
        VALUES (@NomePai, @NomeMae);

        DECLARE @IdFiliacaoInserido INT;
        SET @IdFiliacaoInserido = SCOPE_IDENTITY();


		-- Inserindo Cliente
		INSERT INTO Cliente (IdCliente, IdFiliacao, Nome, Sobrenome, DataDeNascimento, NomeConjuge)
		VALUES (@IdCliente, @IdFiliacaoInserido, @NomeCliente, @SobrenomeCliente, @DataDeNascimento, @NomeConjuge);


		-- Inserindo Telefones
		IF (@TelefoneResidencial IS NOT NULL) AND (@TelefoneResidencial <> '')
		BEGIN
			INSERT INTO Telefone (IdCliente, IdTipoTelefone, Numero)
			VALUES (@IdCliente, 1, @TelefoneResidencial);
		END

		IF (@TelefoneComercial IS NOT NULL) AND (@TelefoneComercial <> '')
		BEGIN
			INSERT INTO Telefone (IdCliente, IdTipoTelefone, Numero)
			VALUES (@IdCliente, 2, @TelefoneComercial);
		END

		IF (@TelefoneCelular IS NOT NULL) AND (@TelefoneCelular <> '')
		BEGIN
			INSERT INTO Telefone (IdCliente, IdTipoTelefone, Numero)
			VALUES (@IdCliente, 3, @TelefoneCelular);
		END

		IF (@TelefoneFax IS NOT NULL) AND (@TelefoneFax <> '')
		BEGIN
			INSERT INTO Telefone (IdCliente, IdTipoTelefone, Numero)
			VALUES (@IdCliente, 4, @TelefoneFax);
		END

		IF (@TelefoneOutro IS NOT NULL) AND (@TelefoneOutro <> '')
		BEGIN
			INSERT INTO Telefone (IdCliente, IdTipoTelefone, Numero)
			VALUES (@IdCliente, 5, @TelefoneOutro);
		END

		IF (@TelefoneConjuge IS NOT NULL) AND (@TelefoneConjuge <> '')
		BEGIN
			INSERT INTO Telefone (IdCliente, IdTipoTelefone, Numero)
			VALUES (@IdCliente, 6, @TelefoneConjuge);
		END


		-- Inserindo Endereços
		IF ((@DescricaoEnderecoPrincipal IS NOT NULL) AND (@DescricaoEnderecoPrincipal <> '')) AND
		   (@IdBairroEnderecoPrincipal IS NOT NULL) AND
		   (@IdCidadeEnderecoPrincipal IS NOT NULL)
		BEGIN
			INSERT INTO Endereco (IdBairro, IdCidade, Descricao, Cep)
			VALUES (@IdBairroEnderecoPrincipal, @IdCidadeEnderecoPrincipal, @DescricaoEnderecoPrincipal, @CepEnderecoPrincipal);

			DECLARE @IdEnderecoPrincipalInserido INT;
			SET @IdEnderecoPrincipalInserido = SCOPE_IDENTITY();

			-- Inserindo Endereço Principal do Cliente
			INSERT INTO EnderecoPorCliente (IdCliente, IdEndereco, IdTipoEndereco)
			VALUES (@IdCliente, @IdEnderecoPrincipalInserido, 1);
		END

		IF ((@DescricaoEnderecoCobranca IS NOT NULL) AND (@DescricaoEnderecoCobranca <> '')) AND
		   (@IdBairroEnderecoCobranca IS NOT NULL) AND
		   (@IdCidadeEnderecoCobranca IS NOT NULL)
		BEGIN
			INSERT INTO Endereco (IdBairro, IdCidade, Descricao, Cep)
			VALUES (@IdBairroEnderecoCobranca, @IdCidadeEnderecoCobranca, @DescricaoEnderecoCobranca, @CepEnderecoCobranca);

			DECLARE @IdEnderecoCobrancaInserido INT;
			SET @IdEnderecoCobrancaInserido = SCOPE_IDENTITY();

			-- Inserindo Endereço de Cobrança do Cliente
			INSERT INTO EnderecoPorCliente (IdCliente, IdEndereco, IdTipoEndereco)
			VALUES (@IdCliente, @IdEnderecoCobrancaInserido, 2);
		END

		IF ((@DescricaoEnderecoEntrega IS NOT NULL) AND (@DescricaoEnderecoEntrega <> '')) AND
		   (@IdBairroEnderecoEntrega IS NOT NULL) AND
		   (@IdCidadeEnderecoEntrega IS NOT NULL)
		BEGIN
			INSERT INTO Endereco (IdBairro, IdCidade, Descricao, Cep)
			VALUES (@IdBairroEnderecoEntrega, @IdCidadeEnderecoEntrega, @DescricaoEnderecoEntrega, @CepEnderecoEntrega);

			DECLARE @IdEnderecoEntregaInserido INT;
			SET @IdEnderecoEntregaInserido = SCOPE_IDENTITY();

			-- Inserindo Endereço de Entrega do Cliente
			INSERT INTO EnderecoPorCliente (IdCliente, IdEndereco, IdTipoEndereco)
			VALUES (@IdCliente, @IdEnderecoEntregaInserido, 3);
		END

		IF ((@DescricaoEnderecoComercial IS NOT NULL) AND (@DescricaoEnderecoComercial <> '')) AND
		   (@IdBairroEnderecoComercial IS NOT NULL) AND
		   (@IdCidadeEnderecoComercial IS NOT NULL)
		BEGIN
			INSERT INTO Endereco (IdBairro, IdCidade, Descricao, Cep)
			VALUES (@IdBairroEnderecoComercial, @IdCidadeEnderecoComercial, @DescricaoEnderecoComercial, @CepEnderecoComercial);

			DECLARE @IdEnderecoComercialInserido INT;
			SET @IdEnderecoComercialInserido = SCOPE_IDENTITY();

			-- Inserindo Endereço Comercial do Cliente
			INSERT INTO EnderecoPorCliente (IdCliente, IdEndereco, IdTipoEndereco)
			VALUES (@IdCliente, @IdEnderecoComercialInserido, 4);
		END

		IF ((@DescricaoEnderecoConjuge IS NOT NULL) AND (@DescricaoEnderecoConjuge <> '')) AND
		   (@IdBairroEnderecoConjuge IS NOT NULL) AND
		   (@IdCidadeEnderecoConjuge IS NOT NULL)
		BEGIN
			INSERT INTO Endereco (IdBairro, IdCidade, Descricao, Cep)
			VALUES (@IdBairroEnderecoConjuge, @IdCidadeEnderecoConjuge, @DescricaoEnderecoConjuge, @CepEnderecoConjuge);

			DECLARE @IdEnderecoConjugeInserido INT;
			SET @IdEnderecoConjugeInserido = SCOPE_IDENTITY();

			-- Inserindo Endereço do Cônjuge do Cliente
			INSERT INTO EnderecoPorCliente (IdCliente, IdEndereco, IdTipoEndereco)
			VALUES (@IdCliente, @IdEnderecoConjugeInserido, 5);
		END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        -- Capturando e retornando informações sobre o erro
        DECLARE @ErroMensagem NVARCHAR(4000);
        DECLARE @ErroNumero INT;
        DECLARE @ErroSeveridade INT;
        DECLARE @ErroEstado INT;
        DECLARE @ErroLinha INT;

        SELECT 
            @ErroMensagem = ERROR_MESSAGE(),
            @ErroNumero = ERROR_NUMBER(),
            @ErroSeveridade = ERROR_SEVERITY(),
            @ErroEstado = ERROR_STATE(),
            @ErroLinha = ERROR_LINE();

        -- Retornando informações sobre o erro
        RAISERROR (
            'Erro %d, Severidade %d, Estado %d, Linha %d: %s',
            @ErroSeveridade, 
            @ErroEstado, 
            @ErroNumero, 
            @ErroLinha, 
            @ErroMensagem
        );

        -- Inserção do erro no LogErros
        INSERT INTO LogErros (MensagemErro)
        VALUES (
            FORMATMESSAGE('Erro %d, Severidade %d, Estado %d, Linha %d: %s', 
                          @ErroSeveridade, @ErroEstado, @ErroNumero, @ErroLinha, @ErroMensagem)
        );
    END CATCH;
END;

go

--Views
create or alter view vwCliente
as
	select DISTINCT
		CONCAT(cl.Nome, cl.Sobrenome) AS Nome,
		C.Nome as Cidade,
		cl.DataDeNascimento as 'Data de nascimento',
		cl.DataDeCadastro as 'Data de cadastro'
	from Cliente cl
		inner join EnderecoPorCliente ec on
			ec.IdCliente = cl.IdCliente
		inner join Endereco e on
			e.IdEndereco = ec.IdEndereco
		inner join Cidade c on
			c.IdCidade = e.IdCidade
go


CREATE TABLE Cliente (
	IdCliente int NOT NULL,
	IdFiliacao int NOT NULL,
	Nome varchar(300) NOT NULL,
	Sobrenome varchar(100) NOT NULL,
	DataDeNascimento datetime NULL,
	DataDeCadastro datetime NULL DEFAULT GETDATE(),
	NomeConjuge varchar(300) NULL,
	CONSTRAINT PK_Cliente PRIMARY KEY(IdCliente),
	CONSTRAINT FK_Cliente_Filiacao FOREIGN KEY(IdFiliacao) REFERENCES Filiacao (IdFiliacao)
);
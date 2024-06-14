

CREATE TABLE Filiacao (
	IdFiliacao int NOT NULL,
	NomePai varchar(300) NOT NULL,
	NomeMae varchar(300) NOT NULL,
	CONSTRAINT PK_Filiacao PRIMARY KEY(IdFiliacao)
);

CREATE TABLE Cliente (
	IdCliente int NOT NULL,
	IdFiliacao int NULL,
	Nome varchar(50) NOT NULL,
	Sobrenome varchar(250) NOT NULL,
	DataDeNascimento datetime NOT NULL,
	DataDeCadastro datetime NULL DEFAULT GETDATE(),
	NomeConjuge varchar(300) NULL DEFAULT 'N/A',
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
	IdValidacaoDeCredito int NOT NULL,
	CodigoCliente int NOT NULL,
	Data datetime NOT NULL,
	Status char(1) NOT NULL,
	CONSTRAINT PK_ValidacaoDeCredito PRIMARY KEY(IdValidacaoDeCredito),
	CONSTRAINT FK_ValidacaoDeCredito_Cliente FOREIGN KEY(CodigoCliente) REFERENCES Cliente (IdCliente)
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
	Nome varchar(200) NOT NULL,
	CONSTRAINT PK_Pais PRIMARY KEY(IdPais)
);

CREATE TABLE Cidade (
	IdCidade int NOT NULL,
	IdPais int NOT NULL,
	Nome varchar(200) NOT NULL,
	FOREIGN KEY(IdPais) REFERENCES Pais (IdPais),
	CONSTRAINT PK_Cidade PRIMARY KEY(IdCidade)
);

CREATE TABLE Bairro (
	IdBairro int NOT NULL,
	Nome varchar(200) NOT NULL,
	CONSTRAINT PK_Bairro PRIMARY KEY(IdBairro)
);

CREATE TABLE Endereco (
	IdEndereco int NOT NULL,
	IdBairro int NOT NULL,
	IdCidade int NOT NULL,
	Descricao varchar(400) NOT NULL,
	Cep varchar(12) NOT NULL,
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
	Numero smallint NOT NULL,
	CONSTRAINT PK_EnderecoPorCliente PRIMARY KEY(IdCliente,IdEndereco,IdTipoEndereco),
	CONSTRAINT FK_EnderecoPorCliente_Cliente FOREIGN KEY(IdCliente) REFERENCES Cliente (IdCliente),
	CONSTRAINT FK_EnderecoPorCliente_Endereco FOREIGN KEY(IdEndereco) REFERENCES Endereco (IdEndereco),
	CONSTRAINT FK_EnderecoPorCliente_TipoEndereco FOREIGN KEY(IdTipoEndereco) REFERENCES TipoEndereco (IdTipoEndereco)
);


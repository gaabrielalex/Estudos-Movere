
CREATE TABLE Filiacao (
	IdFiliacao int,
	NomePai varchar(300),
	NomeMae varchar(300),
	CONSTRAINT PK_Filiacao PRIMARY KEY(IdFiliacao)
);

CREATE TABLE Cliente (
	IdCliente int,
	IdFiliacao int,
	Nome varchar(50),
	Sobrenome varchar(250),
	DataDeNascimento datetime,
	DataDeCadastro datetime,
	NomeConjuge varchar(300),
	CONSTRAINT PK_Cliente PRIMARY KEY(IdCliente),
	CONSTRAINT FK_Cliente_Filiacao FOREIGN KEY(IdFiliacao) REFERENCES Filiacao (IdFiliacao)
);

CREATE TABLE DependenteCliente (
	IdDependeteCliente int,
	IdCliente int,
	NomeCompleto varchar(300),
	DataDeNascimento datetime,
	CONSTRAINT PK_DependenteCliente PRIMARY KEY(IdDependeteCliente),
	CONSTRAINT FK_DependenteCliente_Cliente FOREIGN KEY(IdCliente) REFERENCES Cliente (IdCliente)
);

CREATE TABLE ValidacaoDeCredito (
	IdValidacaoDeCredito int,
	CodigoCliente int,
	Data datetime,
	Status char(1),
	CONSTRAINT PK_ValidacaoDeCredito PRIMARY KEY(IdValidacaoDeCredito),
	CONSTRAINT FK_ValidacaoDeCredito_Cliente FOREIGN KEY(CodigoCliente) REFERENCES Cliente (IdCliente)
);

CREATE TABLE TipoTelefone (
	IdTipoTelefone int,
	Nome varchar(100),
	CONSTRAINT PK_TipoTelefone PRIMARY KEY(IdTipoTelefone)
);

CREATE TABLE Telefone (
	IdCliente int,
	IdTipoTelefone int,
	Numero varchar(14),
	CONSTRAINT PK_Telefone PRIMARY KEY(IdCliente, IdTipoTelefone),
	CONSTRAINT FK_Telefone_Cliente FOREIGN KEY(IdCliente) REFERENCES Cliente (IdCliente),
	CONSTRAINT FK_Telefone_TipoTelefone FOREIGN KEY(IdTipoTelefone) REFERENCES TipoTelefone (IdTipoTelefone)
);

CREATE TABLE Pais (
	IdPais int,
	Nome varchar(200),
	CONSTRAINT PK_Pais PRIMARY KEY(IdPais)
);

CREATE TABLE Cidade (
	IdCidade int,
	IdPais int,
	Nome varchar(200),
	FOREIGN KEY(IdPais) REFERENCES Pais (IdPais),
	CONSTRAINT PK_Cidade PRIMARY KEY(IdCidade)
);

CREATE TABLE Bairro (
	IdBairro int,
	Nome varchar(200),
	CONSTRAINT PK_Bairro PRIMARY KEY(IdBairro)
);

CREATE TABLE Endereco (
	IdEndereco int,
	IdBairro int,
	IdCidade int,
	Descricao varchar(400),
	Cep varchar(12),
	CONSTRAINT PK_Endereco PRIMARY KEY(IdEndereco),
	CONSTRAINT FK_Endereco_Bairro FOREIGN KEY(IdBairro) REFERENCES Bairro (IdBairro),
	CONSTRAINT FK_Endereco_Cidade FOREIGN KEY(IdCidade) REFERENCES Cidade (IdCidade)
);

CREATE TABLE TipoEndereco (
	IdTipoEndereco int,
	Nome varchar(100),
	CONSTRAINT PK_TipoEndereco PRIMARY KEY(IdTipoEndereco)
);

CREATE TABLE EnderecoPorCliente (
	IdCliente int,
	IdEndereco int,
	IdTipoEndereco int,
	Numero smallint,
	CONSTRAINT PK_EnderecoPorCliente PRIMARY KEY(IdCliente,IdEndereco,IdTipoEndereco),
	CONSTRAINT FK_EnderecoPorCliente_Cliente FOREIGN KEY(IdCliente) REFERENCES Cliente (IdCliente),
	CONSTRAINT FK_EnderecoPorCliente_Endereco FOREIGN KEY(IdEndereco) REFERENCES Endereco (IdEndereco),
	CONSTRAINT FK_EnderecoPorCliente_TipoEndereco FOREIGN KEY(IdTipoEndereco) REFERENCES TipoEndereco (IdTipoEndereco)
);


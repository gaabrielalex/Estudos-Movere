drop table Clientes;
drop table Bairros;

go

exec sp_pkeys Clientes

select * 
from sys.columns

select * 
from sys.tables

select *
from sys.objects

select *
from sys.indexes


go

create table Bairros (
	Codigo int NOT NULL,
	Nome varchar(50) NOT NULL,
	CONSTRAINT PK_Bairros primary key(Codigo)
)

go

create table Clientes(
	Codigo int NOT NULL identity (1, 1),
	Nome varchar(50) NOT NULL,
	Sobrenome varchar(250) NOT NULL,
	Ativo bit NOT NULL default 1,
	DataDeCadastro datetime NOT NULL default getdate(),
	CodigoBairro int NULL,
	CONSTRAINT PK_CLientes primary key (Codigo),
	CONSTRAINT FK_Clientes_Bairros FOREIGN KEY (CodigoBairro) REFERENCES Bairros (Codigo)
);

go

create index ixClientesNomeSobrenome on Clientes(Nome, Sobrenome) include(DataDeCadastro)
create index ixClientesDataDeCadastro on Clientes(DataDeCadastro)

go

select *
from Clientes;

select *
from Bairros;

INSERT INTO Bairros(Codigo, Nome)
SELECT bairros.f0149idbairro, bairros.f0149nome
FROM APUMinasPneus.dbo.t0149 bairros



INSERT INTO Clientes(Nome, Sobrenome, Ativo, DataDeCadastro, CodigoBairro)
SELECT
	SUBSTRING(clientes.f0050nome, 1, CHARINDEX(' ', clientes.f0050nome) - 1),
	SUBSTRING(clientes.f0050nome, CHARINDEX(' ', clientes.f0050nome) + 1, LEN(clientes.f0050nome)),
	clientes.f0050ativo, 
	clientes.f0050dtacadastro, 
	clientes.f0149idbairro
from APUMinasPneus.dbo.t0050 clientes
where CHARINDEX(' ', clientes.f0050nome) > 0

union

SELECT
	clientes.f0050nome,
	'',
	clientes.f0050ativo, 
	clientes.f0050dtacadastro, 
	clientes.f0149idbairro
from APUMinasPneus.dbo.t0050 clientes
where CHARINDEX(' ', clientes.f0050nome) = 0


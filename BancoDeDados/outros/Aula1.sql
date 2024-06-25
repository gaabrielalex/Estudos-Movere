CREATE TABLE Cliente(
	Codigo int NOT NULL identity (1, 1),
	Cpf varchar(14) NOT NULL,
	Nome varchar(50) NOT NULL,
	Sobrenome varchar(250) NULL,
	Ativo bit NOT NULL default 1,
	DataDeCadastro datetime NOT NULL default getdate(),
	primary key (Codigo)
);

f
SELECT Nome, Sobrenome
FROM Cursodbo.Cliente
Where Ativo = 1
ORDER BY Nome, Sobrenome DESC


INSERT INTO CursoGenaro.dbo.Cliente(Nome, Sobrenome, Ativo)
VALUES ('Max William', '2222', 1);


SELECT * FROM CursoGenaro.dbo.Cliente;


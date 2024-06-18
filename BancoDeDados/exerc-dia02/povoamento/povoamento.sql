

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

dependente_cliente
	Atributos:
		Nome
	Relacionamentos:

pessoa:
	Atributos:
		Nome
		Telefone 
	Relacionamentos:
		Pessoa possui 1 ou mais endereços

cliente:
	Atributos:
		Nome
		Sobrenome
		Nome do Pai
		Nome da Mãe
		Telefone Celular
		Telefone Fixo
		Telefone Trabalho
		Data de Nascimento
		Data de Cadastro
		Data de Validação de Crédito
	Relacionamentos:
		- Cliente possui 1 ou mais endereços
		- Cliente possui 0 ou mais dependentes
		- Cliente possui 0 ou 1 conjuge(sendo conjuge uma pessoa(vem da tabela pessoa))


endereço:
	Atributos:
		-- R: Residencial
		-- T: Trabalho
		-- C- Conbrança
		tipo_endereco char(1) check(tipo_endereco in ("R", 'T', 'C')) NOT NULL,
		Endereço(lagradouro)
		Número
		Bairro
		Cidade
		CEP
		País
	Relacionamentos:











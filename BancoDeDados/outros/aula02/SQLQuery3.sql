select TOP 100 
	CONCAT(estabelecimentos.f0002idestab, ' - ',  estabelecimentos.f0002nome) AS Loja, 
	-- CONCAT(orcamentos.f0050idclifor, ' - ', orcamentos.f0120clientenome) AS Clientes,
	SUM(orcamentos.f0120valortotalorcamento) As 'Valor Total de Vendas'
from APUMinasPneus.dbo.t0120 orcamentos
	join  APUMinasPneus.dbo.t0002 estabelecimentos on estabelecimentos.f0002idestab = orcamentos.f0120idorcamento
	GROUP BY estabelecimentos.f0002idestab, estabelecimentos.f0002nome
	ORDER BY 1

select TOP 100 
	estabelecimentos.f0002idestab, estabelecimentos.f0002nome, 
	-- CONCAT(orcamentos.f0050idclifor, ' - ', orcamentos.f0120clientenome) AS Clientes,
	SUM(orcamentos.f0120valortotalorcamento) As 'Valor Total de Vendas'
from APUMinasPneus.dbo.t0120 orcamentos
	join  APUMinasPneus.dbo.t0002 estabelecimentos on estabelecimentos.f0002idestab = orcamentos.f0120idorcamento
	GROUP BY estabelecimentos.f0002idestab, estabelecimentos.f0002nome
	ORDER BY 1

select TOP 100 
	estabelecimentos.f0002idestab,
	-- CONCAT(orcamentos.f0050idclifor, ' - ', orcamentos.f0120clientenome) AS Clientes,
	SUM(orcamentos.f0120valortotalorcamento) As 'Valor Total de Vendas'
from APUMinasPneus.dbo.t0120 orcamentos
	join  APUMinasPneus.dbo.t0002 estabelecimentos on estabelecimentos.f0002idestab = orcamentos.f0120idorcamento
	GROUP BY estabelecimentos.f0002idestab
	HAVING SUM(orcamentos.f0120valortotalorcamento) > 200000
	ORDER BY 1 

select TOP 100 
	estabelecimentos.f0002idestab,
	-- CONCAT(orcamentos.f0050idclifor, ' - ', orcamentos.f0120clientenome) AS Clientes,
	SUM(orcamentos.f0120valortotalorcamento) As 'Valor Total de Vendas'
from APUMinasPneus.dbo.t0120 orcamentos
	join  APUMinasPneus.dbo.t0002 estabelecimentos on estabelecimentos.f0002idestab = orcamentos.f0120idorcamento
	GROUP BY estabelecimentos.f0002idestab
	HAVING AVG(orcamentos.f0120valortotalorcamento) > 2000
	ORDER BY 1 
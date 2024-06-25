SELECT  c.Ativo, COUNT(*)
from Clientes c
GROUP BY c.Ativo

SELECT  c.CodigoBairro, b.Nome , Ativo, COUNT(*) AS Quantidade
from Clientes c
	left join Bairros b on  c.CodigoBairro = b.Codigo
where (b.Nome like 'A%')
	and (
		(b.Nome LIKE '%A') OR (b.Nome LIKE '%S')
	)
GROUP BY c.CodigoBairro, b.Nome, Ativo
HAVING COUNT(*) > 1
ORDER BY 4 DESC

SELECT  c.CodigoBairro, b.Nome , Ativo, COUNT(*) AS Quantidade
from Clientes c
	left join Bairros b on  c.CodigoBairro = b.Codigo
where (b.Nome like 'A%A') OR (b.Nome LIKE 'A%S')
GROUP BY c.CodigoBairro, b.Nome, Ativo
HAVING COUNT(*) > 1
ORDER BY 4 DESC


SELECT  c.CodigoBairro, b.Nome , Ativo, COUNT(*) AS Quantidade
from Clientes c
	left join Bairros b on  c.CodigoBairro = b.Codigo
where (b.Nome LIKE 'A%[AS]')
GROUP BY c.CodigoBairro, b.Nome, Ativo
HAVING COUNT(*) > 1000
ORDER BY 4 DESC


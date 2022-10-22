SELECT count(*) as Clientes_fieles_a_Online
FROM(
		SELECT IdCliente,Canal,count(DISTINCT Canal) as cc
		FROM venta v
		LEFT JOIN canal_venta c ON v.IdCanal=c.IdCanal
		WHERE year(Fecha) = 2019 or year(fecha)=2020
		GROUP BY IdCliente
		HAVING cc=1 and canal = 'Presencial'
	) nazi
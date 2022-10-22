SELECT 
	g.IdSucursal,
    s.sucursal,
    g.gasto,
    v.venta,
    v.venta-g.gasto as ganancia
FROM
	(
		SELECT IdSucursal,sum(Monto) as gasto
		FROM gasto
		WHERE year(Fecha)=2019
		GROUP BY IdSucursal
	) AS g
JOIN
	(
		SELECT IdSucursal,sum(Precio*Cantidad) as venta
		FROM venta
		WHERE year(Fecha)=2019
		GROUP BY IdSucursal
	) AS v ON g.IdSucursal=v.IdSucursal
JOIN    
	sucursal as s on g.IdSucursal=s.IdSucursal
ORDER BY
	ganancia DESC
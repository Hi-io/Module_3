SELECT	
	Fecha,
	v.IdVenta,
	v.IdCliente,
	s.Sucursal,
	ls.provSucursal,
	lc.provClient,
	sum(v.Precio*v.Cantidad) as ingreso
FROM 	
	venta v
JOIN 	
	(SELECT IdCliente,IdLocalidad as locCliente FROM cliente)c	ON v.IdCliente=c.IdCliente
JOIN 	
	(SELECT IdSucursal,Sucursal,IdLocalidad as locSucursal FROM sucursal) s ON v.IdSucursal = s.IdSucursal
JOIN 	
	(SELECT IdLocalidad,IdProvincia as provClient FROM localidad) lc on c.locCliente=lc.IdLocalidad
JOIN 	
	(SELECT IdLocalidad,IdProvincia as provSucursal FROM localidad) ls on s.locSucursal=ls.IdLocalidad
WHERE 
	provClient!=provSucursal AND year(v.Fecha)=2019
GROUP BY 
	Sucursal
ORDER BY 
	ingreso DESC
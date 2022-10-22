SELECT v.IdSucursal,s.Sucursal,SUM(v.precio*v.cantidad*(c.Porcentaje/100)) as ganancia
FROM venta v
JOIN empleado e on v.IdEmpleado=e.IdEmpleado
JOIN cordoba c on e.CodigoEmpleado=c.IdEmpleado AND c.Anio=year(v.fecha) AND c.Mes=month(v.fecha)
JOIN sucursal s on c.IdSucursal=s.IdSucursal
WHERE year(v.fecha)=2020
GROUP BY c.IdSucursal
ORDER BY ganancia DESC
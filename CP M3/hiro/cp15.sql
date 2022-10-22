SELECT c.IdEmpleado,c.Apellido_y_Nombre,SUM(v.precio*v.cantidad*(c.Porcentaje/100)) as ganancia
FROM venta v
JOIN empleado e on v.IdEmpleado=e.IdEmpleado
JOIN cordoba c on e.CodigoEmpleado=c.IdEmpleado AND c.Anio=year(v.fecha) AND c.Mes=month(v.fecha)
WHERE year(v.fecha)=2020 AND month(v.fecha)=12
GROUP BY c.IdEmpleado 
ORDER BY ganancia DESC
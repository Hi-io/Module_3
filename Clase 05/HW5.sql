#HW1:
DROP TABLE IF EXISTS nuevos_registros;
CREATE TABLE IF NOT EXISTS nuevos_registros (
  	IdVenta 		INTEGER,
  	Fecha 	DATE,
  	Fecha_Entrega 	DATE,
  	IdCanal 		INTEGER,
    IdCliente	INTEGER,
    IdEmpleado	INTEGER,
	IdProducto	INTEGER,
    Precio	DECIMAL(10,2),
    Cantidad	INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

INSERT INTO nuevos_registros (IdVenta,Fecha, Fecha_Entrega,IdCanal,IdCliente,IdEmpleado,IdProducto,Precio,Cantidad)
SELECT	IdVenta,v.Fecha, Fecha_Entrega,IdCanal,IdCliente,IdEmpleado,IdProducto,Precio,Cantidad
FROM 	fact_venta v JOIN calendario c
	ON (v.Fecha = c.fecha)
WHERE TIMESTAMPDIFF(
MONTH,v.Fecha,'2021-01-01' #La idea es poner CURDATE() aquí, para ver las ventas del último mes.
) <1
;
select * from nuevos_registros

#HW2

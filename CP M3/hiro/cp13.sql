SELECT
    anio2019.mes,
    anio2019.Ganancias as ganancias_2019,
    anio2020.Ganancias as ganancias_2020,
    anio2020.Ganancias - anio2019.Ganancias as Crecimiento_Decrecimiento
FROM(
		SELECT
			v.anio,
			v.mes,
			v.Ingreso-c.Costo-g.Gastos as Ganancias
		FROM (
				SELECT 
					year(fecha) as anio,
					month(fecha) as mes,
					CONCAT(year(fecha),month(fecha)) as mesID,
					sum(Precio*Cantidad) as Ingreso
				FROM venta
				GROUP BY year(fecha),month(fecha)
				ORDER BY year(fecha),month(fecha)
			) as v
		JOIN (
				SELECT
					CONCAT(year(fecha),month(fecha)) as mesID,
					sum(Precio*Cantidad) as Costo
				FROM compra
				GROUP BY year(fecha),month(fecha)
				ORDER BY year(fecha),month(fecha)
			) as c on v.mesID=c.mesID
		JOIN (
				SELECT
					year(fecha) as anio,
					month(fecha) as mes,
					CONCAT(year(fecha),month(fecha)) as mesID,
					sum(Monto) as Gastos
				FROM gasto
				GROUP BY 
					year(fecha),month(fecha)
				ORDER BY
					year(fecha),month(fecha)
			) as g on v.mesID = g.mesID
		WHERE v.anio=2019
	) anio2019
JOIN (
		SELECT
			v.anio,
			v.mes,
			v.Ingreso-c.Costo-g.Gastos as Ganancias
		FROM (
				SELECT 
					year(fecha) as anio,
					month(fecha) as mes,
					CONCAT(year(fecha),month(fecha)) as mesID,
					sum(Precio*Cantidad) as Ingreso
				FROM venta
				GROUP BY year(fecha),month(fecha)
				ORDER BY year(fecha),month(fecha)
			) as v
		JOIN (
				SELECT
					CONCAT(year(fecha),month(fecha)) as mesID,
					sum(Precio*Cantidad) as Costo
				FROM compra
				GROUP BY year(fecha),month(fecha)
				ORDER BY year(fecha),month(fecha)
			) as c on v.mesID=c.mesID
		JOIN (
				SELECT
					year(fecha) as anio,
					month(fecha) as mes,
					CONCAT(year(fecha),month(fecha)) as mesID,
					sum(Monto) as Gastos
				FROM gasto
				GROUP BY 
					year(fecha),month(fecha)
				ORDER BY
					year(fecha),month(fecha)
			) as g on v.mesID = g.mesID
		WHERE v.anio=2020
	) as anio2020 on anio2019.mes=anio2020.mes
ORDER BY
	Crecimiento_Decrecimiento ASC
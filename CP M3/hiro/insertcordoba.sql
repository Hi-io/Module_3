DROP TABLE IF EXISTS `cordoba_quiroz`;
CREATE TABLE IF NOT EXISTS `cordoba_quiroz` (
  `IdEmpleado` int NOT NULL,
  `IdSucursal` INT NOT NULL,
  `Apellido_y_Nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Sucursal`varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Anio` INT NOT NULL,
  `Mes` INT NOT NULL,
  `Porcentaje` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cb_quiroz.csv' into table cordoba_quiroz
fields terminated by ';' enclosed by '' escaped by '' lines terminated by '\n' ignore 1 lines;

DROP TABLE IF EXISTS `cordoba_centro`;
CREATE TABLE IF NOT EXISTS `cordoba_centro` (
  `IdEmpleado` int NOT NULL,
  `IdSucursal` INT NOT NULL,
  `Apellido_y_Nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Sucursal`varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Anio` INT NOT NULL,
  `Mes` INT NOT NULL,
  `Porcentaje` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cb_centro.csv' into table cordoba_centro
fields terminated by ';' enclosed by '' escaped by '' lines terminated by '\n' ignore 1 lines;

DROP TABLE IF EXISTS `cordoba_cerro`;
CREATE TABLE IF NOT EXISTS `cordoba_cerro` (
  `IdEmpleado` int NOT NULL,
  `IdSucursal` INT NOT NULL,
  `Apellido_y_Nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Sucursal`varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Anio` INT NOT NULL,
  `Mes` INT NOT NULL,
  `Porcentaje` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cb_cerro.csv' into table cordoba_cerro
fields terminated by ';' enclosed by '' escaped by '' lines terminated by '\n' ignore 1 lines;
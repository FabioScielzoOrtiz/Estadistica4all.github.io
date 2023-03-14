
-- Eliminar una base de datos:

-- Drop the database 'Base_Datos_Fabio'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Uncomment the ALTER DATABASE statement below to set the database to SINGLE_USER mode if the drop database command fails because the database is in use.
ALTER DATABASE Base_Datos_Fabio SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
-- Drop the database if it exists
IF EXISTS (
  SELECT [name]
   FROM sys.databases
   WHERE [name] = N'Base_Datos_Fabio'
)
DROP DATABASE Base_Datos_Fabio
GO


-------------------------------------------------------------------------

-- Crear una nueva base de datos

USE master
GO
IF NOT EXISTS (
 SELECT name
 FROM sys.databases
 WHERE name = N'Base_Datos_Fabio'
)
 CREATE DATABASE [Base_Datos_Fabio];
GO
IF SERVERPROPERTY('ProductVersion') > '12'
 ALTER DATABASE [Base_Datos_Fabio] SET QUERY_STORE=ON;
GO

-------------------------------------------------------------------------

-- Crear una nueva tabla dentro de la base de datos

-- Create a new table called 'Clientes' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Clientes', 'U') IS NOT NULL
 DROP TABLE dbo.Clientes;
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Clientes
(
 ClienteId nvarchar(50) NOT NULL PRIMARY KEY, -- primary key column --> impide repeticiones de valores en esta columna
 Nombre char (50) NOT NULL,
 Pais nvarchar(50) NOT NULL,
 Ciudad nvarchar(50) NOT NULL,
 Email nvarchar (50) NOT NULL,
 Telefono  nvarchar (50) NOT NULL
);
GO


-- PRIMARY KEY --> impide repeticiones de valores en esta columan

-- char(n) --> n caracteres fijos
-- varchar(n) --> n caracteres variables
-- nvarchar(n) --> cadena alfanumerica con n elementos variables
-- numeric(n, h) --> numero de n cifras con h decimales
-- int --> entero
-- float --> real
-- data --> fecha

-------------------------------------------------------------------------


IF OBJECT_ID('dbo.Proveedores', 'U') IS NOT NULL
 DROP TABLE dbo.Proveedores;
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Proveedores
(
 ProveedorId nvarchar (50) NOT NULL PRIMARY KEY, -- primary key column
 Nombre nvarchar (50) NOT NULL,
 Email nvarchar(50) NOT NULL,
 Telefono nvarchar (50) NOT NULL
);
GO

-------------------------------------------------------------------------

IF OBJECT_ID('dbo.Ventas', 'U') IS NOT NULL
 DROP TABLE dbo.Ventas;
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Ventas
(
 VentasId nvarchar (50) NOT NULL PRIMARY KEY, -- primary key column
 Producto char (50) NOT NULL,
 Precio float (50) NOT NULL,
 Cliente nvarchar (50) NOT NULL,
 Proveedor  nvarchar (50) NOT NULL
);
GO

-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Insertamos filas en la tabla creada

-- Insert rows into table 'Clientes'
INSERT INTO dbo.Clientes
 ([ClienteId], [Nombre], [Pais], [Ciudad], [Email], [Telefono])
VALUES
 ( 'C1', N'Orlando', N'Australia', N'', N'' , N'917755028'),
 ( 'C2', N'Keith', N'India', N'', N'keith0@adventure-works.com', N''),
 ( 'C3', N'Donna', N'Germany', N'Berlin', N'donna0@adventure-works.com', N'915547890'),
 ( 'C4', N'Janet', N'United States', N'California',  N'janet1@adventure-works.com', N''),
 ( 'C5', N'Fabio', N'España', N'Madrid', N'fabio10@gmail.com', N''),
 ( 'C6', N'Juan', N'España', N'Sevilla', N'' , N'915869028'),
 ( 'C7', N'Lucia', N'España', N'', N'LuciaPerez@hotmail.com', N''),
 ( 'C8', N'Pedro', N'Italia', N'Roma', N'Pedro99@gmail.com', N'910007890'),
 ( 'C9', N'Sergio', N'United States', N'New York',  N'sergio_as@gmail.com', N''),
 ( 'C10', N'Grecia', N'Peru', N'Lima', N'Grecia89@gmail.com', N'')
GO

-------------------------------------------------------------------------

-- Insert rows into table 'Ventas'
INSERT INTO dbo.Ventas
 ([VentasId], [Producto], [Precio], [Cliente], [Proveedor])
VALUES
 ( 'V1', N'Alfombra', N'1500', N'C1' , N'P1'),
 ( 'V2', N'Killim', N'699.50', N'C3', N'P1'),
 ( 'V3', N'Killim', N'475', N'C9', N'P3'),
  ( 'V4', N'Alfombra', N'5000', N'C4' , N'P1'),
 ( 'V5', N'Killim', N'499.50', N'C8', N'P1'),
 ( 'V6', N'Killim', N'555', N'C5', N'P3'),
 ( 'V7', N'Alfombra', N'2500', N'C2' , N'P1'),
 ( 'V8', N'Killim', N'299.50', N'C10', N'P1'),
 ( 'V9', N'Killim', N'600', N'C2', N'P3'),
 ( 'V10', N'Alfombra', N'1200', N'C7' , N'P1'),
 ( 'V11', N'Killim', N'500', N'C8', N'P1'),
 ( 'V12', N'Killim', N'650', N'C9', N'P3'),
 ( 'V13', N'Alfombra', N'3500', N'C7' , N'P1'),
 ( 'V14', N'Killim', N'1000', N'C6', N'P1'),
 ( 'V15', N'Killim', N'350', N'C10', N'P3')
GO

-------------------------------------------------------------------------

-- Insert rows into table 'Proveedores'
INSERT INTO dbo.Proveedores
 ([ProveedorId], [Nombre], [Email], [Telefono])
VALUES
 ( 'P1', N'Intertrade', N'Intertrade@gmail.com', N'912223344'),
 ( 'P2', N'SaidKarpet', N'SaidKarpet@gmail.com', N'912783794'),
 ( 'P3', N'OrientKillim', N'OrientKillim@gmail.com', N'9100155475')
GO

-------------------------------------------------------------------------

-- El siguiente codigo sale error porque la columna Nombre ha sido definida como Not Null , por tanto
-- no admite valores NULL , para que los admitiesa deberia haberse definido como Null.
INSERT INTO dbo.Proveedores
 ([ProveedorId], [Nombre], [Email], [Telefono])
VALUES
 ( 'P4' , NULL, N'AlfombrasSA@gmail.com', N'91235344')
GO

-------------------------------------------------------------------------

-- Comprobación restriccion Primary Key
INSERT INTO dbo.Proveedores
 ([ProveedorId], [Nombre], [Email], [Telefono])
VALUES
 ( 'P3' , 'AlfombrasSA', N'AlfombrasSA@gmail.com', N'91235344')
GO


-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Hacemos una vista de todas las filas y columnas de la tabla

SELECT * FROM dbo.Clientes;

------------------------------------------------------------------------

SELECT Nombre, Pais, Ciudad
FROM dbo.Clientes;

------------------------------------------------------------------------

SELECT Nombre AS NewName
FROM dbo.Clientes;

-------------------------------------------------------------------------
-- Filtrar  filas

SELECT * FROM dbo.Clientes WHERE Nombre = 'Fabio' ;

SELECT * FROM dbo.Clientes WHERE Nombre != 'Fabio' ;


SELECT * FROM dbo.Ventas WHERE Precio < 500 ;

SELECT * FROM dbo.Ventas WHERE Precio < 2000 AND Precio > 500 ;

SELECT * FROM dbo.Ventas WHERE Precio <= 2000 OR Precio > 500 ;


SELECT Nombre , Email  FROM dbo.Proveedores WHERE Email = 'Intertrade@gmail.com' ;

SELECT Producto , Cliente, Proveedor FROM dbo.Ventas WHERE Precio < 2000 AND Precio > 500 ;



SELECT * FROM dbo.Clientes WHERE Nombre in ( 'Orlando' , 'Fabio') ;

SELECT * FROM dbo.Clientes WHERE Nombre not in ( 'Orlando' , 'Fabio') ;


-----------------------------------------------------

SELECT * FROM dbo.Clientes WHERE Nombre like '%lan%' ;

SELECT * FROM dbo.Clientes WHERE Nombre like '%i%' ;

SELECT * FROM dbo.Clientes WHERE Nombre not like '%i%' ;

SELECT * FROM dbo.Clientes WHERE Nombre like 'o%' ; -- empieza por 'o'

SELECT * FROM dbo.Clientes WHERE Nombre like '%o' ; -- acaba por 'o'

SELECT * FROM dbo.Clientes WHERE Nombre like '%lan%o' ; -- contiene 'lan' y acaba por 'o'

SELECT * FROM dbo.Clientes WHERE Nombre like '%b%o' ; -- contiene 'b' y acaba por 'o'

SELECT * FROM dbo.Clientes WHERE Nombre like '%F____' ; -- empieza por 'F' seguida de 4 caracteres

SELECT * FROM dbo.Clientes WHERE Nombre like '%F__' ; -- empieza por 'F' seguido de 2 caracteres

-------------------------------------------------------------------------

-- Eliminar todas las filas de una tabla

DELETE from Ventas

-- Eliminar filas de una tabla que cumplen una condicion

Delete from Clientes WHERE Nombre = 'Fabio'

-------------------------------------------------------------------------

-- Eliminar una tabla por completo

DROP TABLE Clientes


-------------------------------------------------------------------------

-- Actualizar una columna para las filas que cumplen una condicion

UPDATE Clientes set Nombre = 'Messi' WHERE ClienteId = 'C1'

UPDATE Clientes set Nombre = 'Messi' , Pais = 'Argentina' WHERE ClienteId = 'C1'

-- Actualizar todos los valores de una columna

UPDATE Clientes set Nombre = 'Messi' 


------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Establecer un valor por defecto en una tabla


IF OBJECT_ID('dbo.Otra_Tabla_1', 'U') IS NOT NULL
 DROP TABLE dbo.Otra_Tabla_1;
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Otra_Tabla_1
(
 Id nvarchar (50) NOT NULL PRIMARY KEY, -- primary key column
 Nombre nvarchar (50) NOT NULL,
 Email nvarchar(50) NOT NULL DEFAULT 'no tiene',
 Telefono nvarchar (50) NOT NULL DEFAULT 'desconocido'
);
GO


INSERT INTO dbo.Otra_Tabla_1
 ([Id], [Nombre], [Email], [Telefono])
VALUES
 ( 1 , 'Juan', DEFAULT , DEFAULT),
 ( 2 , 'Rodrigo', DEFAULT , '915568799'),
 ( 3 , 'Sofia', DEFAULT , DEFAULT),
 ( 4 , 'Irene', 'Irene99@hotmail.es' , '914478236'),
 ( 5 , 'Luis', 'LuisMP@gmail.com' , DEFAULT)
GO


-------------------------------------------------------------------------

-- Columnas calculadas

IF OBJECT_ID('dbo.Otra_Tabla_Ventas', 'U') IS NOT NULL
 DROP TABLE dbo.Otra_Tabla_Ventas;
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Otra_Tabla_Ventas
(
 VentasId nvarchar (50) NOT NULL PRIMARY KEY, -- primary key column
 Producto char (50) NOT NULL,
 Precio float (50) NOT NULL,
 Descuento float (50) NOT NULL,
 Cliente nvarchar (50) NOT NULL,
 Proveedor  nvarchar (50) NOT NULL
);
GO

INSERT INTO dbo.Otra_Tabla_Ventas
 ([VentasId], [Producto], [Precio], [Descuento], [Cliente], [Proveedor])
VALUES
 ( 'V1', 'Alfombra', 1500, 0.5 ,'C2' , 'P1'),
 ( 'V2', 'Killim', 699.50, 0.25, 'C3', 'P1'),
 ( 'V3', 'Killim', 475, 0.10, 'C2', 'P3'),
  ( 'V4', 'Alfombra', 1500, 0.5 ,'C7' , 'P1'),
 ( 'V5', 'Alfombra', 5000, 0.30, 'C5', 'P1'),
 ( 'V6', 'Killim', 250, 0.10, 'C9', 'P3')
GO


SELECT VentasId, Producto, Precio, Descuento, 'Precio_Final' = Precio - Precio*Descuento, Cliente, Proveedor FROM Otra_Tabla_Ventas
-------------------------------------------------------------------------

-- Concatenar strings de filas diferentes

IF OBJECT_ID('dbo.Clientes', 'U') IS NOT NULL
 DROP TABLE dbo.Clientes;
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Clientes
(
 ClienteId nvarchar(50) NOT NULL PRIMARY KEY, -- primary key column --> impide repeticiones de valores en esta columna
 Nombre char (50) NOT NULL,
 Pais nvarchar(50) NOT NULL,
 Ciudad nvarchar(50) NOT NULL,
 Email nvarchar (50) NOT NULL,
 Telefono  nvarchar (50) NOT NULL
);
GO

INSERT INTO dbo.Clientes
 ([ClienteId], [Nombre], [Pais], [Ciudad], [Email], [Telefono])
VALUES
 ( 'C1', N'Orlando', N'Australia', N'', N'' , N'917755028'),
 ( 'C2', N'Keith', N'India', N'', N'keith0@adventure-works.com', N''),
 ( 'C3', N'Donna', N'Germany', N'Berlin', N'donna0@adventure-works.com', N'915547890'),
 ( 'C4', N'Janet', N'United States', N'California',  N'janet1@adventure-works.com', N''),
 ( 'C5', N'Fabio', N'España', N'Madrid', N'fabio10@gmail.com', N''),
 ( 'C6', N'Juan', N'España', N'Sevilla', N'' , N'915869028'),
 ( 'C7', N'Lucia', N'España', N'', N'LuciaPerez@hotmail.com', N''),
 ( 'C8', N'Pedro', N'Italia', N'Roma', N'Pedro99@gmail.com', N'910007890'),
 ( 'C9', N'Sergio', N'United States', N'New York',  N'sergio_as@gmail.com', N''),
 ( 'C10', N'Grecia', N'Peru', N'Lima', N'Grecia89@gmail.com', N'')
GO

----------------------

SELECT Nombre, 'nueva_columna' = Pais + ' - ' + Ciudad   FROM Clientes


-------------------------------------------------------------------------

-- Ordenar tabla por columnas

SELECT*FROM Ventas ORDER BY Precio ASC

SELECT*FROM Ventas ORDER BY Precio DESC

-------------------------------------------------------------------------

-- count

SELECT COUNT(*) FROM Clientes ;

SELECT COUNT(Nombre) FROM Clientes ;

-------------------------------------------------------------------------

SELECT Min(Precio) FROM Ventas ;

SELECT Max(Precio) FROM Ventas ;

SELECT Sum(Precio) FROM Ventas ;

SELECT Avg(Precio) FROM Ventas ;


-------------------------------------------------------------------------
-- COALESCE
-------------------------------------------------------------------------
IF OBJECT_ID('dbo.Empleados', 'U') IS NOT NULL
 DROP TABLE dbo.Empleados;
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Empleados
(
 EmpleadoId nvarchar(50) NOT NULL PRIMARY KEY, -- primary key column --> impide repeticiones de valores en esta columna
 Nombre char (50) NOT NULL,
 Email nvarchar (50) NOT NULL,
 Telefono  nvarchar (50) NOT NULL,
 Puesto nvarchar (50) NOT NULL,
 Salario_1  nvarchar (50) NULL,
 Salario_2  nvarchar (50) NULL,
 Salario_3  nvarchar (50) NULL
);
GO

INSERT INTO dbo.Empleados
 ([EmpleadoId],[Nombre], [Email], [Telefono], [Puesto], [Salario_1], [Salario_2], [Salario_3])
VALUES
 ( 'E1', N'Juan', N'' , N'916655058', 'Alto', 2500, NULL, NULL),
 ( 'E2', N'Garazi', N'keith0@adventure-works.com', N'', 'Alto', 2000, NULL, NULL),
 ( 'E3', N'Pepe', N'donna0@adventure-works.com', N'915555800', 'Bajo', NULL, NULL, 1500),
 ( 'E4', N'Lucia', N'janet1@adventure-works.com', N'', 'Bajo', NULL, NULL, 1200),
 ( 'E5', N'Luis', N'fabio@gmail.com', N'915004589', 'Medio', NULL, 1850, NULL)
GO

------------------------------------------------------------------------


-- seleccionar filas con nulos en ciertas columnas

SELECT*FROM Empleados WHERE Salario_3 is NOT NULL


-- seleccionar filas con nulos en ciertas columnas

SELECT*FROM Empleados WHERE Salario_3 is NULL


-------------------------------------------------------------------------

SELECT EmpleadoId, Nombre, COALESCE( Salario_1, Salario_2, Salario_3 ) AS Salario FROM dbo.Empleados; -- Devuelve el valor no nulo de esas tres columnas para cada fila

-------------------------------------------------------------------------

SELECT EmpleadoId, Nombre,NULLIF(Telefono, 915555800)  FROM dbo.Empleados; -- Convierte los valores de la columna Telefono que coinciden con 915555800  en NULL

-------------------------------------------------------------------------
-------------------------------------------------------------------------


SELECT TOP 3  VentasId, Precio FROM dbo.Ventas ORDER BY Precio DESC;  -- Top 3 ventas con mayor precio

SELECT TOP 5 VentasId , Precio FROM dbo.Ventas ORDER BY Precio ASC; -- Top 5 ventas con menor precio

-------------------------------------------------------------------------
 
 SELECT TOP 50 PERCENT  VentasId, Precio FROM dbo.Ventas ORDER BY Precio DESC; -- 50% de las ventas con mayor precio

-------------------------------------------------------------------------


INSERT INTO dbo.Empleados
 ([EmpleadoId],[Nombre], [Email], [Telefono], [Puesto], [Salario_1], [Salario_2], [Salario_3])
VALUES
 ( 'E6', N'Raul', N'Raul@gmail.com' , N'916655058', 'Alto', 2500, NULL, NULL),
 ( 'E7', N'Raul', N'Raul@gmail.com', N'917586589', 'Alto', 2000, NULL, NULL)
GO

-------------------------------------------------------------------------
SELECT  Nombre, Email FROM dbo.Empleados

SELECT DISTINCT Nombre, Email FROM dbo.Empleados  -- Se eliminan duplicados

-------------------------------------------------------------------------


-------------------------------------------------------------------------


-------------------------------------------------------------------------


-------------------------------------------------------------------------


-------------------------------------------------------------------------


-------------------------------------------------------------------------
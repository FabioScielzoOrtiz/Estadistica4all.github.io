
-- Eliminar una base de datos:

-- Drop the database 'DatabaseName'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Uncomment the ALTER DATABASE statement below to set the database to SINGLE_USER mode if the drop database command fails because the database is in use.
ALTER DATABASE DatabaseName SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
-- Drop the database if it exists
IF EXISTS (
  SELECT [name]
   FROM sys.databases
   WHERE [name] = N'DatabaseName'
)
DROP DATABASE DatabaseName
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
 ( 'C5', N'Fabio', N'España', N'Madrid', N'fabio@gmail.com', N'')
GO

-------------------------------------------------------------------------

-- Insert rows into table 'Ventas'
INSERT INTO dbo.Ventas
 ([VentasId], [Producto], [Precio], [Cliente], [Proveedor])
VALUES
 ( 'V1', N'Alfombra', N'1500', N'C2' , N'P1'),
 ( 'V2', N'Killim', N'699.50', N'C3', N'P1'),
 ( 'V3', N'Killim', N'475', N'C2', N'P3')
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


-- El siguiente codigo sale error porque la columna Nombre ha sido definida como Not Null , por tanto
-- no admite valores NULL , para que los admitiesa deberia haberse definido como Null.
INSERT INTO dbo.Proveedores
 ([ProveedorId], [Nombre], [Email], [Telefono])
VALUES
 ( 'P3' , 'AlfombrasSA', N'AlfombrasSA@gmail.com', N'91235344')
GO
-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Hacemos una vista de todas las filas y columnas de la tabla

SELECT * FROM dbo.Clientes;

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

UPDATE Clientes set Nombre = 'Pedrito' WHERE ClienteId = 'C1'

UPDATE Clientes set Nombre = 'Pedrito' , Pais = 'Ecuador' WHERE ClienteId = 'C1'

-- Actualizar todos los valores de una columna

UPDATE Clientes set Nombre = 'Pedrito' 


-------------------------------------------------------------------------

-- seleccionar filas con nulos en ciertas columnas

SELECT*FROM Clientes WHERE Nombre is NOT NULL


-- seleccionar filas con nulos en ciertas columnas

SELECT*FROM Clientes WHERE Nombre is NULL


-------------------------------------------------------------------------

-- Establecer un valor por defecto en una tabla


IF OBJECT_ID('dbo.Tabla_Prueba', 'U') IS NOT NULL
 DROP TABLE dbo.Tabla_Prueba;
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Tabla_Prueba
(
 Id nvarchar (50) NOT NULL PRIMARY KEY, -- primary key column
 Nombre nvarchar (50) NOT NULL,
 Email nvarchar(50) NOT NULL DEFAULT 'desconocido',
 Telefono nvarchar (50) NOT NULL DEFAULT '-------'
);
GO


INSERT INTO dbo.Tabla_Prueba
 ([Id], [Nombre], [Email], [Telefono])
VALUES
 ( 1 , 'Juan', DEFAULT , DEFAULT)
GO


-------------------------------------------------------------------------

-- Columnas calculadas

IF OBJECT_ID('dbo.Ventas', 'U') IS NOT NULL
 DROP TABLE dbo.Ventas;
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Ventas
(
 VentasId nvarchar (50) NOT NULL PRIMARY KEY, -- primary key column
 Producto char (50) NOT NULL,
 Precio float (50) NOT NULL,
 Descuento float (50) NOT NULL,
 Cliente nvarchar (50) NOT NULL,
 Proveedor  nvarchar (50) NOT NULL
);
GO

INSERT INTO dbo.Ventas
 ([VentasId], [Producto], [Precio], [Descuento], [Cliente], [Proveedor])
VALUES
 ( 'V1', 'Alfombra', 1500, 0.5 ,'C2' , 'P1'),
 ( 'V2', 'Killim', 699.50, 0.25, 'C3', 'P1'),
 ( 'V3', 'Killim', 475, 0.10, 'C2', 'P3')
GO


SELECT VentasId, Producto, Precio, Descuento, 'Precio_Final' = Precio - Precio*Descuento, Cliente, Proveedor FROM Ventas
-------------------------------------------------------------------------

-- Concatenar strings de filas diferentes

SELECT 'nueva_columna' = Pais + ' - ' + Ciudad  FROM Clientes


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




-------------------------------------------------------------------------



-------------------------------------------------------------------------




-------------------------------------------------------------------------



-------------------------------------------------------------------------
-- Create a new database:

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
-------------------------------------------------------------------------
-- Delete a database:

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
-------------------------------------------------------------------------

-- Create a new table:

-- Create a new table called 'Clientes' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Alumnos', 'U') IS NOT NULL
 DROP TABLE dbo.Alumnos;
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Alumnos
(
 AlumnoID nvarchar(50) NOT NULL PRIMARY KEY, -- primary key column --> impide repeticiones de valores en esta columna
 Nombre char (50) NOT NULL,
 Pais nvarchar(50) NOT NULL,
 Ciudad nvarchar(50) NOT NULL,
 Email nvarchar (50) NOT NULL,
 Telefono  nvarchar (50) NOT NULL
);
GO

-------------------------------------------------------------------------
-------------------------------------------------------------------------

IF OBJECT_ID('dbo.Profesores', 'U') IS NOT NULL
 DROP TABLE dbo.Profesores;
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Profesores
(
 ProfesorID nvarchar (50) NOT NULL PRIMARY KEY, -- primary key column
 Nombre nvarchar (50) NOT NULL,
 Estudios nvarchar(50) NOT NULL,
 Email nvarchar(50) NOT NULL,
);
GO

-------------------------------------------------------------------------
-------------------------------------------------------------------------

IF OBJECT_ID('dbo.Examenes', 'U') IS NOT NULL
 DROP TABLE dbo.Examenes;
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Examenes
(
 ExamenID nvarchar (50) NOT NULL PRIMARY KEY, -- primary key column
 Nota DECIMAL(5,2) NOT NULL,
 Asignatura nvarchar (50) NOT NULL,
 AlumnoID nvarchar (50) NOT NULL,
 ProfesorID  nvarchar (50) NOT NULL
);
GO

-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Insert rows into table 'Alumnos'
INSERT INTO dbo.Alumnos
 ([AlumnoID], [Nombre], [Pais], [Ciudad], [Email], [Telefono])
VALUES
 ( 'A1', N'Orlando', N'Australia', N'', N'' , N'917755028'),
 ( 'A2', N'Keith', N'India', N'', N'keith0@adventure-works.com', N''),
 ( 'A3', N'Donna', N'Germany', N'Berlin', N'donna0@adventure-works.com', N'915547890'),
 ( 'A4', N'Janet', N'United States', N'California',  N'janet1@adventure-works.com', N''),
 ( 'A5', N'Fabio', N'España', N'Madrid', N'fabio10@gmail.com', N''),
 ( 'A6', N'Juan', N'España', N'Sevilla', N'' , N'915869028'),
 ( 'A7', N'Lucia', N'España', N'', N'LuciaPerez@hotmail.com', N''),
 ( 'A8', N'Pedro', N'Italia', N'Roma', N'Pedro99@gmail.com', N'910007890'),
 ( 'A9', N'Sergio', N'United States', N'New York',  N'sergio_as@gmail.com', N''),
 ( 'A10', N'Grecia', N'Peru', N'Lima', N'Grecia89@gmail.com', N''),
 ( 'A11', N'Ismael', N'España', N'Madrid', N'Isma98@gmail.com', N'912234543'),
 ( 'A12', N'Luis', N'España', N'Murcia', N'Luismiguel123@gmail.com', N''),
 ( 'A13', N'Pedro', N'Argentina', N'Buenos Aires', N'Pedro120@gmail.com', N'')
GO

-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Insert rows into table 'Profesores'
INSERT INTO dbo.Profesores
 ([ProfesorID], [Nombre], [Estudios], [Email])
VALUES
 ( 'P1', N'Juan', N'Matemáticas', N'JuanPerez@colegio.es'),
 ( 'P2', N'Sonia', N'Física', N'SoniDiaz@colegio.es'),
 ( 'P3', N'Lucia', N'Lengua', N'LuciaPerez@colegio.es'),
  ( 'P4', N'Marcos', N'Biología', N'MarcosSanz@colegio.es'),
 ( 'P5', N'Carlos', N'Educación Física', N'CarlosFernandez@colegio.es'),
 ( 'P6', N'Daniel', N'Geografía', N'DanielOrtiz@colegio.es'),
 ( 'P7', N'Garazi', N'Inglés', N'GaraziGarcia@colegio.es')
GO

-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Insert rows into table 'Examenes'
INSERT INTO dbo.Examenes
 ([ExamenID], [Nota], [Asignatura], [AlumnoID], [ProfesorID])
VALUES
 ( 'E1', 6.7, N'Matemáticas', N'A2', N'P1'),
 ( 'E2', 8, N'Física', N'A4', N'P2'),
 ( 'E3', 4.25, N'Matemáticas', N'A1', N'P1'),
 ( 'E4', 6.5, N'Inglés', N'A7', N'P7'),
 ( 'E5', 7, N'Lengua', N'A9', N'P3')
GO

-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Checking Not Null restriction

-- El siguiente codigo sale error porque la columna Nombre ha sido definida como Not Null , por tanto
-- no admite valores NULL , para que los admitiesa deberia haberse definido como Null.
INSERT INTO dbo.Profesores
 ([ProfesorID], [Nombre], [Estudios], [Email])
VALUES
 ( 'P8' , NULL, N'Filosofía', N'JuanDiaz@colegio.es')
GO

-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Checking Primary Key restriction

-- Comprobación restriccion Primary Key
INSERT INTO dbo.Profesores
 ([ProfesorID], [Nombre], [Estudios], [Email])
VALUES
 ( 'P1' , N'Juan', N'Filosofía', N'JuanDiaz@colegio.es')
GO

-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Make a full view of a table:


SELECT * FROM dbo.House_Price_Regression;


SELECT * FROM dbo.Alumnos;


-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Number of rows

SELECT COUNT(*) FROM House_Price_Regression;

-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Alias


SELECT Nombre AS Nombre_Alumnos
FROM dbo.Alumnos;


-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Number of columns

SELECT count(*) 
FROM information_schema.columns 
WHERE table_name ='House_Price_Regression';

-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Head of a table:

SELECT TOP (4) [neighborhood_recode]
       [price]
      ,[no_of_bedrooms]
      ,[no_of_bathrooms]
      ,[quality_recode]
      ,[size_in_m_2]
  FROM [Base_Datos_Fabio].[dbo].[House_Price_Regression]

-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Columns Names

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = N'Alumnos'



SELECT [name] FROM sys.columns 
WHERE object_id = OBJECT_ID('dbo.Examenes') 

-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Select columns from a table:

SELECT * FROM House_Price_Regression


SELECT quality_recode, balcony_recode,size_in_m_2, private_jacuzzi_recode, view_of_water_recode FROM House_Price_Regression


SELECT Nombre, Pais, Ciudad FROM dbo.Alumnos;

-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Filtering rows from a table

SELECT * FROM dbo.Examenes WHERE Nota < 7 ;

SELECT * FROM dbo.Examenes WHERE Nota <= 7 ;

SELECT AlumnoID, Nota FROM dbo.Examenes WHERE Nota < 7 ;

SELECT * FROM dbo.Alumnos WHERE Nombre = 'Fabio';

SELECT * FROM dbo.Alumnos WHERE Nombre != 'Fabio';

SELECT * FROM dbo.Alumnos WHERE Nombre in ('Fabio','Pedro');

SELECT * FROM dbo.Alumnos WHERE Nombre not in ('Fabio','Pedro');

SELECT Nombre , Email  FROM dbo.Proveedores WHERE Email = 'Intertrade@gmail.com' ;

SELECT AlumnoID , Nota, ProfesorID FROM dbo.Examenes WHERE Nota < 7 AND Nota > 5 ;

SELECT Nombre FROM dbo.Profesores WHERE Estudios = 'Inglés' OR Estudios = 'Geografía' ;

SELECT*FROM Alumnos WHERE Nombre is NOT NULL


-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Delete a column from a table**

ALTER TABLE dbo.House_Price_Regression DROP COLUMN latitude , longitude;
SELECT*FROM House_Price_Regression



DELETE FROM House_Price_Regression
WHERE neighborhood_recode=460;
SELECT*FROM House_Price_Regression



DELETE from Alumnos
SELECT * FROM Alumnos

Delete from Alumnos WHERE Nombre = 'Fabio'
SELECT * FROM Alumnos


Delete from Alumnos WHERE Nombre in ('Fabio','Grecia', 'Orlando')
SELECT * FROM Alumnos


ALTER TABLE Alumnos DROP COLUMN Nombre , Email;
SELECT * FROM Alumnos

-------------------------------------------------------------------------
-------------------------------------------------------------------------

UPDATE Alumnos set Nombre = 'Messi' WHERE AlumnoID = 'A2'
SELECT * FROM Alumnos

UPDATE Alumnos set Nombre = 'Messi' , Pais = 'Argentina' WHERE AlumnoID = 'A2'
SELECT * FROM Alumnos

UPDATE Alumnos set Nombre = 'Messi' 
SELECT * FROM Alumnos

-------------------------------------------------------------------------
-------------------------------------------------------------------------

SELECT Nombre, 'Pais-Alumnos' = Pais + '-' + Ciudad FROM Alumnos

-------------------------------------------------------------------------
-------------------------------------------------------------------------

SELECT*FROM Examenes ORDER BY Nota ASC

SELECT*FROM Examenes ORDER BY Nota DESC

-------------------------------------------------------------------------
-------------------------------------------------------------------------

SELECT * FROM dbo.Alumnos WHERE Nombre like '%io%' ;

SELECT * FROM dbo.Alumnos WHERE Nombre like 'o%' ; -- starts by 'o'

SELECT * FROM dbo.Alumnos WHERE Nombre like '%o' ; -- ends by 'o'

SELECT * FROM dbo.Alumnos WHERE Nombre like '%ab%o' ; -- has 'ab' and ends by 'o'

SELECT * FROM dbo.Alumnos WHERE Nombre like '%F____' ; -- starts with 'F' followed by 4 characters

SELECT * FROM dbo.Alumnos WHERE Nombre like '%F__' ; -- starts with 'F' followed by 2 characters

-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Insert new rows into table 'Examenes'
INSERT INTO dbo.Examenes
 ([ExamenID], [Nota], [Asignatura], [AlumnoID], [ProfesorID])
VALUES
  ( 'E6', 5, N'Lengua', N'A3', N'P3'),
 ( 'E7', 7, N'Inglés', N'A12', N'P7'),
 ( 'E8', 7, N'Física', N'A1', N'P2'),
   ( 'E9', 8, N'Lengua', N'A2', N'P3'),
 ( 'E10', 6.90, N'Inglés', N'A11', N'P7'),
 ( 'E11', 5.25, N'Física', N'A2', N'P2'),
   ( 'E12', 6, N'Lengua', N'A4', N'P3'),
 ( 'E13', 7.2, N'Inglés', N'A6', N'P7'),
 ( 'E14', 7.8, N'Física', N'A5', N'P2'),
   ( 'E15', 5.5, N'Lengua', N'A7', N'P3'),
 ( 'E16', 3, N'Inglés', N'A10', N'P7'),
 ( 'E17', 4, N'Física', N'A10', N'P2')
GO

SELECT * FROM Examenes

-------------------------------------------------------------------------
-------------------------------------------------------------------------

SELECT Min(Nota) as Nota_min FROM Examenes ;

SELECT Max(Nota) as Nota_max FROM Examenes ;

SELECT Avg(Nota) as Nota_mean FROM Examenes ;

SELECT Var(Nota) as Nota_var FROM Examenes ;

SELECT Stdev(Nota) as Nota_std FROM Examenes ;

SELECT TOP (1) PERCENTILE_DISC(0.30) 
WITHIN GROUP (ORDER BY Nota ASC)
OVER () AS Nota_Q30
FROM Examenes ;

SELECT TOP (1) PERCENTILE_DISC(0.80) 
WITHIN GROUP (ORDER BY Nota ASC)
OVER () AS Nota_Q80
FROM Examenes ;

-------------------------------------------------------------------------
-------------------------------------------------------------------------

SELECT Nombre, COUNT(Nombre) as Cantidad_Nombre
FROM Alumnos
GROUP BY Nombre ;

SELECT Nombre, COUNT(Nombre) as Cantidad_Nombre
FROM Alumnos
GROUP BY Nombre
HAVING COUNT(Nombre) > 1 ;


SELECT Asignatura, AVG(Nota) as Nota_Media, MIN(Nota) as Nota_Min , MAX(Nota) as Nota_Max , VAR(Nota) as Nota_Var
FROM Examenes
GROUP BY Asignatura ;


SELECT Asignatura, AVG(Nota) as Nota_Media, MIN(Nota) as Nota_Min , MAX(Nota) as Nota_Max , VAR(Nota) as Nota_Var
FROM Examenes
GROUP BY Asignatura
HAVING AVG(Nota) > 6.2 ;

SELECT Asignatura, AVG(Nota) as Nota_Media, MIN(Nota) as Nota_Min , MAX(Nota) as Nota_Max , VAR(Nota) as Nota_Var
FROM Examenes
GROUP BY Asignatura
HAVING Min(Nota) >= 5 ;


SELECT DISTINCT Asignatura, PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Nota ASC) OVER (PARTITION BY Asignatura) as Nota_Q25
INTO Tabla_Q25
FROM Examenes ;
SELECT * FROM Tabla_Q25;


SELECT DISTINCT Asignatura, PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY Nota ASC) OVER (PARTITION BY Asignatura) as Nota_Q50
INTO Tabla_Q50
FROM Examenes ;
SELECT * FROM Tabla_Q50 ;


SELECT DISTINCT Asignatura, PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Nota ASC) OVER (PARTITION BY Asignatura) as Nota_Q75
INTO Tabla_Q75
FROM Examenes ;
SELECT * FROM Tabla_Q75 ;


SELECT Asignatura, AVG(Nota) as Nota_Media, MIN(Nota) as Nota_Min, MAX(Nota) as Nota_Max, VAR(Nota) as Nota_Var
INTO Tabla_Resumen
FROM Examenes
GROUP BY Asignatura;
Select * From Tabla_Resumen ;


SELECT e.Asignatura, e.Nota_Media, e.Nota_Min, e.Nota_Max, e.Nota_Var, c.Nota_Q25, d.Nota_Q50, f.Nota_Q75
FROM Tabla_Resumen e
JOIN Tabla_Q25 c ON e.Asignatura = c.Asignatura
JOIN Tabla_Q50 d ON e.Asignatura = d.Asignatura
JOIN Tabla_Q75 f ON e.Asignatura = f.Asignatura;


-------------------------------------------------------------------------
-------------------------------------------------------------------------

SELECT a.Nombre, b.Asignatura , b.Nota
FROM Alumnos a
JOIN Examenes b 
ON a.AlumnoID = b.AlumnoID ;


SELECT a.Nombre, b.Asignatura , a.email
FROM Profesores a
JOIN Examenes b 
ON a.ProfesorID = b.ProfesorID ;

SELECT a.Nombre, b.Asignatura, b.Nota
FROM Alumnos a
FULL OUTER JOIN Examenes b 
ON a.AlumnoID = b.AlumnoID;

SELECT a.Nombre, b.Asignatura , a.Estudios, a.email, b.AlumnoID, b.Nota
FROM Profesores a
FULL OUTER JOIN Examenes b 
ON a.ProfesorID = b.ProfesorID ;

SELECT DISTINCT a.Nombre, b.Asignatura , a.Estudios, a.email
FROM Profesores a
FULL OUTER JOIN Examenes b 
ON a.ProfesorID = b.ProfesorID ;


SELECT a.Nombre, b.Asignatura , a.Estudios, a.email
FROM Profesores a
RIGHT JOIN Examenes b 
ON a.ProfesorID = b.ProfesorID ;

SELECT DISTINCT a.Nombre, b.Asignatura , a.Estudios, a.email
FROM Profesores a
RIGHT JOIN Examenes b 
ON a.ProfesorID = b.ProfesorID ;


SELECT a.Nombre, b.Asignatura, b.Nota, a.email
FROM Alumnos a
RIGHT JOIN Examenes b 
ON a.AlumnoID = b.AlumnoID ;


SELECT a.Nombre, b.Asignatura, b.Nota, a.email, a.AlumnoID
FROM Alumnos a
LEFT JOIN Examenes b 
ON a.AlumnoID = b.AlumnoID ;


SELECT a.Nombre, b.Asignatura , a.Estudios, a.email
FROM Profesores a
LEFT JOIN Examenes b 
ON a.ProfesorID = b.ProfesorID ; 



SELECT DISTINCT a.Nombre, b.Asignatura , a.Estudios, a.email
FROM Profesores a
LEFT JOIN Examenes b 
ON a.ProfesorID = b.ProfesorID ;

-------------------------------------------------------------------------
-------------------------------------------------------------------------

SELECT  Nombre, Email 
INTO New_Table 
FROM Alumnos ;

 
SELECT*FROM New_Table;

-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Concatenar tablas por filas --> UNION

SELECT Nombre, Email, AlumnoID as ID FROM Alumnos
UNION
SELECT Nombre, Email, ProfesorID as ID FROM Profesores;


-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- Concatenar tablas por columnas --> JOIN


---Añadimos la columna ID a la tabla Alumnos, la cuales contiene la secuencia 1,2,...,len(Alumnos)

ALTER TABLE Alumnos
ADD ID nvarchar(50) NULL;


-- Generar números consecutivos para cada fila de la tabla Alumnos
WITH cteAlumnos AS (
  SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn, *
  FROM Alumnos
)
-- Actualizar la columna ID de la tabla Alumnos con los números generados
UPDATE cteAlumnos
SET ID = CAST(rn AS nvarchar(50));


select*from Alumnos


-----------

--Añadimos la columna ID a la tabla Profesores, la cuales contiene la secuencia 1,2,...,len(Profesores)

ALTER TABLE Profesores
ADD ID nvarchar(50) NULL;


-- Generar números consecutivos para cada fila de la tabla Alumnos
WITH cteProfesores AS (
  SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn, *
  FROM Profesores
)
-- Actualizar la columna ID de la tabla Alumnos con los números generados
UPDATE cteProfesores
SET ID = CAST(rn AS nvarchar(50));


select*from Profesores

 
---------

-- Ahora concatemaos por columnas las tablas Alumnos y Profesores usando ID como columna de enlace.

SELECT a.Nombre, a.Email, a.Pais , b.Nombre, b.Email, b.Estudios
FROM Alumnos a
JOIN Profesores b 
ON a.ID = b.ID ;

-- Como la tabla profesores tiene 7 filas y la de Alumnos 13, la concatenacion por columnas de ambas tablas solo tiene 7 filas (todos los registros de Profesores, y solo los primeros 7 de Alumnos).




-----------------------------------------------------------------------------
-----------------------------------------------------------------------------




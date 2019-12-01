CREATE DATABASE restaurante;
 USE restaurante;

CREATE TABLE tiposEmpleado(
idTipo INT IDENTITY PRIMARY KEY,
puesto VARCHAR(100),
descripcion VARCHAR(100)
)

SELECT * FROM tiposEmpleado

CREATE TABLE empleados(
idEmpleado INT IDENTITY PRIMARY KEY,
nombre VARCHAR(100),
edad INT,
horario INT,
salario DECIMAL(12,2),
bono DECIMAL(12,2),
tipoEmpleado INT FOREIGN KEY(tipoEmpleado) REFERENCES tiposEmpleado(idTipo)
)


INSERT INTO empleados values('Raul Jimenez', 35, 8,1200.00,0,5)
INSERT INTO empleados values('Laura Robles', 20, 8,1100.00,0,1)
INSERT INTO empleados values('Mario Garcia', 18, 8,1500.00,0,2)
INSERT INTO empleados values('Pedro Perez', 30, 8,2500.00,0,4)



CREATE TABLE mesas(
idMesa INT IDENTITY PRIMARY KEY,
capacidad INT,
costo_reservacion DECIMAL(12,2),
prioridad INT
)


SELECT * FROM mesas


INSERT INTO mesas VALUES(4,150.00,1)
INSERT INTO mesas VALUES(4,150.00,1)
INSERT INTO mesas VALUES(4,150.00,1)
INSERT INTO mesas VALUES(6,200.00,2)
INSERT INTO mesas VALUES(6,200.00,2)
INSERT INTO mesas VALUES(8,300.00,3)

CREATE TABLE  platillos(
idPlatillo VARCHAR(10) PRIMARY KEY,
nombre VARCHAR(80),
precio  DECIMAL(12,2),
porcion VARCHAR(15)
)

SELECT * FROM platillos

INSERT INTO platillos values ('MLPOLLO','Milanesas de pollo',75.00,100)
INSERT INTO platillos values ('PTALF','Pasta Alfredo con Camarones',180.00,400)
INSERT INTO platillos values ('POZOL','Pozole',80.00,250)
INSERT INTO platillos values ('TASAD','Tacos de Carne asada',25.00,70)


CREATE TABLE ingredientes (
idIngrediente INT IDENTITY PRIMARY KEY,
nombre VARCHAR(30),
costo DECIMAL(18,4),
existencias DECIMAL(18,2),
UnidadMedida VARCHAR(10)
)

SELECT * FROM ingredientes 

INSERT INTO ingredientes VALUES ('Pollo',25.00 ,20,'KG')
INSERT INTO ingredientes VALUES ('Tomate',30.00 ,15,'KG')
INSERT INTO ingredientes VALUES ('Agua',8.00 ,100,'L')
INSERT INTO ingredientes VALUES ('Carne de Res',150.00 ,25,'KG')
INSERT INTO ingredientes VALUES ('Pasta',10.00 ,30,'PZA')
INSERT INTO ingredientes VALUES ('Crema',20.00 ,5,'L')
INSERT INTO ingredientes VALUES ('Granos de maiz',120.00 ,5,'KG')
INSERT INTO ingredientes VALUES ('Chiles',10.00 ,10,'KG')
INSERT INTO ingredientes VALUES ('Cebolla',20.00 ,10,'KG')


CREATE TABLE recetas(
idReceta VARCHAR(10) PRIMARY KEY,
nombre VARCHAR(50),
preparacion VARCHAR(MAX),
tiempo TIME,
idPlatillo VARCHAR(10) FOREIGN KEY (idPlatillo) REFERENCES platillos(idPlatillo)
)

SELECT * FROM recetas

SELECT * FROM platillos

INSERT INTO recetas VALUES ('POZOLE','POZOLE ROJO','Primero le pones agua, luego la carne, los chiles, el grano, y ya.','00:25:00' ,'POZOL')
INSERT INTO recetas VALUES ('MLPOLLO','MILANESAS EMPANIZADAS DE POLLO','Vertir aceite en la sarten, empanizar las milanesas y freirlas hasta cocerse.', '00:10:00','MLPOLLO')
INSERT INTO recetas VALUES ('PASTA','PASTA ALFREDO CON CAMARONES','Proceso similar al del espagueti, al final vertir crema y camarones hervidos.', '00:25:00','PTALF')
INSERT INTO recetas VALUES ('TACOS','TACOS DE ASADA NORTEÑOS','Asar la carne y ponerlo en una tortilla.', '00:05:00','TASAD')



CREATE TABLE receta_ingredientes(
idReceta  VARCHAR(10) FOREIGN KEY (idReceta) REFERENCES recetas(idReceta),
idIngrediente  INT FOREIGN KEY (idIngrediente) REFERENCES ingredientes(idIngrediente),
id INT IDENTITY PRIMARY KEY,
cantidad DECIMAL(8,2),
UnidadMedida VARCHAR(10)
)

SELECT * FROM RECETAS 
SELECT * FROM ingredientes 

SELECT * from receta_ingredientes


INSERT INTO receta_ingredientes VALUES('MLPOLLO', 1,0.220,'KG')
INSERT INTO receta_ingredientes VALUES('MLPOLLO', 8, 0.8,'KG')

INSERT INTO receta_ingredientes VALUES('PASTA', 5,2,'PZA')
INSERT INTO receta_ingredientes VALUES('PASTA', 6,0.5,'L')
INSERT INTO receta_ingredientes VALUES('PASTA', 3,1,'L')

INSERT INTO receta_ingredientes VALUES('POZOLE', 3,2,'L')
INSERT INTO receta_ingredientes VALUES('POZOLE', 4,1.30,'KG')
INSERT INTO receta_ingredientes VALUES('POZOLE', 7,0.80,'KG')
INSERT INTO receta_ingredientes VALUES('POZOLE', 9,0.20,'KG')
INSERT INTO receta_ingredientes VALUES('POZOLE', 8,0.40,'KG')

INSERT INTO receta_ingredientes VALUES('TACOS', 4,0.05,'KG')



CREATE TABLE ordenes(
noOrden INT IDENTITY PRIMARY KEY,
mesero INT FOREIGN KEY (mesero) REFERENCES Empleados(idEmpleado),
mesa INT FOREIGN KEY (mesa) REFERENCES mesas(idMesa),
hora DATETIME,
subTotal DECIMAL(12,2),
impuestos DECIMAL(8,2),
total DECIMAL(12,2)
)

SELECT * FROM empleados
SELECT * FROM MESAS 



INSERT INTO ordenes VALUES (2,1,'20191130 10:34:09 AM',150,0,150)
INSERT INTO ordenes VALUES (2,4,'20191129 08:00:00 PM',155,0,155)
INSERT INTO ordenes VALUES (2,2,'20191129 08:10:00 AM',260,0,260)
INSERT INTO ordenes VALUES (2,3,'20191201 09:10:00 AM',75,0,75)

SELECT * FROM ordenes
SELECT * FROM platillos

CREATE TABLE ordenesDetalle(
idDetalle INT IDENTITY PRIMARY KEY,
idOrden INT FOREIGN KEY (idOrden) REFERENCES ordenes(noOrden),
idPlatillo VARCHAR(10) FOREIGN KEY (idPlatillo) REFERENCES platillos(idPlatillo),
cantidad INT,
costo DECIMAL(12,2)
)

INSERT INTO ordenesDetalle VALUES(1,'MLPOLLO',2,150 )
INSERT INTO ordenesDetalle VALUES(2,'MLPOLLO',1,75 )
INSERT INTO ordenesDetalle VALUES(2,'POZOL',1,80 )
INSERT INTO ordenesDetalle VALUES(3,'PTALF',1,180 )
INSERT INTO ordenesDetalle VALUES(3,'POZOL',1,80 )
INSERT INTO ordenesDetalle VALUES(4,'TASAD',3,75 )





--Transaccion que inserta 5 registros a la tabla tiposEmpleado
--TiposEmpleado son los roles de los empleados del restaurante
--@@Error ->funcion que retorna un numero de error en la transaccion
Begin transaction InsertTipoEmpleado
	insert into tiposEmpleado(puesto,descripcion) values ('Mesero','Atiende ordenes');
	insert into tiposEmpleado(puesto,descripcion) values ('Cajero','Cobra ordenes');
	insert into tiposEmpleado(puesto,descripcion) values ('Jefe de Meseros','Administra Meseros');
	insert into tiposEmpleado(puesto,descripcion) values ('Gerente','Coordinador del local ');
	insert into tiposEmpleado(puesto,descripcion) values ('Cocinero','Prepara los alimentos');
	if @@ERROR <> 0
		Begin
			Rollback Transaction InsertTipoEmpleado
			Print 'Error';
		End
	Else
		Begin
			Commit Transaction InsertTipoEmpleado
			Print 'Inserted!';
		End


--Transaccion que genera un reporte de ventas del ultimo mes de ventas
Begin transaction ReporteVentas

	USE restaurante;

	SELECT sum(total) AS Total_Ventas  FROM ordenes WHERE
		DATEPART(MONTH,CONVERT(DATE,HORA)) = DATEPART(MONTH,CURRENT_TIMESTAMP)
		GROUP BY hora ORDER BY HORA

Commit Transaction ReporteVentas




/*
Transaccion que evalua las ventas realizadas por un mesero 
y en base a ellas calcular un bono para el empleado
*/
BEGIN TRANSACTION verificarBono

UPDATE empleados SET bono = 200 
	WHERE idEmpleado IN ( SELECT mesero FROM ordenes WHERE DATEPART(DAY,hora) = DATEPART(DAY,GETDATE())
						  GROUP BY mesero HAVING COUNT(noOrden)>20 
						)
IF @@ERROR <> 0
		Begin
			Rollback Transaction verificarBono
			Print 'Error en la operacion: cambios descartados.';
		End
	Else
		Begin
			Commit Transaction verificarBono
			Print 'Calculo exitoso';
		End
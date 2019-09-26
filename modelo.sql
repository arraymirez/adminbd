--CREATE DATABASE restaurante2;
--USE restaurante2;

CREATE TABLE tiposEmpleado(
idTipo INT IDENTITY PRIMARY KEY,
puesto VARCHAR(100),
descripcion VARCHAR(100)
)

CREATE TABLE empleados(
idEmpleado INT IDENTITY PRIMARY KEY,
nombre VARCHAR(100),
edad INT,
horario INT,
salario DECIMAL(12,2),
tipoEmpleado INT FOREIGN KEY(tipoEmpleado) REFERENCES tiposEmpleado(idTipo)
)

CREATE TABLE mesas(
idMesa INT IDENTITY PRIMARY KEY,
capacidad INT,
costo_reservacion DECIMAL(12,2),
prioridad INT
)

CREATE TABLE  platillos(
idPlatillo VARCHAR(10) PRIMARY KEY,
nombre VARCHAR(80),
precio  DECIMAL(12,2),
porcion VARCHAR(15)
)

CREATE TABLE ingredientes (
idIngrediente INT IDENTITY PRIMARY KEY,
nombre VARCHAR(30),
costo DECIMAL(18,4),
existencias DECIMAL(18,2),
UnidadMedida VARCHAR(10)
)

CREATE TABLE recetas(
idReceta VARCHAR(10) PRIMARY KEY,
nombre VARCHAR(50),
preparacion VARCHAR(MAX),
tiempo TIME,
idPlatillo VARCHAR(10) FOREIGN KEY (idPlatillo) REFERENCES platillos(idPlatillo)
)

CREATE TABLE receta_ingredientes(
idReceta  VARCHAR(10) FOREIGN KEY (idReceta) REFERENCES recetas(idReceta),
idIngrediente  VARCHAR(10) FOREIGN KEY (idIngrediente) REFERENCES recetas(idReceta),
id INT IDENTITY PRIMARY KEY,
cantidad INT,
UnidadMedida VARCHAR(10)
)


CREATE TABLE ordenes(
noOrden INT IDENTITY PRIMARY KEY,
mesero INT FOREIGN KEY (mesero) REFERENCES Empleados(idEmpleado),
mesa INT FOREIGN KEY (mesa) REFERENCES mesas(idMesa),
hora DATETIME,
subTotal DECIMAL(12,2),
impuestos DECIMAL(8,2),
total DECIMAL(12,2)
)

CREATE TABLE ordenesDetalle(
idDetalle INT IDENTITY PRIMARY KEY,
idOrden INT FOREIGN KEY (idOrden) REFERENCES ordenes(noOrden),
idPlatillo VARCHAR(10) FOREIGN KEY (idPlatillo) REFERENCES platillos(idPlatillo),
cantidad INT, 
costo DECIMAL(12,2),

)
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
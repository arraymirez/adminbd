GO
create database club
GO
use club

CREATE TABLE socios(
id_socio INT PRIMARY KEY,
nombre VARCHAR(50),
edad VARCHAR(50),
telefono VARCHAR(50),
correo VARCHAR(20)
)

CREATE TABLE dueños_barcos(
id_dueño INT PRIMARY KEY,
nombre VARCHAR(100)
)

CREATE TABLE barcos(
matricula INT PRIMARY KEY,
nombre VARCHAR(50),
no_amarre VARCHAR(50),
cuota VARCHAR(50),
id_socio INT FOREIGN KEY(id_socio) REFERENCES socios(id_socio),
id_dueño INT FOREIGN KEY(id_dueño) REFERENCES dueños_barcos(id_dueño)
)

CREATE TABLE salidas(
fecha_salida DATE,
fecha_llegada DATE,
destino VARCHAR(50),
matricula INT FOREIGN KEY(matricula) REFERENCES barcos(matricula),
)

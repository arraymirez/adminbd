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

CREATE TABLE due�os_barcos(
id_due�o INT PRIMARY KEY,
nombre VARCHAR(100)
)

CREATE TABLE barcos(
matricula INT PRIMARY KEY,
nombre VARCHAR(50),
no_amarre VARCHAR(50),
cuota VARCHAR(50),
id_socio INT FOREIGN KEY(id_socio) REFERENCES socios(id_socio),
id_due�o INT FOREIGN KEY(id_due�o) REFERENCES due�os_barcos(id_due�o)
)

CREATE TABLE salidas(
fecha_salida DATE,
fecha_llegada DATE,
destino VARCHAR(50),
matricula INT FOREIGN KEY(matricula) REFERENCES barcos(matricula),
)

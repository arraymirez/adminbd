GO
--CREATE DATABASE bibliografias
go
use bibliografias


CREATE TABLE articulos(
id_articulo INT PRIMARY KEY,
titulo VARCHAR(100),
palabra_clave VARCHAR(50),
correo_electronico VARCHAR(50),
localizacion VARCHAR(50)
)

CREATE TABLE congreso(
id_congreso INT PRIMARY KEY,
tipo_congreso VARCHAR(50),
frecuencia_celebracion VARCHAR(50),
ciudad VARCHAR(50),
pais VARCHAR(50),
fecha_primera_vez DATE,
fecha_inicio DATETIME,
fecha_fin	DATETIME,
id_articulo INT FOREIGN KEY(id_articulo) REFERENCES articulos(id_articulo)
)

CREATE TABLE revista(
id_revista INT PRIMARY KEY,
editor VARCHAR(50),
año_publicacion DATE,
frecuencia_publicacion VARCHAR(50),
temas VARCHAR(300),
numero_aparicion_articulo INT,
paginas VARCHAR(50),
año_aparicion_articulo DATE,
id_articulo INT FOREIGN KEY(id_articulo) REFERENCES articulos(id_articulo)
)

CREATE TABLE investigadores(
id_investigador INT PRIMARY KEY,
nombre VARCHAR(100),
correo_electronico VARCHAR(50),
tema_investigacion VARCHAR(300),
centro_trabajo VARCHAR(50),
id_articulo INT FOREIGN KEY(id_articulo) REFERENCES articulos(id_articulo)
)

CREATE TABLE informe_tecnico(
id_informe INT PRIMARY KEY,
numero INT,
centro VARCHAR(50),
fecha DATE,
id_articulo INT FOREIGN KEY(id_articulo) REFERENCES articulos(id_articulo)
)



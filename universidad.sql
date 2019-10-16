--create database universidad
--use universidad


create table asignaturas(
id_asignatura INT PRIMARY KEY,
codigo VARCHAR(10),
asignatura VARCHAR(50),
creditos_teoricos INT,
creditos_lab INT,
duracion VARCHAR(100),
limite_admision VARCHAR(100),
libre_config BIT,
grupo_teoria INT,
grupo_lab INT
)

CREATE TABLE areas(
id_area INT PRIMARY KEY,
nombre VARCHAR(100)
)


CREATE TABLE departamentos(
id_departamento INT PRIMARY KEY,
nombre VARCHAR(100),
id_area INT FOREIGN KEY(id_area) REFERENCES areas(id_area)
)

CREATE TABLE profesores(
id_profesor INT PRIMARY KEY,
nombre VARCHAR(100),
despacho VARCHAR(20),
id_area INT FOREIGN KEY(id_area) REFERENCES areas(id_area)

)

CREATE TABLE asignatura_profesor(
id_asignatura INT FOREIGN KEY(id_asignatura) REFERENCES asignaturas(id_asignatura),
id_profesor INT FOREIGN KEY(id_profesor) REFERENCES profesores(id_profesor),
Hora_asignatura TIME
)


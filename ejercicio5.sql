CREATE DATABASE ejercicio5_aerolinea;

USE ejercicio5_aerolinea;

CREATE TABLE persona(
codigo INT IDENTITY PRIMARY KEY,
nombre VARCHAR(100)
)



CREATE TABLE vuelos(
numero INT IDENTITY PRIMARY KEY,
origen VARCHAR(100),
destino VARCHAR(100),
hora_fecha DATETIME
)


 CREATE TABLE piloto(
 codigo INT FOREIGN KEY(codigo) REFERENCES persona(codigo),
 horas_vuelo INT,
 numero INT FOREIGN KEY (numero) REFERENCES vuelos(numero)
 )
 

  CREATE TABLE MIEMBROS(
 codigo INT FOREIGN KEY(codigo) REFERENCES persona(codigo),
 numero INT FOREIGN KEY (numero) REFERENCES vuelos(numero)
 )


CREATE TABLE avion(
codigo VARCHAR(50)  PRIMARY KEY,
tipo VARCHAR(100)
)

CREATE TABLE base(
id_base INT PRIMARY KEY,
nombre VARCHAR(100)
)

CREATE TABLE Regreso (
id_base INT FOREIGN KEY (id_base) REFERENCES base(id_base),
 codigo INT FOREIGN KEY(codigo) REFERENCES persona(codigo),
)


CREATE TABLE mantenimiento (
id_base INT FOREIGN KEY (id_base) REFERENCES base(id_base),
 codigo VARCHAR(50) FOREIGN KEY(codigo) REFERENCES avion(codigo),
)

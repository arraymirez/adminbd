CREATE DATABASE ejercicio7_cines;
USE  ejercicio7_cines;

CREATE TABLE cines(
codigo INT PRIMARY KEY,
calle VARCHAR(70),
numero INT,
nombre VARCHAR(70),
telefono VARCHAR(20)
)

CREATE TABLE tarifas(
dia VARCHAR(10),
precio DECIMAL(10,2)
)




GO
CREATE DATABASE concensionarios
GO
USE concensionarios


CREATE TABLE complementos(
id_complemento INT PRIMARY KEY,
nombre VARCHAR(100),
precio DECIMAL(2,2),
extra BIT,

)

CREATE TABLE modelos(
id_modelo INT PRIMARY KEY,
airbag_conductor BIT,
cierre_centralizado BIT,
id_complemento INT FOREIGN KEY(id_complemento) REFERENCES complementos(id_complemento)
)


CREATE TABLE automoviles(1
id_automovil INT PRIMARY KEY,
bastidor VARCHAR(15),
marca VARCHAR(50),
precio DECIMAL(2,2),
descuento DECIMAL(2,2),
id_modelo INT FOREIGN KEY(id_modelo) REFERENCES modelos(id_modelo)
)

CREATE TABLE concensionario(
id_concensionario INT PRIMARY KEY,
nombre VARCHAR(50)
)

CREATE TABLE servicio_oficial(
id_servicio_oficial INT PRIMARY KEY,
nombre VARCHAR(50),
domicilio VARCHAR(100),
NIF VARCHAR(50),
id_concensionario INT FOREIGN KEY(id_concensionario) REFERENCES concensionarios(id_concensionario)
)

CREATE TABLE vendedores(
id_vendedor INT PRIMARY KEY,
nombre VARCHAR(100),
NIF VARCHAR(50),
domicilio VARCHAR(100)
)

CREATE TABLE ventas(
id_venta INT PRIMARY KEY,
pago VARCHAR(50),
costo_venta DECIMAL(2,2),
)

CREATE TABLE detalle_venta(
id_detalle_venta INT PRIMARY KEY,
fecha_entrega DATE,
matricula VARCHAR(50),
stock BIT,
id_venta INT FOREIGN KEY(id_venta) REFERENCES ventas(id_venta)
)
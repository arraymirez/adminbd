--CREATE DATABASE Ejercicio1_abogados;
--USE Ejercicio1_abogados;


CREATE TABLE Clientes(
DNI INT PRIMARY KEY,
nombre VARCHAR(50),
apaterno VARCHAR(60),
aMaterno VARCHAR(60),
telefono VARCHAR(20),
direccion VARCHAR(100)
)

INSERT INTO CLIENTES VALUES(1,'Lorena','Robles','Gutierrez','6461234567','Calle independiencia, 4 Tijuana')
INSERT INTO CLIENTES VALUES(2,'Juan','Perez','Lopez','1234567','Calle Alegria, Reforma 5 Mexicali')
INSERT INTO CLIENTES VALUES(3,'Janeth','Morales','Ramirez','664741852369','Villa fontana #13')
INSERT INTO CLIENTES VALUES(4,'Bruno','Gonzalez','Torres','66745678913','Lomas Verdes 14, Tijuana')
INSERT INTO CLIENTES VALUES(5,'Laura','Juarez','Soto','45612347','Durango 23, Residencial del bosque')
INSERT INTO clientes([DNI],[nombre],[apaterno],[aMaterno],[telefono]) VALUES(11,'Jerome','Valentine','Clayton','(300) 593-3039'),(12,'Maite','Shields','Doyle','(527) 253-7045'),(13,'Wynne','Wells','Greer','(124) 577-7969'),(14,'Pandora','Houston','Morton','(571) 159-6989'),(15,'Reece','Joyner','Walsh','(217) 226-8049'),(16,'Hadassah','Rowland','Henry','(265) 966-2639'),(17,'Amethyst','Horton','Collier','(426) 179-4645'),(18,'Alice','Lewis','Davis','(128) 339-1869'),(19,'Connor','Vega','Kent','(719) 149-2635'),(20,'Yetta','Grant','Conner','(811) 121-8082');


CREATE TABLE Procuradores(
id INT PRIMARY KEY,
nombre VARCHAR(50),
apaterno VARCHAR(60),
aMaterno VARCHAR(60),
telefono VARCHAR(20),
direccion VARCHAR(100)
)
select * from Procuradores

INSERT INTO Procuradores([id],[nombre],[apaterno],[aMaterno],[telefono],[direccion]) VALUES(1,'Vance','Sweeney','Nichols','(550) 192-3664','P.O. Box 465, 3193 Ut St.'),(2,'Mercedes','Rowe','Patel','(273) 579-4109','2747 Scelerisque St.'),(3,'Judah','Cantu','Valdez','(601) 591-7154','Ap #637-2762 Nunc Rd.'),(4,'Jena','Morgan','Hardy','(964) 614-4683','Ap #349-4596 Enim. Avenue'),(5,'Riley','Nguyen','Fischer','(822) 532-8264','1026 Sagittis Rd.'),(6,'Kelsey','Villarreal','Holder','(508) 243-8116','820-8477 Tincidunt, Avenue'),(7,'Sandra','Valencia','Duran','(756) 346-6176','P.O. Box 390, 127 Nec Rd.'),(8,'Willa','Franklin','Baird','(116) 603-3198','Ap #992-5928 Risus. Ave'),(9,'Iola','Summers','Austin','(896) 829-2015','P.O. Box 296, 7520 Ultrices. St.'),(10,'Ulysses','Guy','Clay','(618) 163-5419','Ap #594-2110 Adipiscing Rd.');
INSERT INTO Procuradores([id],[nombre],[apaterno],[aMaterno],[telefono],[direccion]) VALUES(11,'Zane','Carrillo','Abbott','(960) 674-8165','Ap #645-2726 Vel St.'),(12,'Courtney','Watts','Whitfield','(157) 234-4760','P.O. Box 116, 5930 Et, Rd.'),(13,'Chase','Harrington','Martinez','(131) 944-7495','6938 Vivamus Street'),(14,'Jelani','Key','Reyes','(675) 958-2255','Ap #997-9261 Purus, Rd.'),(15,'Marcia','Nixon','Goodwin','(895) 873-5099','P.O. Box 842, 7190 Aliquet Road'),(16,'Brian','Hanson','Farrell','(774) 884-1144','302-5473 Et Street'),(17,'Cleo','Maddox','Swanson','(510) 790-4730','198-7588 Ante Rd.'),(18,'Caesar','Ashley','Cochran','(251) 928-4199','2489 Dui Ave'),(19,'Yael','Hale','Carpenter','(380) 464-3126','Ap #475-8443 Orci, Road'),(20,'Reese','Stewart','Hutchinson','(733) 437-2659','P.O. Box 287, 7315 Ultricies St.');

CREATE TABLE Estado(
id INT PRIMARY KEY,
descripcion VARCHAR(60)
)
INSERT INTO ESTADO VALUES(1,'En tramite')
INSERT INTO ESTADO VALUES(2,'Archivado')
INSERT INTO ESTADO VALUES(3,'Rechazado')
INSERT INTO ESTADO VALUES(4,'Pendiente cobro')
INSERT INTO ESTADO VALUES(5,'Documentacion pendiente')
INSERT INTO ESTADO VALUES(6,'Firma pendiente')


CREATE TABLE Asuntos(
id_expediente INT PRIMARY KEY,
fechaInicio DATE,
fechaArchivo DATE,
idCliente INT FOREIGN KEY(idCliente) REFERENCES Clientes(DNI),
estado INT FOREIGN KEY(estado) REFERENCES Estado(id)
)


INSERT INTO Asuntos VALUES(1,'20190405','20190603',1,1)
INSERT INTO Asuntos VALUES(2,'20190615','20190620',2,2)
INSERT INTO Asuntos VALUES(3,'20190205','20190305',3,3)
INSERT INTO Asuntos VALUES(4,'20190801','20190603',4,1)
INSERT INTO Asuntos VALUES(5,'20190901','20190903',5,5)
INSERT INTO Asuntos VALUES(6,'20190501','20190515',11,4)
INSERT INTO Asuntos VALUES(7,'20190310','20190313',12,4)
INSERT INTO Asuntos VALUES(8,'20190513','20190603',11,6)
INSERT INTO Asuntos VALUES(9,'20190801','20190603',1,2)
INSERT INTO Asuntos VALUES(10,'20190901','20190903',4,3)


CREATE TABLE Asuntos_Procuradores(
id INT IDENTITY PRIMARY KEY,
idAsunto INT FOREIGN KEY(idAsunto) REFERENCES Asuntos(id_expediente),
IdProcurador INT FOREIGN KEY(IdProcurador) REFERENCES Procuradores(id)
)
INSERT INTO Asuntos_Procuradores(idAsunto,IdProcurador) VALUES (1,1)
INSERT INTO Asuntos_Procuradores(idAsunto,IdProcurador) VALUES (1,2)
INSERT INTO Asuntos_Procuradores(idAsunto,IdProcurador) VALUES (2,4)
INSERT INTO Asuntos_Procuradores(idAsunto,IdProcurador) VALUES (3,5)
INSERT INTO Asuntos_Procuradores(idAsunto,IdProcurador) VALUES (4,8)
INSERT INTO Asuntos_Procuradores(idAsunto,IdProcurador) VALUES (2,2)
INSERT INTO Asuntos_Procuradores(idAsunto,IdProcurador) VALUES (5,6)
INSERT INTO Asuntos_Procuradores(idAsunto,IdProcurador) VALUES (7,4)
INSERT INTO Asuntos_Procuradores(idAsunto,IdProcurador) VALUES (6,2)
INSERT INTO Asuntos_Procuradores(idAsunto,IdProcurador) VALUES (10,10)
INSERT INTO Asuntos_Procuradores(idAsunto,IdProcurador) VALUES (10,11)
INSERT INTO Asuntos_Procuradores(idAsunto,IdProcurador) VALUES (8,5)
INSERT INTO Asuntos_Procuradores(idAsunto,IdProcurador) VALUES (9,6)
INSERT INTO Asuntos_Procuradores(idAsunto,IdProcurador) VALUES (9,1)







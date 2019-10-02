GO
create database zoologicos
GO
use zoologicos
GO
CREATE TABLE continentes(
id_continente INT IDENTITY PRIMARY KEY,
nombre VARCHAR(100),
)
GO
CREATE TABLE paises(
id_pais INT IDENTITY PRIMARY KEY,
nombre VARCHAR(100),
id_continente  INT FOREIGN KEY(id_continente) REFERENCES continentes(id_continente),
)
GO
CREATE TABLE especies(
id_especie INT IDENTITY PRIMARY KEY,
nombre_vulgar VARCHAR(100),
nombre_cientifico VARCHAR(100),
familia VARCHAR(100),
peligro BIT,
)
GO
CREATE TABLE animales(
id_animal INT IDENTITY PRIMARY KEY,
id_especie INT FOREIGN KEY(id_especie) REFERENCES especies(id_especie),
sexo BIT,
año_nacimiento DATE,
id_pais  INT FOREIGN KEY(id_pais) REFERENCES paises(id_pais),
id_continente  INT FOREIGN KEY(id_continente) REFERENCES continentes(id_continente)
)
GO
CREATE TABLE zoologicos(
id_zoo INT IDENTITY PRIMARY KEY,
nombre VARCHAR(100),
ciudad VARCHAR(100),
id_pais  INT FOREIGN KEY(id_pais) REFERENCES paises(id_pais),
area DECIMAL(2,0),
presupuesto DECIMAL(2,0)
)
GO
CREATE TABLE zoo_animales(
id_animal  INT FOREIGN KEY(id_animal) REFERENCES animales(id_animal),
id_zoo INT FOREIGN KEY(id_zoo) REFERENCES zoologicos(id_zoo),
)



--DATA
INSERT INTO continentes VALUES('America')
INSERT INTO continentes VALUES('Africa')
INSERT INTO continentes VALUES('Asia')
INSERT INTO continentes VALUES('Europa')
INSERT INTO continentes VALUES('Oceania')


INSERT INTO paises VALUES('Indonesia',1);
INSERT INTO paises VALUES('Poland',2);
INSERT INTO paises VALUES('Indonesia',3);
INSERT INTO paises VALUES('Russia',3);
INSERT INTO paises VALUES('Pakistan',3);
INSERT INTO paises VALUES('UnitedStates',1);
INSERT INTO paises VALUES('France',4);
INSERT INTO paises VALUES('Sweden',3);
INSERT INTO paises VALUES('Vietnam',3);


INSERT INTO especies VALUES('Platypus','Ornithorhynchus anatinus','Cornaceae',1);
INSERT INTO especies VALUES('Australian brush turkey','Alectura lathami','Scrophulariaceae',0);
INSERT INTO especies VALUES('Striped hyena','Hyaena hyaena','Isoetaceae',0);
INSERT INTO especies VALUES('Pie','rufous tree', 'Dendrocitta vagabunda,Vitaceae',1);
INSERT INTO especies VALUES('Common boubou shrike','Laniarius ferrugineus','Orchidaceae',0);
INSERT INTO especies VALUES('Moose','Alces alces','Liliaceae',1);
INSERT INTO especies VALUES('Ring-necked pheasant','Phasianus colchicus','Rosaceae',0);
INSERT INTO especies VALUES('Eurasian badger','Meles meles','Scrophulariaceae',1);
INSERT INTO especies VALUES('Malleefowl','Leipoa ocellata','Euphorbiaceae',1);
INSERT INTO especies VALUES('Pale white-eye','Zosterops pallidus','Simaroubaceae',1);

INSERT INTO animales VALUES(1,0,'2019-09-14',1,1);
INSERT INTO animales VALUES(2,1,'2019-04-17',2,2);
INSERT INTO animales VALUES(3,1,'2019-08-11',3,3);
INSERT INTO animales VALUES(4,0,'2018-11-25',4,4);
INSERT INTO animales VALUES(5,1,'2018-12-17',5,5);
INSERT INTO animales VALUES(6,1,'2019-05-05',1,1);
INSERT INTO animales VALUES(7,1,'2019-09-02',2,2);
INSERT INTO animales VALUES(8,1,'2019-03-20',3,3);
INSERT INTO animales VALUES(9,1,'2019-01-24',4,4);
INSERT INTO animales VALUES(10,0,'2019-01-05',5,5);


INSERT INTO zoologicos VALUES('zoo1','Cuenca',1,68.00,56.63);
INSERT INTO zoologicos VALUES('zoo2','Obihiro',2,18.00,60.63);
INSERT INTO zoologicos VALUES('zoo3','Ilha Solteira',30.00,53,73.59);
INSERT INTO zoologicos VALUES('zoo4','Vide',4,63.00,67.62);
INSERT INTO zoologicos VALUES('zoo5','Nanxia',5,21.50,67.90);
INSERT INTO zoologicos VALUES('zoo6','Shinpokh',1,57.70,59.93);
INSERT INTO zoologicos VALUES('zoo7','Torrevieja',2,25.80,80.12);
INSERT INTO zoologicos VALUES('zoo8','Budy',3,63.90,83.91);
INSERT INTO zoologicos VALUES('zoo9','Cap-Santé',4,13.43,84.18);
INSERT INTO zoologicos VALUES('zoo10','Holguín',5,40.13,57.79);

INSERT INTO zoo_animales VALUES(1,31)
INSERT INTO zoo_animales VALUES(2,32)
INSERT INTO zoo_animales VALUES(3,33)
INSERT INTO zoo_animales VALUES(4,34)
INSERT INTO zoo_animales VALUES(5,35)
INSERT INTO zoo_animales VALUES(6,36)
INSERT INTO zoo_animales VALUES(7,37)
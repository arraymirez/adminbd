--CREATE DATABASE ejercicio4_videoclub;
--USE ejercicio4_videoclub;


CREATE TABLE socios
(
 codigo    int PRIMARY KEY,
 nombre    varchar(50) ,
 direccion varchar(50) ,
 telefono  varchar(50) ,
);


CREATE TABLE director
(
 id_director int PRIMARY KEY  ,
 nombre      varchar(100),

);


CREATE TABLE actor
(
 id_actor int PRIMARY KEY  ,
 nombre      varchar(100),

);


CREATE TABLE genero
(
 id_genero int PRIMARY KEY  ,
 nombre      varchar(100),

);


CREATE TABLE pelicula
(
 id_pelicula int PRIMARY KEY ,
 nombre      varchar(100) NOT NULL ,
 id_director int FOREIGN KEY (id_director)  REFERENCES director(id_director), 
 id_genero   int FOREIGN KEY (id_genero)  REFERENCES genero(id_genero)
);

CREATE TABLE gusta_director(
id INT PRIMARY KEY,
codigo  INT FOREIGN KEY (codigo) REFERENCES socios(codigo),
id_director  INT FOREIGN KEY (id_director) REFERENCES director(id_director)
)


CREATE TABLE gusta_actor(
id INT PRIMARY KEY,
codigo  INT FOREIGN KEY (codigo) REFERENCES socios(codigo),
id_actor  INT FOREIGN KEY (id_actor) REFERENCES actor(id_actor)
)

CREATE TABLE gusta_genero(
id INT PRIMARY KEY,
codigo  INT FOREIGN KEY (codigo) REFERENCES socios(codigo),
id_genero  INT FOREIGN KEY (id_genero) REFERENCES genero(id_genero)
)

CREATE TABLE reparto(
id INT IDENTITY PRIMARY KEY,
id_actor  INT FOREIGN KEY (id_actor) REFERENCES actor(id_actor),
id_pelicula  INT FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula)
)


CREATE TABLE cinta(
numero INT PRIMARY KEY,
id_pelicula  INT FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula)
)



CREATE TABLE prestamos(
id INT IDENTITY primary KEY,
fecha_actual DATE NULL,
fecha_finalizado DATE NULL,
codigo  INT FOREIGN KEY (codigo) REFERENCES socios(codigo),
numero  INT FOREIGN KEY (numero) REFERENCES cinta(numero)

)



CREATE TABLE  lista_espera(

id INT IDENTITY PRIMARY KEY,
codigo  INT FOREIGN KEY (codigo) REFERENCES socios(codigo),
id_pelicula  INT FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula)

)
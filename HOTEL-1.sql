create database HOTEL;
use HOTEL
use ZooDB
drop database HOTEL;
 --*==============================================================* /  /* Table: HOTEL */  / *==============================================================* / 
create table Hotel 
(
IdHotel INT PRIMARY KEY IDENTITY not null,
NombreHotel NVARCHAR  (45) not null,
DireccionHotel  NVARCHAR (45) not null,
CantidadDePiezas NVARCHAR  (45) not null,
Telefono  NVARCHAR (14) not null,
AnoConstruccion  INT not null,
Categoria NVARCHAR (45) not null
);
 --*==============================================================* /  /* Table: TIPOHAB */  / *==============================================================* / 
create table TipoHab
(
IdTipo INT PRIMARY KEY IDENTITY not null,
Nombre NVARCHAR (45) not null
);

 --*==============================================================* /  /* Table: PERSONA */  / *==============================================================* / 
create table Persona
(
IdPersona INT PRIMARY KEY IDENTITY not null,
Nombre NVARCHAR (45)not null,
Apellido NVARCHAR (45)not null,
Direccion NVARCHAR (45) not null,
Telefono NVARCHAR (14) null
);
 --*==============================================================* /  /* Table: HABITACIONES */  / *==============================================================* / 
create table Habitaciones
(
IdHabitacion INT PRIMARY KEY IDENTITY not null,
TipoDeHab NVARCHAR (45)not null,
IdHotel INT FOREIGN KEY REFERENCES Hotel(IdHotel) not null,
IdTipo INT FOREIGN KEY REFERENCES TipoHab(IdTipo) not null,
Minibar NVARCHAR (45)not null,
Jacuzzi NVARCHAR (45)not null
);
 --*==============================================================* / /* Table: RESERVA */  / *==============================================================* / 
create table Reserva
(
IdReserva INT PRIMARY KEY IDENTITY not null,
Preciohab NVARCHAR (45)not null,
Fechainicio NVARCHAR (25)not null,
FechaTermino NVARCHAR (45) not null,
IdPersona INT FOREIGN KEY REFERENCES Persona(IdPersona)not null,
IdHabitacion INT FOREIGN KEY REFERENCES Habitaciones(IdHabitacion) not null
);

Select * from Hotel;
Select * from TipoHab;
Select * from Persona;
Select * from Habitaciones;
Select * from Reserva;

INSERT INTO Persona(Nombre,Apellido,Direccion,Telefono) VALUES ('Oscar','Barraza','Av Juventino Rosas 1671','664-438-1313');

---------------------------------------------------CONCURRENCIA-------------------------------------------------------
-------------------------------- Transaccion 1 -----------------------------------------------------------------------
use Hotel
go

Set Transaction Isolation level read committed

--Inicio proceso A --
Begin Tran uno
	Update Persona Set Telefono='123456'
	Where IdPersona =1
--Tiempo de espera--
	Waitfor Delay '00:00:10'
Rollback Tran uno
--Fin del proceso A--
-------------------------------- Transaccion 2 -----------------------------------------------------------------------
use Hotel

Set Transaction Isolation Level Read UnCommitted

--Inicio proceso B --
Begin Tran Dos
	Select Telefono from Persona Where IdPersona = 1
Commit Tran Dos
--Fin del proceso B--

select*from Persona;


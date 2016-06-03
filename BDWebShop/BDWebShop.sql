use master
go
-- Creación de la Base de Datos
begin
if  db_id('BDWebShop') is not null    
	drop database BDWebShop
end
create database BDWebShop
go

use BDWebShop
go
 
--Creación de Tablas :

--Creación de la tabla TCategoria:
if OBJECT_ID('TCategoria') is not null
	drop table TCategoria
go	
create table TCategoria
(
	CodCategoria  varchar(2) not null constraint pk_CodCategoria primary key(CodCategoria),
	Nombre varchar(20)
)
go

--Creación de la tabla TSubCategoria:
if OBJECT_ID('TSubCategoria') is not null
	drop table TSubCategoria
go	
create table TSubCategoria
(
	CodSubCategoria  varchar(4) not null constraint pk_CodSubCategoria primary key(CodSubCategoria),
	Nombre varchar(25),
	CodCategoria varchar(2) not null constraint fk_CodCategoria foreign key references TCategoria(CodCategoria)
)

go

--Creación de la tabla TProducto:
if OBJECT_ID('TProducto') is not null
	drop table TProducto
go	
create table TProducto
(
	CodProducto varchar(6) not null constraint pk_CodProducto primary key (CodProducto),
	Nombre  varchar(35),
	Descripcion nvarchar(2000),
	Especificacion varchar(40),
	Stock int,
	Precio money CONSTRAINT prod_precio DEFAULT (0),
	CodSubCategoria  varchar(4) not null constraint fk_CodSubCategoria foreign key references TSubCategoria(CodSubCategoria)
)
go
--Creación de la tabla TCliente:
if OBJECT_ID('TCliente') is not null
	drop table TCliente
go	
create table TCliente
(
	CodCliente int not null constraint pk_CodCliente primary key(CodCliente) IDENTITY (1, 1),
	Nombres varchar(25),
	Apellidos varchar(40),
	Genero  char(1),
	TipoDocumento  varchar(20),
	NroDocumento varchar(20),
	Email  varchar(30)not null constraint uq_Email unique nonclustered, 
	Provincia varchar(30),
	Ciudad varchar(30),
	Distrito  varchar(25),
	Direccion  varchar(30),
	Usuario  varchar(50)not null constraint uq_Usuario unique nonclustered,
	Contrasena varchar(40),
	RazonSocial varchar(30),
	Telefono varchar(10)
)
go

--Creación de la tabla TOrdenVenta:
if OBJECT_ID('TOrdenVenta') is not null
	drop table TOrdenVenta
go	
create table TOrdenVenta
(
	NroVenta int constraint pk_NroVenta primary key (NroVenta) identity,
	CodCliente int constraint fk_CodCliente foreign key references TCliente(CodCliente),
	Total money,
	FechaVenta datetime default getdate(),
	FechaEntrega  datetime
)
go

--Creación de la tabla TDetalleVenta:
if OBJECT_ID('TDetalleVenta') is not null
	drop table TDetalleVenta
go	
create table TDetalleVenta
(
	NroDetalleVenta int identity primary key,
	NroVenta int constraint fk_NroVenta foreign key references TOrdenVenta(NroVenta),
	CodProducto varchar(6) constraint fk_CodProducto foreign key references TProducto(CodProducto),
	Cantidad integer,
	PrecioUnitario money,
)
go

--Creación de la tabla TCabeceraVentas: 
if OBJECT_ID('TCabeceraVenta') is not null
	drop table TCabeceraVenta
go	
create table TCabeceraVenta
(	
	NroDetalleVenta int,
	CodCliente int,
	FechaVenta datetime,	
	foreign key (CodCliente) references TCliente(CodCliente),	
	foreign key (NroDetalleVenta) references TDetalleVenta(NroDetalleVenta),
	constraint pk_CabeVenta primary key (CodCliente,NroDetalleVenta)
)
go
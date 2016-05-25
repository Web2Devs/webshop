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
	Sexo  char(1),
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

--Creación de la tabla TCompra:
if OBJECT_ID('TCompra') is not null
	drop table TCompra
go	
create table TCompra
(
	CodCompra varchar(10) not null constraint pk_CodCompra primary key (CodCompra),
	CodCliente int constraint fk_CodCliente foreign key references TCliente(CodCliente),
	Total money,
	FechaCompra datetime default getdate(),
	FechaEntrega  datetime
)
go

--Creación de la tabla TDetalleCompra:
if OBJECT_ID('TDetalleCompras') is not null
	drop table TDetalleCompras
go	
create table TDetalleCompras
(
	CodCompra varchar(10) constraint fk_CodCompra foreign key references TCompra(CodCompra),
	CodProducto varchar(6) constraint fk_CodProducto foreign key references TProducto(CodProducto),
	Cantidad integer,
	Precio money
	constraint pk_CodDetalleCompras primary key (CodCompra,CodProducto)
)
go

--Creación de la tabla TDireccionEnvio:
if OBJECT_ID('TDireccionEnvio') is not null
	drop table TDireccionEnvio
go	
create table  TDireccionEnvio
(
	CodDireccionEnvio int not null constraint pk_CodDireccionEnvio primary key (CodDireccionEnvio) IDENTITY (1, 1),
	Nombre varchar (30),	
	Provincia varchar(30),
	Ciudad varchar(30),
	Distrito  varchar(20),
	Direccion  varchar(30),
	Telefono  varchar(10),
	NombreDestinatario  varchar(20),
	ApellidoDestinatario varchar(30),
	CodCliente int constraint fk_CodDireccionEnvio foreign  key references TCliente (CodCliente)
)
go

--Creación de Tablas Pasarela:
--Creación de la tabla TClientePasarela:
if OBJECT_ID('TClientePasarela') is not null
	drop table TClientePasarela
go	

create table TClientePasarela
(
	CodCliente int not null primary key,
	Nombres varchar(30),
	Apellidos varchar(50),
	Cuidad varchar(20),
	Provincia varchar(20),
	Distrito varchar(20),
	Estado varchar(20),
	TipoDocumento varchar(10),
	DNI char(8)
)
go

--Creación de la tabla TCuentaAhorro:
if OBJECT_ID('TCuentaAhorroPasarela') is not null
	drop table TCuentaAhorroPasarela
go	
create table TCuentaAhorroPasarela
(
	NroCuenta  varchar(16)not null primary key,
	TipoDeCuenta varchar(40),
	Banco varchar(40),
	CodCliente int,
	foreign key (CodCliente) references TClientePasarela(CodCliente)
)
go

--Creación de la tabla TTarjeta:
if OBJECT_ID('TTarjetaPasarela') is not null
	drop table TTarjetaPasarela
go	
create table TTarjetaPasarela
(
	NroTarjeta varchar(16)not null primary key,
	TipoTarjeta varchar(40),
	Contrasena char(40),
	NroCuenta  varchar(16),
	foreign key (NroCuenta) references TCuentaAhorroPasarela(NroCuenta)
)
go 

--Creación de la tabla TMovimiento:
if OBJECT_ID('TMovimientoPasarela') is not null
	drop table TMovimientoPasarela
go	
create table TMovimientoPasarela
(
	RegistroMovimiento int not null primary key,
	FechaMovimiento DateTime,
	MontoRetiro Decimal,
	SaldoDisponible Decimal,
	NroTarjeta varchar(16),
    Activo varchar(1),
	foreign key (NroTarjeta) references TTarjetaPasarela(NroTarjeta)
)
go

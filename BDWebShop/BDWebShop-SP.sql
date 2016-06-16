use BDWebShop
go

-- Procedimientos Almacenados
-- Procedimiento Almacenado para Listar Producto
if OBJECT_ID('uspListarProductos') is not null
	drop proc uspListarProductos
go
create proc uspListarProductos
@CodProducto int
as
begin
	select * from TProducto
	where CodProducto = @CodProducto
end
go

exec uspListarProductos '1';

--Procedimiento Almacenado para Agregar Productos
if OBJECT_ID('uspAgregarProducto') is not null
	drop proc uspAgregarProducto
go
create proc uspAgregarProducto
@Nombre varchar(35),@Descripcion nvarchar(2000),@Especificacion varchar(40),@Stock int,@Precio money,@CodSubCategoria varchar(4)
as
begin
		if not exists (select Nombre from TProducto where Nombre = @Nombre)
			if exists (select CodSubCategoria from TProducto where CodSubCategoria = @CodSubCategoria)
			begin
				insert into TProducto values(@Nombre,@Descripcion,@Especificacion,@Stock,@Precio,@CodSubCategoria)
				select CodError = 0, Mensaje = 'Producto insertado correctamente'
			end
			else select CodError =1, Mensaje ='Error: No existe código de Sub Categoría'
		else select CodError =1, Mensaje ='Error: Nombre de Producto Duplicado'
end
go

exec uspAgregarProducto 'Mouse Razer3', 'Razer', 'gfgfg', 50, 350, 1;

--Procedimiento Almacenado para Eliminar Productos
if OBJECT_ID('uspEliminarProducto') is not null
	drop proc uspEliminarProducto
go
create proc uspEliminarProducto
@CodProducto int
as
begin
	if exists (select CodProducto from TProducto where CodProducto = @CodProducto)
		if not exists (select CodProducto from TDetalleCompras where CodProducto=@CodProducto)
			begin
				delete from TProducto where CodProducto = @CodProducto
				select CodError = 0, Mensaje = 'Producto eliminado correctamente'
			end 
			
		else Select CodError =1, Mensaje ='Error: Existe Producto en Detalle de Compra'
	else Select CodError =1, Mensaje ='Error: Código de Producto no existe'
end
go

exec uspEliminarProducto '3';
exec uspListarProductos '3';

--Procedimiento Almacenado para Modificar Productos
if OBJECT_ID('uspModificarProducto') is not null
	drop proc uspModificarProducto
go
create proc uspModificarProducto
@CodProducto varchar(6),@Nombre varchar(35),@Descripcion nvarchar(2000),@Especificacion varchar(40),@Stock int,@Precio money,@CodSubCategoria varchar(4)
as
begin
	if exists (select CodProducto from TProducto where CodProducto = @CodProducto)
		if not exists (select Nombre from TProducto where Nombre = @Nombre)
			if exists (select CodSubCategoria from TProducto where CodSubCategoria = @CodSubCategoria)
			begin
				update TProducto set  Nombre=@Nombre,Descripcion=@Descripcion,Especificacion=@Especificacion,Stock=@Stock,Precio=@Precio,CodSubCategoria=@CodSubCategoria where CodProducto=@CodProducto
				select CodError = 0, Mensaje = 'Datos de producto modificado correctamente'
			end
			else select CodError =1, Mensaje ='Error: No existe código de Sub Categoría'
		else Select CodError =1, Mensaje ='Error: Nombre de producto duplicado'
	else Select CodError =1, Mensaje ='Error: Codigo de producto no existe'
end
go


--Procedimiento Almacenado para Buscar Productos

if OBJECT_ID('uspBuscarProducto') is not null
	drop proc uspBuscarProducto
go
create proc uspBuscarProducto
@Nombre varchar(35)
as
begin
		if  exists (select Nombre from TProducto where Nombre like @Nombre + '%')
			begin
				select CodProducto, Nombre, Precio from TProducto where Nombre like @Nombre + '%'
				
			end
		else Select CodError =1, Mensaje ='Error: Nombre de Producto no existe'

end
go

-- Procedimiento Almacenado para Listar Clientes
if OBJECT_ID('uspListarCliente') is not null
	drop proc uspListarCliente
go
create proc uspListarCliente
as
begin
	select * from TCliente
end
go

-- Procedimiento Almacenado para mostrar datos del cliente por email
if OBJECT_ID('uspListarDatosCliente') is not null
	drop proc uspListarDatosCliente
	
go
create proc uspListarDatosCliente
@Email varchar(50)
as
begin
	select * from TCliente where Email=@Email
end
go

--Procedimiento Almacenado para Agregar Clientes
if OBJECT_ID('uspAgregarCliente') is not null
	drop proc uspAgregarCliente
go
create proc uspAgregarCliente
@CodCliente int,@Nombres varchar(25),@Apellidos varchar(40),@Sexo char(1),@TipoDocumento varchar(20),@NroDocumento varchar(20),@Email varchar(30),@Provincia varchar(30),@Ciudad varchar(30),@Distrito varchar(25),@Direccion varchar(30),@Usuario varchar(50),@Contrasena varchar(40),@RazonSocial varchar(30),@Telefono varchar(10)
as
begin
	if exists (select CodCliente from TCliente where CodCliente = @CodCliente)
		if not exists (select Usuario from TCliente where Usuario = @Usuario)
			begin
				insert into TCliente values(@Nombres,@Apellidos,@Sexo,@TipoDocumento,@NroDocumento,@Email,@Provincia,@Ciudad,@Distrito,@Direccion,@Usuario,@Contrasena,@RazonSocial,@Telefono)
				select CodError = 0, Mensaje = 'Cliente insertado correctamente'
			end
		else select CodError =1, Mensaje ='Error: Nombre de Email Duplicado'
	else Select CodError =1, Mensaje ='Error: Código del cliente Duplicado'
end
go

select*from TCliente;
--Procedimiento Almacenado para Eliminar Clientes
if OBJECT_ID('uspEliminarCliente') is not null
	drop proc uspEliminarCliente
go
create proc uspEliminarCliente
@CodCliente varchar(6)
as
begin
	if exists (select CodCliente from TCliente where CodCliente = @CodCliente)
		if not exists (select CodCliente from TCompra where CodCliente = @CodCliente)
			if not exists (select CodCliente from TDireccionEnvio where CodCliente = @CodCliente)
			begin
				delete from TCliente where CodCliente = @CodCliente
				select CodError = 0, Mensaje = 'Producto eliminado correctamente'
			end 
			else Select CodError =1, Mensaje ='Error: Existen Direcciones de envío de este cliente'
		else Select CodError =1, Mensaje ='Error: Existen Compras de este cliente'
	else Select CodError =1, Mensaje ='Error: Código de Cliente no existe'
end
go
--exec uspEliminarCliente '1'

-- Procedimiento para modificar cliente
if OBJECT_ID('uspModificarCliente') is not null
	drop proc uspModificarCliente01
go
create proc uspModificarCliente01
@CodCliente int,@Nombres varchar(25),@Apellidos varchar(40),@Sexo char(1),@TipoDocumento varchar(20),@NroDocumento varchar(20),@Email varchar(30),@Provincia varchar(30),@Ciudad varchar(30),@Distrito varchar(25),@Direccion varchar(30),@Usuario varchar(50),@RazonSocial varchar(30),@Telefono varchar(10)
as
begin
	if exists (select Email from TCliente where Email = @Email)

			begin
				update TCliente set Nombres=@Nombres, Apellidos=@Apellidos,Sexo=@Sexo,TipoDocumento=@TipoDocumento,NroDocumento=@NroDocumento,Email=@Email,Provincia=@Provincia,Ciudad=@Ciudad,Distrito=@Distrito,Direccion=@Direccion,Usuario=@Usuario,RazonSocial=@RazonSocial,Telefono=@Telefono where Email=@Email
				select CodError = 0, Mensaje = 'Datos Modificados Correctamente'
			end

	else Select CodError =1, Mensaje ='Error:No existe el usuario'
end
go

--exec spCargarDatosCliente 'ruben@hotmail.com';

-- Procedimiento Almacenado para Listar Compras
if OBJECT_ID('uspListarCompra') is not null
	drop proc uspListarCompra
go
create proc uspListarCompra
as
begin
	select * from TCompra
end
go

--exec uspListarCompra


--Procedimiento Almacenado para Agregar Compra
if OBJECT_ID('uspAgregarCompra') is not null
	drop proc uspAgregarCompra
go
create proc uspAgregarCompra
@CodCompra varchar(10),@CodCliente int,@Total money,@FechaCompra datetime,@FechaEntrega datetime
as
begin
	if not exists (select CodCompra from TCompra where CodCompra = @CodCompra)
		if exists (select CodCliente from TCliente where CodCliente = @CodCliente)
			begin
				insert into TCompra values(@CodCompra,@CodCliente,@Total,@FechaCompra,@FechaEntrega)
				select CodError = 0, Mensaje = 'Compra insertada correctamente'
			end
		else Select CodError =1, Mensaje ='Error: No existe el código de cliente'
	else Select CodError =1, Mensaje ='Error: Codigo de Compra Duplicado'
end
go
--exec uspAgregarCompra '005','2','35.00','2010-02-12','2010-02-12'

--Procedimiento Almacenado para Eliminar Compra
if OBJECT_ID('uspEliminarCompra') is not null
	drop proc uspEliminarCompra
go
create proc uspEliminarCompra
@CodCompra varchar(10)
as
begin
	if exists (select CodCompra from TCompra where CodCompra = @CodCompra)
	   if not exists (select CodCompra from TDetalleCompras where CodCompra=@CodCompra)
			begin
				delete from TCompra where CodCompra = @CodCompra
				select CodError = 0, Mensaje = 'Compra eliminada correctamente'
			end 
				else select CodError =1, Mensaje ='Error: Existe Compra en Detalle de Compra'
	else Select CodError =1, Mensaje ='Error: Código de Compra no existe'
end
go
--exec uspEliminarCompra '001'

-- Procedimiento Almacenado para Listar Detalle de Compras
if OBJECT_ID('uspListarDetalleCompras') is not null
	drop proc uspListarDetalleCompras
go
create proc uspListarDetalleCompras
as
begin
	select * from TDetalleCompras
end
go

--exec uspListarDetalleCompras 

--Procedimiento Almacenado para Agregar Detalle de compras
if OBJECT_ID('uspAgregarDetalleCompras') is not null
	drop proc uspAgregarDetalleCompras
go
create proc uspAgregarDetalleCompras
@CodCompra varchar(10),@CodProducto varchar(6),@Cantidad integer,@Precio money
as
begin
	if exists (select CodCompra from TCompra where CodCompra = @CodCompra)
		if exists(select CodProducto from TProducto where CodProducto = @CodProducto)
			begin
				insert into TDetalleCompras values(@CodCompra,@CodProducto,@Cantidad,@Precio)
				select CodError = 0, Mensaje = 'Detalle de compra insertado correctamente'
			end
		else select CodError =1, Mensaje ='Error: No existe código de Producto'
	else Select CodError =1, Mensaje ='Error: No existe código de Compra'
end
go
--exec uspAgregarDetalleCompras '002','C10002','3','36.00'

--Procedimiento Almacenado para Eliminar Detalle de Compra
if OBJECT_ID('uspEliminarDetalleCompras') is not null
	drop proc uspEliminarDetalleCompras
go
create proc uspEliminarDetalleCompras
@CodCompra varchar(10),@CodProducto varchar(6)
as
begin
	if exists (select CodCompra from TDetalleCompras where CodProducto = @CodProducto)
			begin
				delete from TDetalleCompras where CodCompra =@CodCompra and CodProducto=@CodProducto
				select CodError = 0, Mensaje = 'Detalle de Compra eliminado correctamente'
			end 
	else Select CodError =1, Mensaje ='Error: Código de Compra y de producto no existen en Detalle de Compra'
end
go
--exec uspEliminarDetalleCompras '001','C10002'

--Procedimiento Almacenado para Autenticar Cliente

if OBJECT_ID('uspAutenticarCliente') is not null
	drop proc uspAutenticarCliente
go
create proc uspAutenticarCliente
@Usuario varchar(50),@Contrasena varchar(40)
as
begin
	if exists(select CodCliente from TCliente where Usuario=@Usuario and Contrasena=@Contrasena)
		begin
		    declare @Nombres varchar(50)
		    set @Nombres = (select Nombres + ' ' + Apellidos from TCliente where Usuario=@Usuario and Contrasena=@Contrasena)
			select CodError = 0, Mensaje = @Nombres
		end
	else select CodError = 1, Mensaje = 'Error: Usuario y/o Contrasena incorrectas'
end
go
--exec uspAutenticarCliente 'jean@hotmail.com','3625608'

--Procedimiento Almacenado para Listar Productos por categorías

if OBJECT_ID('uspListarPorCategorias') is not null
	drop proc uspListarPorCategorias
go
create proc uspListarPorCategorias
@CodCategoria varchar(2)
as
begin
select P.CodProducto,P.Nombre,P.Precio
from TCategoria C inner join TSubCategoria S on
C.CodCategoria=S.CodCategoria inner join TProducto P on 
S.CodSubCategoria=P.CodSubCategoria
where C.CodCategoria=@CodCategoria
end
go
--PA para Agregar Dirección de Envío por email
if OBJECT_ID('uspAgregarDireccionEnvio') is not null
	drop proc uspAgregarDireccionEnvio
go
create proc uspAgregarDireccionEnvio
@CodDireccionEnvio int,@Nombre varchar(30),@Provincia varchar(30),@Ciudad varchar (30),@Distrito varchar(20),@Direccion varchar(30),@Telefono varchar(10),@NombreDestinatario varchar(20),@ApellidoDestinatario varchar(30),@Email varchar(50)
as
begin
declare @CodCliente int
set @CodCliente=(select CodCliente from TCliente where Email=@Email)

	if exists (select CodCliente from TCliente where CodCliente=@CodCliente)

		if exists (select CodDireccionEnvio from TDireccionEnvio where CodDireccionEnvio = @CodDireccionEnvio)
			
			if not exists (select Nombre from TDireccionEnvio where Nombre=@Nombre and CodCliente=@CodCliente)
			begin
				insert into TDireccionEnvio values(@Nombre,@Provincia,@Ciudad,@Distrito,@Direccion,@Telefono,@NombreDestinatario,@ApellidoDestinatario,@CodCliente)

				select CodError = 0, Mensaje = 'Dirección de envío insertado correctamente'
			end
			else select CodError =1, Mensaje ='Error: Ya existe una dirección de envío con ese nombre'
		else select CodError =1, Mensaje ='Error: ya existe direccion envio'
	else Select CodError =1, Mensaje ='Error: No existe cliente'
end
go
--uspAgregarDireccionEnvio '1','Mi casa2','Cusco','Cusco','Cusco','Larapa D-12-2','237856','José','Guillén','alba@hotmail.com'

---PA para listar Direcciones de envío por email:

if OBJECT_ID('uspListarDireccionEnvio') is not null
	drop proc uspListarDireccionEnvio
go
create proc uspListarDireccionEnvio
@Email varchar(50)
as
begin
	select S.Nombre,S.NombreDestinatario,S.ApellidoDestinatario,S.Ciudad,S.Provincia,S.Distrito,S.Direccion,S.Telefono
from TDireccionEnvio S inner join TCliente C on
C.CodCliente=S.CodCliente where C.Email=@Email
end
go

---PA para listar Direcciones de envío por email:

if OBJECT_ID('uspListarDireccionEnvioDatos') is not null
	drop proc uspListarDireccionEnvioDatos
go
create proc uspListarDireccionEnvioDatos
@Email varchar(50), @Nombre varchar(30)
as
begin
	select S.Nombre,S.NombreDestinatario,S.ApellidoDestinatario,S.Ciudad,S.Provincia,S.Distrito,S.Direccion,S.Telefono
from TDireccionEnvio S inner join TCliente C on
C.CodCliente=S.CodCliente where C.Email=@Email and S.Nombre=@Nombre
end
go

--exec uspListarDireccionEnvioDatos 'ruben@hotmail.com','Casa Mamá'

if OBJECT_ID('uspListarDireccionEnvio','P') is not null
	drop proc uspListarDireccionEnvio
go
create proc uspListarDireccionEnvio
@Email varchar(50)
as
begin
	select S.Nombre,S.NombreDestinatario,S.ApellidoDestinatario,S.Ciudad,S.Provincia,S.Distrito,S.Direccion,S.Telefono
from TDireccionEnvio S inner join TCliente C on
C.CodCliente=S.CodCliente where C.Email=@Email
end
go

--exec uspListarDireccionEnvio 'ruben@hotmail.com'


--Procedimiento Almacenado para Verificar Email

if OBJECT_ID('uspVerificarEmail','P') is not null
	drop proc uspVerificarEmail
go
create proc uspVerificarEmail
@Email varchar(50)
as
begin
	if not exists(select Email from TCliente where Email=@Email)
		begin
select CodError = 0, Mensaje = 'continuar'
		end
	else select CodError = 1, Mensaje = 'Error: Email ya existe'
end
go
--exec uspVerificarEmail 'rubaden@hotmail.com'


---PA para listar tarjetas:
if OBJECT_ID('uspListarTarjeta') is not null
	drop proc uspListarTarjeta
go
create proc uspListarTarjeta
as
begin
	select * from TTarjetaPasarela
end
go

--exec uspListarTarjeta
-----procedimiento para autenticar tarjeta
If object_id('uspAutenticarTarjeta')is not null
Drop Proc uspAutenticarTarjeta
Go
Create Proc uspAutenticarTarjeta
@TipoTarjeta varchar(40),
@NroTarjeta varchar(25),
@Contrasena varchar(40)
as 
begin
	if exists (select * from TTarjetaPasarela where TipoTarjeta=@TipoTarjeta and NroTarjeta=@NroTarjeta)
		if exists (select * from TTarjetaPasarela where  Contrasena = @Contrasena)

		begin
		Select CodError=0, Mensaje = 'Pago correcto'
		end
		
		else Select CodError=1, Mensaje = 'Nro de Tarjeta y/o Contraseña incorrecto'
	else Select CodError=1, Mensaje = 'Nro de Tarjeta no existe'
end
go

--exec uspAutenticarTarjeta 'Tarjeta Débito Visa','4213550312345678','7110EDA4D09E062AA5E4A390B0A572AC0D2C0220'

--Procedimiento almacenado para cambiar contraseña de cliente
if OBJECT_ID('uspCambiarContrasenaCliente') is not null
	drop proc uspCambiarContrasenaCliente
go
create proc uspCambiarContrasenaCliente
@Email varchar(30), @Contra varchar(40), @Contrasena varchar(40)
as
begin

	if exists (select Email from TCliente where Email = @Email)
		if exists (select Contrasena from TCliente where Contrasena = @Contra)

			begin
				update TCliente set Contrasena=@Contrasena  where Email=@Email
				select CodError = 0, Mensaje = 'Contraseña  modificada'
			end
		else Select CodError =1, Mensaje ='Error: Contraseña incorrecta'

	else Select CodError =1, Mensaje ='Error: Email no existe'
end
go
--exec uspCambiarContrasenaCliente 'ruben@hotmail.com','0C85959A489D57AD20D1ABC7E4A3EDE2C1E3DAEE','C24783BA96A35464632A624D9F829136EDC0175E'


if OBJECT_ID('spDatosCliente')  is not null
	drop procedure spDatosCliente
go
create procedure spDatosCliente
@Usuario varchar(50)
as
begin
	select CodCliente,(Apellidos + ' ' + Nombres)as Datos  
	from TCliente WHERE Usuario=@Usuario
end
go

-- CARGA DE DATOS DEL CLIENTE FORMA 2(DATOS COMPLETOS)
if OBJECT_ID('spCargarDatosCliente')  is not null
	drop procedure spCargarDatosCliente
go
create procedure spCargarDatosCliente
@Usuario varchar(50)
as
begin
	select * from TCliente WHERE Usuario=@Usuario
end
go

select*from TCliente;
--exec spCargarDatosCliente 'ruben@hotmail.com';

if OBJECT_ID('spCargarDatosProducto')  is not null
	drop procedure spCargarDatosProducto
go
create procedure spCargarDatosProducto
@CodProducto varchar(6)
as
begin
	select * from TProducto WHERE CodProducto=@CodProducto
end
go

--exec spCargarDatosProducto 'C10001';

--select*from TProducto;

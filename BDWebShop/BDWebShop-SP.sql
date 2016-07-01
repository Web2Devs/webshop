use BDWebShop
go

-- Procedimientos Almacenados
--Procedimiento Almacenado para Listar Categorias
if OBJECT_ID('uspListarCategorias') is not null
	drop proc uspListarCategorias
go
create proc uspListarCategorias
as
begin
	select * from TCategoria
end
go

--exec uspListarCategorias;
--Procedimiento Almacenado para Agregar Categorias
if OBJECT_ID('uspAgregarCategoria') is not null
	drop proc uspAgregarCategoria
go
create proc uspAgregarCategoria
@Nombre varchar(60)
as
begin
		if not exists (select Nombre from TCategoria where Nombre = @Nombre)			
			begin
				insert into TCategoria values(@Nombre)
				select CodError = 0, Mensaje = 'Categoria insertada correctamente'
			end
		else select CodError =1, Mensaje ='Error: Nombre de la Categoria ya Existe'
end
go

--exec uspAgregarCategoria 'jkjkj';
--select*from TCategoria;
--Procedimiento Almacenado para Modificar Categorias
if OBJECT_ID('uspModificarCategoria') is not null
	drop proc uspModificarCategoria
go
create proc uspModificarCategoria
@CodCategoria int,@Nombre varchar(60)
as
begin
	if exists (select CodCategoria from TCategoria where CodCategoria = @CodCategoria)
		if not exists (select Nombre from TCategoria where Nombre = @Nombre)
			begin
				update TCategoria set  Nombre=@Nombre where CodCategoria=@CodCategoria
				select CodError = 0, Mensaje = 'Datos de producto modificado correctamente'
			end
		else Select CodError =1, Mensaje ='Error: Nombre de categoria duplicado'
	else Select CodError =1, Mensaje ='Error: Codigo de categoria no existe'
end
go

--exec uspModificarCategoria '2','Cases & Accesorios';
--select*from TCategoria;
--Procedimiento Almacenado para Eliminar Categorias
if OBJECT_ID('uspEliminarCategoria') is not null
	drop proc uspEliminarCategoria
go
create proc uspEliminarCategoria
@CodCategoria int
as
begin
	if exists (select CodCategoria from TCategoria where CodCategoria = @CodCategoria)
		if not exists (select CodCategoria from TSubCategoria where CodCategoria=@CodCategoria)
			begin
				delete from TCategoria where CodCategoria = @CodCategoria
				select CodError = 0, Mensaje = 'Categoria eliminada correctamente'
			end 			
		else Select CodError =1, Mensaje ='Error: La Categoria esta siendo Utilizada'
	else Select CodError =1, Mensaje ='Error: Código de Categoria no existe'
end
go

--select*from TCategoria;
--exec uspEliminarCategoria '1003';
--Procedimiento Almacenado para Listar SubCategorias
if OBJECT_ID('uspListarSubCategorias') is not null
	drop proc uspListarSubCategorias
go
create proc uspListarSubCategorias
as
begin
	select * from TSubCategoria
end
go

--exec uspListarSubCategorias;
--Procedimiento Almacenado para Agregar SubCategorias
if OBJECT_ID('uspAgregarSubCategoria') is not null
	drop proc uspAgregarSubCategoria
go
create proc uspAgregarSubCategoria
@Nombre varchar(60),@CodCategoria int
as
begin
		if not exists (select Nombre from TSubCategoria where Nombre = @Nombre)
			if exists (select CodCategoria from TCategoria where CodCategoria = @CodCategoria)
			begin
				insert into TSubCategoria values(@Nombre,@CodCategoria)
				select CodError = 0, Mensaje = 'SubCategoria insertada correctamente'
			end
			else select CodError =1, Mensaje ='Error: No existe código de Categoría'
		else select CodError =1, Mensaje ='Error: Nombre de la SubCategoria ya Existe'
end
go
--exec uspAgregarSubCategoria 'Teclado Gamer2pro',1;
--select*from TSubCategoria;
--Procedimiento Almacenado para Modificar SubCategorias
if OBJECT_ID('uspModificarSubCategoria') is not null
	drop proc uspModificarSubCategoria
go
create proc uspModificarSubCategoria
@CodSubCategoria int,@Nombre varchar(60),@CodCategoria int
as
begin
	if exists (select CodSubCategoria from TSubCategoria where CodSubCategoria = @CodSubCategoria)
		if not exists (select Nombre from TSubCategoria where Nombre = @Nombre)
			begin
				update TSubCategoria set  Nombre=@Nombre ,CodCategoria=@CodCategoria where CodSubCategoria=@CodSubCategoria
				select CodError = 0, Mensaje = 'Datos de producto modificado correctamente'
			end
		else Select CodError =1, Mensaje ='Error: Nombre de SubCategoria duplicado'
	else Select CodError =1, Mensaje ='Error: Codigo de SubCategoria no existe'
end
go

--exec uspModificarSubCategoria '2','Case Certificado','2';
--select*from TSubCategoria;

--Procedimiento Almacenado para Eliminar SubCategorias
if OBJECT_ID('uspEliminarSubCategoria') is not null
	drop proc uspEliminarSubCategoria
go
create proc uspEliminarSubCategoria
@CodSubCategoria int
as
begin
	if exists (select CodSubCategoria from TSubCategoria where CodSubCategoria = @CodSubCategoria)
		if not exists (select CodSubCategoria from TProducto where CodSubCategoria=@CodSubCategoria)
			begin
				delete from TSubCategoria where CodSubCategoria = @CodSubCategoria
				select CodError = 0, Mensaje = 'SubCategoria eliminada correctamente'
			end 			
		else Select CodError =1, Mensaje ='Error: La SubCategoria esta siendo Utilizada'
	else Select CodError =1, Mensaje ='Error: Código de SubCategoria no existe'
end
go

--select*from TSubCategoria;
--exec uspEliminarSubCategoria '1002';
-- Procedimiento Almacenado para Listar Producto
if OBJECT_ID('uspListarProductos') is not null
	drop proc uspListarProductos
go
create proc uspListarProductos
as
begin
	select * from TProducto
end
go

--exec uspListarProductos;
--Procedimiento Almacenado para Agregar Productos
if OBJECT_ID('uspAgregarProducto') is not null
	drop proc uspAgregarProducto
go
create proc uspAgregarProducto
@Nombre varchar(50),@Descripcion nvarchar(2000),@Especificacion varchar(60),@Stock int,@Precio money,@CodSubCategoria int
as
begin
		if not exists (select Nombre from TProducto where Nombre = @Nombre)
			if exists (select CodSubCategoria from TSubCategoria where CodSubCategoria = @CodSubCategoria)
			begin
				insert into TProducto values(@Nombre,@Descripcion,@Especificacion,@Stock,@Precio,@CodSubCategoria)
				select CodError = 0, Mensaje = 'Producto insertado correctamente'
			end
			else select CodError =1, Mensaje ='Error: No existe código de SubCategoría'
		else select CodError =1, Mensaje ='Error: Nombre de Producto Duplicado'
end
go

--exec uspAgregarProducto 'Teclado s4', 'Razer', 'gfgfg', 50, 350, 2;

--Procedimiento Almacenado para Modificar Productos
if OBJECT_ID('uspModificarProducto') is not null
	drop proc uspModificarProducto
go
create proc uspModificarProducto
@CodProducto int,@Nombre varchar(50),@Descripcion nvarchar(2000),@Especificacion varchar(60),@Stock int,@Precio money,@CodSubCategoria int
as
begin
	if exists (select CodProducto from TProducto where CodProducto = @CodProducto)
		if not exists (select Nombre from TProducto where Nombre = @Nombre)
			if exists (select CodSubCategoria from TSubCategoria where CodSubCategoria = @CodSubCategoria)
			begin
				update TProducto set  Nombre=@Nombre,Descripcion=@Descripcion,Especificacion=@Especificacion,Stock=@Stock,Precio=@Precio,CodSubCategoria=@CodSubCategoria where CodProducto=@CodProducto
				select CodError = 0, Mensaje = 'Datos de producto modificado correctamente'
			end
			else select CodError =1, Mensaje ='Error: No existe código de SubCategoría'
		else Select CodError =1, Mensaje ='Error: Nombre de producto duplicado'
	else Select CodError =1, Mensaje ='Error: Codigo de producto no existe'
end
go
--exec uspModificarProducto 1,'Teclado s2', 'Razer', 'gfgfg', 50, 350, 2;
--select*from TProducto;

--Procedimiento Almacenado para Eliminar Productos
if OBJECT_ID('uspEliminarProducto') is not null
	drop proc uspEliminarProducto
go
create proc uspEliminarProducto
@CodProducto int
as
begin
	if exists (select CodProducto from TProducto where CodProducto = @CodProducto)
		if not exists (select CodProducto from TDetalleVenta where CodProducto=@CodProducto)
			begin
				delete from TProducto where CodProducto = @CodProducto
				select CodError = 0, Mensaje = 'Producto eliminado correctamente'
			end 			
		else Select CodError =1, Mensaje ='Error: Existe Producto en Detalle de Venta'
	else Select CodError =1, Mensaje ='Error: Código de Producto no existe'
end
go
--select*from TProducto;
--exec uspEliminarProducto '4';

--Procedimiento Almacenado para Buscar Productos por Nombre

if OBJECT_ID('uspBuscarProductoXnombre') is not null
	drop proc uspBuscarProductoXnombre
go
create proc uspBuscarProductoXnombre
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

--exec uspBuscarProductoXnombre 't';

--Procedimiento Almacenado para Buscar Productos por Codigo

if OBJECT_ID('uspBuscarProductoXcodigo') is not null
	drop proc uspBuscarProductoXcodigo
go
create proc uspBuscarProductoXcodigo
@CodProducto int
as
begin
		if  exists (select CodProducto from TProducto where CodProducto = @CodProducto)
			begin
				select CodProducto, Nombre, Precio from TProducto where CodProducto = @CodProducto				
			end
		else Select CodError =1, Mensaje ='Error: El codigo de Producto no existe'
end
go

--exec uspBuscarProductoXcodigo '3';
--select * from TProducto;

-- Procedimiento Almacenado para Listar Clientes
if OBJECT_ID('uspListarClientes') is not null
	drop proc uspListarClientes
go
create proc uspListarClientes
as
begin
	select * from TCliente
end
go
--exec uspListarClientes;

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
@Nombres varchar(50),@Apellidos varchar(50),@Genero char(1),@TipoDocumento varchar(20),@NroDocumento varchar(20),@Email varchar(60),@Provincia varchar(60),@Ciudad varchar(60),@Distrito varchar(60),@Direccion varchar(60),@Usuario varchar(50),@Contrasena varchar(40),@RazonSocial varchar(60),@Telefono varchar(10)
as
begin
	if not exists (select Usuario from TCliente where Usuario = @Usuario)
		if not exists (select Usuario from TCliente where Email = @Email)
			begin
				insert into TCliente values(@Nombres,@Apellidos,@Genero,@TipoDocumento,@NroDocumento,@Email,@Provincia,@Ciudad,@Distrito,@Direccion,@Usuario,@Contrasena,@RazonSocial,@Telefono)
				select CodError = 0, Mensaje = 'Cliente insertado correctamente'
			end
		else select CodError =1, Mensaje ='Error: Email Duplicado'
	else select CodError =1, Mensaje ='Error: Usuario Duplicado'
end
go
--select*from TCliente;
--exec uspAgregarCliente 'UserTex','ApellTex',1,'DNI','99669966','test_test@hotmail.com','Lima','Lima','Test test','Av. Lima','testUser','123456','sasas','6632265';

-- Procedimiento para modificar cliente
if OBJECT_ID('uspModificarCliente') is not null
	drop proc uspModificarCliente
go
create proc uspModificarCliente
@Email varchar(60),@Nombres varchar(50),@Apellidos varchar(50),@Genero char(1),@TipoDocumento varchar(20),@NroDocumento varchar(20),@Provincia varchar(60),@Ciudad varchar(60),@Distrito varchar(60),@Direccion varchar(60),@Usuario varchar(50),@Contrasena varchar(40),@RazonSocial varchar(60),@Telefono varchar(10)
as
begin
	if exists (select Email from TCliente where Email = @Email)
			begin
				update TCliente set Nombres=@Nombres, Apellidos=@Apellidos,Genero=@Genero,TipoDocumento=@TipoDocumento,NroDocumento=@NroDocumento,Provincia=@Provincia,Ciudad=@Ciudad,Distrito=@Distrito,Direccion=@Direccion,Usuario=@Usuario,RazonSocial=@RazonSocial,Telefono=@Telefono where Email=@Email
				select CodError = 0, Mensaje = 'Datos Modificados Correctamente'
			end
	else Select CodError =1, Mensaje ='Error:No existe el usuario'
end
go
--select*from TCliente;
--exec uspModificarCliente 'bet@softbet.com','UserTex','ApellTex',1,'DNI','99669966','Lima','Lima','Test test','Av. Lima','testUser','123456','sasas','6632265';

--Procedimiento Almacenado para Eliminar Clientes
if OBJECT_ID('uspEliminarCliente') is not null
	drop proc uspEliminarCliente
go
create proc uspEliminarCliente
@CodCliente int
as
begin
	if exists (select CodCliente from TCliente where CodCliente = @CodCliente)
		if not exists (select CodCliente from TOrdenVenta where CodCliente = @CodCliente)
			begin
				delete from TCliente where CodCliente = @CodCliente
				select CodError = 0, Mensaje = 'Cliente eliminado correctamente'
			end 
		else Select CodError =1, Mensaje ='Error: Existen Compras de este cliente'
	else Select CodError =1, Mensaje ='Error: Código de Cliente no existe'
end
go
--select*from TCliente;
--exec uspEliminarCliente 2;

-- Procedimiento Almacenado para Listar Ventas
if OBJECT_ID('uspListarOrdenVenta') is not null
	drop proc uspListarOrdenVenta
go
create proc uspListarOrdenVenta
as
begin
	select * from TOrdenVenta
end
go
--exec uspListarOrdenVenta;

--Procedimiento Almacenado para Agregar Orden
if OBJECT_ID('uspAgregarOrden') is not null
	drop proc uspAgregarOrden
go
create proc uspAgregarOrden
@CodCliente int,@Total money,@FechaVenta datetime,@FechaEntrega datetime
as
begin
	if exists (select CodCliente from TCliente where CodCliente = @CodCliente)
		begin
			insert into TOrdenVenta values(@CodCliente,@Total,@FechaVenta,@FechaEntrega)
			select CodError = 0, Mensaje = 'Compra insertada correctamente'
		end
	else Select CodError =1, Mensaje ='Error: No existe el código de cliente'
end
go
--exec uspAgregarOrden '1','35.00','2010-02-12','2010-02-12'

-- Procedimiento para modificar OrdenVenta
if OBJECT_ID('uspModificarOrden') is not null
	drop proc uspModificarOrden
go
create proc uspModificarOrden
@NroVenta int,@CodCliente int,@Total money,@FechaVenta datetime,@FechaEntrega datetime
as
begin
	if exists (select CodCliente from TCliente where CodCliente=@CodCliente)
		if exists (select NroVenta from TOrdenVenta where NroVenta = @NroVenta)
				begin
					update TOrdenVenta set CodCliente=@CodCliente, Total=@Total,FechaVenta=@FechaVenta,FechaEntrega=@FechaEntrega where NroVenta=@NroVenta
					select CodError = 0, Mensaje = 'Datos Modificados Correctamente'
				end
		else Select CodError =1, Mensaje ='Error:No existe el Nro de Orden'
	else Select CodError =1, Mensaje ='Error:No existe el Cliente'
end
go
--select * from TOrdenVenta;
--exec uspModificarOrden '1','2','35.00','2010-02-12','2010-02-12'

--Procedimiento Almacenado para Eliminar Compra
if OBJECT_ID('uspEliminarOrden') is not null
	drop proc uspEliminarOrden
go
create proc uspEliminarOrden
@NroVenta int
as
begin
	if exists (select NroVenta from TOrdenVenta where NroVenta=@NroVenta)
	  if not exists (select NroVenta from TDetalleVenta where NroVenta=@NroVenta)
		begin
			delete from TOrdenVenta where NroVenta = @NroVenta
			select CodError = 0, Mensaje = 'Compra eliminada correctamente'
		end 
		else select CodError =1, Mensaje ='Error: Existe Compra en Detalle de Compra'
	else select CodError =1, Mensaje ='Error: El Nro de Orden no existe'
end
go
--select * from TOrdenVenta;
--exec uspEliminarOrden '2'


-- Procedimiento Almacenado para Listar Detalle de Ventas
if OBJECT_ID('uspListarDetalleVentas') is not null
	drop proc uspListarDetalleVentas
go
create proc uspListarDetalleVentas
as
begin
	select * from TDetalleVenta
end
go
--exec uspListarDetalleVentas;

--Procedimiento Almacenado para Agregar Detalle de ventas
if OBJECT_ID('uspAgregarDetalleVentas') is not null
	drop proc uspAgregarDetalleVentas
go
create proc uspAgregarDetalleVentas
@NroVenta int,@CodProducto int,@Cantidad integer
as
begin
declare @Precio money
	if exists (select NroVenta from TOrdenVenta where NroVenta = @NroVenta)
		if exists(select CodProducto from TProducto where CodProducto = @CodProducto)
			begin
				set @Precio=(select Precio from TProducto where CodProducto=@CodProducto)
				insert into TDetalleVenta values(@NroVenta,@CodProducto,@Cantidad,@Precio)
				select CodError = 0, Mensaje = 'Detalle de compra insertado correctamente'
			end
		else select CodError =1, Mensaje ='Error: No existe código de Producto'
	else Select CodError =1, Mensaje ='Error: No existe código de Orden'
end
go
--select*from TProducto;
--select*from TDetalleVenta;
--exec uspAgregarDetalleVentas '1','1','5';

-- Procedimiento para modificar OrdenVenta
if OBJECT_ID('uspModificarDetalleVenta') is not null
	drop proc uspModificarDetalleVenta
go
create proc uspModificarDetalleVenta
@NroDetalleVenta int,@NroVenta int,@CodProducto int,@Cantidad int
as
begin
declare @Precio money
	if exists (select NroDetalleVenta from TDetalleVenta where NroDetalleVenta=@NroDetalleVenta)
		if exists (select NroVenta from TOrdenVenta where NroVenta = @NroVenta)
				begin
					set @Precio=(select Precio from TProducto where CodProducto=@CodProducto)
					update TDetalleVenta set NroVenta=@NroVenta, CodProducto=@CodProducto,Cantidad=@Cantidad,PrecioUnitario=@Precio where NroDetalleVenta=@NroDetalleVenta
					select CodError = 0, Mensaje = 'Datos Modificados Correctamente'
				end
		else Select CodError =1, Mensaje ='Error:No existe el Nro de Orden'
	else Select CodError =1, Mensaje ='Error:No existe el Nro de Detalle de Venta'
end
go
--select * from TOrdenVenta;
--exec uspModificarDetalleVenta '1','2','3','2'

--Procedimiento Almacenado para Eliminar Detalle de ventas
if OBJECT_ID('uspEliminarDetalleVentas') is not null
	drop proc uspEliminarDetalleVentas
go
create proc uspEliminarDetalleVentas
@NroDetalle int,@NroVenta int,@CodProducto int
as
begin
	if exists (select NroDetalleVenta from TDetalleVenta where NroDetalleVenta=@NroDetalle)
		if exists (select NroVenta from TDetalleVenta where CodProducto = @CodProducto)
				begin
					delete from TDetalleVenta where NroVenta =@NroVenta and CodProducto=@CodProducto
					select CodError = 0, Mensaje = 'Detalle de Compra eliminado correctamente'
				end 
		else Select CodError =1, Mensaje ='Error: Código de Compra y de producto no existen en Detalle de Venta'
	else Select CodError =1, Mensaje ='Error: Código de Detalle no existe'
end
go
--select*from TDetalleVenta;
--exec uspEliminarDetalleVentas '4','1','1';

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
--select*from TCliente;
--exec uspAutenticarCliente 'testUser','123456'

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

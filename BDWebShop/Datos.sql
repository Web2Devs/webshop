select * from TCategoria;
insert into TCategoria values('Mouse'); 

select * from TSubCategoria;
insert into TSubCategoria values('Gaming', 1);

select * from TProducto;
insert into TProducto values('Mouse Razer', 'Razer', 'no entiendo', 50, 150, 1);

select * from TCliente;
insert into TCliente values('Bet', 'Demo', 'F', 'DNI', '1323465', 'bet@softbet.com', 'Lima', 'Lima', 'Lima', 'no tiene', 'bet', '123456', 'Casada', '32145');

select * from TOrdenVenta;
select * from TDetalleVenta;
select * from TCabeceraVenta;


insert into TOrdenVenta values('1', 0, '2016-06-12', '2016-06-12');
insert into TDetalleVenta values('2', '1', 1, 150);
insert into TCabeceraVenta values('2','1','2016-06-12');

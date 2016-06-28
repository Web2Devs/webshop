select * from TCategoria;
insert into TCategoria values('Cases & Accesorios'); 
insert into TCategoria values('Discos Duros & Accesorios'); 
insert into TCategoria values('Fuentes de Poder'); 
insert into TCategoria values('Impresoras'); 
insert into TCategoria values('Memorias'); 
insert into TCategoria values('Microprocesadores'); 
insert into TCategoria values('Monitores');
insert into TCategoria values('Mouse & Accesorios');
insert into TCategoria values('Placas Madre');
insert into TCategoria values('Tarjetas Graficas');
insert into TCategoria values('Teclados');

select * from TSubCategoria;
insert into TSubCategoria values('Case Certificado', 1);
insert into TSubCategoria values('Case Gamer', 1);
insert into TSubCategoria values('Case Mini', 1);
insert into TSubCategoria values('Case Standard', 1);

insert into TSubCategoria values('Disco Duro Externo', 2);
insert into TSubCategoria values('Disco Duro para Laptop', 2);
insert into TSubCategoria values('Disco Duro para PC', 2);
insert into TSubCategoria values('Disco Solido', 2);

insert into TSubCategoria values('Fuente Certificado', 3);
insert into TSubCategoria values('Fuente Standard', 3);

insert into TSubCategoria values('Impresora Laser', 4);
insert into TSubCategoria values('Impresora Matricial', 4);
insert into TSubCategoria values('Impresoras Tinta', 4);

insert into TSubCategoria values('Memoria RAM DDR3', 5);
insert into TSubCategoria values('Memoria RAM DDR4', 5);
insert into TSubCategoria values('Memoria SODIMM DDR3', 5);
insert into TSubCategoria values('Memorias SD', 5);
insert into TSubCategoria values('Memorias USB', 5);

insert into TSubCategoria values('Cooler para Procesador', 6);
insert into TSubCategoria values('PROC. AMD SOCKET AM1', 6);
insert into TSubCategoria values('PROC. AMD SOCKET AM3+', 6);
insert into TSubCategoria values('PROC. AMD SOCKET FM1', 6);
insert into TSubCategoria values('PROC. AMD SOCKET AM2', 6);
insert into TSubCategoria values('PROC. INTEL SOCKET 1150', 6);
insert into TSubCategoria values('PROC. INTEL SOCKET 1151', 6);
insert into TSubCategoria values('PROC. INTEL SOCKET 1155', 6);
insert into TSubCategoria values('PROC. INTEL SOCKET 2011-V3', 6);


insert into TSubCategoria values('Monitores Gamer', 7);
insert into TSubCategoria values('Monitor 15.6 / 18.5 / 19 PULG', 7);
insert into TSubCategoria values('Monitor 19.5 / 20 / 21.5 / 23 PULG', 7);
insert into TSubCategoria values('Monitor 24 / 27 PULG', 7);

insert into TSubCategoria values('Mouse Inalambrico', 8);
insert into TSubCategoria values('Mouse Para Gamer', 8);
insert into TSubCategoria values('Mouse Standard', 8);

insert into TSubCategoria values('MB SOCKET 1150', 9);
insert into TSubCategoria values('MB SOCKET 1151', 9);
insert into TSubCategoria values('MB SOCKET 1155', 9);
insert into TSubCategoria values('MB SOCKET 2011-V3', 9);
insert into TSubCategoria values('MB SOCKET AM1', 9);
insert into TSubCategoria values('MB SOCKET AM3+', 9);
insert into TSubCategoria values('MB SOCKET FM2', 9);

insert into TSubCategoria values('TARJ. Video ATI', 10);
insert into TSubCategoria values('TARJ. Video NVIDIA', 10);

insert into TSubCategoria values('Teclado Gamer', 11);
insert into TSubCategoria values('Teclado Standard', 11);

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

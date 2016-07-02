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
insert into TSubCategoria values('PROC. AMD SOCKET FM2', 6);
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
insert into TProducto values('CASE ANTRYX ELEGANT BATTLESHIP ( AC-EU120-NN ) 300W', '-Dimension (LxWxH): 405 x 180 x 420mm -Metal: 0.5mm, SGCC -Drive space 5.25?: 4 -Mainboard: ATX -Power supply: Optional -Expansion slots: 7 slots -Internal super speed USB 2.0 is ready for option.', 'ANTRYX', 100, 140, 1);
insert into TProducto values('CASE ANTRYX ELEGANT BLACK CHALLENGER ( AC-EB240-NN ) 350W', '-Dimension (LxWxH): 405 x 180 x 420mm -Metal: 0.5mm, SGCC -Drive space 5.25?: 4 -Mainboard: ATX -Power supply: Optional -Expansion slots: 7 slots -Internal super speed USB 2.0 is ready for option.', 'ANTRYX', 100, 131, 1);
insert into TProducto values('CASE ANTRYX ELEGANT BLACK FLARE ( AC-EB250-NN ) 350W', '-Material:Metal 0.5mm, Acero SGCC -Color: Negro - tarjetas de Madre Soportadas: ATX -Puertos Frontales :2 USB 2.0 -Fuente de Poder Incluida 350 Watts.', 'ANTRYX', 100, 135, 1);
insert into TProducto values('CASE ANTRYX ELEGANT BREEZE C/300W USB 3.0', '-Dimensión (LxWxH): 410 x 180 x 420mm -ATX caso de la torre central con Metal: 1 puerto USB 3.0 -Frente capacidad del ventilador: 1 x 8/12cm (no incluido, sólo hacer referencia a la imagen) -Panel de control superior por igual :de aluminio con 2xUSB + HD audio,USB 3.0 Interno.', 'ANTRYX', 100, 131, 1);
insert into TProducto values('CASE THERMALTAKE VERSA H23 ( CA-3B1-60M1WU-04 ) 600W', '-Dimension (H x W x D): 429 x 209 x 491mm (16.9 x 8.2 x 19.3 inch) -Cooling System: Front (intake) :(optional) 120 x 120 x 25 mm x 2 Rear (exhaust) : 120 x 120 x 25 mm Turbo fan (1000rpm, 16dBA) -Motherboards: 9.6? x 9.6? (Micro ATX), 12? x 9.6? (ATX).', 'THERMALTAKE', 100, 314, 1);

insert into TProducto values('CASE CORSAIR 760T ( CC-9011074-WW ) SIN- FUENTE / BLANCO', '-Color Arctic White -Case Form Factor Full-Tower -Maximum GPU Length 450mm -Maximum CPU Cooler Height 170mm -Compatible Corsair Liquid Coolers H55, H60, H75, H80i, H90, H100i,H105, H110.', 'CORSAIR', 100, 721, 2);
insert into TProducto values('CASE CORSAIR 760T ( CC-9011073-WW ) SIN- FUENTE / NEGRO', '-Color Arctic Black -Case Form Factor Full-Tower -Maximum GPU Length 450mm -Maximum CPU Cooler Height 170mm -Compatible Corsair Liquid Coolers H55, H60, H75, H80i, H90, H100i,H105, H110.', 'CORSAIR', 100, 687, 2);
insert into TProducto values('CASE COOLER MASTER COSMOS SE ( COS-5000-KWN1 ) SIN- FUENTE', '-Color Arctic White -Case Form Factor Full-Tower -Maximum GPU Length 450mm -Maximum CPU Cooler Height 170mm -Compatible Corsair Liquid Coolers H55, H60, H75, H80i, H90, H100i,H105, H110.', 'COOLER MASTER', 100, 624, 2);
insert into TProducto values('CASE COOLER MASTER CMSTORM TROOPER ( SGC-5000-KWN1 ) SIN- FUENTE', '-Color Arctic White -Case Form Factor Full-Tower -Maximum GPU Length 450mm -Maximum CPU Cooler Height 170mm -Compatible Corsair Liquid Coolers H55, H60, H75, H80i, H90, H100i,H105, H110.', 'COOLER MASTER', 100, 735, 2);
insert into TProducto values('CASE ANTRYX GAURO RX ( AC-RX520W ) SIN- FUENTE / BLANCO', '-Color Arctic White -Case Form Factor Full-Tower -Maximum GPU Length 450mm -Maximum CPU Cooler Height 170mm -Compatible Corsair Liquid Coolers H55, H60, H75, H80i, H90, H100i,H105, H110.', 'ANTRYX', 100, 221, 2);

insert into TProducto values('CASE MINI ITX CORSAIR 380T ( CC-9011060-WW ) SIN- FUENTE / BORDES BLANCO', '-Form Factor Mini-ITX -Dimensions 393mm x 292mm x 356mm -External Connections (x2) USB 3.0.', 'CORSAIR', 100, 496, 3);
insert into TProducto values('CASE MINI ITX CORSAIR 380T ( CC-9011060-WW ) SIN- FUENTE / BORDES NEGRO', '-Form Factor Mini-ITX -Dimensions 393mm x 292mm x 356mm -External Connections (x2) USB 3.0.', 'CORSAIR', 100, 455, 3);
insert into TProducto values('CASE MINI ITX CORSAIR 380T ( CC-9011060-WW ) SIN- FUENTE / BORDES AMARILLO', '-Form Factor Mini-ITX -Dimensions 393mm x 292mm x 356mm -External Connections (x2) USB 3.0.', 'CORSAIR', 100, 496, 3);
insert into TProducto values('CASE MINI ITX THERMALTAKE CORE V1 ( CA-1B8-00S1WN-00 ) SIN- FUENTE / NEGRO', '-Case Type Mini Case -Dimension (H x W x D) 276 x 260 x 316 mm -Side Panel Transparent Window (Interchangeable).', 'THERMALTAKE', 100, 190, 3);
insert into TProducto values('CASE MINI MICRONICS MAXES-3 ( MIC C132-3 ) 230W/600W', '-Puerto Frontales: 2 USB ,SD, Micrófono, Auricular, Audio Puerto SD y USB 3.0 HD -Ventilación: Sistema Tac 2.0, Ventilador de 6cm -Tipo de Fuente:ATX 230W/630.', 'MICRONICS', 100, 121, 3);

insert into TProducto values('CASE AVATEC CLASICO ( V336BS ) 600W', '-Fuente de Poder: ATX 600W -Color: Negro con Plata -Sistema de Refrigeración: TAC 2.0 -Rejillas de ventilación en chasis -Bahías de expansión: 7 bahías de expansion posteriores.', 'AVATEC', 100, 113, 4);
insert into TProducto values('CASE CYBERTEL CYCLONE ( CYB C221 ) 200W/600W', '-Fuente de Poder: ATX 600W -Color: Negro con Plata -Sistema de Refrigeración: TAC 2.0 -Rejillas de ventilación en chasis -Bahías de expansión: 7 bahías de expansion posteriores.', 'CYBERTEL', 100, 97, 4);
insert into TProducto values('CASE CYBERTEL SCORPIO ( CYB C288S ) 200W/600W', '-Fuente de Poder: ATX 600W -Color: Negro con Plata -Sistema de Refrigeración: TAC 2.0 -Rejillas de ventilación en chasis -Bahías de expansión: 7 bahías de expansion posteriores.', 'AVATEC', 100, 94, 4);
insert into TProducto values('CASE HALION BLUE ( 7608 B )', '-Fuente de Poder: ATX 600W -Color: Negro con Plata -Sistema de Refrigeración: TAC 2.0 -Rejillas de ventilación en chasis -Bahías de expansión: 7 bahías de expansion posteriores.', 'HALION', 100, 111, 4);
insert into TProducto values('CASE TEROS ( TE-WKS 6T10R ) 200W/600W - ROJO', '-Fuente de Poder: ATX 600W -Color: Negro con Plata -Sistema de Refrigeración: TAC 2.0 -Rejillas de ventilación en chasis -Bahías de expansión: 7 bahías de expansion posteriores.', 'TEROS', 100, 121, 4);

insert into TProducto values('HDD EXTERNO ADATA 1 TERA HD650 ( AHD650-1TU3-CRD/CBK ) ANTI GOLPE', '-Modelo HD650.', 'ADATA', 100, 222, 5);
insert into TProducto values('HDD EXTERNO ADATA 1 TERA HD710 ( AHD710-1TU3-CBK/CYL/CBL ) ANTI GOLPE', '-Dimensiones (L x An x Al) 132 x 99 x 22 mm (5,2 x 3,9 x 0,9 pulg) -Accesorios Cable USB 3.0; Guía de instalación rapida.', 'ADATA', 100, 266, 5);
insert into TProducto values('HDD EXTERNO ADATA 1 TERA HD710M ( AHD710M-1TU3-CCF ) ANTI GOLPE', '-Dimensiones (L x An x Al) 132 x 99 x 22 mm (5,2 x 3,9 x 0,9 pulg) -Accesorios Cable USB 3.0; Guía de instalación rapida.', 'ADATA', 100, 253, 5);
insert into TProducto values('HDD EXTERNO ADATA 1 TERA HD720 ( AHD720-1TU3-CBK/CGR/CBL ) ANTI GOLPE', '-Dimensiones (L x An x Al) 132 x 99 x 22 mm (5,2 x 3,9 x 0,9 pulg) -Accesorios Cable USB 3.0; Guía de instalación rapida.', 'ADATA', 100, 280, 5);
insert into TProducto values('HDD EXTERNO ADATA 500 GB HD650 ( AHD650-500GU3-CRD ) ANTI GOLPE', '-Dimensiones (L x An x Al) 132 x 99 x 22 mm (5,2 x 3,9 x 0,9 pulg) -Accesorios Cable USB 3.0; Guía de instalación rapida.', 'ADATA', 100, 185, 5);

insert into TProducto values('HDD LAPTOP WESTER DIGITAL 1 TERA ( WD10JPVX ) AZUL', '-MODELO WD5000LPCX -CAPACIDAD 500GB .', 'TOSHIBA', 100, 209, 6);
insert into TProducto values('HDD LAPTOP WESTER DIGITAL 500GB ( WD5000LPCX ) AZUL', '-MODELO WD5000LPCX -CAPACIDAD 500GB .', 'TOSHIBA', 100, 168, 6);

insert into TProducto values('HDD SEAGATE 1 TERA ( ST1000DM003 )', '-Interfaz SATA 6Gb/s -Caché 64MB -Capacidad 1TB -Velocidad de giro (rpm) 7200 rpm.', 'SEAGATE', 100, 189, 7);
insert into TProducto values('HDD SEAGATE 2 TERAS ( ST2000DM001 )', '-Interfaz SATA 6Gb/s -Caché 64MB -Capacidad 1TB -Velocidad de giro (rpm) 7200 rpm.', 'SEAGATE', 100, 273, 7);
insert into TProducto values('HDD SEAGATE 3 TERAS ( ST3000DM001 )', '-Interfaz SATA 6Gb/s -Caché 64MB -Capacidad 1TB -Velocidad de giro (rpm) 7200 rpm.', 'SEAGATE', 100, 337, 7);
insert into TProducto values('HDD SEAGATE 320GB ( ST3320311CS ) PIPELINE', '-Interfaz SATA 6Gb/s -Caché 64MB -Capacidad 1TB -Velocidad de giro (rpm) 7200 rpm.', 'SEAGATE', 100, 101, 7);
insert into TProducto values('HDD SEAGATE 4 TERAS ( ST4000DM000 )', '-Interfaz SATA 6Gb/s -Caché 64MB -Capacidad 1TB -Velocidad de giro (rpm) 7200 rpm.', 'SEAGATE', 100, 472, 7);

insert into TProducto values('HDD MSATA SOLIDO KINGSTON MS200 60GB ( SMS200S3/60G )', '-MODELO SMS200S3/60G -Device Type Internal Solid State Drive (SSD) -Capacity 60GB -Interface Mini-SATA (mSATA).', 'KINGSTON', 100, 212, 8);
insert into TProducto values('HDD SOLIDO ADATA 120GB ( ASP550SS3-120GM-C )', '-MODELO SMS200S3/60G -Device Type Internal Solid State Drive (SSD) -Capacity 60GB -Interface Mini-SATA (mSATA).', 'ADATA', 100, 155, 8);
insert into TProducto values('HDD SOLIDO ADATA 240GB ( ASP550SS3-240GM-C )', '-MODELO SMS200S3/60G -Device Type Internal Solid State Drive (SSD) -Capacity 60GB -Interface Mini-SATA (mSATA).', 'ADATA', 100, 246, 8);
insert into TProducto values('HDD SOLIDO ADATA 256 GB (ASX900S3 - 256GM - C)', '-MODELO SMS200S3/60G -Device Type Internal Solid State Drive (SSD) -Capacity 60GB -Interface Mini-SATA (mSATA).', 'ADATA', 100, 368, 8);
insert into TProducto values('HDD SOLIDO ADATA 256GB -2.5 SATA SX900', '-MODELO SMS200S3/60G -Device Type Internal Solid State Drive (SSD) -Capacity 60GB -Interface Mini-SATA (mSATA).', 'ADATA', 100, 246, 8);

insert into TProducto values('FUENTE ANTRYX ( AP-B450R00 ) 450W', '-MODELO AP B450R00 -Dimensiones: 150mm x 140mm x 86mm -Voltaje de entrada: 220 ~ 240V / 5A -Frecuencia de Entrada: 47 ~ 63 Hz -Capacidad Real: 450 Watts.', 'ATRYX', 100, 118, 9);
insert into TProducto values('FUENTE ANTRYX XTREME PRO ( AP-XP650ACA-US ) 650W', '-MODELO AP B450R00 -Dimensiones: 150mm x 140mm x 86mm -Voltaje de entrada: 220 ~ 240V / 5A -Frecuencia de Entrada: 47 ~ 63 Hz -Capacidad Real: 450 Watts.', 'ATRYX', 100, 195, 9);
insert into TProducto values('FUENTE COOLER MASTER B500 ( RS-500-ACAB-B1 ) 500W', '-MODELO AP B450R00 -Dimensiones: 150mm x 140mm x 86mm -Voltaje de entrada: 220 ~ 240V / 5A -Frecuencia de Entrada: 47 ~ 63 Hz -Capacidad Real: 450 Watts.', 'COOLER MASTER', 100, 192, 9);
insert into TProducto values('FUENTE COOLER MASTER B600 ( RS-600-ACAB-B1 ) 600W', '-MODELO AP B450R00 -Dimensiones: 150mm x 140mm x 86mm -Voltaje de entrada: 220 ~ 240V / 5A -Frecuencia de Entrada: 47 ~ 63 Hz -Capacidad Real: 450 Watts.', 'COOLER MASTER', 100, 229, 9);
insert into TProducto values('FUENTE COOLER MASTER CMSTORM GX650 ( RS-650-ACAA-B3 ) 650W BRONZE', '-MODELO AP B450R00 -Dimensiones: 150mm x 140mm x 86mm -Voltaje de entrada: 220 ~ 240V / 5A -Frecuencia de Entrada: 47 ~ 63 Hz -Capacidad Real: 450 Watts.', 'COOLER MASTER', 100, 304, 9);

insert into TProducto values('FUENTE AVATEC ( PSA-F600W ) 600W', '-MODELO ATX600W.', 'AVATEC', 100, 47, 10);
insert into TProducto values('FUENTE HALION ( ATX-600W ) 600W', '-MODELO ATX600W.', 'HALION', 100, 50, 10);

insert into TProducto values('IMPRESORA LASER COLOR HP CP1025NW ( CE918A ) IMPRIME', '-CONECTIVIDAD: USB,WIFI 802.11 B/G -VOLTAJE DE ALIMENTACION: AUTO VOLTAJE (110 - 220 VAC).', 'HP', 100, 641, 11);
insert into TProducto values('IMPRESORA LASER HP P1102W ( CE658A ) IMPRIME', '-CONECTIVIDAD: USB,WIFI 802.11 B/G -VOLTAJE DE ALIMENTACION: AUTO VOLTAJE (110 - 220 VAC).', 'HP', 100, 310, 11);

insert into TProducto values('IMPRESORA MATRICIAL EPSON FX-890 ( C11C524131 )', '-MODELO LX350 -TECNOLOGIA DE IMPRESION IMPACTO (MATRIZ DE PUNTOS 9 PINES) -VELOCIDAD DE IMPRESION 347 CPS (10 CPI).', 'EPSON', 100, 1493, 12);
insert into TProducto values('IMPRESORA MATRICIAL EPSON LX-350 ( C11CC24011 )', '-MODELO LX350 -TECNOLOGIA DE IMPRESION IMPACTO (MATRIZ DE PUNTOS 9 PINES) -VELOCIDAD DE IMPRESION 347 CPS (10 CPI).', 'EPSON', 100, 733, 12);

insert into TProducto values('IMPRESORA BROTHER ( DCP-T300 ) CON- TANQUE / IMPRIME - ESCANEA - FOTOCOPIA', '-MODELO DCP-T300 -Tecnología de impresión Inyección de tinta a color -Velocidad de impresión máx. en negro (ppm) 27 ppm (modo rápido) / 11 ipm (ISO/IEC 24734).', 'BROTHER', 100, 564, 13);
insert into TProducto values('IMPRESORA BROTHER ( DCP-T500W ) CON- TANQUE / IMPRIME - ESCANEA - FOTOCOPIA - INALAMBRICO', '-MODELO DCP-T300 -Tecnología de impresión Inyección de tinta a color -Velocidad de impresión máx. en negro (ppm) 27 ppm (modo rápido) / 11 ipm (ISO/IEC 24734).', 'BROTHER', 100, 628, 13);
insert into TProducto values('IMPRESORA CANON ( E401 ) IMPRIME - ESCANEA - FOTOCOPIA', '-MODELO DCP-T300 -Tecnología de impresión Inyección de tinta a color -Velocidad de impresión máx. en negro (ppm) 27 ppm (modo rápido) / 11 ipm (ISO/IEC 24734).', 'BROTHER', 100, 145, 13);

insert into TProducto values('MEM. RAM ADATA DDR3 2 GB/1333 ( AD3U1333C2G9-S )', '-MODELO AD3U1333C2G9-S -CAPACIDAD 2 GB -VELOCIDAD 1333 MHZ -VOLTAJE DE ALIMENTACIÓN 1.5 VOLTS.', 'ADATA', 100, 91, 14);
insert into TProducto values('MEM. RAM ADATA DDR3 4 GB/1600 ( AX3U1600W4G11-SD )', '-MODELO AD3U1333C2G9-S -CAPACIDAD 4 GB -VELOCIDAD 1333 MHZ -VOLTAJE DE ALIMENTACIÓN 1.5 VOLTS.', 'ADATA', 100, 91, 14);
insert into TProducto values('MEM. RAM CORSAIR DDR3 4 GB/1600 ( CMZ4GX3M1A1600C9 ) VENGEANCE', '-MODELO AD3U1333C2G9-S -CAPACIDAD 4 GB -VELOCIDAD 1333 MHZ -VOLTAJE DE ALIMENTACIÓN 1.5 VOLTS.', 'CORSAIR', 100, 101, 14);
insert into TProducto values('MEM. RAM CRUCIAL DDR3 4 GB/1600 ( BLS4G3D1609DS1S00 ) BALLISTIX', '-MODELO AD3U1333C2G9-S -CAPACIDAD 4 GB -VELOCIDAD 1333 MHZ -VOLTAJE DE ALIMENTACIÓN 1.5 VOLTS.', 'CRUCIAL', 100, 81, 14);
insert into TProducto values('MEM. RAM CRUCIAL DDR3 4 GB/1600 ( CT51264BA160BJ )', '-MODELO AD3U1333C2G9-S -CAPACIDAD 4 GB -VELOCIDAD 1333 MHZ -VOLTAJE DE ALIMENTACIÓN 1.5 VOLTS.', 'ADATA', 100, 121, 14);

insert into TProducto values('MEM. RAM CORSAIR DDR4 16GB(2X8)/2666 ( CMD16GX4M2A2666C15 ) DOMINATOR / PLATINUM', '-MODELO DOMINATOR PLATINUM -CAPACIDAD 16 GB / 2X8GB -VOLTAJE: 1.2V.', 'CORSAIR', 100, 503, 15);
insert into TProducto values('MEM. RAM CORSAIR DDR4 16GB(2X8)/2666 ( CMK16GX4M2A2666C16 ) VENGEANCE', '-MODELO DOMINATOR PLATINUM -CAPACIDAD 16 GB / 2X8GB -VOLTAJE: 1.2V.', 'CORSAIR', 100, 293, 15);
insert into TProducto values('MEM. RAM CORSAIR DDR4 16GB(2X8)/3000 ( CMD16GX4M2B3000C15 ) DOMINATOR / PLATINUM', '-MODELO DOMINATOR PLATINUM -CAPACIDAD 16 GB / 2X8GB -VOLTAJE: 1.2V.', 'CORSAIR', 100, 472, 15);
insert into TProducto values('MEM. RAM CORSAIR DDR4 16GB(2X8)/3200 ( CMK16GX4M2B3200C16 ) VENGEANCE ', '-MODELO DOMINATOR PLATINUM -CAPACIDAD 16 GB / 2X8GB -VOLTAJE: 1.2V.', 'CORSAIR', 100, 408, 15);
insert into TProducto values('MEM. RAM CORSAIR DDR4 4 GB/2400 ( CMK4GX4M1A2400C14 ) VENGEANCE', '-MODELO DOMINATOR PLATINUM -CAPACIDAD 4 GB -VOLTAJE: 1.2V.', 'CORSAIR', 100, 111, 15);

insert into TProducto values('MEM. SODIMM CRUCIAL DDR3 4 GB/1600 ( CT51264BF160BJ )', '-MODELO SODIMM CT51264BF160BJ -Capacity: 4GB.', 'CRUCIAL', 100, 87, 16);
insert into TProducto values('MEM. SODIMM KINGSTON DDR3 4 GB/1600 ( KVR16LS11/4 )', '-MODELO SODIMM CT51264BF160BJ -Capacity: 4GB.', 'CRUCIAL', 100, 94, 16);
insert into TProducto values('MEM. SODIMM KINGSTON DDR3 8 GB/1600 ( KVR16LS11/8 )', '-MODELO SODIMM CT51264BF160BJ -Capacity: 8GB.', 'CRUCIAL', 100, 148, 16);

insert into TProducto values('MEM. MICRO SD KINGSTON 16 GB ( SDC10G2/16GB ) C/CARD ADAPTADOR', '-Series SDC10G2/16GB -Capacidad de la memoria RAM 16 GB -Capacidad del disco duro 16384 MB.', 'KINGSTON', 100, 30, 17);
insert into TProducto values('MEM. MICRO SD KINGSTON 16 GB ( SDC4/16GB ) C/CARD ADAPTADOR', '-Series SDC10G2/16GB -Capacidad de la memoria RAM 16 GB -Capacidad del disco duro 16384 MB.', 'KINGSTON', 100, 27, 17);
insert into TProducto values('MEM. MICRO SD KINGSTON 32 GB ( SDC4/32GB ) C/CARD ADAPTADOR', '-Series SDC10G2/16GB -Capacidad de la memoria RAM 32 GB.', 'KINGSTON', 100, 40, 17);
insert into TProducto values('MEM. MICRO SD KINGSTON 8 GB ( SDC4/8GB ) C/CARD ADAPTADOR', '-Series SDC10G2/16GB -Capacidad de la memoria RAM 8 GB.', 'KINGSTON', 100, 20, 17);
insert into TProducto values('MEM. MICRO SD SANDISK 16 GB ( SDSDQUAN-016G-G4A ) C/CARD ADAPTADOR', '-Series SDC10G2/16GB -Capacidad de la memoria RAM 16 GB -Capacidad del disco duro 16384 MB.', 'SANDISK', 100, 43, 17);

insert into TProducto values('MEM. USB + MICRO.USB SANDISK 16 GB ( SDDD2-016G-G46 ) 3.0', '-Capacidad: 16GB.', 'SANDISK', 100, 30, 18);
insert into TProducto values('MEM. USB + MICRO.USB SANDISK 32 GB ( SDDD2-032G-G46 ) 3.0', '-Capacidad: 32GB.', 'SANDISK', 100, 47, 18);
insert into TProducto values('MEM. USB ADATA 16 GB UV100 ( AUV100-16G-RBK )', '-Capacidad: 16GB.', 'ADATA', 100, 30, 18);
insert into TProducto values('MEM. USB ADATA 16 GB UV100 NEGRO/AZUL', '-Capacidad: 16GB.', 'ADATA', 100, 27, 18);

insert into TProducto values('COOLER PROC. COOLER MASTER ( DP6-9EDSA-OL-GP )', '-Compatibility Intel LGA 1150 / 1155 / 1156.', 'COOLER MASTER', 100, 37, 19);
insert into TProducto values('COOLER PROC. COOLER MASTER HYPER 212X ( RR-212X-20PM-R1 )', '-Compatibility Intel LGA 1150 / 1155 / 1156.', 'COOLER MASTER', 100, 145, 19);
insert into TProducto values('COOLER PROC. COOLER MASTER V8 GTS ( RR-V8VC-16PR-R1 )', '-Compatibility Intel LGA 1150 / 1155 / 1156.', 'COOLER MASTER', 100, 327, 19);
insert into TProducto values('COOLER PROC. CORSAIR H105 ( CW-9060016-WW )', '-Compatibility Intel LGA 1150 / 1155 / 1156.', 'CORSAIR', 100, 429, 19);

insert into TProducto values('PROC. AMD ATHLON 5150 ( AD5150JAHMBOX ) 1.6GHZ-2.0MB / AM1', '-Integrated Graphics AMD Radeon HD 8400 -Thermal Design Power 25W.', 'AMD', 100, 195, 20);
insert into TProducto values('PROC. AMD SEMPRON 2650 ( SD2650JAHMBOX ) 1.45GHZ-1.0MB / AM1', '-Integrated Graphics AMD Radeon HD 8400 -Thermal Design Power 25W.', 'AMD', 100, 131, 20);

insert into TProducto values('PROC. AMD FX-4300 ( FD4300WMHKBOX ) 3.8GHZ-8.0MB / AM3+', '-SOCKET AM3+ AMD -VELOCIDAD DE PROCESO 3.80 GHZ.', 'AMD', 100, 385, 21);
insert into TProducto values('PROC. AMD FX-6300 ( FD6300WMHKBOX ) 3.5GHZ-14.0MB / AM3+', '-SOCKET AM3+ AMD -VELOCIDAD DE PROCESO 3.80 GHZ.', 'AMD', 100, 412, 21);
insert into TProducto values('PROC. AMD FX-8320E ( FD832EWMHKBOX ) 3.2GHZ-16.0MB / AM3+', '-SOCKET AM3+ AMD -VELOCIDAD DE PROCESO 3.80 GHZ.', 'AMD', 100, 496, 21);
insert into TProducto values('PROC. AMD FX-8350 ( FD8350FRHKBOX ) 4.0GHZ-16.0MB / AM3+', '-SOCKET AM3+ AMD -VELOCIDAD DE PROCESO 3.80 GHZ.', 'AMD', 100, 682, 21);

insert into TProducto values('PROC. AMD A4-3300 ( AD3300OJHXBOX ) 2.5GHZ-1.0MB / FM1', '-SOCKET FM1 AMD -VELOCIDAD DE PROCESO 2.50 GHZ.', 'AMD', 100, 118, 22);

insert into TProducto values('PROC. AMD A10-6790K ( AD679KWOHLBOX ) 4.0GHZ-4.0MB / FM2', '-CPU SOCKET TYPE SOCKET FM2 -MAX TURBO FREQUENCY 4.3GHZ.', 'AMD', 100, 445, 23);
insert into TProducto values('PROC. AMD A10-7800 ( AD7800YBJABOX ) 3.9GHZ-4.0MB / FM2+', '-CPU SOCKET TYPE SOCKET FM2 -MAX TURBO FREQUENCY 4.3GHZ.', 'AMD', 100, 479, 23);
insert into TProducto values('PROC. AMD A10-7850K ( AD785KXBJABOX ) 4.0GHZ-4.0MB / FM2+', '-CPU SOCKET TYPE SOCKET FM2 -MAX TURBO FREQUENCY 4.3GHZ.', 'AMD', 100, 415, 23);
insert into TProducto values('PROC. AMD A10-7860K ( AD786KYBJCSBX ) 4.0GHZ-4.0MB / FM2+', '-CPU SOCKET TYPE SOCKET FM2 -MAX TURBO FREQUENCY 4.3GHZ.', 'AMD', 100, 439, 23);

insert into TProducto values('PROC. INTEL CELERON G1820 ( BX80646G1820 ) 2.7GHZ-2.0MB / LGA 1150', '-Numeros de Cores Cores Dual-Core -Operación Frecuencial 2.7 GHz.', 'INTEL', 100, 138, 24);
insert into TProducto values('PROC. INTEL CORE I3 4170 ( BX80646I34170 ) 3.7GHZ-3.0MB / LGA 1150', '-Numeros de Cores Cores Dual-Core -Operación Frecuencial 2.7 GHz.', 'INTEL', 100, 449, 24);
insert into TProducto values('PROC. INTEL CORE I5 4440 ( BX80646I54440 ) 3.1GHZ-6.0MB / LGA 1150', '-Numeros de Cores Cores Dual-Core -Operación Frecuencial 2.7 GHz.', 'INTEL', 100, 678, 24);

insert into TProducto values('PROC. INTEL CORE I3 6100 ( BX80662I36100 ) 3.7GHZ-3.0MB / LGA 1151', '-SOCKET LGA 1151 -VELOCIDAD DE PROCESADOR 3.7 GHZ.', 'INTEL', 100, 472, 25);
insert into TProducto values('PROC. INTEL CORE I5 6400 ( BX80662I56400 ) 2.7GHZ-6.0MB / LGA 1151', '-SOCKET LGA 1151 -VELOCIDAD DE PROCESADOR 2.7 GHZ.', 'INTEL', 100, 726, 25);
insert into TProducto values('PROC. INTEL CORE I7 6700 ( BX80662I76700 ) 3.4GHZ-8.0MB / LGA 1151', '-SOCKET LGA 1151 -VELOCIDAD DE PROCESADOR 3.4 GHZ.', 'INTEL', 100, 1290, 25);

insert into TProducto values('PROC. INTEL CORE I5 3330 ( BX80637I53330 ) 3.0GHZ-6.0MB / LGA 1155', '-Core Count: 4 -Clock Speed: 3.0 GHz.', 'INTEL', 100, 618, 26);
insert into TProducto values('PROC. INTEL CORE I5 3570 ( BX80637I53570 ) 3.4GHZ-6MB / LGA 1155', '-Core Count: 4 -Clock Speed: 3.0 GHz.', 'INTEL', 100, 753, 26);

insert into TProducto values('PROC. INTEL CORE I7-5820K ( BX80648I75820K ) 3.3GHZ-15.0MB / LGA 2011V3 / SIN- COOLER', '-Operating Frequency 3.3 GHz -Max Turbo Frequency 3.6 GHz.', 'INTEL', 100, 1672, 27);

insert into TProducto values('MONITOR BENQ LED 24" RL ( RL2455HM ) 9H.LA9LB.DBA / GAMING', '-RESOLUCION MAX 1600X900 -VOLTAJE DE ALIMENTACION 220 VAC.', 'BENQ', 100, 800, 28);
insert into TProducto values('MONITOR BENQ LED 27" XL ( XL2720Z ) 9H.LA4LB.RBL / GAMING', '-RESOLUCION MAX 1600X900 -VOLTAJE DE ALIMENTACION 220 VAC.', 'BENQ', 100, 2003, 28);

insert into TProducto values('MONITOR HP LED 18.5" ( V193F )', '-Resolución 1366 x 768 a 60 Hz -Relación de aspecto 16:9.', 'HP', 100, 246, 29);
insert into TProducto values('MONITOR LG LED 18.5" ( 19M37A-B )', '-Resolución 1366 x 768 a 60 Hz -Relación de aspecto 16:9.', 'LG', 100, 266, 29);
insert into TProducto values('MONITOR LG LED 18.5" ( 19M38A-B )', '-Resolución 1366 x 768 a 60 Hz -Relación de aspecto 16:9.', 'LG', 100, 266, 29);

insert into TProducto values('MONITOR AOC LED 20" ( E2070SWN )', '-RESOLUCION MAX 1600X900 -VOLTAJE DE ALIMENTACION 220 VAC.', 'AOC', 100, 246, 30);
insert into TProducto values('MONITOR AOC LED 20" ( I2080SW ) IPS', '-RESOLUCION MAX 1600X900 -VOLTAJE DE ALIMENTACION 220 VAC.', 'AOC', 100, 249, 30);
insert into TProducto values('MONITOR BENQ LED 19.5" ( DL2020 )', '-RESOLUCION MAX 1600X900 -VOLTAJE DE ALIMENTACION 220 VAC.', 'AOC', 100, 249, 30);

insert into TProducto values('MONITOR AOC LED 24" ( M2471F ) MHL / HDMI', '-Resolución 1366 x 768 a 60 Hz -Relación de aspecto 16:9.', 'LG', 100, 655, 31);
insert into TProducto values('MONITOR BENQ LED 24" ( GL2450 ) VGA / DVI', '-Resolución 1366 x 768 a 60 Hz -Relación de aspecto 16:9.', 'BENQ', 100, 513, 31);
insert into TProducto values('MONITOR LG LED 24" ( 24MP58VQ-P ) IPS / HDMI', '-Resolución 1366 x 768 a 60 Hz -Relación de aspecto 16:9.', 'LG', 100, 624, 31);

insert into TProducto values('MOUSE INALAMBRICO CYBERTEL MDO. CYB M301', '-CONEXION INALAMBRICA.', 'CYBERTEL', 100, 29, 32);
insert into TProducto values('MOUSE INALAMBRICO GENIUS 6000Z ( 31030031108 )', '-CONEXION INALAMBRICA.', 'CYBERTEL', 100, 40, 32);
insert into TProducto values('MOUSE INALAMBRICO GENIUS NX-7015 ( 31030119102/3 ) COLORES- VARIADOS', '-CONEXION INALAMBRICA.', 'CYBERTEL', 100, 40, 32);
insert into TProducto values('MOUSE INALAMBRICO HALION ( DLM-130GB+G01UF ) CELESTE - AZUL', '-CONEXION INALAMBRICA.', 'CYBERTEL', 100, 54, 32);

insert into TProducto values('COMBO HALION 7D GAMING ( HA-915 ) PAD MOUSE + MOUSE ', '-MODELO COMBO 7D GAMING.', 'HALION', 100, 50, 33);
insert into TProducto values('COMBO RAZER ABYSSUS & GOLIATHUS ( RZ84-00360200-B3U1 ) PAD MOUSE + MOUSE ', '-MODELO COMBO 7D GAMING.', 'HALION', 100, 135, 33);
insert into TProducto values('MOUSE ANTRYX ZIGRA ( AGM-5000BA ) GAMING', '-MODELO COMBO 7D GAMING.', 'HALION', 100, 101, 33);
insert into TProducto values('MOUSE CORSAIR M65 ( CH-9000109-NA ) GAMING', '-MODELO COMBO 7D GAMING.', 'HALION', 100, 202, 33);

insert into TProducto values('COMBO LANDBYTE ( LB-M24 ) PAD MOUSE + MOUSE', '-PAD Y MOUSE.', 'LANDBYTE', 100, 23, 34);
insert into TProducto values('MOUSE GENIUS XSCROLL ( 31010826101 )', '-PAD Y MOUSE.', 'LANDBYTE', 100, 23, 34);
insert into TProducto values('MOUSE GENIUS DX-110 ( 31010116100 )', '-PAD Y MOUSE.', 'LANDBYTE', 100, 23, 34);

select * from TCliente;
insert into TCliente values('Bet', 'Demo', 'F', 'DNI', '1323465', 'bet@softbet.com', 'Lima', 'Lima', 'Lima', 'no tiene', 'bet', '123456', 'Casada', '32145');

select * from TOrdenVenta;
select * from TDetalleVenta;
select * from TCabeceraVenta;

insert into TOrdenVenta values('1', 0, '2016-06-12', '2016-06-12');
insert into TDetalleVenta values('2', '1', 1, 150);
insert into TCabeceraVenta values('2','1','2016-06-12');

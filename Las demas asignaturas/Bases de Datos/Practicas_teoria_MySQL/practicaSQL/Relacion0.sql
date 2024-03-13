create database if not exists Relacion0;
use Relacion0;
create table if not exists Cliente (
    NIF char(9) primary key,
    Nombre varchar(25) not null,
    Domicilio varchar(100),
    tlf varchar(25),
    ciudad varchar(50)
)engine=innodb;
create table if not exists Producto(
    codigo char(4) primary key,
    descripcion varchar(100) not null,
    precio float,
    stock float,
    minimo float,
    check (precio > 0)
)engine=innodb;
create table if not exists factura(
    numero int primary key,
    fecha date,
    pagado bool,
	NIF char(9),
    total_precio float,
    foreign key(NIF) references Cliente(NIF) 
    on delete cascade on update cascade
)engine=innodb;
create table if not exists detalle(
    numero int,
    codigo char(4),
    unidades int,
    foreign key(numero) references factura(numero) on delete restrict on update cascade,
    foreign key(codigo) references Producto(codigo) on delete restrict on update cascade,
    primary key (numero, codigo)
)engine=innodb;
insert into Cliente values 
    ("43434343A", 'DELGADO PEREZ MARISAC', '/ MIRAMAR,84 3ºA','925-200-967', 'TOLEDO'),
    ('51592939K', "LOPEZ VAL SOLEDAD", 'C/PEZ, 54 4ºC ', '915-829-394', 'MADRID'),
    ('51639989K', "DELGADO ROBLES MIGUEL", 'C/ OCA, 54 5ºC', '913-859-293','MADRID'),
    ('51664372R', "GUTIERREZ PEREZ ROSA", 'C/ CASTILLA, 4 4ºA', '919-592-932', 'MADRID');
insert into Producto values 
	("CAJ1", 'CAJA DE HERRAMIENTAS DE PLASTICO', 8.50, 4.00, 3), 
	("CAJ2", 'CAJA DE HERRAMIENTAS DE METAL', 12.30, 3.00, 2), 
	("MAR1", 'MARTILLO PEQUEÑO', 3.50, 5, 10), 
	("MAR2", 'MARTILLO GRANDE', 6.50, 12, 10), 
	("TOR7", 'CAJA 100 TORNNILLOS DEL 7', 0.80, 20, 100), 
	("TOR8", 'CAJA 100 TORNNILLOS DEL 9', 0.80, 25, 100), 
	("TUE1", 'CAJA 1OO TUERCAS DEL 7', 0.50, 40, 100), 
	("TUE2", 'CAJA 1OO TUERCAS DEL 9', 0.50, 54, 100), 
	("TUE3", 'CAJA 1OO TUERCAS DEL 12', 0.50, 60, 100);
insert into factura values 
	(5440, "2017-09-05", TRUE, "51664372R", 345),
    (5441, "2017-09-06", FALSE, "51592939K", 1000),
    (5442, "2017-09-07", FALSE, "43434343A", 789),
    (5443, "2017-09-08", TRUE, "51639989K", 123.78),
    (5444, "2017-09-09", TRUE, "51639989K", 567),
    (5445, "2017-09-10", TRUE, "51592939K", 100);
insert into detalle values
    (5440, 'CAJ2', 2),
    (5440, 'MAR1', 1),
    (5440, 'TOR7', 2),
    (5440, 'TOR8', 2),
    (5441, 'CAJ1', 1),
    (5442, 'CAJ1', 1),
    (5442, 'MAR1', 2),
    (5443, 'TOR7', 1),
    (5443, 'TUE1', 1),
    (5444, 'MAR2', 1),
    (5445, 'TOR7', 5),
    (5445, 'TOR8', 5),
    (5445, 'TUE2', 5),
    (5445, 'TUE3',5); 

    
#cambiar campos de la tabla (no funciona por ser foreign key)
	/*alter table cliente change NIF dni char(9) not null primary key;*/
#añadir un nuevo campo
	/*alter table Cliente
	add fecha_Nac date;*/
#Eliminar el campo añadido
	/*alter table Cliente drop fecha_Nac;*/
    
    #Mostrar todos los datos introducidos en cada una de las tablas
    select * from Cliente;
# b. Reemplazar la ciudad del cliente con DNI 51664372R por Granada.
	update Cliente set Ciudad='GRANADA' where NIF='51592939K';
# c. Actualizar todos los precios de los productos con un aumento del 10%
	update Producto set precio=precio*1.10;
# d. Aumentar el stock en 20 unidades para todos los productos y disminuir el precio de los productos en un 30%
	update Producto set stock=stock+20, precio=precio*0.70;
# e. A los productos en los que haya un mínimo de 100 unidades, hacerle un descuento al precio del 50%
	update Producto set precio=precio*0.5 where stock >=100;
# f. Eliminar al cliente cuyo dni sea 51664372R
	delete from Cliente where NIF='51664372R';
    select * from Cliente
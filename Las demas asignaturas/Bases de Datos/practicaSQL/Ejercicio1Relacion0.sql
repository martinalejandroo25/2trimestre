create database if not exists Ejercicio1Relacion0;
use Ejercicio1Relacion0;
create table if not exists Cliente (
NIF char(9) primary key,
Nombre varchar(25) not null,
Domicilio varchar(100),
tlf varchar(25),
ciudad varchar(50)
);
create table if not exists Producto(
codigo char(4) primary key,
descripcion varchar(100) not null,
precio float,
stock float,
minimo float,
check (precio > 0)
);
create table if not exists factura(
numero int primary key,
fecha date,
pagado bool,
total_precio float,
NIF char(9),
foreign key(NIF) references Cliente(NIF)
on delete restrict on update cascade
);
create table if not exists detalle(
numero int,
codigo char(4),
unidades int,
foreign key(numero) references factura(numero)
on delete restrict on update cascade,
foreign key(codigo) references Producto(codigo)
on delete restrict on update cascade,
primary key (numero, codigo)
);
#cambiar campos de la tabla (no funciona por ser foreign key)
alter table cliente change NIF dni char(9) not null primary key;

#añadir un nuevo campo
alter table Cliente add fecha_Nac date;

#Eliminar el campo añadido
alter table Cliente drop fecha_Nac;

/*insert into factura values (5440, 2017-09-05, TRUE, 51664372R, 345€);
insert into factura values (5441, 2017-09-06, FALSE, 51592939K, 1000€);
insert into factura values (5442, 2017-09-07, FALSE, 43434343A, 789€);
insert into factura values (5443, 2017-09-08, TRUE, 51639989K, 123.78€);
insert into factura values (5444, 2017-09-09, TRUE, 51639989K, 567€);
insert into factura values (5445, 2017-09-10, TRUE, 51592939K, 100€);*/
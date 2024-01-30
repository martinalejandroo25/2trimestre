create database if not exists Tienda_Informática;
use Tienda_Informática;
create table if not exists fabricantes (
Clave_fabricante Int primary key,
Nombre Varchar(30)
) engine=innodb;

create table if not exists articulos(
Clave_articulo Int primary key,
Nombre Varchar(30),
Precio Int,
Clave_fabricante Int,
foreign key (Clave_fabricante) references fabricantes(Clave_fabricante)
on delete cascade on update cascade
) engine=innodb;

show tables;
describe articulos;

insert into fabricantes values 
(1, "Kingston"),
(2, "Adata"),
(3, "Logitech"),
(4, "Lexar"),
(5, "Lexar");

insert into articulos values
(1, "Teclado", 100, 3),
(2, "Disco duro 300 Gb", 500, 5),
(3, "Mouse", 80, 3),
(4, "Memoria USB", 140, 4),
(5, "Memoria RAM", 290, 1),
(6, "Disco duro extraíble 250 Gb", 650, 5),
(7, "Memoria USB", 279, 1),
(8, "DVD Rom", 450, 2),
(9, "CD Rom", 200, 2),
(10, "Tarjeta de red", 180, 3);
select * from articulos;
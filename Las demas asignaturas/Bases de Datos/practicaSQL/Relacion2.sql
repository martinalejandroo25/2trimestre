create database if not exists Tienda_Informática;
use Tienda_Informática;
create table if not exists fabricantes (
Clave_fabricante Int primary key,
Nombre Varchar(30)
) engine=innodb;

create table if not exists articulos(
Clave_articulo Int primary key,
nombre Varchar(30),
nrecio Int,
clave_fabricante Int,
foreign key (Clave_fabricante) references fabricantes(Clave_fabricante)
on delete cascade on update cascade
) engine=innodb;
alter table articulos change nrecio  precio  int;
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

# 8. Genera las siguientes consultas:
# a) Obtener todos los datos de los productos de la tienda
select * from articulos;
# b) Obtener los nombres de los productos de la tienda
select nombre from articulos;
# c) Obtener los nombres y precio de los productos de la tienda
select nombre, precio from articulos;
# d) Obtener los nombres de los artículos sin repeticiones
select distinct nombre from articulos; /*distinct para tablas con informacion repetida*/
# e) Obtener todos los datos del artículo cuya clave de producto es ‘5’
select * from articulos where Clave_articulo = 5;
# f) Obtener todos los datos del artículo cuyo nombre del producto es ‘’Teclado”
select * from articulos where nombre like "Teclado";
# g) Obtener todos los datos de la Memoria RAM y memorias USB
select * from articulos where nombre like "Memoria RAM" OR nombre like "Memoria USB";
# h) Obtener todos los datos de los artículos que empiezan con ‘M’
select * from articulos where nombre like "M%";
# i) Obtener el nombre de los productos donde el precio sea $ 100
select nombre from articulos where precio = 100;
# j) Obtener el nombre de los productos donde el precio sea mayor a $ 200
select nombre from articulos where precio > 200;
# k) Obtener todos los datos de los artículos cuyo precio este entre $100 y $350
select * from articulos where precio between 100 and 350; /*between entre 1 valor "and" y el otro valor*/
# l) Obtener el precio medio de todos los productos
select avg(precio) from articulos;
# m) Obtener el precio medio de los artículos cuyo código de fabricante sea 2
select avg(precio) from articulos where clave_fabricante = "2";
# n) Obtener el nombre y precio de los artículos ordenados por Nombre
select nombre, precio from articulos order by nombre;
# o) Obtener todos los datos de los productos ordenados descendentemente por Precio
select * from articulos order by precio desc;
# p) Obtener el nombre y precio de los artículos cuyo precio sea mayor a $ 250 y ordenarlos descendentemente por precio
#    y luego ascendentemente por nombre
select nombre, precio from articulos where precio > 250 order by precio desc;
select nombre, precio from articulos where precio > 250 order by nombre asc;
# q) Obtener un listado completo de los productos, incluyendo por cada articulo los datos del articulo y del fabricante
select articulos.*, fabricante.* from articulos
join articulos on articulos.clave_fabricante = fabricante.Clave_fabricante
join fabricante on fabricante.Clave_fabricante = articulos.clave_fabricante;
# r) Obtener la clave de producto, nombre del producto y nombre del fabricante de todos los productos en venta
# s) Obtener el nombre y precio de los artículos donde el fabricante sea Logitech ordenarlos alfabéticamente por nombre
#    del producto
# t) Obtener el nombre, precio y nombre de fabricante de los productos que son marca Lexar o Kingston ordenados
#    descendentemente por precio
# u) Añade un nuevo producto: Clave del producto 11, Altavoces de $ 120 del fabricante 2
# v) Cambia el nombre del producto 6 a ‘Impresora Laser’
# w) Aplicar un descuento del 10% a todos los productos.
# x) Aplicar un descuento de $ 10 a todos los productos cuyo precio sea mayor o igual a $ 300
# y) Borra el producto numero 6

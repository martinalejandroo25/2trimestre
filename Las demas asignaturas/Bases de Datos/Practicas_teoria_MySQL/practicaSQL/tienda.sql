create database if not exists tienda;
use tienda;
create table if not exists cliente(
id_cliente int auto_increment primary key,
nombre varchar (40),
direccion varchar(100),
telefono char(9),
ciudad varchar(18)
);
create table if not exists producto(
id_producto int auto_increment primary key,
descripcion varchar(200),
precio double
);
create table if not exists venta (
id_venta int auto_increment primary key,
cantidad char(10),
id_producto int,
id_cliente int,
foreign key (id_producto) references producto(id_producto)
on delete restrict on update cascade,
foreign key (id_cliente) references cliente(id_cliente)
on delete restrict on update cascade
);
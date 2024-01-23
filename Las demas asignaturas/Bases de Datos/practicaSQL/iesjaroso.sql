create database iesjaroso; /*crear nueva base de datos*/
show databases; /*Muestra las bases de datos existentes*/
use iesjaroso; /*usar la BD de las existentes*/
create table alumno( /*Crear dentro de la BD una nueva tabla, 
					entre parentesis las columnas de la nueva tabla*/
codAlumno numeric(4),
nombre varchar(35),
apellido1 varchar(35),
apellido2 varchar(35),
fechaAlta date,
primary key (codAlumno) /*Definir la Llave primaria*/
);
show tables; /*muestra las tablas dentro de la BD*/
describe alumno; /*Información junto con las filas de la columna*/
create table if not exists ciudad( /*if not exists en caso de que la tabla no exista*/
nombre char(20) not null, /*not null no permite valores nulos en la columna*/
poblacion int null
);
show tables; /*muestra las tablas de mi base de datos*/
describe ciudad;

create table if not exists ciudad1(
nombre char(20) not null,
poblacion int null default 5000 #valor por defecto
);
describe ciudad1;

create table if not exists ciudad2(
nombre char(20) not null,
poblacion int null default 5000, #valor por defecto
primary key (nombre)
);
describe ciudad2;

create table if not exists fabricante(
codFabricante varchar(4) not null,
nombre varchar(35),
telefono varchar(9),
primary key (codFabricante)
);
create table if not exists articulo (
codArt varchar(4) not null primary key,
descripcion varchar(50),
codfabricante varchar(4),
foreign key (codFabricante) references fabricante(codFabricante) /*creacion de llave foranea de otra tabla*/
on delete cascade on update cascade
);
describe articulo;

create table if not exists ciudad3(
clave int auto_increment primary key comment 'clave auto incrementada',
nombre char(20) not null,
poblacion int null default 5000 #valor por defecto
);
describe ciudad3;
create database if not exists Biblioteca;
use Biblioteca;

create table if not exists Editorial(
ClaveEditorial smallint auto_increment primary key,
Nombre varchar(60),
Direccion varchar(60),
Telefono varchar(15)
);

create table if not exists Libro (
ClaveLibro int auto_increment primary key,
Titulo varchar(60),
Idioma varchar(15),
Formato varchar(15),
Categoria char,
ClaveEditorial smallint,
foreign key (ClaveEditorial) references Editorial(ClaveEditorial)
on delete restrict on update cascade
);
create table if not exists Tema(
ClaveTema smallint auto_increment primary key,
Nombre varchar(40)
);
create table if not exists Autor(
ClaveAutor int auto_increment primary key,
Nombre varchar(60)
);
create table if not exists Ejemplar(
ClaveLibro int auto_increment primary key,
NumeroOrden smallint,
Edicion smallint,
Ubicacion varchar(15),
foreign key (ClaveLibro) references Libro(ClaveLibro)
on delete restrict on update cascade
);
create table if not exists Socio(
ClaveSocio int auto_increment primary key,
Nombre varchar(60),
Direccion varchar(60),
Telefono varchar(15),
Categoria char
);
create table if not exists Prestamo(
ClaveSocio int, 
ClaveLibro int,
NumeroOrden smallint,
Fecha_prestamo date,
Fecha_devolucion date,
Notas varchar(60),
foreign key (ClaveLibro) references Libro(ClaveLibro)
on delete restrict on update cascade,
foreign key (ClaveSocio) references Socio(ClaveSocio)
on delete restrict on update cascade

);
create table if not exists Trata_sobre(
ClaveLibro int,
ClaveTema smallint,
foreign key (ClaveLibro) references Libro(ClaveLibro)
on delete restrict on update cascade,
foreign key (ClaveTema) references Tema(ClaveTema)
on delete restrict on update cascade
);

create table if not exists Escrito_por(
ClaveLibro int, 
ClaveAutor int,
foreign key (ClaveLibro) references Libro(ClaveLibro)
on delete restrict on update cascade,
foreign key (ClaveAutor) references Autor(ClaveAutor)
on delete restrict on update cascade
);

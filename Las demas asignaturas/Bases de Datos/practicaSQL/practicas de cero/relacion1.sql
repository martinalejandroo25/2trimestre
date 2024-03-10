create database relacion1;
use relacion1;
create table alumno(
id_al char(3) primary key,
nom_al varchar(40),
fech_al date,
telf_al varchar(9)
);
create table profesor(
id_prof char(3) primary key,
nom_prof varchar(40),
fech_prof date,
telf_prof varchar(9)
);
create table relacion(
id_al char(3),
id_prof char(3),
nota double,
primary key(id_al, id_prof),
foreign key (id_al) references alumno(id_al)
on delete cascade on update restrict,
foreign key (id_prof) references profesor(id_prof)
on delete cascade on update restrict
);
insert into alumno VALUES
("A01", "JUAN MUÑOZ", "1978-09-04", 676543456),
("A02", "ANA TORRES", "1980-12-05", 654786756),
("A03", "PEPE GARCIA", "1982-08-09", 950441234),
("A04", "JULIO GOMEZ", "1983-12-23", 678909876),
("A05", "KIKO ANDRADES", "1979-01-30", 666123456);
insert into profesor values
("P01", "CARMEN TORRES", "1966-09-08", 654789654),
("P02", "FERNANDO GARCIA", "1961-07-09", 656894123);
insert into relacion VALUES
("A01", "P01", 3.56),
("A01", "P02", 4.57),
("A02", "P01", 5.78),
("A02", "P02", 7.80),
("A03", "P01", 4.55),
("A03", "P02", 5),
("A04", "P02", 10),
("A05", "P01", 2.75),
("A05", "P02", 8.45);

# 3.- Mostrar todos los nombres de los alumnos con sus teléfonos.
select nom_al, telf_al from alumno;
# 4.- Mostrar los nombres de los alumnos ordenados en orden creciente y decreciente.
select nom_al from alumno order by id_al desc;
# 5.- Mostrar los alumnos ordenados por edad.
select * from alumno order by fech_al asc;
# 6.- Mostrar nombre de alumnos que contengan alguna ‘A’ en el nombre.
select nom_al from alumno where nom_al like "%A%"; -- %a% CONTIENE a, a% comienza con a, %a termina  con a
# 7.- Mostrar id_al ordenado por nota.
select id_al from relacion order by nota asc;

# 8.- Mostrar nombre alumno y nombre de sus respectivos profesores.
select 
# 9.- Mostrar el nombre de los alumnos que les de clase el profesor P01

# 10.- Mostrar el nombre y la nota de los alumnos que les de clase el profesor ‘FERNAND0 GARCIA’.

# 11.- Mostrar todos los alumnos (codigo) que hayan aprobado con el profesor P01.

# 12.- Mostrar todos los alumnos (nombre) que hayan aprobado con el profesor P01.

# 13.- Mostrar todos los alumnos (nombre) que hayan aprobado con el profesor ‘CARMEN TORRES’.

# 14.- Mostrar el alumno/s que haya obtenido la nota más alta con ‘P01’,

# 15.- Mostrar los alumnos (nombre y codigo) que hayan aprobado todo. 

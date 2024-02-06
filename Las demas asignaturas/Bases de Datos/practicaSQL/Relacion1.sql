create database if not exists relacion1;
use relacion1;

create table if not exists alumno(
id_al char(3) primary key,
nom_al varchar(40),
fech_al date,
telf_al varchar(9)
)engine=innodb;


create table if not exists profesor(
id_prof char(3) primary key,
nom_prof varchar(40),
fech_prof date,
telf_prof varchar(9)
)engine=innodb;

create table if not exists relacion(
id_al char(3),
id_prof char(3),
nota double,
foreign key(id_al) references alumno(id_al)
on delete cascade on update cascade,
foreign key(id_prof) references profesor(id_prof)
on delete cascade on update cascade,
primary key(id_al, id_prof)
) engine=innodb;
#para insertar en las columnas de las tablas
insert into alumno values
	("A01", "JUAN MUÑOZ",      '1978-09-04', 676543456),
	("A02", "ANA TORRES",      '1980-12-05', 654786756),
	("A03", "PEPE GARCIA",     '1982-08-09', 950441234),
	("A04", "JULIO GOMEZ",     '1983-12-23', 678909876),
	("A05", "KIKO ANDRADES",   '1979-01-30', 666123456);
insert into profesor values
	("P01", "CARMEN TORRES",   '1966-09-08', 654789654),
	("P02", "FERNANDO GARCIA", '1961-07-09', 656894123);
insert into relacion values
	('A01', 'P01', 3.56),
	('A01', 'P02', 4.57),
	('A02', 'P01', 5.78),
	('A02', 'P02', 7.80),
	('A03', 'P01', 4.55),
	('A03', 'P02', 5),
	('A04', 'P02', 10),
	('A05', 'P01', 2.75),
	('A05', 'P02', 8.45);
#ver la columna
select * from alumno;
#3.- Mostrar todos los nombres de los alumnos con sus teléfonos.
select nom_al, nom_prof from alumno,profesor,relacion where relacion.id_al=alumno.id_al;

/*select nom_al as alumno, nom_prof as profesor from alumno as a, profesor a;*//*me quede a medias aqui*/
#4.- Mostrar los nombres de los alumnos ordenados en orden creciente y decreciente.
select nom_al from alumno order by nom_al asc; /*ascendente*/
select nom_al from alumno order by nom_al desc; /*descendente*/
#5.- Mostrar los alumnos ordenados por edad.
select nom_al from alumno order by fech_al asc;
#6.- Mostrar nombre de alumnos que contengan alguna ‘A’ en el nombre.
select nom_al from alumno where nom_al like "%A%"; /*A% AL PRINCIPIO %A AL FINAL  %A% CONTIENE*/
#7.- Mostrar id_al ordenado por nota.
select id_al from relacion order by nota; 
#8.- Mostrar nombre alumno y nombre de sus respectivos profesores.
select alumno.nom_al, profesor.nom_prof from alumno
join relacion on alumno.id_al = relacion.id_al
join profesor on relacion.id_prof = profesor.id_prof;
#9.- Mostrar el nombre de los alumnos que les de clase el profesor P01
select alumno.nom_al from alumno
join relacion on alumno.id_al = relacion.id_al
join profesor on relacion.id_prof = profesor.id_prof where profesor.id_prof = "P01";
#10.- Mostrar el nombre y la nota de los alumnos que les de clase el profesor ‘FERNAND0 GARCIA’.
select alumno.nom_al, relacion.nota from alumno 
join relacion on alumno.id_al = relacion.id_al
join profesor on relacion.id_prof = profesor.id_prof where profesor.nom_prof = "FERNANDO GARCIA";
#11.- Mostrar todos los alumnos (codigo) que hayan aprobado con el profesor P01.
select alumno.id_al, relacion.nota from alumno
join relacion on alumno.id_al = relacion.id_al
join profesor on relacion.id_prof = profesor.id_prof where profesor.id_prof = "P01" and relacion.nota >= 5;
#12.- Mostrar todos los alumnos (nombre) que hayan aprobado con el profesor P01.
select alumno.nom_al, relacion.nota from alumno
join relacion on alumno.id_al = relacion.id_al
join profesor on profesor.id_prof = relacion.id_prof where profesor.id_prof = "P01" and relacion.nota >= 5;
#13.- Mostrar todos los alumnos (nombre) que hayan aprobado con el profesor ‘CARMEN TORRES’.
select alumno.nom_al, relacion.nota from alumno
join relacion on alumno.id_al = relacion.id_al
join profesor on profesor.id_prof = relacion.id_prof where profesor.nom_prof = "CARMEN TORRES" and relacion.nota >= 5;
#14.- Mostrar el alumno/s que haya obtenido la nota más alta con ‘P01’,
select alumno.nom_al, relacion.nota from alumno
join relacion on alumno.id_al = relacion.id_al
join profesor on profesor.id_prof = relacion.id_prof 
where relacion.nota = (select max(nota) from relacion where relacion.id_prof = "P01" );
#15.- Mostrar los alumnos (nombre y codigo) que hayan aprobado todo.
select alumno.nom_al, alumno.id_al from alumno
where alumno.id_al not in (select relacion.id_al from relacion where relacion.nota < 5);

/*select relacion.nota, alumno.nom_al from alumno
join relacion on alumno.id_al = relacion.id_al;*/



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
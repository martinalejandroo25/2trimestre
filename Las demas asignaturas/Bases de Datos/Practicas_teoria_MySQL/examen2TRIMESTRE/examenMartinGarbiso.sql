drop database if exists examenMartinGarbiso; -- en caso de querer ejecutar de nuevo todo el script SQL
create database if not exists examenMartinGarbiso;
use examenMartinGarbiso;
-- CREACION DE TABLAS
create table if not exists Cliente(
    id_cli char(3) primary key,
    nom_cli varchar(25),
    telf_cli varchar(9)
);
create table if not exists Provincia (
id_prov char(2) primary key, 
provincia varchar(20)
);
create table if not exists Localidad(
    c_postal char(5) primary key,
    localidad varchar(20),
    id_prov char(2),
    foreign key (id_prov) references Provincia(id_prov)
);
create table if not exists Alojamiento(
    id_aloj char(3) primary key,
    nom_aloj varchar(25),
    habitaciones int,
    categoria varchar(5),
    c_postal char(5),
    foreign key (c_postal) references Localidad (c_postal)
);
create table if not exists Cli_aloj(
    id_cli char(3),
    id_aloj char(3),
    fech_entrada date,
    fech_salida date,
    precio double,
    primary key(id_cli, id_aloj, fech_entrada),
    foreign key (id_cli) references Cliente(id_cli)
    on delete cascade on update cascade,
    foreign key (id_aloj) references Alojamiento(id_aloj)
    on delete cascade on update cascade
);
create table if not exists Empleado(
    id_emp char(3) primary key,
    nom_emp varchar(25),
    sueldo double,
    id_aloj char(3),
    foreign key (id_aloj) references Alojamiento(id_aloj)
    on delete cascade on update cascade
);
-- INSERCCIÓN DE DATOS
insert into Cliente
values
("C01", "JUAN FERNÁNDEZ", "898765678"),
("C02", "ANA GARCÍA", "678987567"),
("C03", "PEPA FLORES", "432123456"),
("C04", "JOSÉ LINARES", "950122145"),
("C05", "LUIS JARCIA", "954678763"),
("C06", "XAVI PÉREZ", "900873221"),
("C07", "LUISA JUANES", "878909876"),
("C08", "HILARIO PINO", "675121234"),
("C09", "CARMEN CONSUEGRA", "123234789"),
("C10", "VICENTA FERRER", "924866378"),
("C11", "OLIVIA GINESA", "789123456"),
("C12", "JUANJO DÍAZ", "911234321");
insert into Provincia
values 
	(04, "ALMERIA"),
    (18, "GRANADA");
insert into Localidad values
	(04620, "VERA", 04),
	(04610, "CUEVAS DEL ALMANZORA", 04),
	(18500, "GUADIX", 18),
	(18004, "GRANADA", 18);
insert into Alojamiento
values ("A01", "TERRAZA CARMONA", 100, "***", 04620),
    ("A02", "VALLE DEL ESTE", 250, "****", 04620),
    ("A03", "HOSTAL LUCERO", 17, "**", 04610),
    ("A04", "VERA PLAYA", 350, "****", 04620),
    ("A05", "HOTEL MEXICO", 80, "****", 04610),
    ("A06", "HOTEL GUADIX", 40, "**", 18500),
    ("A07", "ALHAMBRA PALACE", 120, "*****", 18004);
insert into Cli_aloj VALUES

("C01", "A01", "2023-03-01", "2023-03-10", 345), 
("C02", "A01", "2022-04-01", "2022-04-02", 60), 
("C03", "A01", "2021-03-02", "2021-03-11", 540), 
("C04", "A02", "2018-04-03", "2018-04-10", 420),
("C05", "A02", "2019-05-04", "2019-05-10", 395), 
("C06", "A02", "2013-06-05", "2013-06-10", 145), 
("C07", "A02", "2013-07-06", "2013-07-10", 450), 
("C08", "A03", "2013-08-07", "2013-08-10", 344), 
("C09", "A03", "2013-08-08", "2013-08-10", 349), 
("C10", "A03", "2013-10-09", "2013-10-10", 145), 
("C11", "A03", "2013-11-11", "2013-11-15", 245), 
("C12", "A03", "2013-12-21", "2013-12-30", 600), 
("C01", "A04", "2013-09-05", "2013-09-07", 148), 
("C02", "A03", "2013-10-07", "2013-10-14", 849), 
("C03", "A03", "2013-03-11", "2013-03-15", 248), 
("C04", "A03", "2013-03-21", "2013-03-30", 345), 
("C05", "A01", "2013-03-11", "2013-03-19", 149), 
("C06", "A02", "2013-06-21", "2013-06-30", 315), 
("C01", "A01", "2013-01-11", "2013-01-20", 319), 
("C03", "A04", "2014-02-14", "2014-02-16", 200), 
("C04", "A07", "2014-02-14", "2014-02-16", 500), 
("C09", "A05", "2014-03-07", "2014-03-09", 400), 
("C01", "A06", "2023-01-01", "2023-01-04", 200);

insert into Empleado values

("E01", "MANUEL MURCIA", 				1400, "A01"),
("E02", "GINÉS ASENSIO FERNÁNDEZ", 		1500, "A01"),
("E03", "BALTASAR PARRA GIMÉNEZ", 		950, "A02"),
("E04", "ROSA PÉREZ GARCÍA", 			1300, "A03"),
("E05", "JOSÉ MIGUEL MARTÍNEZ CANO", 	1150, "A04"),
("E06", "ANTONIO FERNÁNDEZ SOTO", 		1200, "A05"),
("E07", "ANA GARCÍA GIMÉNEZ", 			1100, "A04"),
("E08", "MARÍA CAPARROS GÓMEZ", 		1300, "A04"),
("E09", "ALICIA FLORES DÍAZ", 			1500, "A05"),
("E10", "JUAN TORRES NUÑEZ", 			2500, "A07"),
("E11", "MARIA FLORES RODRIGUEZ", 		1100, "A06");

-- CONSULTAS
#1. Nombre o nombres de los alojamientos de cuatro estrellas que tienen menor número de habitaciones.
select nom_aloj from Alojamiento where categoria = "****" order by habitaciones asc;
#2. Datos de los empleados cuyo sueldo está comprendido entre 1000 y 1500 euros ordenados de mayor a menor sueldo.
select * from Empleado 
where sueldo between 1000 and 1500;
#3. Datos de los empleados cuyo sueldo es mayor que la media de todos los empleados.
select * from Empleado
where sueldo > (select avg(sueldo) from Empleado);
#4. Nombre de los clientes que se han hospedado en la provincia de Granada.
select c.nom_cli from Cliente c
inner join Cli_aloj ca on ca.id_cli = c.id_cli
inner join Alojamiento a on a.id_aloj = ca.id_aloj
inner join Localidad l on l.c_postal = a.c_postal
inner join Provincia p on p.id_prov = l.id_prov
where provincia like "granada";
#5. Nombres de los clientes y dinero total que se han gastado en alojarse cada uno de ellos.
select c.nom_cli, sum(ca.precio)  from Cliente c
inner join Cli_aloj ca on ca.id_cli = c.id_cli
group by c.nom_cli
order by sum(precio);
#6. Nombre de los alojamientos y fechas en los que ha estado hospedado el cliente JUAN FERNÁNDEZ, ordenado por el nombre del hotel.
select a.nom_aloj, ca.fech_entrada, ca.fech_salida from Alojamiento a
inner join Cli_aloj ca on ca.id_aloj = a.id_aloj
inner join Cliente c on c.id_cli = ca.id_cli
where c.nom_cli like "JUAN FERNÁNDEZ" 
order by a.nom_aloj;
#7. Datos del cliente/s que más establecimientos ha visitado.
select c.*, count(ca.id_aloj) as num_aloj from Cliente c
inner join Cli_aloj ca on ca.id_cli = c.id_cli
group by c.id_cli
order by num_aloj desc limit 1;
#8. Listado de alojamientos, donde aparezca el nombre de cada alojamiento y el dinero que ha ganado en los hospedajes ordenados por nombre del alojamiento.
select a.nom_aloj, sum(ca.precio) as total_beneficios from Alojamiento a
inner join Cli_aloj ca on ca.id_aloj = a.id_aloj
group by a.nom_aloj
order by total_beneficios;
#9. El nombre del empleado y nombre del alojamiento en que trabaja el empleado que menor sueldo tiene.
select e.nom_emp, a.nom_aloj from Empleado e
inner join Alojamiento a on e.id_aloj = a.id_aloj
group by e.nom_emp, a.nom_aloj
having (select sueldo 
				from Empleado
                order by sueldo asc limit 1); -- SIN TERMINAR
#10. Nombre del alojamiento o alojamientos con mayor número de empleados.
select a.nom_aloj, count(e.id_emp) as num_empleados from Alojamiento a
inner join Empleado e on e.id_aloj = a.id_aloj
group by a.nom_aloj
having (select count(id_emp) as num_empleados 
		from Empleado
		order by num_empleados
        desc limit 1); -- SIN TERMINAR
#11. Nombre de la Provincia con menor número de alojamientos.
select provincia from Provincia p
inner join Localidad l on l.c_postal = p.c_postal
inner join Alojamientoa on p.c_postal = a.c_postal;
#12. Numero de alojamientos por Cada provincia.
select count(a.id_aloj) from Alojamiento a
inner join Localidad l on l.c_postal = a.c_postal
inner join Provincia p on p.id_prov = l.id_prov
group by p.provincia;
#13. Listado que contenga la media del sueldo de los empleados por cada alojamiento. Donde aparezca la media del sueldo de los empleados y el nombre del alojamiento.
select avg(e.sueldo) as Media_Sueldos, a.nom_aloj from Empleado e
inner join Alojamiento a on a.id_aloj = e.id_aloj
group by a.nom_aloj;
#14. El sueldo de los empleados que trabajan en la provincia de Almería se incrementa en un 10% (es decir se actualiza la tabla empleados).        
update Empleado e
inner join Alojamiento a on a.id_aloj = e.id_aloj
inner join Localidad l on l.c_postal = a.c_postal
inner join Provincia p on p.id_prov = l.id_prov
set sueldo = sueldo * 1.10
where provincia like "almeria";

#15. El alojamiento Terraza Carmona incrementa el número de habitaciones a 75.
update Alojamiento
set habitaciones = habitaciones + 75
where nom_aloj like "terraza carmona";

#16. Borra los empleados que trabajen en Terraza Carmona.
delete e.* from Empleado e
inner join Alojamiento a on a.id_aloj = e.id_aloj
where nom_aloj like "terraza carmona";
create database if not exists relacion3;
use relacion3;
create table provincia(
id_prov char(3) primary key not null,
nom_prov varchar(15) not null
);
create table ciudad(
id_ciud char(3) primary key not null,
nom_ciud varchar(20) not null,
num_hab int not null,
id_prov char(3) not null,
foreign key(id_prov) references provincia(id_prov)
);
create table zona(
id_zona char(3) not null,
nom_zona varchar(10) not null,
id_ciud char(3) not null,
primary key (Id_zona, id_ciud),
foreign key (id_ciud) references ciudad (id_ciud)
on delete cascade on update cascade
);
create table cartero(
id_cart char(3) primary key not null,
nom_cart varchar(25) not null,
sueldo int not null
);
create table periodos(
id_per char(3) primary key not null,
fecha_ini date not null,
fecha_fin date not null
);
create table relacion2(
id_zona char(3) not null,
id_ciud char(3)not null,
id_cart char(3)not null,
id_per char(3)not null,
primary key(
id_zona,
id_ciud, 
id_cart,
id_per 
),
foreign key (id_zona) references zona(id_zona)
on delete cascade on update cascade,
foreign key (id_ciud) references ciudad(id_ciud)
on delete cascade on update cascade,
foreign key (id_cart) references cartero(id_cart)
on delete cascade on update cascade,
foreign key (id_per)  references periodos(id_per)
on delete cascade on update cascade
);

insert into zona 
values
("Z01","CENTRO","C01"),
("Z02","ESTE","C01"),
("Z03","OESTE","C01"),
("Z04","NORTE","C01"),
("Z05","SUR","C01"),
("Z01","CENTRO","C02"),
("Z02","POLIOGONO","C02"),
("Z03","OESTE","C02"),
("Z04","NORTE","C02"),
("Z05","SUR","C02"),
("Z01","CENTRO","C03"),
("Z02","ESTE","C03"),
("Z03","BARRIADAS","C03"),
("Z04","NORTE","C03"),
("Z05","SUR","C03"),
("Z01","CENTRO","C04"),
("Z02","BULEVARD","C04"),
("Z03","OESTE","C04"),
("Z04","NORTE","C04"),
("Z05","RIVERA","C04");

INSERT INTO ciudad
values
("C01", "CIUDAD1", 890000, "P01" ),
("C02", "CIUDAD2", 110000, "P02"),
("C03", "CIUDAD3", 98000, "P03"),
("C04", "CIUDAD4", 65000, "P01");

insert into provincia
values
("P01", "SEVILLA"),
("P02", "GRANADA"),
("P03", "ALMERIA");

insert into periodos
values
("PE1", "2000-05-01", "2000-03-30"),
("PE2", "2000-03-30", "2000-08-15"),
("PE3", "2000-08-15", "2000-11-20"),
("PE4", "2000-11-20", "2000-12-25"),
("PE5", "2000-12-25", "2001-03-03");

insert into cartero 
values
("CT1", "JUAN PEREZ", 1100),
("CT2", "ANA TORRES", 1080),
("CT3", "PEPA FERNANDEZ", 1100),
("CT4", "VICENTE VALLES", 1790),
("CT5", "FERNANDO GINES", 1013),
("CT6", "LISA TORMES", 897),
("CT7", "WALDO PEREZ", 899),
("CT8", "KIKA GARCIA", 987),
("CT9", "LOLA JIMENEZ", 1123);

insert into relacion2
values
("Z01", "C01", "CT1", "PE1"),
("Z01", "C02", "CT2", "PE1"),
("Z01", "C03", "CT3", "PE1"),
("Z01", "C04", "CT4", "PE1"),
("Z02", "C01", "CT5", "PE1"),
("Z02", "C02", "CT6", "PE1"),
("Z02", "C03", "CT7", "PE1"),
("Z02", "C04", "CT8", "PE1"),
("Z03", "C01", "CT9", "PE1"),
("Z03", "C02", "CT1", "PE2"),
("Z03", "C03", "CT2", "PE2"),
("Z03", "C04", "CT3", "PE2"),
("Z04", "C01", "CT4", "PE2"),
("Z04", "C02", "CT5", "PE2"),
("Z04", "C03", "CT6", "PE2"),
("Z04", "C04", "CT7", "PE2"),
("Z05", "C01", "CT8", "PE2"),
("Z05", "C02", "CT9", "PE2"),
("Z05", "C03", "CT1", "PE3"),
("Z05", "C04", "CT2", "PE3"),
("Z01", "C01", "CT3", "PE3"),
("Z02", "C02", "CT4", "PE3"),
("Z03", "C01", "CT5", "PE3"),
("Z04", "C01", "CT6", "PE3"),
("Z05", "C01", "CT7", "PE3"),
("Z01", "C01", "CT8", "PE4"),
("Z02", "C03", "CT9", "PE3"),
("Z03", "C04", "CT1", "PE4"),
("Z04", "C01", "CT2", "PE4"),
("Z05", "C01", "CT3", "PE4");


#1.-NOMBRE DE CIUDAD CON MÁS HABITANTES.
select nom_ciud from ciudad order by num_hab desc limit 1;
#2.- NOMBRE DEL CARTERO CON MAYOR SUELDO
select nom_cart from cartero order by sueldo desc limit 1;
#3.- NOMBRE CIUDADES, Nº HABITANTES DE LA PROVINCIA DE SEVILLA
select c.nom_ciud, c.num_hab from ciudad c
inner join provincia p on p.id_prov = c.id_prov
where nom_prov like "sevilla";
#4.- CARTEROS ORDENADOS POR SULEDO.
select * from cartero order by sueldo;
#5.- NOMBRE DE CIUDAD Y NOMBRE DE ZONA
select c.nom_ciud, z.nom_zona from ciudad c
inner join zona z on z.id_ciud = c.id_ciud;
#6.- ZONAS DE LA „C02‟
select * from zona where id_ciud = "C02";
#7.- ZONAS DE LA CIUDAD “CIUDAD3”.
select z.* from zona z
inner join ciudad c on c.id_ciud = z.id_ciud
where nom_ciud like "ciudad3";
#8.- NOMBRE DE LOS CARTEROS QUE HAN TRABAJADO EN LA ZONA “Z01,C02”
select c.* from cartero c
inner join relacion2 r on r.id_cart =  c.id_cart
where r.id_zona like "z01" and r.id_ciud like "c02";
#9.- NOMBRE DE LOS CARTEROS QUE HAN TRABAJADO EN LA ZONA CENTRO DE LA CIUDAD1
select c.nom_cart, z.nom_zona, ci.nom_ciud from cartero c
inner join relacion2 r on r.id_cart = c.id_cart
inner join ciudad ci on r.id_ciud = ci.id_ciud
inner join zona z on z.id_zona = r.id_zona
where ci.nom_ciud like "ciudad1" and z.nom_zona LIKE "CENTRO";
#10.- NOMBRE DE LOS CARTEROS (Y FECHAS DE INICIO Y FIN) QUE HAN TRABAJADO EN LA RIVERA DE LA CIUDAD 4.
select c.nom_cart, p.fecha_ini, p.fecha_fin from cartero c
inner join relacion2 r on r.id_cart = c.id_cart
inner join periodos p on r.id_per = p.id_per
inner join ciudad ci on ci.id_ciud = r.id_ciud
inner join zona z on z.id_zona = r.id_zona
where nom_zona like "RIVERA" and nom_ciud like "ciudad4";
#11.- NOMBRE DE LOS CARTEROS QUE HAN TRABAJADO EN LA PROVINCIA DE SEVILLA
select c.nom_cart from cartero c
inner join relacion2 r on r.id_cart = c.id_cart
inner join ciudad ci on ci.id_ciud = r.id_ciud
inner join provincia p on p.id_prov = ci.id_prov
where p.nom_prov like "sevilla"; 
#12.- NOMBRE DE LOS CARTEROS QUE HAN TRABAJADO EN EL PERIODO PE4 Y NOMBRE DE LA CIUDAD EN QUE ESTABAN TRABAJANDO.
select c.nom_cart, ci.nom_ciud from cartero c
inner join relacion2 r on c.id_cart = r.id_cart
inner join ciudad ci on ci.id_ciud = r.id_ciud
where r.id_per like "pe4";
#13.- CARTEROS QUE HAN TRABAJADO EN LA CIUDAD CIUDAD1 Y FECHA DE INICIO Y FIN EN QUE LO HAN HECHO.
select c.*, p.fecha_ini, p.fecha_fin from cartero c
inner join relacion2 r on r.id_cart = c.id_cart
inner join ciudad ci on ci.id_ciud = r.id_ciud
inner join periodos p on p.id_per = r.id_per
where ci.nom_ciud like "ciudad1";
#14.- CARTEROS QUE HAN TRABAJADO EN LA PROVINCIA DE ALMERIA NOMBRE DE ZONA Y CIUDAD Y FECHAS EN QUE LO HAN HECHO.
select c.*, z.nom_zona, ci.nom_ciud, p.fecha_ini, p.fecha_fin from cartero c
inner join relacion2 r on r.id_cart = c.id_cart
inner join ciudad ci on ci.id_ciud = r.id_ciud
inner join provincia pr on pr.id_prov = ci.id_prov
inner join periodos p on p.id_per = r.id_per
inner join zona z on z.id_zona = r.id_zona
where pr.nom_prov like "almeria";
#15.- NUMERO DE HABITANTES DE CADA PROVINCIA.
select p.nom_prov, sum(ci.num_hab) from provincia p
inner join ciudad ci on ci.id_prov = p.id_prov
group by p.nom_prov;
#16.- NOMBRE Y SUELDO DEL CARTERO QUE MÁS PERIODOS HA TRABAJADO
select c.nom_cart, c.sueldo, count(p.id_per) as num_per -- contar el numero de periodos que ha habido y darle de alias num_per
from cartero c
inner join relacion2 r on r.id_cart = c.id_cart
inner join periodos p on p.id_per = r.id_per
group by c.nom_cart, c.sueldo
order by num_per desc limit 1;
#17.- NOMBRE DE LA CIUDAD QUE MAS CARTEROS HA TENIDO.
select ci.nom_ciud, count(c.id_cart) as num_cart from ciudad ci
inner join relacion2 r on ci.id_ciud = r.id_ciud
inner join cartero c on r.id_cart = c.id_cart
group by ci.nom_ciud
order by num_cart desc limit 1;
#18.- NOMBRE DE LA ZONA QUE MAS CARTEROS HA TENIDO (Y Nº DE CARTEROS)
select z.nom_zona, count(c.id_cart) as num_cart from zona z
inner join relacion2 r on r.id_zona = z.id_zona
inner join cartero c on c.id_cart = r.id_cart
group by z.nom_zona
order by num_cart desc limit 1;
#19.- NOMBRE/S Y SUELDO/S DEL CARTERO QUE HA REPARTIDO EN EL ESTE DE LA CIUDAD3.
select c.nom_cart, c.sueldo from cartero c
inner join relacion2 r on r.id_cart = c.id_cart
inner join ciudad ci on ci.id_ciud = r.id_ciud
inner join zona z on z.id_zona = r.id_zona
where z.nom_zona like "este" and ci.nom_ciud like "ciudad3";
-- en caso de querer reducir a 1 cartero la respuesta podemos hacer order by desc o asc limit 1
#20.- NOMBRE DE LOS CARTEROS QUE NO HAN TRABAJADO EN LA PROVINCIA DE SEVILLA
select c.nom_cart from cartero c
inner join relacion2 r on r.id_cart = c.id_cart
inner join ciudad ci on ci.id_ciud = r.id_ciud
inner join provincia p on p.id_prov = ci.id_prov
where p.nom_prov not like "SEVILLA";
#21.- NOMBRE Y SUELDO DE LOS CARTEROS QUE NO HAN TRABAJADO EN LA RIVERA DE LA CIUDAD4.
select  distinct c.nom_cart, c.sueldo from cartero c
inner join relacion2 r on r.id_cart = c.id_cart
inner join ciudad ci on ci.id_ciud = r.id_ciud
inner join zona z on z.id_zona = r.id_zona
where z.nom_zona not like "rivera" and ci.nom_ciud not like "ciudad4";
#22.- FECHA DE INICIO Y FIN DE LOS PERIODOS EN QUE MAS CARTEROS HAN TRABAJADO.
select p.fecha_ini, p.fecha_fin from periodos p
inner join relacion2 r on r.id_per = p.id_per
inner join cartero c on c.id_cart = r.id_cart
group by p.fecha_ini, p.fecha_fin
order by count(c.id_cart) desc limit 1;
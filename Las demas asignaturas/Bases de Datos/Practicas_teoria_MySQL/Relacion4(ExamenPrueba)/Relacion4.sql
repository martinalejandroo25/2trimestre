#RA2- Crea bases de datos definiendo su estructura y las características de sus
#elementos según el modelo relacional.
#Criterios de evaluación:
#a) Se ha analizado el formato de almacenamiento de la información.
#b) Se han creado las tablas y las relaciones entre ellas.
#c) Se han seleccionado los tipos de datos adecuados
#d) Se han definido los campos clave en las tablas.
#e) Se han implantado las restricciones reflejadas en el diseño lógico.
#h) Se han utilizado asistentes, herramientas gráficas y los lenguajes de definición
#y control de datos.
#Crear la base de datos Relacion4
drop database if exists Relacion4;
create database if not exists Relacion4;
use Relacion4;
#Crear la tabla Mecanico
create table if not exists Mecanico(
    ID_MEC varchar(3) primary key not null,
    NOM_MEC char(40),
    SUELDO double,
    FEC_NAC date
) engine=innodb;
#Crear la tabla Coche
create table if not exists Coche(
    MAT_CO varchar(8) primary key not null,
    MOD_CO char(20),
    COLOR char(13),
    TIPO char(13)
)engine=innodb;
#Crear la tabla Periodo
create table if not exists Periodo(
    ID_PER varchar(3) primary key not null,
    FEC_INI date,
    FEC_FIN date
)engine=innodb;
#Crear la tabla Tipo
create table if not exists Tipo(
    ID_TIPO varchar(10) primary key,
    NOM_TIPO char(40)
)engine=innodb;
#Crear la tabla Pieza
create table if not exists Pieza(
    ID_PIEZ varchar(3) primary key not null,
    NOM_PIEZ char(40),
    ID_TIPO varchar(10),
    foreign key(ID_TIPO) references Tipo(ID_TIPO)
    on delete cascade on update cascade
)engine=innodb;
#Crear la tabla Relacion
create table if not exists Relacion(
    ID_MEC varchar(3),
    MAT_CO varchar(8),
    ID_PER varchar(3),
    ID_PIEZ varchar(3),
    PRECIO double,
    primary key(ID_MEC, MAT_CO, ID_PER, ID_PIEZ),
    foreign key(ID_MEC) references Mecanico(ID_MEC)
    on delete cascade on update cascade,
    foreign key(MAT_CO) references Coche(MAT_CO)
    on delete cascade on update cascade,
    foreign key(ID_PER) references Periodo(ID_PER)
    on delete cascade on update cascade,
    foreign key(ID_PIEZ) references Pieza(ID_PIEZ)
    on delete cascade on update cascade
)engine=innodb;
insert into Mecanico
values ("ME1", "JUAN ROMUALDO", 1289, '1970-09-05'),
    ("ME2", "RAMON FERNANDEZ", 1678, '1976-07-05'),
    ("ME3", "ANA LUCAS", 1100, '1968-09-04');
select * from Mecanico;

insert into Coche
values 
("1234-CDF", "SEAT LEON", "GRIS", "DIESEL"),
("0987-CCC", "RENAULT MEGANE", "BLANCO", "GASOLINA") ,
("0123-BVC", "OPEL ASTRA", "AZUL", "DIESEL") ,
("1456-BNL", "FORD FOCUS", "VERDE", "DIESEL") ,
("1111-CSA", "SEAT TOLEDO", "ROJO", "GASOLINA") ,
("4567-BCB", "VOLKSWAGEN POLO", "BLANCO", "DIESEL") ,
("0987-BFG", "FORD FIESTA", "NEGRO", "GASOLINA");
select * from Coche;

insert into Periodo
values
("PE1", '2003-04-09', '2003-04-10'),
("PE2", '2004-05-12', '2004-05-17'),
("PE3", '2004-06-17', '2004-06-27'),
("PE4", '2005-08-22', '2005-09-1'),
("PE5", '2005-09-10', '2005-09-15'),
("PE6", '2005-10-01', '2005-10-17');
select * from Periodo;

insert into Tipo
values
("TI1", "CHAPA"),
("TI2", "MECANICA"),
("TI3", "ELECTRICIDAD"),
("TI4", "ACCESORIOS");
select * from Tipo;

insert into Pieza
values
("PI1", "FILTRO", "TI4"),
("PI2", "BATERIA", "TI3"),
("PI3", "ACEITE", "TI2"),
("PI4", "RADIO", "TI4"),
("PI5", "EMBRAGE", "TI2"),
("PI6", "ALETA", "TI1"),
("PI7", "PILOTO", "TI3"),
("PI8", "CALENTADOR", "TI2"),
("PI9", "CORREAS", "TI4");
select * from Pieza;

insert into Relacion
values
("ME1", "1234-CDF", "PE1", "PI1", 23),
("ME1", "0123-BVC", "PE2", "PI2", 98),
("ME1", "1456-BNL", "PE3", "PI6", 124),
("ME1", "4567-BCB", "PE4", "PI5", 245),
("ME2", "0987-CCC", "PE1", "PI9", 345),
("ME2", "0987-CCC", "PE1", "PI8", 232),
("ME2", "0987-BFG", "PE2", "PI1", 17),
("ME2", "4567-BCB", "PE3", "PI7", 99),
("ME2", "1111-CSA", "PE4", "PI4", 124),
("ME2", "1111-CSA", "PE4", "PI2", 153),
("ME3", "1456-BNL", "PE6", "PI3", 89),
("ME3", "1456-BNL", "PE1", "PI4", 232),
("ME3", "1234-CDF", "PE2", "PI8", 235),
("ME3", "1111-CSA", "PE3", "PI9", 567),
("ME3", "0123-BVC", "PE5", "PI6", 232),
("ME3", "0987-CCC", "PE4", "PI2", 78),
("ME1", "0987-BFG", "PE5", "PI3", 64),
("ME2", "1234-CDF", "PE6", "PI5", 234),
("ME1", "0987-BFG", "PE6", "PI9", 345),
("ME2", "1234-CDF", "PE6", "PI1", 12),
("ME1", "1234-CDF", "PE1", "PI6", 187),
("ME3", "1111-CSA", "PE3", "PI4", 345),
("ME1", "0123-BVC", "PE2", "PI3", 72),
("ME2", "0123-BVC", "PE6", "PI3", 89);
select * from Relacion;

#CONSULTAS:
#1.- DATOS DEL EMPLEADO DE MAYOR SUELDO.
select * from Mecanico order by Sueldo desc limit 1;
#2.- DATOS DEL EMPLEADO MAYOR.
select * from Mecanico order by FEC_NAC asc limit 1;
#3.- DATOS DEL EMPLEADO MENOR.
select * from Mecanico order by FEC_NAC desc limit 1;
#4.- DATOS DE TODOS LOS COCHES DIESEL.
select * from Coche where TIPO like "DIESEL";
#5.- DATOS DEL COCHE QUE MAS HA IDO AL TALLER.
select * from Periodo where FEC_INI;
#6.- PRECIO TOTAL DE TODAS LAS REPARACIONES.
select PRECIO from Relacion;
#7.- NOMBRE DE PIEZA Y TIPO DE LA PIEZA MAS USADA.
select Pieza.NOM_PIEZ, Tipo.NOM_TIPO, count(*) as numApararicion 
from Relacion
join Pieza on Relacion.ID_PIEZ = Pieza.ID_PIEZ
join Tipo on Pieza.ID_TIPO = Tipo.ID_TIPO
group by Pieza.ID_TIPO 
order by count(*) DESC
LIMIT 1 ;
#8.- NOMBRE Y TIPO DE LA PIEZA MENOS USADA.
select p.NOM_PIEZ, t.NOM_TIPO from Pieza p
inner join Tipo t on t.ID_TIPO = p.ID_TIPO
inner join (
			select ID_PIEZ, COUNT(*) NumUsos
            from Relacion
            group by ID_PIEZ
            ORDER BY NumUsos asc limit 1
) min_usos on min_usos.ID_PIEZ = p.ID_PIEZ;

#9.- MATRICULA, MARCA, MODELO COLOR PIEZA Y TIPO DE TODOS LOS COCHES REPARADOS.
select c.*, p.NOM_PIEZ, t.NOM_TIPO from Coche c
inner join Relacion r on r.MAT_CO = c.MAT_CO
inner join Pieza p on p.ID_PIEZ = r.ID_PIEZ
inner join Tipo t on t.ID_TIPO = p.ID_TIPO;
#10.- MODELO DE PIEZA Y TIPO PUESTAS A ‘0123-BVC’
select p.NOM_PIEZ, t.NOM_TIPO from Pieza p
inner join Tipo t on t.ID_TIPO = p.ID_TIPO
inner join Relacion r on r.ID_PIEZ = p.ID_PIEZ
where MAT_CO like "0123-bvc";
#11.-DINERO QUE HA GASTADO EN REPARACIONES 1234-CDF
select sum(r.PRECIO) from Relacion r
where r.MAT_CO like "1234-cdf";
#12.- DATOS DEL COCHE QUE MAS HA GASTADO EN REPARACIONES
select * from Coche c
inner join Relacion r on r.MAT_CO = c.MAT_CO
order by PRECIO desc limit 1;
#13- DATOS DEL COCHE QUE MENOS HA GASTADO EN REPARACIONES.
select * from Coche c
inner join Relacion r on r.MAT_CO = c.MAT_CO
order by PRECIO asc limit 1;
#14.- DATOS DEL COCHE QUE MENOS HA GASTADO EN EL TALLER.
select * from Coche c
inner join (
			select MAT_CO, count(ID_PIEZ) as ip
            from relacion r
            group by MAT_CO
			) 
as r on r.MAT_CO = c.MAT_CO 
order by ip desc limit 1;

#15.- TOTAL DE TODAS LAS REPARACIONES DE ‘ANA LUCAS’.
select count(m.ID_MEC) as numReparaciones FROM Mecanico m
inner join Relacion r on r.ID_MEC = m.ID_MEC
where m.NOM_MEC like "Ana Lucas";
#16.- DATOS DE LOS COCHES Y LAS PIEZAS PUESTAS POR ‘JUAN ROMUALDO’.
Select * from Coche c, Pieza p
inner join Relacion r on r.MAT_CO = c.MAT_CO
inner join Mecanico m on m.ID_MEC = r.ID_MEC
where m.NOM_MEC like "Juan Romualdo";
#17.- FECHA DE INICIO Y FIN DEL PERIODO EN QUE MAS SE HA TRABAJADO.
select FEC_INI, FEC_FIN, datediff(FEC_FIN, FEC_INI) DuracionP from Periodo p
order by DuracionP asc limit 1;
#18.- FECHA DE INICIO Y FIN DEL PERIODO QUE MENOS SE HA TRABAJADO.
select FEC_INI, FEC_FIN, datediff(FEC_FIN, FEC_INI) DuracionP from Periodo p
order by DuracionP desc limit 1;
#19.-DINERO QUE SE HA HECHO EN EL PERIODO PE2
select sum(PRECIO) from Relacion r
where ID_PER like "pe2";
#20.- DATOS DE LOS COCHES LA QUE SE LE HALLA PUESTO UN EMBRAGE
select * from Coche c
inner join Relacion r on c.MAT_CO = r.MAT_CO
inner join Pieza p on p.ID_PIEZ = r.ID_PIEZ
where p.NOM_PIEZ like "embrage";
#21.- DATOS DE LOS COCHES A LOS QUE SE LES HALLA CAMBIADO EL ACEITE.
select * from Coche c
inner join Relacion r on c.MAT_CO = r.MAT_CO
inner join Pieza p on p.ID_PIEZ = r.ID_PIEZ
where p.NOM_PIEZ like "aceite";
#22.- DATOS DE LOS MECANICOS QUE HALLAN PUESTO ALGUNA PIEZA DE TIPO‘ELECTRICIDAD’.
select distinct * from Mecanico m
inner join Relacion r on m.ID_MEC = r.ID_MEC
inner join Pieza p on p.ID_PIEZ = r.ID_PIEZ
inner join Tipo t on t.ID_TIPO = p.ID_TIPO
where t.NOM_TIPO like "electricidad";
#23.- MONTANTE ECONOMICO DE TODAS LAS PIEZAS DE TIPO CHAPA.
select sum(r.PRECIO) MontanteEco
from Relacion r
inner join Pieza p on r.ID_PIEZ = p.ID_PIEZ
inner join Tipo t on p.ID_TIPO = t.ID_TIPO
where t.NOM_TIPO like "chapa";
#24.- TIPO DE PIEZA QUE MAS DINERO HA DEJADO EN EL TALLER.
select * from Tipo t
inner join Pieza p on p.ID_TIPO = t.ID_TIPO
inner join Relacion r on r.ID_PIEZ = p.ID_PIEZ
Order by PRECIO desc limit 1; 
#25.-DATOS DEL MECANICO QUE MENOS HA TRABAJADO. 
select m.*, count(r.ID_MEC) NumReparaciones 
from Mecanico m
inner join Relacion r on r.ID_MEC = m.ID_MEC
group by m.ID_MEC
order by NumReparaciones asc limit 1;
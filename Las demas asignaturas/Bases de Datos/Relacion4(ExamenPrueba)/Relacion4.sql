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
create database if not exists Relacion4;
use Relacion4;
#Crear la tabla Mecanico
create table if not exists Mecanico(
    ID_MEC varchar(3) primary key not null,
    NOM_MEC char(40),
    SUELDO double,
    FEC_NAC date
);
#Crear la tabla Coche
create table if not exists Coche(
    MAT_CO varchar(8) primary key not null,
    MOD_CO char(20),
    COLOR char(13),
    TIPO char(13)
);
#Crear la tabla Periodo
create table if not exists Periodo(
    ID_PER varchar(3) primary key not null,
    FEC_INI date,
    FEC_FIN date
);
#Crear la tabla Tipo
create table if not exists Tipo(
    ID_TIPO varchar(10) primary key,
    NOM_TIPO char(40)
);
#Crear la tabla Pieza
create table if not exists Pieza(
    ID_PIEZ varchar(3) primary key not null,
    NOM_PIEZ char(40),
    ID_TIPO varchar(10),
    foreign key(ID_TIPO) references Tipo(ID_TIPO)
);
#Crear la tabla Relacion
create table if not exists Relacion(
    ID_MEC varchar(3),
    MAT_CO varchar(8),
    ID_PER varchar(3),
    ID_PIEZ varchar(3),
    PRECIO double,
    foreign key(ID_MEC) references Mecanico(ID_MEC),
    foreign key(MAT_CO) references Coche(MAT_CO),
    foreign key(ID_PER) references Periodo(ID_PER),
    foreign key(ID_PIEZ) references Pieza(ID_PIEZ)
);
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
("TI1" "CHAPA"),
("TI2" "MECANICA"),
("TI3" "ELECTRICIDAD"),
("TI4" "ACCESORIOS");

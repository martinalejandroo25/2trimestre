create database if not exists meteo;
USE meteo;

create table if not exists Estacion(
Identificador int auto_increment primary key,
Latitud double,
Longitud double,
Altitud double
);
create table if not exists Muestra (
IdentificadorEstacion int,
fecha date,
Temperatura_minima tinyint,
Temperatura_maxima tinyint,
Precipitaciones smallint unsigned,
humedad_Minima tinyint unsigned,
humedad_Maxima tinyint unsigned,
Velocidad_viento_Minima smallint unsigned,
Velocidad_viento_Maxima smallint unsigned,
foreign key (IdentificadorEstacion) references Estacion(Identificador)
on delete restrict on update cascade
);

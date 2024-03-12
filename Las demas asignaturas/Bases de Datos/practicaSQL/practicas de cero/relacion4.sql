drop database if exists relacion4;
create database  if not exists relacion4;
use relacion4;

create table if not exists mecanico (
ID_MEC char(4) primary key,
NOM_MEC varchar(20),
SUELDO int, 
FEC_NAC date
);
create table if not exists coche(
MAT_CO char(8),
MOD_CO varchar(20),
COLOR varchar(6),
TIPO varchar(8)
);
create table if not exists periodos(
ID_PER char(3) primary key,
FEC_INI date,
FEC_FIN date
);
create table if not exists pieza(
ID_PIEZ
NOM_PIEZ
ID_TIPO
);
create table if not exists tipo (
ID_TIPO
NOM_TIPO
);
create table if not exists relacion4(
ID_MEC char(4),
MAT_CO char(8),
ID_PER char(4),
ID_PIEZ char(4),
PRECIO double,
primary key (ID_MEC, MAT_CO, ID_PER, ID_PIEZ)
foreign
);

-- CONSULTAS:

#1.- DATOS DEL EMPLEADO DE MAYOR SUELDO.
SELECT * FROM Mecanico ORDER BY SUELDO DESC LIMIT 1;

#2.- DATOS DEL EMPLEADO MAYOR.
SELECT * FROM Mecanico ORDER BY SUELDO DESC LIMIT 1;

#3.- DATOS DEL EMPLEADO MENOR.
SELECT * FROM Mecanico ORDER BY SUELDO ASC LIMIT 1;

#4.- DATOS DE TODOS LOS COCHES DIESEL.
SELECT * FROM Coche WHERE TIPO = 'DIESEL';

#5.- DATOS DEL COCHE QUE MAS HA IDO AL TALLER.
SELECT c.* FROM Coche c
JOIN Relacion3 r ON c.MAT_CO = r.MAT_CO
GROUP BY c.MAT_CO
ORDER BY COUNT(*) DESC
LIMIT 1;

#6.- PRECIO TOTAL DE TODAS LAS REPARACIONES.
SELECT SUM(PRECIO) AS Total_Reparaciones FROM Relacion3;

#7.- NOMBRE DE PIEZA Y TIPO DE LA PIEZA MAS USADA.
SELECT p.NOM_PIEZ, t.NOM_TIPO 
FROM Pieza p 
JOIN Relacion3 r ON p.ID_PIEZ = r.ID_PIEZ
JOIN Tipo t ON p.ID_TIPO = t.ID_TIPO
GROUP BY p.ID_PIEZ
ORDER BY COUNT(*) DESC
LIMIT 1;

#8.- NOMBRE Y TIPO DE LA PIEZA MENOS USADA.
SELECT p.NOM_PIEZ, t.NOM_TIPO 
FROM Pieza p 
JOIN Relacion3 r ON p.ID_PIEZ = r.ID_PIEZ
JOIN Tipo t ON p.ID_TIPO = t.ID_TIPO
GROUP BY p.ID_PIEZ
ORDER BY COUNT(*) ASC
LIMIT 1;

#9.- MATRICULA, MARCA, MODELO COLOR PIEZA Y TIPO DE TODOS LOS COCHES  REPARADOS.
SELECT c.MAT_CO, c.MOD_CO, c.COLOR, p.NOM_PIEZ, t.NOM_TIPO
FROM Coche c
JOIN Relacion3 r ON c.MAT_CO = r.MAT_CO
JOIN Pieza p ON r.ID_PIEZ = p.ID_PIEZ
JOIN Tipo t ON p.ID_TIPO = t.ID_TIPO;

#10.- MODELO DE PIEZA Y TIPO PUESTAS A ‘0123-BVC’
SELECT p.NOM_PIEZ, t.NOM_TIPO
FROM Pieza p
JOIN Relacion3 r ON p.ID_PIEZ = r.ID_PIEZ
JOIN Coche c ON r.MAT_CO = c.MAT_CO
WHERE c.MAT_CO = '0123-BVC';

#11.-DINERO QUE HA GASTADO EN REPARACIONES 1234-CDF
SELECT SUM(PRECIO) AS Total_Gastado
FROM Relacion3
WHERE MAT_CO = '1234-CDF';

#12.- DATOS DEL COCHE QUE MAS HA GASTADO EN REPARACIONES
SELECT c.*
FROM Coche c
JOIN Relacion3 r ON c.MAT_CO = r.MAT_CO
GROUP BY c.MAT_CO
ORDER BY SUM(r.PRECIO) DESC
LIMIT 1;

#13- DATOS DEL COCHE QUE MENOS HA GASTADO EN REPARACIONES.
SELECT c.*
FROM Coche c
JOIN Relacion3 r ON c.MAT_CO = r.MAT_CO
GROUP BY c.MAT_CO
ORDER BY SUM(r.PRECIO) ASC
LIMIT 1;

#14.- DATOS DEL COCHE QUE MENOS HA GASTADO EN EL TALLER.
SELECT c.*
FROM Coche c
LEFT JOIN Relacion3 r ON c.MAT_CO = r.MAT_CO
GROUP BY c.MAT_CO
ORDER BY IFNULL(SUM(r.PRECIO), 0) ASC
LIMIT 1;

#15.- TOTAL DE TODAS LAS REPARACIONES DE ‘ANA LUCAS’.
SELECT SUM(r.PRECIO) AS Total_Gastado
FROM Relacion3 r
JOIN Mecanico m ON r.ID_MEC = m.ID_MEC
WHERE m.NOM_MEC = 'ANA LUCAS';

#16.- DATOS DE LOS COCHES Y LAS PIEZAS PUESTAS POR ‘JUAN ROMUALDO’.
SELECT c.*, p.*
FROM Coche c
JOIN Relacion3 r ON c.MAT_CO = r.MAT_CO
JOIN Pieza p ON r.ID_PIEZ = p.ID_PIEZ
JOIN Mecanico m ON r.ID_MEC = m.ID_MEC
WHERE m.NOM_MEC = 'JUAN ROMUALDO';

#17.- FECHA DE INICIO Y FIN DEL PERIODO EN QUE MAS SE HA TRABAJADO.
SELECT p.FEC_INI, p.FEC_FIN
FROM Periodo p
JOIN Relacion3 r ON p.ID_PER = r.ID_PER
GROUP BY p.ID_PER
ORDER BY COUNT(r.ID_PER) DESC
LIMIT 1;

#18.- FECHA DE INICIO Y FIN DEL PERIODO QUE MENOS SE HA TRABAJADO.
SELECT p.FEC_INI, p.FEC_FIN
FROM Periodo p
LEFT JOIN Relacion3 r ON p.ID_PER = r.ID_PER
GROUP BY p.ID_PER
ORDER BY COUNT(r.ID_PER) ASC
LIMIT 1;

#19.-DINERO QUE SE HA HECHO EN EL PERIODO PE2
SELECT SUM(r.PRECIO) AS Total_Ganado
FROM Relacion3 r
JOIN Periodo p ON r.ID_PER = p.ID_PER
WHERE p.ID_PER = 'PE2';

#20.- DATOS DE LOS COCHES LA QUE SE LE HALLA PUESTO UN EMBRAGE
SELECT c.*
FROM Coche c
JOIN Relacion3 r ON c.MAT_CO = r.MAT_CO
JOIN Pieza p ON r.ID_PIEZ = p.ID_PIEZ
WHERE p.NOM_PIEZ = 'EMBRAGE';

#21.- DATOS DE LOS COCHES A LOS QUE SE LES HALLA CAMBIADO EL ACEITE.
SELECT c.*
FROM Coche c
JOIN Relacion3 r ON c.MAT_CO = r.MAT_CO
JOIN Pieza p ON r.ID_PIEZ = p.ID_PIEZ
WHERE p.NOM_PIEZ = 'ACEITE';

#22.- DATOS DE LOS MECANICOS QUE HALLAN PUESTO ALGUNA PIEZA DE TIPO  ‘ELECTRICIDAD’.
SELECT m.*
FROM Mecanico m
JOIN Relacion3 r ON m.ID_MEC = r.ID_MEC
JOIN Pieza p ON r.ID_PIEZ = p.ID_PIEZ
JOIN Tipo t ON p.ID_TIPO = t.ID_TIPO
WHERE t.NOM_TIPO = 'ELECTRICIDAD';

#23.- MONTANTE ECONOMICO DE TODAS LAS PIEZAS DE TIPO CHAPA.
SELECT SUM(r.PRECIO) AS Montante_Chapa
FROM Relacion3 r
JOIN Pieza p ON r.ID_PIEZ = p.ID_PIEZ
JOIN Tipo t ON p.ID_TIPO = t.ID_TIPO
WHERE t.NOM_TIPO = 'CHAPA';

#24.- TIPODE PIEZA QUE MAS DINERO HA DEJADO EN EL TALLER.
SELECT t.NOM_TIPO
FROM Relacion3 r
JOIN Pieza p ON r.ID_PIEZ = p.ID_PIEZ
JOIN Tipo t ON p.ID_TIPO = t.ID_TIPO
GROUP BY t.NOM_TIPO
ORDER BY SUM(r.PRECIO) DESC
LIMIT 1;

#25.-DATOS DEL MECANICO QUE MENOS HA TRABAJADO. 
SELECT m.*
FROM Mecanico m
LEFT JOIN Relacion3 r ON m.ID_MEC = r.ID_MEC
GROUP BY m.ID_MEC
ORDER BY COUNT(r.ID_MEC) ASC
LIMIT 1;

-- PRACTICAS
SELECT e.nombre, d.nombre AS departamento
FROM empleados e
LEFT JOIN departamentos d ON e.id_departamento = d.id;
-- En esta consulta, LEFT JOIN se utiliza para incluir todos los empleados, incluso si no tienen un departamento asignado. 
-- La cláusula ON especifica la condición de unión entre las tablas empleados y departamentos.

SELECT departamento, AVG(salario) AS salario_promedio
FROM empleados
GROUP BY departamento
HAVING AVG(salario) > 50000;
-- En esta consulta, HAVING se utiliza para filtrar los departamentos que tienen un salario promedio superior a 50000.
-- La cláusula GROUP BY agrupa los resultados por departamento y la función AVG calcula el salario promedio para cada departamento.


SELECT e.nombre, d.nombre AS departamento
FROM empleados e
LEFT JOIN (
    SELECT id, nombre
    FROM departamentos
) AS d ON e.id_departamento = d.id;
-- En esta consulta, se utiliza una subconsulta para seleccionar solo las columnas necesarias de la tabla departamentos.
-- El LEFT JOIN se utiliza para incluir todos los empleados, incluso si no tienen un departamento asignado.

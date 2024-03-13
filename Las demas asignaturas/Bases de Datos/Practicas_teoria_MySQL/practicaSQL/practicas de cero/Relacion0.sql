create database if not exists relacion0;
use relacion0;
create table if not exists cliente(
    NIF CHAR(9) primary key,
    NOMBRE VARCHAR(25) NOT NULL,
    DOMICILIO VARCHAR(100),
    TLF VARCHAR(25),
    CIUDAD VARCHAR(50)
);
create table if not exists producto(
    CODIGO CHAR(4) primary key,
    DESCRIPCION VARCHAR(100) NOT NULL,
    PRECIO FLOAT CHECK (PRECIO > 0),
    STOCK FLOAT,
    MINIMO FLOAT 
);
create table if not exists factura(
    NUMERO INT primary key,
    FECHA DATE,
    PAGADO BOOL,
    NIF_cliente CHAR(9), 
    TOTAL_PRECIO FLOAT,
    foreign key (NIF_cliente) references cliente(NIF)
    on delete cascade on update restrict
);
create table if not exists detalle(
    NUMERO INT,
    CODIGO CHAR(4),
    UNIDADES INT,
    primary key(NUMERO, CODIGO),
    foreign key (NUMERO) references factura(NUMERO) 
    on delete cascade on update restrict,
    foreign key (CODIGO) references producto(CODIGO)
    on delete cascade on update restrict
);
INSERT INTO cliente
VALUES (
        "43434343A",
        "DELGADO PEREZ MARISA",
        "C/ MIRAMAR,84 3ºA",
        "925-200-967",
        "TOLEDO"
    ),
    (
        "51592939K",
        "LOPEZ VAL SOLEDAD",
        "C/PEZ, 54 4ºC",
        "915-829-394",
        "MADRID"
    ),
    (
        "51639989K",
        "DELGADO ROBLES MIGUEL",
        "C/ OCA, 54 5ºC",
        "913-859-293",
        "MADRID"
    ),
    (
        "51664372R",
        "GUTIERREZ PEREZ ROSA",
        "C/ CASTILLA, 4 4ºA",
        "919-592-932",
        "MADRID"
    );
    insert into producto 
    VALUES
    (
        "CAJ1", 
        "CAJA DE HERRAMIENTAS DE PLASTICO",
        8.50, 
        4.00, 
        3
    ),
    (
        "CAJ2", 
        'CAJA DE HERRAMIENTAS DE METAL',
        12.30, 
        3.00, 
        2
    ),
    (
        "MAR1", 
        "MARTILLO PEQUEÑO",
        3.50, 
        5, 
        10
    ),
    (
        "MAR2", 
        'MARTILLO GRANDE',
        6.50, 
        12, 
        10
    ),
    (
        "TOR7", 
        "CAJA 100 TORNILLOS DEL 7",
        0.80, 
        20, 
        100
    ),
    (
        "TOR8", 
        "CAJA 100 TORNILLOS DEL 9",
        0.80, 
        25, 
        100
    ),
    (
        "TUE1", 
        "CAJA 1OO TUERCAS DEL 7",
        0.50, 
        40, 
        100
    ),
    (
        "TUE2", 
        "CAJA 1OO TUERCAS DEL 9",
        0.50, 
        54, 
        100
    ),
    (
        "TUE3", 
        "CAJA 1OO TUERCAS DEL 12",
        0.50, 
        60, 
        100
    );
    INSERT into factura VALUES
    (5440, "2017-09-05", TRUE, "51664372R", 345),
    (5441, "2017-09-06", FALSE, "51592939K", 1000),
    (5442, "2017-09-07", FALSE, "43434343A", 789),
    (5443, "2017-09-08", TRUE, "51639989K", 123.78),
    (5444, "2017-09-09",TRUE, "51639989K", 567),
    (5445, "2017-09-10", TRUE, "51592939K", 100);
    
    insert into detalle VALUES
    (5440, "CAJ2", 2),
    (5440, "MAR1", 1),
    (5440, "TOR7", 2),
    (5440, "TOR8", 2),
    (5441, "CAJ1", 1),
    (5442, "CAJ1", 1),
    (5442, "MAR1", 2),
    (5443, "TOR7", 1),
    (5443, "TUE1", 1),
    (5444, "MAR2", 1),
    (5445, "TOR7", 5),
    (5445, "TOR8", 5),
    (5445, "TUE2", 5),
    (5445, "TUE3", 5);
    
    -- CONSULTAS A REALIZAR
    
    -- a. Mostrar todos los datos introducidos en cada una de las tablas
    select * from producto, detalle, factura, cliente;
    -- b. Reemplazar la ciudad del cliente con DNI 51664372R por Granada.
    update cliente set ciudad = "GRANADA" where NIF = "51664372R";
    -- c. Actualizar todos los precios de los productos con un aumento del 10%
    update producto set PRECIO = PRECIO * 1.10;
    -- d. Aumentar el stock en 20 unidades para todos los productos y disminuir el precio de los productos en un 30% 
    update producto set stock = stock + 20 and PRECIO = PRECIO - 1.30;
    -- e. A los productos en los que haya un mínimo de 100 unidades, hacerle un descuento al precio del 50%
    update producto set PRECIO = PRECIO - 1.5 where stock >= 100;
    -- f. Eliminar al cliente cuyo dni sea 51664372R
    delete from cliente where NIF like "51664372R";
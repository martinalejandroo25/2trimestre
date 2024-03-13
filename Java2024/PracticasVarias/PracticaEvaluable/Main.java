package PracticaEvaluable;
import java.time.LocalDate;
import java.util.Date;
/* Escribe un programa principal Main (1 punto) que:

- Cree al menos seis productos, tres de cada subclase.

- Cree un envío y agregue tres productos de difrente tipo al envío. Asignale fecha de
llegada.
- Crea otro envío y agrega los otros tres productos a este envío. Asignale fecha de
llegada.
- Agregue los envíos a un servicio de envío.
- Genere e imprima el informe de envíos.*/

import java.time.LocalDateTime;

public class Main {
    public static void main(String[] args) {
        ProductoFragil p1 = new ProductoFragil("vasos de cristal", 23, 2 );
        ProductoFragil p2 = new ProductoFragil("Platos cerámica", 32, 1);
        ProductoFragil p3 = new ProductoFragil("Televisión", 9, 2);
        ProductoRefrigerado p4 = new ProductoRefrigerado("Espinacas congeladas", 7, 1);
        ProductoRefrigerado p5 = new ProductoRefrigerado("patatas fritas congeladas", 8, 1);
        ProductoRefrigerado p6 = new ProductoRefrigerado("Cubitos de hielo", 13, 2);
        Producto p7 = new Producto("Cereales envasados", 1);

        Envio e1 = new Envio();
        e1.agregarTransportable(p2);
        e1.agregarTransportable(p7);
        e1.agregarTransportable(p6);
        e1.setFechaLlegada(LocalDate.now().plusDays(10));
    }
}

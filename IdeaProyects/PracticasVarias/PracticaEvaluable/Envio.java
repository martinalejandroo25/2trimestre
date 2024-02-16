package PracticaEvaluable;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.Date;
/*Crea una clase Envio que contenga un ArrayList de objetos que implementen la interfaz
Transportable. Además, lleva dos campos, fechaSalida y fechaLlegada. El constructor no lleva
ningún parámetro, la fecha de salida es ahora, la de llegada es null, y hay que inicializar el
ArrayList. Además de getters y setters necesarios, Incluye los siguientes métodos:

- agregarTransportable(Transportable item): Agrega un objeto transportable al envío.

- calcularCostoTotalEnvio(): Calcula y devuelve el costo total de envío de todos los
objetos en el envío.

- listarProductos(): Muestra la información de todos los productos en el envío, con el
coste de cada uno.

- diasTranscurridos(): devuelve los días que han pasado entre la fecha de salida del
almacén y la de llegada a destino.*/
public class Envio implements Transportable {
    public Envio() {
    }

    private ArrayList<Transportable> productos = new ArrayList<Transportable>();

    private LocalDate fechaSalida;
    private LocalDate fechaLlegada;


    public LocalDate getFechaSalida() {
        return fechaSalida;
    }

    public void setFechaSalida(LocalDate fechaSalida) {
        this.fechaSalida = fechaSalida;
    }

    public LocalDate getFechaLlegada() {
        return fechaLlegada;
    }

    public void setFechaLlegada(LocalDate fechaLlegada) {
        this.fechaLlegada = fechaLlegada;
    }

    public void agregarTransportable(Transportable item) {
        productos.add(item);
    }

    public double calcularCostoTotalEnvio() {
        double costoTotal = 0;
        for (int i = 0; i < productos.size(); i++) {
            costoTotal += productos.get(i).calcularCostoEnvio(esEnvioInternacional());
        }
        return costoTotal;
    }

    public void listarProductos() {
        for (int i = 0; i < productos.size(); i++) {
            System.out.println(productos.get(i));
        }
    }

    public int diasTranscurridos() {
        Period periodo = Period.between(this.fechaLlegada, this.fechaSalida);
        return periodo.getDays();

    }
}

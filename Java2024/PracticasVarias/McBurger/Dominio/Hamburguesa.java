package McBurger.Dominio;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Hamburguesa extends Comida {
    private LocalDate fechaCaducidad;

    /*Pasar como String la fecha de caducidad de Hamburguesa*/
    public Hamburguesa(String fechaCaducidad){
        super("Hamburguesa");
        // Usar Datetimeformatter para usar otro patrón de fecha, ya que por defecto usará el formato ingles(yyyy/MM/dd)
        DateTimeFormatter formateadorFecha = DateTimeFormatter.ofPattern("dd/MM/yyy"); //mes en MM ya que si no pilla mm como minutos
        this.fechaCaducidad = LocalDate.parse(fechaCaducidad, formateadorFecha);
    }

    @Override
    public void cocinar() {

    }

    @Override
    public void freir() {

    }

    @Override
    public void asar() {

    }

    /*El precio de una hamburguesa es de 3,50 €.*/
    @Override
    public double obtenerPrecio() {
        //Si falta 1 día para que caduque, se le hará un descuento del 50 %.
        if (this.fechaCaducidad.isBefore(LocalDate.now())) {
            return super.obtenerPrecio() - (super.obtenerPrecio() * 0.5);
        }
        //Si faltan 2 días para que caduque, se le hará un descuento del 40 %.
        else if (this.fechaCaducidad.isBefore(LocalDate.now().plusDays(1))) {
            return super.obtenerPrecio() - (super.obtenerPrecio() * 0.4);
        }
        //Si faltan 3 días para que caduque, se le hará un descuento del 30 %.
        else if (this.fechaCaducidad.isBefore((LocalDate.now().plusDays(2)))){
            return super.obtenerPrecio() - (super.obtenerPrecio() * 0.3);
        }
        //Si faltan 4 días para que caduque, se le hará un descuento del 20 %.
        else if (this.fechaCaducidad.isBefore((LocalDate.now().plusDays(3)))){
            return super.obtenerPrecio() - (super.obtenerPrecio() * 0.2);
        }
        return super.obtenerPrecio();
    }
}

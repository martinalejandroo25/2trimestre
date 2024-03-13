//[]Sin empezar, [x]terminado, [-] incompleto o a revisar
package Asiento;

/*Añade atributos:
[x]boolean ventana
[X]Constructor (el tipo lo pone a Turista),
[X]getters, setters,
[]toString (codigo, precio, tipo, tiene ventana, dni Pasajero)
Métodos extra:
[x]- calcularPrecio(): devuelve el precio del asiento. Suma 10€ si es un asiento de ventana.*/
public class AsientoTurista extends Asiento {
    public boolean ventana;
    public TipoAsiento tipo;
    public AsientoTurista(long id, double precioBase, TipoAsiento tipo, Integer fila, String letra, boolean ventana) {
        super(id, precioBase, fila, letra);
        this.ventana = ventana;
        this.tipo = TipoAsiento.TURISTA;
    }

    public boolean isVentana() {
        return ventana;
    }

    public void setVentana(boolean ventana) {
        this.ventana = ventana;
    }



    @Override
    public double calcularPrecio() {
        if(ventana){
            return getPrecioBase()+10;
        }else
            return getPrecioBase();
    }
}

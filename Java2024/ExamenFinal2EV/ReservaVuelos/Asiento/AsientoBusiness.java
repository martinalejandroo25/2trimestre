//[]Sin empezar, [x]terminado, [-] incompleto o a revisar
package Asiento;
/*Añade atributos:
[x]boolean comida
[X]Constructor (el tipo lo pone a Business),
[]getters, setters,
[]toString (codigo, precio, tipo, tiene comida, dni Pasajero)
Métodos extra:
[x]- calcularPrecio(): devuelve el precio del asiento, suma 25% al precioBase. Si incluye comida suma 30€.*/
public class AsientoBusiness extends Asiento {
    private boolean comida;
    private TipoAsiento tipo;

    public AsientoBusiness(long id, double precioBase, TipoAsiento tipo, Integer fila, String letra, boolean comida) {
        super(id, precioBase, fila, letra);
        this.comida = comida;
        this.tipo = TipoAsiento.BUSINESS;
    }

    @Override
    public double calcularPrecio() {
        if(comida){
            return (getPrecioBase()*0.25)+30;
        } else {
            return getPrecioBase()*0.25;
        }
    }
}

package PracticaEvaluable;
/*Crea una interfaz llamada Transportable con los métodos:
- calcularCostoEnvio(boolean esInternacional) que devuelve el costo de envío del objeto
que implementa la interfaz.
- boolean esEnvioInternacional()*/
public interface Transportable {
    public default double calcularCostoEnvio(boolean esEnvioInternacional){
        return 20;
    }
    public default boolean esEnvioInternacional(){
        return false;
    }
}

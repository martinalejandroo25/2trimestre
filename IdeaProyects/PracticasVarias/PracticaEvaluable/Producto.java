package PracticaEvaluable;
/*Crea una clase Producto con los siguientes atributos:
- nombre (String)
- peso (double)
Incluye un constructor y métodos getter y setter para cada atributo. Implementa la interfaz
Transportable en esta clase: el costo base es de 20€, si es internacional le sumamos 30€. Le
sumamos un coste por peso (peso * 0.2).*/
public class Producto implements Transportable{
    private String nombre;
    private double peso;

    public Producto() {
    }

    public Producto(String nombre, double peso) {
        this.nombre = nombre;
        this.peso = peso;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }
}

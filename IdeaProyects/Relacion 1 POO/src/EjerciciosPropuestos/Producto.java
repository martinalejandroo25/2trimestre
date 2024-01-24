package EjerciciosPropuestos;

import java.util.Objects;

/*Producto {
    String nombre;
    double precio;

    Constructor parametrizado
    Constructor copia
    Getters y setters
    toString()
    equals(nombre)
}*/
public class Producto {
    private String nombre;
    private double precio;

    public Producto(String nombre) {

    }
    public Producto(String nombre, double precio) {

    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Producto{");
        sb.append("nombre='").append(nombre).append('\'');
        sb.append(", precio=").append(precio);
        sb.append('}');
        return sb.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Producto producto)) return false;
        return Double.compare(precio, producto.precio) == 0 && Objects.equals(nombre, producto.nombre);
    }

    @Override
    public int hashCode() {
        return Objects.hash(nombre, precio);
    }
}

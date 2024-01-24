package EjerciciosPropuestos.Tienda;

import java.util.ArrayList;
import java.util.Objects;

/*Tienda{
    String nombre;
    ArrayList<Producto> productos;

    Constructor
    Getters y setters(nombre)
    toString()
    equals(nombre)
    addProducto(producto prod)
}*/
public class Tienda {
    private String nombre;
    private ArrayList<Producto> productos;

    public Tienda(String nombre) {

    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public ArrayList<Producto> getProductos() {
        return productos;
    }

    public void setProductos(ArrayList<Producto> productos) {
        this.productos = productos;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Tienda{");
        sb.append("nombre='").append(nombre).append('\'');
        sb.append(", productos=").append(productos);
        sb.append('}');
        return sb.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Tienda tienda)) return false;
        return Objects.equals(nombre, tienda.nombre) && Objects.equals(productos, tienda.productos);
    }

    @Override
    public int hashCode() {
        return Objects.hash(nombre, productos);
    }
    public void addProducto(Producto producto){

    }

}

package EjerciciosPropuestos.Tienda;

import java.util.ArrayList;

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
        this.nombre = nombre;
        this.productos = new ArrayList<>();
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
        sb.append('\n');
        for (int i = 0; i < productos.size() ; i++) {
            sb.append(productos.get(i));
            sb.append("\n");
        }
        sb.append('}');
        return sb.toString();
    }

    public void addProducto(Producto producto) {
        this.productos.add(producto);
    }
}

package src.Relacion4.Multimedia;

import src.Relacion4.Genero;

public class Pelicula extends Multimedia {
    private int duracion;

    public Pelicula() {

    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Pelicula{");
        sb.append("duracion=").append(duracion);
        sb.append('}');
        return sb.toString();
    }
    public double getPrecio() {
        return super.getPrecio();
    }

    public Pelicula(String titulo, boolean plus, double precio, Genero genero, int duracion) {
        super();
        this.duracion = duracion;
    }
}

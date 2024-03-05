package src.Relacion4.Multimedia;

import src.Relacion4.Genero;

import java.util.Objects;

public class Multimedia {
    private static long autoincremento = 1;
    private long codigo;
    private String titulo;
    private boolean plus;
    private double precio;
    private Genero genero;

    public Multimedia() {
    }

    public Multimedia(String titulo, boolean plus, double precio, Genero genero, long codigo) {
        this.titulo = titulo;
        this.plus = plus;
        this.precio = precio;
        this.genero = genero;
        this.codigo = autoincremento;
        autoincremento++;
    }

    public long getAutoincremento() {
        return autoincremento;
    }

    public void setAutoincremento(long autoincremento) {
        this.autoincremento = autoincremento;
    }

    public long getCodigo() {
        return codigo;
    }

    public void setCodigo(long codigo) {
        this.codigo = codigo;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public Genero getGenero() {
        return genero;
    }

    public void setGenero(Genero genero) {
        this.genero = genero;
    }

    public boolean isPlus() {
        return plus;
    }

    public void setPlus(boolean plus) {
        this.plus = plus;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Multimedia{");
        sb.append("codigo=").append(codigo);
        sb.append(", titulo='").append(titulo).append('\'');
        sb.append(", plus=").append(plus);
        sb.append(", precio=").append(precio);
        sb.append(", genero=").append(genero);
        sb.append('}');
        return sb.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false; //Borrar siempre con los equals el || getClass() != o.getClass() para evitar errores
        Multimedia that = (Multimedia) o;
        return codigo == that.codigo;
    }

    @Override
    public int hashCode() {
        return Objects.hash(codigo);
    }

    public Multimedia(String titulo, boolean plus, double precio, Genero genero) {
        this.titulo = titulo;
        this.plus = plus;
        this.precio = precio;
        this.genero = genero;
    }

}

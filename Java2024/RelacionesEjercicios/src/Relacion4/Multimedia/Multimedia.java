package Relacion4.Multimedia;

import Relacion4.Genero;

public class Multimedia {
    private long autoincremento = 1;
    private long codigo;
    private String titulo;
    private boolean plus;
    private double precio;
    private Genero genero;

    public Multimedia() {

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
}

package src.Relacion4.Multimedia.Series;

public class Episodio {
    private String titulo;
    private int duracion;

    public Episodio() {
    }

    public Episodio(String titulo, int duracion) {
        this.titulo = titulo;
        this.duracion = duracion;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Episodio{");
        sb.append("titulo='").append(titulo).append('\'');
        sb.append(", duracion=").append(duracion);
        sb.append('}');
        return sb.toString();
    }
}


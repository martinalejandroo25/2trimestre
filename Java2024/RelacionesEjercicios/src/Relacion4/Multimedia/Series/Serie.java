package src.Relacion4.Multimedia.Series;

import src.Relacion4.Genero;

import java.util.ArrayList;

public class Serie {
    private ArrayList<Temporada> temporadas = new ArrayList<>();

    public Serie() {
    }
    public int NumeroTemporadas() {
        return temporadas.size();
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Serie{");
        sb.append("temporadas=").append(temporadas);
        sb.append('}');
        return sb.toString();
    }
    public Serie(String titulo, boolean plus, double precio, Genero genero) {
        super();
    }
    public Temporada addTemporada(Temporada temporada) {
        Temporada Temporada = null;
        temporadas.add(Temporada);
        return Temporada;
    }
    public boolean delTemporada(Temporada temporada) {
        if (temporadas.contains(temporada)){
            temporadas.remove(temporada);
            return true;
        } else
            System.out.println("Temporada no existente");
            return false;
    }
}

package src.Relacion4.Multimedia.Series;

import src.Relacion4.Multimedia.Series.Episodio;

import java.util.ArrayList;

public class Temporada {
    ArrayList<Episodio> episodios = new ArrayList<>();
     private int numero;

    public Temporada() {
    }

    public Temporada(int numero) {
        this.numero = numero;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Temporada{");
        sb.append("episodios=").append(episodios);
        sb.append(", numero=").append(numero);
        sb.append('}');
        return sb.toString();
    }
    public Episodio addEpisodio(Episodio episodio){
        episodios.add(episodio);
        return  episodio;
    }
    public boolean delEpisodio(Episodio episodio){
        if(episodios.contains(episodio)){
            episodios.remove(episodio);
            return true;
        } else
            System.out.println("Episodio no existente");
            return false;

    }
}

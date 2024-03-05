package src.Relacion4.Aplicacion;
import src.Relacion4.*;
import src.Relacion4.Cliente.Cliente;
import src.Relacion4.Multimedia.Multimedia;
import src.Relacion4.Multimedia.Series.Episodio;
import src.Relacion4.Multimedia.Series.Serie;
import src.Relacion4.Multimedia.Series.Temporada;

public class main {
    public static void main(String[] args) {
        PrimeVideo pv = new PrimeVideo();

        for (int i = 0; i < 10; i++) {
            Serie serie = new Serie("Serie"+i, true, 12, Genero.INFANTIL);
            addTemporadaEpisodio(serie);
                pv.addMultimedia(serie);
        }

    }
    private static void addTemporadaEpisodio(Serie serie){
        for(int i=0; i<10; i++) {
            Temporada t = new Temporada(i);
            for(int j=0; j<10; j++) {
                t.addEpisodio(new Episodio("Episodio "+j+" "+serie.getTitulo(), 50));
            }
            serie.addTemporada(t);
        }
    }


}

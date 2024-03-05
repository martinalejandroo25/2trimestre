package src.Relacion4.Aplicacion;

import src.Relacion4.Cliente.Cliente;
import src.Relacion4.Cliente.ClientePrime;
import src.Relacion4.Cliente.ClientePrimePro;
import src.Relacion4.Genero;
import src.Relacion4.Multimedia.Multimedia;
import src.Relacion4.Multimedia.Pelicula;
import src.Relacion4.PrimeVideo;

public class test {
    /*En una clase Test calcula las ganancias anuales de la empresa si tiene 200 pelis (30 son plus a 10€ cada una) y
1.000.000 de clientes (25% son pro). Simula que cada cliente vea las 40 primeras películas y dime las ganancias*/
    public static void main(String[] args) {
        PrimeVideo pv = new PrimeVideo();
        for (int i = 0; i < 1000000; i++) {
            if(i<250000){
                ClientePrimePro cliente = new ClientePrimePro("Cliente"+i,"Nombre"+i , ("cliente"+i+"@gmail.com"));
                pv.addSuscriptor(cliente);
            }
            else{
                ClientePrime cliente = new ClientePrime("Cliente"+i,"Nombre"+i , ("cliente"+i+"@gmail.com"));
                pv.addSuscriptor(cliente);
            }
        }
        for (int i = 0; i < 200; i++) {
            if (i<30){
                Pelicula pelicula = new Pelicula("peli"+i, true, 10, Genero.TERROR, 90);
                pv.addMultimedia(pelicula);
            } else {
                Pelicula pelicula = new Pelicula("peli"+i, false, 5, Genero.INFANTIL, 75);
                pv.addMultimedia(pelicula);
            }
        }pv.ver(pv.getCatalogo(), pv.getSuscriptores());
    }
}

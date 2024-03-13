package src.Relacion4;

import src.Relacion4.Multimedia.Multimedia;
import src.Relacion4.Cliente.Cliente;

import java.util.ArrayList;

public class PrimeVideo{
    ArrayList<Multimedia> catalogo = new ArrayList<Multimedia>();
    ArrayList<Cliente> suscriptores = new ArrayList<Cliente>();
    public double ganancias;

    public PrimeVideo() {

    }


    public double getGanancias() {
        return ganancias;
    }
    public ArrayList<Multimedia> getCatalogo(){
        return catalogo;
    }

    public ArrayList<Cliente> getSuscriptores() {
        return suscriptores;
    }

    public void addSuscriptor(Cliente cliente){
        this.suscriptores.add(cliente);
    }

    public void addMultimedia(Multimedia multimedia){
        this.catalogo.add(multimedia);
    }

    /*Método ver(Multimedia m, Cliente c): si el cliente no es pro se añade a ganancias el precio del Multimedia*/
    public void ver(Multimedia m, Cliente c){
        if(c.esPro()){
            ganancias += m.getPrecio();
        }
    }

}

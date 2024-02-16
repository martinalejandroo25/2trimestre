package McBurger.Dominio;

import java.util.ArrayList;

public class Menu {
    public int numeroMenus;
    private int numeroInstancia;
    private ArrayList<Ingrediente> listaIngrediente;

    /*Crear un Constructor sin parámetros con la funcionalidad correspondiente.*/

    public Menu() {
    }

    public void imprimirMenu() {
        for (int i= 0; i < this.listaIngredientes.size(); i++) {
            System.out.println(this.listaIngredientes.get(i) );
        }
    }

    public int getNumeroMenus() {
        return numeroMenus;
    }

    public void setNumeroMenus(int numeroMenus) {
        this.numeroMenus = numeroMenus;
    }

    public int getNumeroInstancia() {
        return numeroInstancia;
    }

    public void setNumeroInstancia(int numeroInstancia) {
        this.numeroInstancia = numeroInstancia;
    }

    public ArrayList<Ingrediente> getListaIngrediente() {
        return listaIngrediente;
    }

    public void setListaIngrediente(ArrayList<Ingrediente> listaIngrediente) {
        this.listaIngrediente = listaIngrediente;
    }

}

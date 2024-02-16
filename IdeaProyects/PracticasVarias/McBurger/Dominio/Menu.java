package McBurger.Dominio;

import java.util.ArrayList;

public class Menu {
    public static int numeroMenus;
    private int numeroInstancia;
    private ArrayList<Ingrediente> listaIngrediente;

    /*Crear un Constructor sin parámetros con la funcionalidad correspondiente.*/

    public Menu() {
        this.numeroMenus = 0;
        this.numeroInstancia = 0;
        this.listaIngrediente = new ArrayList<Ingrediente>();
    }

    public void imprimirMenu() {
        for (int i= 0; i < this.listaIngrediente.size(); i++) {
            System.out.println(this.listaIngrediente.get(i) );
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
   /*Añadir los métodos necesarios para que el programa compile y para que funcione la clase Principal.java*/
   public void addBebida(Ingrediente ing){
       listaIngrediente.add(ing);
   }
   public void addComida(Ingrediente ing){
       listaIngrediente.add(ing);
   }


    public int getNumeroIngredientes() {
        return listaIngrediente.size();
    }

    public double obtenerPrecioMenu() {
        double precioTotal = 0;
        for (int i = 0; i < listaIngrediente.size() ; i++) {
            precioTotal += listaIngrediente.get(i).obtenerPrecio();
        }
        return precioTotal;
    }
}

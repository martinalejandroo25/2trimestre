package McBurger.Dominio;

import java.util.ArrayList;

public class Menu {
    public static int numeroMenus;
    private int numeroInstancia;
    private ArrayList<Comida> listaComida;
    private ArrayList<Bebida> listaBebida;

    public Menu() {
        this.numeroMenus++;
        this.numeroInstancia++;
        this.listaComida = new ArrayList<>();
        this.listaBebida = new ArrayList<>();
    }

    public void imprimirMenu() {
        for (Comida comida : listaComida) {
            System.out.println(comida);
        }
        for (Bebida bebida : listaBebida) {
            System.out.println(bebida);
        }
    }

    public void addBebida(Bebida bebida) {
        listaBebida.add(bebida);
    }

    public void addComida(Comida comida) {
        listaComida.add(comida);
    }

    public int getNumeroMenus() {
        return numeroMenus;
    }

    public int getNumeroInstancia() {
        return numeroInstancia;
    }

    public ArrayList<Comida> getListaComida() {
        return listaComida;
    }

    public ArrayList<Bebida> getListaBebida() {
        return listaBebida;
    }

    public int getNumeroIngredientes() {
        return listaComida.size() + listaBebida.size();
    }

    public double obtenerPrecioMenu() {
        double precioTotal = 0;
        for (Comida comida : listaComida) {
            precioTotal += comida.obtenerPrecio();
        }
        for (Bebida bebida : listaBebida) {
            precioTotal += bebida.obtenerPrecio();
        }
        return precioTotal;
    }
}

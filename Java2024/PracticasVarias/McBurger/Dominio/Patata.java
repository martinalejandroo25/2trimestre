package McBurger.Dominio;

import McBurger.Interfaces.Cocinable;

public class Patata extends Comida implements Cocinable {
    private boolean cocinada;
    private boolean  frita;
    private boolean  cocida;
    private boolean  asada;
    public Patata() {
        super("patata");
        cocinada = false;
        frita = false;
        cocida = false;
        asada = false;

    }

    @Override
    public void cocinar() {
        cocinada = true;
    }

    @Override
    public void freir() {
        frita = true;
    }

    @Override
    public void cocer() {
    cocida = true;
    }

    @Override
    public void asar() {
    asada = true;
    }
}

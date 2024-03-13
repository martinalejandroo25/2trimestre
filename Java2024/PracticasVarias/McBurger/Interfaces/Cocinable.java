package McBurger.Interfaces;

public interface Cocinable {
    /*crear constantes: CRUDA = 0, FRITA = 1, COCIDA = 2 y ASADA = 3*/
    int CRUDA = 0;
    int FRITA = 1;
    int COCIDA = 2;
    int ASADA = 3;

    /*Crear metodos freir, cocer y asar, no devolverán nada*/
    public void freir();
    public void cocer();
    public void asar();

}

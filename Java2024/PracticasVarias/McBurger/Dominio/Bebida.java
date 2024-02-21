package McBurger.Dominio;

public abstract class Bebida extends Ingrediente {
    /*cuando se crea la bebida no esta refrigerada por defecto, NO refrigerada 1 euro,  SI refrigerada 1,50 euros*/
    private boolean refrigerada;
    protected String nombre;

    public Bebida(String nombre, boolean refrigerada) {
        this.refrigerada = refrigerada;
    }
    public boolean isRefrigerada() {
        return refrigerada;
    }
    public void setRefrigerada(boolean refrigerada) {
        this.refrigerada = refrigerada;
    }

    @Override
    public String getNombre() {
        return nombre;
    }

    @Override
    public double obtenerPrecio() {
        if (this.isRefrigerada()) {
            return super.obtenerPrecio() + 1.5;
        }
        return super.obtenerPrecio();
    }

    @Override
    public String toString() {
        return nombre;
    }
}

package McBurger.Dominio;

public abstract class Ingrediente {
    private String nombre;
    private String tipoIngrediente;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipoIngrediente() {
        return tipoIngrediente;
    }

    public void setTipoIngrediente(String tipoIngrediente) {
        this.tipoIngrediente = tipoIngrediente;
    }

    /*METODOS meterEnNevera sacarEnNevera, cocinar, freir, asar*/
    public void meterEnNevera(){
        boolean EnNevera = true;
    }
    public void sacarDeNevera(){
        boolean EnNevera = false;
    }
    public abstract void cocinar();
    public abstract void freir();
    public abstract void asar();

    //Métodos abstractos
    public double obtenerPrecio() {
        return 0;
    }
}
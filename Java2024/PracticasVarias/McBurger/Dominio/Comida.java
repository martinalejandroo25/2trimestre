package McBurger.Dominio;

public abstract class Comida extends Ingrediente{
    protected boolean cocinado;
    protected String nombre;

/*Crear un constructor sin parámetros con la funcionalidad correspondiente.*/
    public Comida(String nombre){
        this.nombre = nombre;
        this.cocinado = false;
    }
    public String getNombre(){
        return nombre;
    }

    @Override
    public String toString() {
        return nombre;
    }
}

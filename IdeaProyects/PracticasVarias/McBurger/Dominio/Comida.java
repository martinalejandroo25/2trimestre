package McBurger.Dominio;

public abstract class Comida extends Ingrediente{
    protected boolean cocinado;

/*Crear un constructor sin parámetros con la funcionalidad correspondiente.*/
    public Comida(){
        this.cocinado = false;
    }
}

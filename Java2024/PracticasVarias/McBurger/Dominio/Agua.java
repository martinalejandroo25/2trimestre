package McBurger.Dominio;

public class Agua extends Bebida{
    /*Crear un constructor sin parámetros con la funcionalidad correspondida*/
    public Agua() {
        super(false);

    }

    @Override
    public void cocinar() {
        // No se hace nada, ya que el agua no se cocina
    }

    @Override
    public void freir() {
        // No se hace nada, ya que el agua no se frie
    }

    public void asar() {
        // No se hace nada, ya que el agua no se asa
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Agua");
        sb.append(" " + this.obtenerPrecio());
        return sb.toString();
    }
}

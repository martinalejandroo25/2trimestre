package McBurger.Dominio;

public class Cola extends Bebida {
    public Cola() {
        super("Cola", false);
    }

    public void cocinar() {
        // No se hace nada, ya que la cola no se cocina
    }

    @Override
    public void freir() {
        // No se hace nada, ya que la cola no se frie
    }

    public void asar() {
        // No se hace nada, ya que la cola no se asa
    }
}

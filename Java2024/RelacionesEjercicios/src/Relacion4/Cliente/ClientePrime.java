package src.Relacion4.Cliente;
public class ClientePrime extends Cliente {
    private double precio = 3;

    public ClientePrime() {
    }

    public ClientePrime(String dni, String nombre, String email) {
        super(dni, nombre, email);
    }
    public boolean esPro(){
        return true;
    }
}

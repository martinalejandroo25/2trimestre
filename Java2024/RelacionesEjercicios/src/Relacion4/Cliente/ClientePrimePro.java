package Relacion4.Cliente;

public class ClientePrimePro extends Cliente {
    private double precio = 5;
    public ClientePrimePro() {
    }

    public ClientePrimePro(String dni, String nombre, String email) {
        super(dni, nombre, email);
    }

    public boolean esPro(){
        return true;
    }

    public double getPrecioMensual() {
        return precio;
    }
}

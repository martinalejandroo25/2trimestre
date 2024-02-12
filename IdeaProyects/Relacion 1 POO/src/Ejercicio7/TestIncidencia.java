package Ejercicio7;

public class TestIncidencia {
    
    public static void main(String[] args) {
        Incidencia inc1 = new Incidencia("I001", "Farola rota en la calle noseque", null);
        Incidencia inc2 = new Incidencia("I001", "tubería rota en calle noseque", null);
        Incidencia inc3 = new Incidencia("I001", "carretera a asfaltar en calle noseque", null);

        System.out.println(Incidencia.pendientes);
        System.out.println(inc1);
        System.out.println(inc2);
    }

        
}

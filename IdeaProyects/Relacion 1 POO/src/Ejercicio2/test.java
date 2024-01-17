import java.util.Scanner;

public class test {
    public static void main(String[] args) {
        int velocidad = 0;
        Scanner sc = new Scanner(System.in);

        while (true) {
            System.out.println("Quieres acelerar?(escribe 'a')");
            String accion = sc.nextLine();

            if (accion.equals("a")) {
                System.out.println("Cuanto? numero en km:");
            } else if (accion.equals("f")) {
                System.out.println("Cuanto? numero en km");
                int sumaresta = Integer.parseInt(sc.nextLine());
                Coche.frena(sumaresta);
            }
        }
        System.out.println("El coche va ahora a una velocidad de" + velocidad);
    

    }
}

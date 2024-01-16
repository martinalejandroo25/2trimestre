package Ejercicio2;
import java.util.Scanner;

public class test {
    public static void main(String[] args) {
        int velocidad = 0;
        Scanner sc = new Scanner(System.in);
        for (int i = 0; i < velocidad; i++) {
            System.out.println("Quieres acelerar (escribe 'a') o frenar(escribe 'f')?");
            String accion = sc.nextLine();
            System.out.println("Cuanto? numero en km:");
            int sumaresta = Integer.parseInt(sc.nextLine());
            if (accion == "a") {
                velocidad = new Coche.acelerar(sumaresta);
            }
            System.out.println("El coche va ahora a una velocidad de"+velocidad);

        }
        System.out.println("El coche va ahora a una velocidad de"+velocidad);
    }
}

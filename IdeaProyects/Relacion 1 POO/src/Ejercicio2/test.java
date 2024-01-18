package Ejercicio2;

import java.util.Scanner;

public class test {
    public static void main(String[] args) {
        int velocidad = 0;
        Scanner sc = new Scanner(System.in);

        while (true) {
            System.out.println("Quieres acelerar?(escribe 'a') o frenar?(escribe 'f')");
            String accion = sc.nextLine();
            System.out.println("Cuanto? numero en km:");
            velocidad = Integer.parseInt(sc.nextLine());
            Coche c1 = new Coche (velocidad);
            
            if (accion.equals("a")) {
                c1.acelera(velocidad);
            } else if (accion.equals("f")) {
                c1.freno(velocidad);
            }
            int actual = c1.getVelocidad();
            
            System.out.println("El coche va ahora a una velocidad de: " + actual + " km/h");
        }
    }
}

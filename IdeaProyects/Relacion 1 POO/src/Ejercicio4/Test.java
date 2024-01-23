package Ejercicio4;

import java.util.Scanner;

public class Test {
        public static void main(String[] args) {
            Finanzas f1 = new Finanzas();
            Scanner sc = new Scanner(System.in);
            /*En caso de querer configurar el valor de tasa:*/
            System.out.println("¿Quiere cambiar la tasa de cambio? (default= 1.36) s(si)/n(no)");
                String yesNo = sc.nextLine();
                if (yesNo.equals("n")) {
                } else if (yesNo.equals("s")) {
                    System.out.println("introduzca nueva tasa de cambio");
                   try { Double newTasa = Double.parseDouble(sc.nextLine());
                        f1 = new Finanzas(newTasa);
                   }
                   catch (NumberFormatException e) {
                       System.out.println("Tasa de cambio inválida "+ e.getMessage());
                       return;
                   }


                } else {
                    System.out.println("Introducción incorrecta, solo 's' o 'n' ");
                    return;
                }
            System.out.println("Euros a Dolares (e) Dolares a Euros (d)");
            String eleccion = sc.nextLine();
            if (eleccion.equals("e")) {
                System.out.println("Euros a Dolares, inserte Euros:");
                try {Double introeuro = Double.parseDouble(sc.nextLine());
                Double euro = f1.EurosToDolares(introeuro);
                System.out.println("En Dolares es = "+euro);
                }
                catch (NumberFormatException e) {
                    System.out.println("Cantidad inválida "+ e.getMessage());
                    return;
                }

            } else if (eleccion.equals("d")) {
                System.out.println("Dolares a Euros, inserte Dolares:");
                try{Double introdolar = Double.parseDouble(sc.nextLine());
                Double dolar = f1.dolaresToEuros(introdolar);
                System.out.println("En Euros es = "+dolar);}
                catch (NumberFormatException e) {
                    System.out.println("Cantidad inválida "+ e.getMessage());
                    return;
                }
            } else {
                System.out.println("Introducción incorrecta de los parámetros, solo 'e' o 'd' ");
                return;
            }
    }
}

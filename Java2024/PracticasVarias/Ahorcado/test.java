package Ahorcado;

import java.util.Scanner;

public class test {
    public static void main(String[] args) {
        ahorcado ahorcado = new ahorcado();
        Scanner sc = new Scanner(System.in);

        System.out.println("------------Ahorcado------------");
        System.out.println("La palabra ha sido seleccionada: "+ ahorcado.getPalabraIntentada() + " longitud "+ ahorcado.contaLetra());
        System.out.println("Escriba una palabra");



        while (ahorcado.getNumFallos() < 8){
            System.out.println("------------Menú de selección---------------");
            System.out.println("""
                            
                            Elija 1 para probar con una letra
                            
                            Elija 2 para probar con una palabra
                            
                            """);
            int seleccion = Integer.parseInt(sc.nextLine());
            if (seleccion == 1) {
                System.out.println("Inserte la nueva letra a probar");
                String letra = sc.nextLine();
                if (ahorcado.probarLetra(letra)) {
                    System.out.println("Letra encontrada!!");
                } else {
                    System.out.println("Nada, sigue intentandolo... Intentos restantes: "+(8- ahorcado.getNumFallos()));
                }
            } else if (seleccion == 2) {
                System.out.println("Inserte la nueva palabra a probar");
                String palabra = sc.nextLine();
                if (ahorcado.probarPalabra(palabra)) {
                    System.out.println("Enhorabuena!! encontraste la palabra ;)");
                    break;
                } else {
                    System.out.println("Nada, sigue intentandolo... Intentos restantes: "+(8- ahorcado.getNumFallos()));

                }
            } else {
                System.out.println("Por favor, elija una opción válida");
            }
            System.out.println("Palabra actual: " + ahorcado.getPalabraIntentada());
        }
        if(ahorcado.getNumFallos() >= 8) {
            System.out.println("Sin intentos restantes. La palabra a adivinar era " + ahorcado.getPalabraIntentada());
        }
    }
}


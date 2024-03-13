package Relacion1.ejercicio1;

import java.util.Scanner;
public class TestTemp {
    /*Realiza una clase Temperatura, la cual convierta grados Celsius a Farenheit y viceversa. Para ello, crea dos
métodos double celsiusToFarenheit(double celsius) y double farenheitToCelsius(double
farenheit). La clase Temperatura no tendrá ninguna propiedad, solo esos dos métodos.
En la construcción ten en cuenta las siguientes fórmulas:
- Farenheit a Celsius C = (F – 32)/1,8
- Celsius a Farenheit F = (1,8)C + 32*/
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Cual es el número de temperatura?");
        double temperatura = Double.parseDouble(sc.nextLine());

        System.out.println("Está en Celsius? Escribe c. o en Farenheit? Escribe f");
        char medida = sc.next().charAt(0);
        double temp = temperatura;

        if (medida == 'c' || medida == 'C') {
            // Convierte Celsius a Fahrenheit
            temperatura = Temperatura.celsiusToFarenheit(temperatura);
            System.out.println("La temperatura de " + temp + " celsius a Fahrenheit es de " + temperatura);
        } else if (medida == 'f' || medida == 'F') {
            // Convierte Fahrenheit a Celsius
            temperatura = Temperatura.farenheitToCelsius(temperatura);
            System.out.println("La temperatura de " + temp + " Fahrenheit a Celsius es de " + temperatura);
        } else {
            System.out.println("Medida no válida. Debe ser 'c' o 'f'.");
        }
    }
}
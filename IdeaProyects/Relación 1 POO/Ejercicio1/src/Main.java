import java.util.Objects;
import java.util.Scanner;

public class Main {
    public void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Son Celsius o Fahrenheit? (C o F)");
        String medida = sc.nextLine();
        System.out.println("Dame entonces la temperatura exacta que quieres pasar");
        double temperatura = Double.parseDouble(sc.nextLine());
        if (Objects.equals(medida, "C") || Objects.equals(medida, "c")) {
            temperatura nuevatemp = new temperatura();
            System.out.println("A Fahrenheit es " + nuevatemp);
        } else if (Objects.equals(medida, "F") || Objects.equals(medida, "f")) {
            temperatura.farenheitToCelsius nuevatemp = new temperatura.farenheitToCelsius();
            System.out.println("A Celsius es " + nuevatemp);
        }
    }
}
package ejercicio3;
import java.util.Scanner;

public class test {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Pajaro p1 = new Pajaro();
        int edad = p1.setedad(Integer.parseInt(sc.nextLine()));
        String impreso = p1.printedad();

    }
}

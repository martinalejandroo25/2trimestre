package ejercicio3;
import java.util.Scanner;
public class test {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Pajaro test = new Pajaro();
        test.setEdad(52);
        test.setColor('A');
        test.printEdad();
        test.printColor();
    }
}

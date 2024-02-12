package EjerciciosPropuestos.Lingo;

import java.util.Scanner;

public class TestLingo {
    public static void main(String[] args) {
        Lingo juego = new Lingo();
        System.out.println(juego.getPalabrasAcertar());

        Scanner sc = new Scanner(System.in);
        String palabraUsuario = "";
        while(true) {
        System.out.println("Introduce una palabra: ");
        palabraUsuario = sc.nextLine();

        //Comprobar el número de aciertos
        int numAciertos = juego.comprobar(palabraUsuario);
        if(numAciertos == 5) {
            System.out.println("Enhorabuena!!!");
            break;
        } else {
            System.out.println("Has acertado "+numAciertos+" letras de la palabra");
            System.out.println("Sigue intentandolo!");
        }
        }
    }
}

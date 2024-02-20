package EjerciciosPropuestos.Lingo;

import java.util.ArrayList;

public class Lingo {
    private ArrayList<String> palabras = new ArrayList<>();
    private String palabrasAcertar;
    private StringBuffer palabraIntento;

    private static int partidasGanadas = 0;

    public Lingo() {
        palabras.add("Lunes");
        palabras.add("ringo");
        palabras.add("bingo");
        palabras.add("perro");
        palabras.add("pedal");
        palabras.add("actor");
        palabras.add("censo");
        palabras.add("arroz");

        int posicion = (int) (Math.random() * palabras.size());
        this.palabrasAcertar = palabras.get(posicion);

        this.palabraIntento = new StringBuffer();
        for (int i = 0; i < this.palabrasAcertar.length(); i++) {
            this.palabraIntento.append("-");
        }
    }

    public void setPalabras(ArrayList<String> palabras) {
        this.palabras = palabras;
    }

    public String getPalabrasAcertar() {
        return palabrasAcertar;
    }

    public void setPalabrasAcertar(String palabrasAcertar) {
        this.palabrasAcertar = palabrasAcertar;
    }

    /*Comprueba caracter a caracter la palabra introducida y la palabra a acertar
    * calcula el número de letras que están en la misma posición
    * @param palabra
    * @return El número de letras en la misma posición*/

    public int comprobar(String palabra) {
        if (palabra.length()!= 5) {
            System.out.println("La palabra introducida no tiene 5 caracteres");
            return 0;
        }
        int aciertos = 0;
        for (int i = 0; i < palabra.length(); i++) {
            if (palabra.charAt(i) == palabrasAcertar.charAt(i)) {
                aciertos++;
            }
        }
        System.out.println(this.palabraIntento);

        return aciertos;
    }
}

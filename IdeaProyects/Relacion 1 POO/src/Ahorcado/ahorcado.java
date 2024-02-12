package Ahorcado;

import java.util.ArrayList;
import java.util.Random;

public class ahorcado {
    private String palabraAdivinar;
    private String palabraIntentada;
    private int numFallos;
    private ArrayList<String> letras;

    public ahorcado() {
        letras = new ArrayList<>();
        nuevapalabra();
    }
        private void nuevapalabra() {
            Random rand = new Random();
            int ind = rand.nextInt(palabras.length);
            palabraAdivinar = palabras[ind];
            palabraIntentada = convertirAGuiones(palabraAdivinar);
            numFallos = 0;
        }
        private String palabras[] = {"adaptacion", "cirugia", "conducta", "evaluacion", "fisioterapeuta", "infancia", "nervios", "virus", "control", "mundo"};

    public String convertirAGuiones(String palabra) {
        StringBuffer palabraGuiones = new StringBuffer();

        for (int i = 0; i < palabra.length(); i++) {
            palabraGuiones.append("-");
        }
        return palabraGuiones.toString();
    }
    public int contaLetra() {
        return palabraAdivinar.length();
    }
    public boolean probarLetra(String letra) {
        if (letras.contains(letra)) {
            System.out.println("La letra "+letra+" ya ha sido intentada");
            return false;
        }
        boolean letraEncontrada = false;
        StringBuffer newPalabraIntentada = new StringBuffer(palabraIntentada);

        letra = letra.toLowerCase();
        letras.add(letra);

        for(int i = 0; i<palabraAdivinar.length(); i++) {
            if (Character.toLowerCase(palabraAdivinar.charAt(i)) ==letra.charAt(0)) {
                newPalabraIntentada.setCharAt(i, palabraAdivinar.charAt(i));
                letraEncontrada = true;
            }
        }
        if(!letraEncontrada) {
            numFallos++;
        }
        palabraIntentada = newPalabraIntentada.toString();
        return true;
    }
    public boolean probarPalabra(String palabra) {
        return palabra.equalsIgnoreCase(palabraAdivinar);
    }
    public String getPalabraIntentada() {
        return palabraIntentada;
    }
    public int getNumFallos() {
        return numFallos;
    }

}

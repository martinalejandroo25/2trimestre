public class Main {
    public static void main(String[]args) {
    /*public static int generarNumeroAleatorio(int min, int max) throws Exception {
        if (min > max) {
            throw new Exception("El valor mínimo no puede ser mayor que el máximo");
        }
        return (int) (Math.random() * (max - min + 1) + min);
    }

    public static void main (String[] args) throws Exception {
        System.out.println("Hola contraseña...");

        //Hacer un programa que genere 8 carácteres entre el ASCII 48 y 122
        StringBuffer ejemplo = new StringBuffer();
        for (int i = 0; i <=8; i++) {
            ejemplo.append((char)generarNumeroAleatorio(48, 122));

        }

        System.out.println("Contraseña generada: "+ejemplo.toString());
    }*/
    Coche micoche = new Coche("mercedes", "GLA", "Gris");
    Coche tucoche = new Coche("Audi", "A5", "Rojo");

    System.out.println(micoche.marca);
    System.out.println(tucoche.marca);

    tucoche.pintar("azul");

    System.out.println(tucoche.marca + " "+ tucoche.color);
    System.out.println(micoche.marca + " " + micoche.color);

    }
}

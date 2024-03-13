package BladeOfDarkness1;

import java.util.Scanner;

public class TestJuego {
    public static void main(String[] args) {
        //crear armas
        Arma Espada = new Arma("Espada infernal", Arma.tipo.ESPADA, 48, false);
        Arma arco = new Arma("Arco Helado", Arma.tipo.ARCO, 23, true);
        Arma Hacha = new Arma("Hacha mortal", Arma.tipo.HACHA, 80, true);
        Arma Baston = new Arma("Bastón Ligero", Arma.tipo.BASTON, 30, false);

        //Crear Jugador
        Jugador j1 = new Jugador("Frisk", Jugador.clase.CABALLERO, 5, 300, 230, Espada, Baston, arco);

        //Equipar armas al jugador
        j1.equiparArma(Espada);
        j1.equiparArma(Baston);

        //Mostrar informacion
        System.out.println("Info del Jugador "+ j1.getNombre());
        System.out.println(j1);

        //crear monstruo
        Monstruo demonio = new Monstruo("Asgore", Monstruo.clase.DEMONIO,8, 500, 30);

        //Mostrar informacion
        System.out.println("Info del Monstruo "+ demonio.getNombre());
        System.out.println(demonio);

        //combate de prueba de solo 1 turno
       /*j1.mostrarMenu();
        j1.golpear(demonio);
        if(demonio.getSalud() <= 0) {
            System.out.println("Asgore, rey de los demonios, ha sido derrotado");
        }   else {
            System.out.println("El demonio contraataca");
                demonio.golpear(j1);
        }*/

        //Juego por turnos
            //j1.mostrarMenu(j1);

            boolean juegoEnCurso = true;
            while(juegoEnCurso){
                System.out.println("Arma derecha o izquierda(d/i)?");
                Scanner sc = new Scanner(System.in);
                    String ladoarma = sc.nextLine();
                switch (ladoarma){
                    case "i":
                        System.out.println("Frisk ataca al monstruo con "+j1.getArmaIzquierda().getNombre());
                        j1.golpear(demonio);
                    case "d":
                        System.out.println("Frisk ataca al monstruo con "+j1.getArmaDerecha().getNombre());
                        j1.golpear(demonio);
                }
            System.out.println("Frisk ataca al monstruo con "+j1.getArmaDerecha().getNombre());
            j1.golpear(demonio);

            if (demonio.getSalud() <= 0) {
                System.out.println("Asgore ha sido derrotado!! ganaste");
                    juegoEnCurso = false;
            } else {
                System.out.println("Salud restante del demonio: "+ demonio.getSalud());
                System.out.println("El monstruo contraataca");
                demonio.golpear(j1);
                System.out.println("ouch, te queda "+j1.getSalud()+" puntos de vida");
                if (j1.getSalud() <=0) {
                    System.out.println("OH NO... no has logrado derrotar al temible Asgore, has fallecido...");
                    juegoEnCurso = false;
                }
            }
            }
            System.out.println("Estado de Frisk: "+j1);
            System.out.println("Estado del demonio "+demonio);

    }
}

package BladeOfDarkness1;

import java.util.Scanner;

public class Jugador {
    private String nombre;
    public enum clase {MAGO, BRUJO, BARBARO, CABALLERO};
    private int nivel;
    private int salud = 200;
    private int experiencia;
    private Arma armaDerecha;
    private Arma armaIzquierda;
    private Arma armaDosManos;

    public Jugador(String nombre, clase clase, int nivel, int experiencia, int salud,
                Arma armaDerecha, Arma armaIzquierda, Arma armaDosManos) {
        this.nombre = nombre;
        this.nivel = 1;
        this.experiencia = 0;
        this.salud = 200;
        this.armaDerecha = null;
        this.armaIzquierda = null;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public int getExperiencia() {
        return experiencia;
    }

    public void setExperiencia(int experiencia) {
        this.experiencia = experiencia;
    }

    public int getSalud() {
        return salud;
    }

    public void setSalud(int salud) {
        this.salud = salud;
    }

    public Arma getArmaDerecha() {
        return armaDerecha;
    }

    public void setArmaDerecha(Arma armaDerecha) {
        this.armaDerecha = armaDerecha;
    }

    public Arma getArmaIzquierda() {
        return armaIzquierda;
    }

    public void setArmaIzquierda(Arma armaIzquierda) {
        this.armaIzquierda = armaIzquierda;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Jugador{");
        sb.append("nombre='").append(nombre).append('\'');
        sb.append(", nivel=").append(nivel);
        sb.append(", experiencia=").append(experiencia);
        sb.append(", salud=").append(salud);
        sb.append(", armaDerecha=").append(armaDerecha);
        sb.append(", armaIzquierda=").append(armaIzquierda);
        sb.append('}');
        return sb.toString();
    }
    public void subirNivel() {
        if (nivel <=10) {
            nivel++;
            salud = (int) Math.pow(nivel, 2.5);
        } else if (nivel == 10) {
            System.out.println("Nivel máximo ya ha sido alcanzado!");
        }
    }
    public boolean equiparArma(Arma arma) {
        if (arma.isDosManos()) { // Verifica si el arma es de dos manos
            if (armaDosManos == null) {
                armaDosManos = arma;
                return true;
            } else {
                System.out.println("Ya tienes un arma de dos manos equipada");
                return false;
            }
        } else { // Si no es de dos manos, intenta equipar en brazo derecho o izquierdo
            if (armaIzquierda == null) {
                armaIzquierda = arma;
                return true;
            } else if (armaDerecha == null) {
                armaDerecha = arma;
                return true;
            } else {
                System.out.println("No hay espacio disponible para equipar más armas");
                return false;
            }
        }
    }
    public void tomarPocion(int puntosS) {
        if (puntosS <= 10000 && puntosS > 0) {
        salud += puntosS;
        } else {
            System.out.println("Esa poción no es de dios, no hará efecto");
        }
    }
    public boolean reducirVida(int puntosD) {
        salud -= puntosD;
        if (salud <= 0) {
            System.out.println("""
                    Has muerto... No pierdas tu determinación, nos vemos en otra vida...
             𝐺𝐴ͣ𝑀ⷨ𝐸ͤ 𝑂ͦ𝑉ͮ𝐸ͤ𝑅ͬ """);
            return true;
        } else if (salud > 0);
        System.out.println("Siguiente turno, Salud restante: "+salud);
        return false;
    }
    public void golpear(Monstruo monstruo) {
        if (this.getArmaDerecha() != null) {
            monstruo.reducirVida(this.getArmaDerecha().getPuntosD());
            if (! this.getArmaDerecha().isDosManos()) {
                if (this.getArmaIzquierda() != null) {
                    monstruo.reducirVida(this.getArmaIzquierda().getPuntosD());
                }
            }
        }
    }
    public void mostrarMenu(Jugador jugador) { //no he podido implementar este sistema, me da un error de bucle
        Scanner sc = new Scanner(System.in);
        Arma arma = null;
        System.out.println("""
                    Elige un arma para equipar:
                    1.Espada
                    2.Hacha
                    3.Bastón
                    4,Arco
                    Selecciona una opción
                    """);
        int opcion = sc.nextInt();

        switch(opcion) {
            case 1:
                arma = new Arma("Espada", Arma.tipo.ESPADA, 48, false);
                jugador.equiparArma(arma);
                break;
            case 2:
                arma = new Arma("Hacha", Arma.tipo.HACHA, 80, true);
                jugador.equiparArma(arma);
                break;
            case 3:
                arma = new Arma("Bastón", Arma.tipo.BASTON, 32, false);
                jugador.equiparArma(arma);
                break;
            case 4:
                arma = new Arma("Arco", Arma.tipo.ARCO, 25, true);
                jugador.equiparArma(arma);
                break;
        } if (arma != null) {
            if (equiparArma(arma)) {
                System.out.println("Tu " + arma.getNombre()+" ha sido equipado con exito");
            }else {
                System.out.println("No se pudo equipar el arma, No hay espacio");
            }
        }
    }

}
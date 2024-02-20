package BladeOfDarkness2;

public class Monstruo {
    private String nombre;
    public enum clase {GOBLIN, TROLL, SKRALL, DEMONIO, FANTASMA};
    private int nivel;
    private int salud = 100;
    private int puntosD;

    public Monstruo(String nombre,clase clase, int nivel, int salud, int puntosD) {
        this.nombre = nombre;
        this.nivel = 1;
        this.salud = 100;
        this.puntosD = puntosD;
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

    public int getSalud() {
        return salud;
    }

    public void setSalud(int salud) {
        this.salud = salud;
    }

    public int getPuntosD() {
        return puntosD;
    }

    public void setPuntosD(int puntosD) {
        this.puntosD = puntosD;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Monstruo{");
        sb.append("nombre='").append(nombre).append('\'');
        sb.append(", nivel=").append(nivel);
        sb.append(", salud=").append(salud);
        sb.append(", puntosD=").append(puntosD);
        sb.append('}');
        return sb.toString();
    }
    public void subirNivel() {
        if (nivel <=10) {
            nivel++;
            salud = (int) Math.pow(nivel, 2);
        } else if (nivel == 10) {
            System.out.println("Nivel máximo ya ha sido alcanzado!");
        }
    }
    public boolean reducirVida(int puntosD) {
        salud -= puntosD;
        if (salud <= 0) {
            System.out.println("Enemigo derrotado! Ganas la batalla" );
            return true;
        } else if (salud > 0);
        System.out.println("Siguiente turno, Salud restante del enemigo: " +salud);
        return false;
    }
    public void golpear(Jugador jugador) {
        jugador.reducirVida(puntosD);
    }
}

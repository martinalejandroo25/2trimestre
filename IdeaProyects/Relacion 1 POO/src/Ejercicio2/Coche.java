import java.util.Objects;

public class Coche {
    private int velocidad; // atributo

    Coche(int velocidad) {
        this.velocidad = 0; // Constructor
    }

    public int getVelocidad() {
        return velocidad; // atribut
    }

    public void acelera(int mas) {
        this.velocidad += mas;
    }

    public void freno(int menos) {
        this.velocidad -= menos;
    }
    
}
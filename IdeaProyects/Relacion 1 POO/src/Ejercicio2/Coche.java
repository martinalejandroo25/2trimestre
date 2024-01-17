import java.util.Objects;

public class Coche {
    private int velocidad; // atributo

    Coche() {
        velocidad = 0; // Constructor
    }

    public int getVelocidad() {
        return velocidad; // atribut
    }

    public void acelera(int mas) {
        velocidad += mas;
    }

    public void frena(int menos) {
        velocidad -= menos;
    }
    
}
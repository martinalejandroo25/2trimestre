
public class Coche {
    //ATRIBUTOS
    public String marca;
    public String modelo;
    public String color;

    //MÉTODOS
    public Coche(String marca, String modelo, String color) {
        this.marca = marca;
        this.modelo = modelo;
        this.color = color;
    }

    public void pintar(String color){ this.color = color;}

}

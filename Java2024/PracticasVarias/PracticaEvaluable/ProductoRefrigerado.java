package PracticaEvaluable;
/*ProductoRefrigerado: Agrega un atributo nivelRefrigeracion que indica si el producto
requiere refrigeración isotérmica (1) o refrigeración frigorífica (2). El primero añade un
coste de 10€ al envío y el segundo de 30€.*/
public class ProductoRefrigerado extends Producto{
    private int Nivelrefrigeracion;

    public ProductoRefrigerado(String nombre, double peso, int Nivelrefrigeracion){
        super(nombre, peso);
        this.Nivelrefrigeracion = Nivelrefrigeracion;
    }


}

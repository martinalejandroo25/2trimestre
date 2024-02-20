package PracticaEvaluable;
/*ProductoFragil: Agrega un atributo nivelFragil que indica si el producto es frágil (1) o
muy frágil (2). Para el cálculo del coste del envío le suma 20€ si es frágil y 50€ si es muy
frágil.*/
public class ProductoFragil extends Producto {
    private int nivelFragil;

    public ProductoFragil(String nombre, double peso, int nivelFragil) {
        super(nombre, peso);
        this.nivelFragil = nivelFragil;
    }

    @Override
    public double calcularCostoEnvio(boolean esEnvioInternacional) {

        if (nivelFragil == 1) {
            return super.calcularCostoEnvio(esEnvioInternacional) + 20;
        }
        else if (nivelFragil == 2) {
            return super.calcularCostoEnvio(esEnvioInternacional) + 50;
        }
        return super.calcularCostoEnvio(esEnvioInternacional);
    }
}

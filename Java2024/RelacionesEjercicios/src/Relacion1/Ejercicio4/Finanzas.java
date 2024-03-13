package Relacion1.Ejercicio4;
/*clase Finanzas
convierta dólares a euros y viceversa
propiedad se almacena cambio dólar-euro
no se almacena una cantidad sino el tipo de cambio
dolaresToEuros(double dolares)
eurosToDolares(double euros). Pruebala haciendo conversiones entre euros y dólares.
La clase debe tener:
- Un constructor Finanzas() por defecto el cual establecerá el cambio dólar-euro en 1.36.
- Un constructor Finanzas(double), el cual permitirá configurar el cambio dólar-euro.
- Getters y setters
Prueba la clase en otra clase TestFinanzas.*/
public class Finanzas {
    private double dolarEuro = 1.36;


    public Finanzas(double dolarEuro) {
        this.dolarEuro = dolarEuro;
    }
    public Finanzas() {
        this.dolarEuro = dolarEuro;
    }

    public double dolaresToEuros(double dolares) {
        double Euro = dolares * dolarEuro;
        return Euro;
    }
    public double EurosToDolares(double euro) {
    double dolar = euro * dolarEuro;
    return dolar;
    }

    public double getDolarEuro() {
        return dolarEuro;
    }

    public void setDolarEuro(double dolarEuro) {
        this.dolarEuro = dolarEuro;
    }
}

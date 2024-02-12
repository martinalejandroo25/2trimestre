package ejercicio1;

public class Temperatura {
    public static double celsiusToFarenheit(double celsius) {
        double farenheit = (1.8)*celsius+32;
                return farenheit;
    }
    public static double farenheitToCelsius(double farenheit) {
        double celsius = (farenheit-32)/1.8;
                return celsius;
    }
}
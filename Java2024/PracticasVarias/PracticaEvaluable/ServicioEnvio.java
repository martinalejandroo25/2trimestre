package PracticaEvaluable;

import java.util.ArrayList;


/*Crea una clase ServicioEnvio que contenga un ArrayList de envíos. Incluye los siguientes
métodos:
- agregarEnvio(Envio envio): Agrega un envío a la lista de envíos del servicio.
- generarInformeEnvios(): Genera un informe que incluye la lista de envíos y su costo
total. Debe mostrar todos los productos del envío, el coste total del envío, y los días
transcurridos entre la fecha de salida y de llegada.*/
public class ServicioEnvio {
    private ArrayList envios = new ArrayList<>();

    public void agregarEnvio(Envio envio){
        envios.add(envio);
    }
    public void generarInformeEnvios(){
        for (int i = 0; i < envios.size() ; i++) {
            System.out.println(envios.get(i));
        }
    }

}

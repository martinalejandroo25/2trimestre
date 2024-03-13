import Asiento.Asiento;
import Asiento.TipoAsiento;
import Asiento.TipoTarifa;
import Persona.Pasajero;

import java.util.ArrayList;

/*Añade atributos:
[X]Long id,
[X]Vuelo vuelo,
[X]ArrayList<Pasajero> pasajeros,
[X]TipoTarifa tipoT,
[X]TipoAsiento tipoA
[X]Constructor,
[X]getters, setters,
[]toString (mostrará el id, el código del vuelo, también los días que faltan para el Vuelo, no
    imprime pasajeros ni asientos, llama a imprimirBilletes).
[]El id no debe aparecer en el constructor, debe hacerse con un campo estático, cada reserva incrementa el valor.

[x]addPasajero,
[x]removePasajero
[]ArrayList<Asiento> getAsientos():
    devuelve los asientos asignados a pasajeros
[]reservaAsiento(Pasajero pasajero):
    Primero verifica que haya disponibilidad de Asientos del tipo indicado, si
    hay disponibilidad, buscaremos un asiento libre del tipo y ocupará el asiento en el vuelo, añadirá el pasajero
    a la lista de pasajeros de la reserva. IMPORTANTE: aquí debemos clonar el objeto Pasajero llamando a su
    constructor copia, antes de ocupar el asiento, y a ocupar() se le pasa el pasajero clonado y se añade también
    a la lista de pasajeros el pasajero clonado. Es decir, cada reserva lleva un objeto pasajero diferente, si fuera el
    mismo, el asiento del pasajero se modificaría cuando se haga otra reserva.
[]calcularPrecioTotal():
    devuelve la suma del precio de los asientos de la reserva. Según el tipo de tarifa,
    sumará un valor al precio de cada asiento individual: si es Optima suma un 10%, Confort suma un 15% y
    Flexible suma un 30%

[]imprimirBilletes(): muestra la información de cada pasajero, junto su asiento y el precio total de la reserva.*/
public class ReservaVuelo {
    private long id;
    private Vuelo vuelo;
    ArrayList<Pasajero> pasajeros = new ArrayList<Pasajero>();
    TipoTarifa tipoT;
    TipoAsiento tipoA;

    public ReservaVuelo(long id, Vuelo vuelo, ArrayList<Pasajero> pasajeros, TipoTarifa tipoT, TipoAsiento tipoA) {
        this.id = id;
        this.vuelo = vuelo;
        this.pasajeros = pasajeros;
        this.tipoT = tipoT;
        this.tipoA = tipoA;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Vuelo getVuelo() {
        return vuelo;
    }

    public void setVuelo(Vuelo vuelo) {
        this.vuelo = vuelo;
    }

    public ArrayList<Asiento> getAsiento() {
        ArrayList<Asiento> asientos = new ArrayList<>();
        for (Pasajero pasajero : pasajeros) {
            asientos.add(pasajero.getAsiento());
        }
        return asientos;
    }

    public void setPasajeros(ArrayList<Pasajero> pasajeros) {
        this.pasajeros = pasajeros;
    }

    public TipoTarifa getTipoT() {
        return tipoT;
    }

    public void setTipoT(TipoTarifa tipoT) {
        this.tipoT = tipoT;
    }

    public TipoAsiento getTipoA() {
        return tipoA;
    }

    public void setTipoA(TipoAsiento tipoA) {
        this.tipoA = tipoA;
    }

    public void addPasajero(Pasajero pasajero) {
        pasajeros.add(pasajero);
    }
    public void delPasajeros(Pasajero pasajero) {
        pasajeros.remove(pasajero);
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("ReservaVuelo{");
        sb.append("id=").append(id);
        sb.append(", vuelo=").append(vuelo);
        sb.append('}');
        return sb.toString();
    }
    public void reservarAsiento(Pasajero pasajero){
        if(vuelo.getAsientosDisponibles() != null){
         //   return vuelo.getAsientosDisponibles().
        }
    }
}

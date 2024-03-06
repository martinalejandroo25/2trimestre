import Asiento.TipoAsiento;
import Asiento.TipoTarifa;
import Persona.Pasajero;

import java.lang.reflect.Array;
import java.util.ArrayList;

/*Añade atributos:
[x]ArrayList<Vuelo> vuelos,
[x]ArrayList<ReservaVuelo> reservas.
[x]Constructor,
[x]getVuelos,
[x]getReservas
Métodos:
[x] addVuelo(Vuelo vuelo):
    añade un vuelo a la colección.
[] Boolean crearReserva(Vuelo, ArrayList<Pasajero>, TipoTarifa, TipoAsiento):
    comprueba que haya tantos
    asientos disponibles del tipo de asiento como números de pasajeros hay en la reserva. Si no hay devuelve
    false. Si sí hay, crear la reserva y añade a la reserva cada pasajero. Añade la reserva a la lista de reservas.
[] cancelarReserva(Long id):
    antes de eliminar la reserva de la colección, debe entrar a su vuelo y liberar los
    asientos que tenían asignados en el vuelo.
[] ArrayList<Vuelo> buscarVuelos(String destino)
[] ArrayList<Vuelo> buscarVuelos(LocalDate fecha)
[] ArrayList<Vuelo> buscarVuelos(LocalDate fecha, String destino)
[] ArrayList<Reserva> buscarReservas(String dni)*/
public class Atrapame {
    ArrayList<Vuelo> vuelos = new ArrayList<Vuelo>();
    ArrayList<ReservaVuelo> reservas = new ArrayList<ReservaVuelo>();

    public Atrapame(ArrayList<Vuelo> vuelos, ArrayList<ReservaVuelo> reservas) {
        this.vuelos = new ArrayList<>();
        this.reservas = new ArrayList<>();
    }

    public ArrayList<Vuelo> getVuelos() {
        return vuelos;
    }

    public ArrayList<ReservaVuelo> getReservas() {
        return reservas;
    }

    public void addVuelo(Vuelo vuelo){
        vuelos.add(vuelo);
    }
    public boolean crearReserva(Vuelo vuelo, ArrayList<Pasajero> pasajeros, TipoTarifa tipoT, TipoAsiento tipoA) {
        int asientosDisponibles = vuelo.verificarDisponibilidad(tipoA);
        if (asientosDisponibles >= pasajeros.size()) {
           // ReservaVuelo reserva = new ReservaVuelo(); //long id, Vuelo vuelo, ArrayList<Pasajero> pasajeros, TipoTarifa tipoT, TipoAsiento tipoA

        }
        return false;
    }
}

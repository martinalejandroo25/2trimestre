 /*Añade atributos:
[x]    String codigo,
[x]    String origen,
[x]    String destino,
[x]    LocalDate fecha,
[x]    LocalTime hora,
[x]    Double precioBase,
[x]    Integer asientosDisponibles,
        La propiedad asientosDisponibles es el número de asientos del avión.
[x]    ArrayList<Asiento> asientos.
[x]    Constructor,
[x]    getters, setters,
[x]    toString,
[x]    equals por codigoVuelo.

[-]    En el constructor deberás crear todos esos asientos y meterlos en la colección asientos,
[x]    que haya un 30% Business y un 70% Turista.
[X]    A cada asiento se le pone de precioBase, el precioBase del vuelo.
Métodos extra:
[x]    int verificarDisponibilidad(TipoAsiento tipoAsiento):
        devuelve el número de asientos disponibles del tipo indicado (Business o Turiesta)
        que no tienen Pasajero asignado.
        No hay que usar instanceof, hay un método getTipo().
[x]    Asiento buscarAsientoDisponible(TipoAsiento tipoAsiento):
        devuelve el primer asiento libre en el vuelo del tipo indicado.
        No hay que usar instanceof, hay un método getTipo().
[x]    - boolean ocuparAsiento(Pasajero, Asiento):
            si ese asiento está disponible, se pone que el Pasajero tiene ese Asiento,
            y que el Asiento es ocupado por el Pasajero.
[]      liberarAsiento(Asiento):
          se quita el Pasajero del Asiento, y del Pasajero su Asiento queda null (si el asiento tenía pasajero previamente).
[]        diasFaltanVuelo():
            devuelve los días que faltan para el vuelo.
[]       ArrayList<Pasajero> getPasajeros(): devuelve la lista de pasajeros del vuelo.*/

 import java.time.LocalDate;
 import java.time.LocalTime;
 import java.util.ArrayList;
 import java.util.Objects;

 import Asiento.*;
 import Persona.Pasajero;

 public class Vuelo {
     private String codigo;
     private String origen;
     private String destino;
     private LocalDate fecha;
     private LocalTime hora;
     private double precioBase;
     private Integer asientosDisponibles;

     ArrayList<Asiento> asientos = new ArrayList<>;

     public Vuelo(String codigo, String origen, String destino, LocalDate fecha, LocalTime hora, double precioBase, Integer asientosDisponibles, ArrayList<Asiento> asientos) {
         this.codigo = codigo;
         this.origen = origen;
         this.destino = destino;
         this.fecha = fecha;
         this.hora = hora;
         this.precioBase = precioBase;
         this.asientosDisponibles = asientosDisponibles;
         this.asientos = new ArrayList<Asiento>();
         crearAsiento();

     }

     public String getCodigo() {
         return codigo;
     }

     public void setCodigo(String codigo) {
         this.codigo = codigo;
     }

     public String getOrigen() {
         return origen;
     }

     public void setOrigen(String origen) {
         this.origen = origen;
     }

     public String getDestino() {
         return destino;
     }

     public void setDestino(String destino) {
         this.destino = destino;
     }

     public LocalDate getFecha() {
         return fecha;
     }

     public void setFecha(LocalDate fecha) {
         this.fecha = fecha;
     }

     public LocalTime getHora() {
         return hora;
     }

     public void setHora(LocalTime hora) {
         this.hora = hora;
     }

     public double getPrecioBase() {
         return precioBase;
     }

     public void setPrecioBase(double precioBase) {
         this.precioBase = precioBase;
     }

     public Integer getAsientosDisponibles() {
         return asientosDisponibles;
     }

     public void setAsientosDisponibles(Integer asientosDisponibles) {
         this.asientosDisponibles = asientosDisponibles;
     }

     public ArrayList<Asiento> getAsientos() {
         return asientos;
     }

     public void setAsientos(ArrayList<Asiento> asientos) {
         for (int i = 0; i < asientosDisponibles; i++) {
             Asiento asiento = new Asiento(i, getPrecioBase(), i, asiento.getLetra());
         }

     }

     @Override
     public String toString() {
         final StringBuffer sb = new StringBuffer("Vuelo{");
         sb.append("codigo='").append(codigo).append('\'');
         sb.append(", origen='").append(origen).append('\'');
         sb.append(", destino='").append(destino).append('\'');
         sb.append(", fecha=").append(fecha);
         sb.append(", hora=").append(hora);
         sb.append(", precioBase=").append(precioBase);
         sb.append(", asientosDisponibles=").append(asientosDisponibles);
         sb.append(", asientos=").append(asientos);
         sb.append('}');
         return sb.toString();
     }

     @Override
     public boolean equals(Object o) {
         if (this == o) return true;
         if (o == null) return false;
         Vuelo vuelo = (Vuelo) o;
         return Objects.equals(codigo, vuelo.codigo);
     }

     @Override
     public int hashCode() {
         return Objects.hash(codigo);
     }

     private void crearAsiento(){
         int numBusiness = (int) (asientosDisponibles *0.3);
         int numTurista = asientosDisponibles - numBusiness;

         for (int i = 0; i <= numBusiness; i++) {
             asientos.add(new AsientoBusiness((long)i,precioBase, TipoAsiento.TURISTA, i+i, "LETRA", false));
         }
         for (int i = numBusiness + 1; i <= asientosDisponibles; i++) {
             asientos.add(new AsientoTurista((long)i,precioBase, TipoAsiento.TURISTA, i+i, "LETRA", false));
         }
     }
     public int verificarDisponibilidad(TipoAsiento tipoA) {
         int disponibles = 0;
         for (Asiento asiento : asientos){
             if (asiento.getTipo() == tipoA && !asiento.isOcupado()){
                 disponibles++;

             }
         }
         return disponibles;
     }
     public Asiento buscarAsientoDisponible(TipoAsiento tipoasiento) {
         for (Asiento asiento : asientos) {
             if (asiento.getTipo() == tipoasiento && !asiento.isOcupado())
                 return asiento;
         }
         return null;
     }
     public boolean ocuparAsiento(Pasajero pasajero, Asiento asiento) {
         if (!asiento.isOcupado()) {
             asiento.ocupar(pasajero);
             return true;
         }
         return false;
     }
 }

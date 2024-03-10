//[]Sin empezar, [x]terminado, [-] incompleto o a revisar
package Asiento;

import Persona.Pasajero;

import java.util.Objects;
import java.util.Random;

/*Añade atributos:
[x]Long id,
[x]Pasajero pasajero,
[x]Double precioBase,
[x]Integer fila,
[x]String letra,
[x]TipoAsiento tipo
[x]Constructor (sin pasajero, ni tipo de asiento),
[x]getters, setters,
[-]toString (ojo a Pasajero – Asiento),
[x]equals por id.
Métodos extra:
[x]getCodigo(): devuelve un String con la fila y la letra del asiento.
[x]calcularPrecio(): devuelve el precio del asiento. Método abstracto.*/
public abstract class Asiento {
    private long id;
    private Pasajero pasajero;
    private double precioBase;
    private Integer fila;
    private String letra;
    private TipoAsiento tipo;
    private boolean ocupado;

    //CONSTRUCTOR (SIN PASAJEROS NI TIPO DE ASIENTO)
    public Asiento(long id, double precioBase, Integer fila, String letra) {
        this.id = id;
        this.precioBase = precioBase;
        this.fila = fila;
        this.letra = letra;
        this.ocupado = false;
    }

    //GETTERS Y SETTERS
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Pasajero getPasajero() {
        return pasajero;
    }

    public void setPasajero(Pasajero pasajero) {
        this.pasajero = pasajero;
    }

    public double getPrecioBase() {
        return precioBase;
    }

    public void setPrecioBase(double precioBase) {
        this.precioBase = precioBase;
    }

    public Integer getFila() {
        return fila;
    }

    public void setFila(Integer fila) {
        this.fila = fila;
    }

    public String getLetra() {
        return letra;
    }

    public void setLetra(String letra) {
        this.letra = letra;
    }

    public TipoAsiento getTipo() {
        return tipo;
    }

    public void setTipo(TipoAsiento tipo) {
        this.tipo = tipo;
    }

    //TO STRING
    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Asiento{");
        sb.append("id=").append(id);
        sb.append(", pasajero=").append(pasajero);
        sb.append(", precioBase=").append(precioBase);
        sb.append(", fila=").append(fila);
        sb.append(", letra='").append(letra).append('\'');
        sb.append(", tipo=").append(tipo);
        sb.append('}');
        return sb.toString();
    }

    //EQUALS Y HASHCODE
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
        Asiento asiento = (Asiento) o;
        return id == asiento.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    //devuelve un String con la fila y la letra del asiento
    public String getCodigo() {
            String codigo = getFila()+getLetra();
        return codigo;
    }

    //devuelve el precio del asiento. Método abstracto
    public abstract double calcularPrecio();
//   CHATGPT
//    public boolean isOcupado() {
//        return ocupado;
//    }
//    public void ocupar(Pasajero pasajero) {
//        this.pasajero = pasajero;
//        this.ocupado = true;
//    }
}

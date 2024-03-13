//[]Sin empezar, [x]terminado, [-] incompleto o a revisar
package Persona;
import Asiento.Asiento;
import Persona.Persona;
/*Añade atributos:
[x]String preferenciasComida,
[x]String restriccionesMedicas,
[x]Asiento asiento.
[x]Constructor con todos los parámetros,
[]Constructor copia,
[x]getters, setters
[x]toString.*/
public class Pasajero extends Persona {
    //ATRIBUTOS
    private String preferenciasComida;
    private String restriccionesMedicas;
    private Asiento asiento;

    //CONSTRUCCTOR CON TODOS LOS PARÁMETROS
    public Pasajero(long id, String nombre, String apellidos, String dniPasaporte, String email, String direccion, String ciudad, String pais, String telefono, String preferenciasComida, String restriccionesMedicas, Asiento asiento) {
        super(id, nombre, apellidos, dniPasaporte, email, direccion, ciudad, pais, telefono);
        this.preferenciasComida = preferenciasComida;
        this.restriccionesMedicas = restriccionesMedicas;
        this.asiento = asiento;
    }
    //CONSTRUCTOR COPIA

    //GETTERS Y SETTERS

    public String getPreferenciasComida() {
        return preferenciasComida;
    }

    public void setPreferenciasComida(String preferenciasComida) {
        this.preferenciasComida = preferenciasComida;
    }

    public String getRestriccionesMedicas() {
        return restriccionesMedicas;
    }

    public void setRestriccionesMedicas(String restriccionesMedicas) {
        this.restriccionesMedicas = restriccionesMedicas;
    }

    public Asiento getAsiento() {
        return asiento;
    }

    public void setAsiento(Asiento asiento) {
        this.asiento = asiento;
    }

    //TO STRING
    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Pasajero{");
        sb.append("preferenciasComida='").append(preferenciasComida).append('\'');
        sb.append(", restriccionesMedicas='").append(restriccionesMedicas).append('\'');
        sb.append(", asiento=").append(asiento);
        sb.append('}');
        return sb.toString();
    }
}

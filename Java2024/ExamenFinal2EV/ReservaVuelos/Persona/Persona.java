//[]Sin empezar, [x]terminado, [-] incompleto o a revisar
package Persona;

import java.util.Objects;

/*Clase básica con información:
[x]Long id,
[x]nombre,
[x]apellidos,
[x]dniPasaporte,
[x]dirección,
[x]ciudad,
[x]país,
[x]teléfono.
[x]Constructor vacío,
[x]constructor con todos los parámetros,
[x]getters, setters
[x]toString.
[x]Equals por dniPasaporte.*/
public class Persona {
    //ATRIBUTOS
    private long id;
    private String nombre;
    private String apellidos;
    private String dniPasaporte;
    private String email;
    private String direccion;
    private String ciudad;
    private String pais;
    private String telefono;

    //CONSTRUCTOR VACÍO
    public Persona() {
    }

    //CONSTRUCTOR CON TODOS LOS PARÁMETROS
    public Persona(long id, String nombre, String apellidos, String dniPasaporte, String email, String direccion, String ciudad, String pais, String telefono) {
        this.id = id;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.dniPasaporte = dniPasaporte;
        this.email = email;
        this.direccion = direccion;
        this.ciudad = ciudad;
        this.pais = pais;
        this.telefono = telefono;
    }

    //GETTERS Y SETTERS
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDniPasaporte() {
        return dniPasaporte;
    }

    public void setDniPasaporte(String dniPasaporte) {
        this.dniPasaporte = dniPasaporte;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    //TO STRING
    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Persona{");
        sb.append("id=").append(id);
        sb.append(", nombre='").append(nombre).append('\'');
        sb.append(", apellidos='").append(apellidos).append('\'');
        sb.append(", dniPasaporte='").append(dniPasaporte).append('\'');
        sb.append(", email='").append(email).append('\'');
        sb.append(", direccion='").append(direccion).append('\'');
        sb.append(", ciudad='").append(ciudad).append('\'');
        sb.append(", pais='").append(pais).append('\'');
        sb.append(", telefono='").append(telefono).append('\'');
        sb.append('}');
        return sb.toString();
    }

    //EQUALS
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null ) return false;
        Persona persona = (Persona) o;
        return Objects.equals(dniPasaporte, persona.dniPasaporte);
    }

    @Override
    public int hashCode() {
        return Objects.hash(dniPasaporte);
    }
}

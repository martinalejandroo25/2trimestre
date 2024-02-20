package Agenda;

public class contactoPersona extends Contacto{
    private String apodo;

    public String getApodo() {
        return apodo;
    }

    public void setApodo(String apodo) {
        this.apodo = apodo;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("contactoPersona{");
        sb.append("apodo='").append(apodo).append('\'');
        sb.append('}');
        return sb.toString();
    }
}

package Agenda;

public class ContactoEmpresa extends Contacto{
    private String cif;
    private String email;

    public String getCif() {
        return cif;
    }

    public void setCif(String cif) {
        this.cif = cif;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("ContactoEmpresa{");
        sb.append("cif='").append(cif).append('\'');
        sb.append(", email='").append(email).append('\'');
        sb.append('}');
        return sb.toString();
    }
}

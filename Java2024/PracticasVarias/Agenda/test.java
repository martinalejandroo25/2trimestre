package Agenda;

import org.w3c.dom.ls.LSOutput;

public class test {
    public static void main(String[] args) {
        //Crear contactos, 1particular y 1empresa
        Agenda agenda = new Agenda();
        contactoPersona persona1 = new contactoPersona();
        persona1.setNombre("Juan");
        persona1.setTelefono("123456789");
        persona1.setApodo("Er Juanico fino");

        ContactoEmpresa empresa1 = new ContactoEmpresa();
        empresa1.setNombre("PrimaFLor");
        empresa1.setTelefono("987654321");
        empresa1.setCif("768547548");
        empresa1.setEmail("primaflorNGS@agricultura.es");

        //Agregar contactos creados en la agenda
        agenda.addContacto(persona1);
        agenda.addContacto(empresa1);

        System.out.println("El contacto Juan existe? " + agenda.existeContacto(persona1));
        System.out.println("El contacto PrimaFLor existe? " + agenda.existeContacto(empresa1));

        //Buscar un contacto

        Contacto Buscar = agenda.buscarContacto(persona1);
        if(Buscar != null){
            System.out.println("COntacto encontrado: " + Buscar.getNombre());
        } else {
            System.out.println("Contacto no encontrado");
        }
        System.out.println(persona1.toString());
        System.out.println(empresa1.toString());
    }
}

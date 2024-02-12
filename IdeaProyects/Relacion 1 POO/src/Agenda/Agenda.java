package Agenda;

import java.util.ArrayList;

public class Agenda {
    ArrayList<Contacto> contactos;

    // Constructor de la clase Agenda
    public Agenda() {
        contactos = new ArrayList<Contacto>();
    }

    /*añadir contactos*/
    public void addContacto(Contacto c) {
        contactos.add(c);
    }

    /*eliminar Contactos*/
    public void eliminarContacto(Contacto c) {
        contactos.remove(c);
    }

    /*Existe el contacto? true o false*/
    public boolean existeContacto(Contacto c) {
        return contactos.contains(c);
    }

    /*Busca contacto, devuelve posicion*/
    public Contacto buscarContacto(Contacto c) {
        int posicion = contactos.indexOf(c);
        return contactos.get(posicion);
    }
}

package Agenda;

import java.util.Scanner;

/*public class testConMenu {
    public static void main(String[] args) {
        Agenda agenda = new Agenda();
        agenda.addContacto(new contactoPersona("Jose manueh", "55664433", "Pepe"));
        Scanner sc = new Scanner(System.in);
        int opcion = 0;
        while (opcion != 5) {
            System.out.println("1.Listar contactos");
            System.out.println("2.Agregar contacto");
            System.out.println("3.Eliminar contacto");
            System.out.println("4.Buscar contacto");
            System.out.println("5.Salir");

            opcion = Integer.parseInt(sc.nextLine());

            switch (opcion) {
                case 1:
                    agenda.listarContactos();
                    break;
                case 2:
                    System.out.println("1.Empresa, 2.Persona");
                    int tipo = Integer.parseInt(sc.nextLine());
                    if (tipo == 1) {
                        System.out.println("Nombre:");
                        System.out.println("Telefono:");
                        System.out.println("Cif");
                        System.out.println("Email");
                    } else if (tipo == 2) {
                    }
                    agenda.addContacto();
                    break;
                case 3:
                    System.out.println("Nombre del contacto a eliminar:");
                    String nombre = sc.nextLine();
                    Contacto contaELiminar = new Contacto(nombre, null);
                    // Eliminamos el contacto con el mismo nombre
                    agenda.eliminarContacto(contaELiminar);
                    break;
                case 4:
                    agenda.buscarContacto();
                    break;
                case 5:
                    System.out.println("Gracias por usar Mi Agenda");
                    break;
                default:
                    System.out.println("Opcion no valida");
                    break;
            }
        }
    }
}
        */
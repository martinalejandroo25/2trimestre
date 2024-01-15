package Ejercicio7;

public class Incidencia {
    enum Estado {ABIERTA, ENPROCESO, RESUELTA}
    private String codigo;
    private Estado estado;
    private String problema;
    private String solucion;

    public static int pendientes = 0;

public Incidencia(String codigo, String problema, String solucion) {
    this.codigo = codigo;
    this.estado = Estado.ABIERTA;
    this.problema = problema;
    this.solucion = solucion;
}
}

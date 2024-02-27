package src.Relacion2;

public abstract class Ejercicio1 {
    private int peso;
    public final void setPeso(int p) { peso = p; }
    public abstract int getVelocidadActual();
}
//¿Podrá tener descendencia esta clase?
// Sí, la clase Vehículo puede tener descendencia.
// Al ser una clase abstracta, está diseñada para ser extendida por clases concretas.
// Las clases abstractas proporcionan una base común para las clases hijas
// y pueden contener métodos abstractos que deben ser implementados por las subclases.


// ¿Se pueden sobreescribir todos sus métodos?
// No todos los métodos de la clase Vehiculo pueden ser sobrescritos:
//El método setPeso(int p) no puede ser sobrescrito porque está marcado como final.
// La palabra clave final en un método indica que no se puede anular en las subclases.
//El método getVelocidadActual() es abstracto,
// por lo que debe ser implementado por cualquier clase que extienda Vehículo.
// Las clases hijas deben proporcionar su propia implementación para este método abstracto.


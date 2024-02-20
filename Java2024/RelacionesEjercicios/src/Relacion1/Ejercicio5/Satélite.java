package Relacion1.Ejercicio5;

public class Satélite {
    private double meridiano;
    private double paralelo;
    private double distancia_tierra;

public void Satelite(double m, double p, double d) {
    meridiano = m;
    paralelo = p;
    distancia_tierra = d;
}
public void Satelite() {
    meridiano = paralelo = distancia_tierra = 0.0;
}
public void setPosicion(double m, double p, double d) {
    meridiano = m;
    paralelo = p;
    distancia_tierra = d;
}
//Metodos del ejercicio///////////////////////////////////////
public void variaAltura(double desplazamiento) {
    //ACEPTA UN PARÁMETRO + O - DEPENDIENDO DE SI SE AEJA O ACERCA A LA TIERRA
    if (desplazamiento > 0) {
        paralelo += desplazamiento;
    }   else if (desplazamiento < 0) {
        paralelo -= desplazamiento;
    }
}
public boolean enOrbita() {
    //FALSE SATELITE ESTÁ EN LA TIERRA, TRUE SATELITE NO ESTÁ EN LA TIERRA
    if (distancia_tierra < paralelo) {
        return true;
    } else {
        return false;
    }
}
public void variaPosicion(double variap, double variam) {
    if (variap > 0) {
        meridiano += variap;
    } else if (variap < 0) {
        meridiano -= variap;
    }
}
////////////////////////////////////////////////////////////

public void printPosicion() {
    System.out.println("El satélite e encuentra en ");
    System.out.println("el paralelo "+paralelo+" meridiano "+meridiano);
    System.out.println(" a una distancia de la tierra de "+distancia_tierra+" kms.");
}
}

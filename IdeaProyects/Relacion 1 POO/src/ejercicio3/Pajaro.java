package ejercicio3;
/*public class Pajaro {
public void setedad(int e) { edad=e; }
public void printedad() { System.out.println(edad); }
public void setcolor(char c) { color=c; }
private int edad;
private char color;
}*/

public class Pajaro {
        private int edad;             //recolocacion de edad y color
        private char color;

        public void setEdad(int e) {
                this.edad = e;         //cambio de edad=e a this.edad = e
        }

        public void setColor(char color) {
                this.color = color;
        }
        public void printEdad() {
            System.out.println("La edad es de "+edad+ " años");

        }
        public void printColor() {
                System.out.println("El color es "+color);

        }
}

//El codigo está bien y compila perfectamente,
//Añadí this. a las variables dentro de los métodos
// cambié el orden de las variables para que estén antes que los métodos
// y los nombres de los metodos a setEdad y setColor
//He añadido un método extra para imprimir el color
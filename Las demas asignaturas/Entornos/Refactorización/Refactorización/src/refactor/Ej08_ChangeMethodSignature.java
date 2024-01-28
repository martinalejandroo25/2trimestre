package refactor;

public class Ej08_ChangeMethodSignature {
	public static void main(String[] args) {
		System.out.println(miMetodo());
	}

	public static boolean miMetodo() {
		int numero = 75;
		int contador = 2;
		boolean primo = true;
		while (primo && contador != numero) {
			if (numero % contador == 0)
				primo = false;
			contador++;
		}
		return primo;
	}
}

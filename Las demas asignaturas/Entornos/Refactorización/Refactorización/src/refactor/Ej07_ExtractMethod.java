package refactor;

public class Ej07_ExtractMethod {
	public boolean esPrimo(int numero) {
		int contador = 2;
		boolean primo = true;
		while (primo && contador != numero) {
			if (numero % contador == 0)
				primo = false;
			contador++;
		}
		return primo;
	}

	public boolean esPar(int numero) {
		return (numero % 2 == 0);
	}

}

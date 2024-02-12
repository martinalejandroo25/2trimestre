
sumar() {
    echo $((num1 + num2))
}
restar() {
    echo $((num1 - num2))
}
multiplicar() {
    echo $((num1 * num2))
}
dividir() {
    echo $((num1/num2))
    echo $((num1 % num2))
    if [ $num2 -eq 0 ]; then
        echo "No se puede dividir por 0"
    fi
}
echo Quieres insertar s/n??
read respuesta
if [ "$respuesta" = "s" ]; then
    echo Inserta el primer número
    read num1
    echo Inserta el segundo número
    read num2
    echo La suma da `sumar`
    echo La resta da `restar`
    echo la multiplicacion da `multiplicar`
    echo la division junto con su resto son `dividir`
fi
if [ "$respuesta" = "n" ]; then
    echo Adios y gracias por su visita
    exit 1
fi

#!/bin/bash

#Ejercicio 1: Calculadora básica
#Crea un script de Bash que funcione como una calculadora básica. Debe permitir al usuario ingresar dos números y luego elegir una operación (suma, resta, multiplicación o división). El script debe realizar la operación seleccionada y mostrar el resultado.
#
#Requisitos:
#El script debe solicitar al usuario que ingrese dos números.
#Luego, debe presentar un menú que permita al usuario elegir la operación a realizar (suma, resta, multiplicación o división).
#Después de que el usuario seleccione una operación, el script debe realizar el cálculo correspondiente y mostrar el resultado.
#Si el usuario elige una operación inválida o intenta dividir por cero, el script debe mostrar un mensaje de error adecuado y volver al menú principal.

menu(){
    echo "-----------------------------------"
    echo "Bienvenido a mi calculadora"
    echo "1. Suma"
    echo "2. Resta"
    echo "3. Multiplicación"
    echo "4. División"
    echo "5. Salir"
    echo "-----------------------------------"
    read opcion
    case $opcion in
        1)
            suma
        ;;
        2)
            resta
            ;;
        3)
            multiplicacion
            ;;
        4)
            Division
            ;;
        5)
            echo "Adioos"
            exit
            ;;
        *)
            echo "Opción no valida"
            menu
            ;;
    esac
}

suma() {
    echo "Ingrese el primer número"
    read num1
    echo "Ingrese el segundo número"
    read num2
    echo "La suma es: $(( $num1 + $num2 ))"
}
resta() {
    echo "Ingrese el primer número"
    read num1
    echo "Ingrese el segundo número"
    read num2
    echo "La resta es: $(( $num1 - $num2 ))"
}
multiplicacion(){
    echo "Ingrese el primer número"
    read num1
    echo "Ingrese el segundo número"
    read num2
    echo "La multiplicación es: $(( $num1 * $num2 ))"
}
Division(){
    echo "Ingrese el primer número"
    read num1
    echo "Ingrese el segundo número"
    read num2
    if [ $num2 -eq 0 ]; then  # Corrección aquí
        echo "No se puede dividir entre 0"
    else
        echo "La División es: $(($num1/$num2))"
    fi
}


menu
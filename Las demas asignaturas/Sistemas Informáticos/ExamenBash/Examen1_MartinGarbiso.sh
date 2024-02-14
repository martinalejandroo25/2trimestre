#!/bin/bash
#Menú que actúe sobre un directorio (del directorio de trabajo) que se le pase como parámetro. Se
#debe comprobar que el usuario que ejecuta el script es root.
#Las opciones son:

#1. Mostrar el camino absoluto del directorio. Si no existe el directorio se creará.

#2. Cambiar los permisos(en octal) al directorio para el usuario, grupo y otros. Previamente y
#posteriormente visualiza los permisos para comprobar que se han cambiado.

#3. Crear un fichero llamado fich1.txt en el directorio.

#4. Añade el contenido “Soy tu nombre” al fich1.txt

#5. Visualizar el contenido del directorio recursivamente.

#Las comprobaciones a realizar:
#3. Los valores de los permisos están entre 0 y 7.#
#1. El número de parámetros es 1.#
#2. El parámetro es directorio.#
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script debe ser ejecutado como root."
    exit 1
fi

menu(){
    echo "*************************************"
    echo "Menu de Opciones"
    echo "1.Mostrar el camino"
    echo "2.Cambiar los permisos"
    echo "3.Crear un fichero"
    echo "4.Añadir contenido al fichero"
    echo "5.Visualizar el directorio"
    echo "0.Salir"
    echo "*************************************"
    read opcion

    case $opcion in

        1)
    read -p "Ingrese el directorio para mostrar el camino: " directorio
    camino "$directorio";;
        2)
            permisos;;
        3)
            fichero;;
        4)
            contenido;;
        5)
    read -p "Ingrese el directorio para mostrar su contenido: " directorio
    visualizado "$directorio";;


        0)
            salir;;
    esac
}
camino() {
    if [ $# -gt 0 ]; then
        directorio="$1"
        if [ -d "$directorio" ]; then
            lugar=$(realpath "$directorio")
            echo "El directorio se encuentra en $lugar"
        else
            echo "El directorio proporcionado no es válido: $directorio"
        fi
    else
        echo "No se ha proporcionado ningún directorio como argumento"
    fi
}


permisos() {
    read -p "Ingrese el directorio para cambiar permisos: " directorio

    if [ ! -d "$directorio" ]; then
        echo "El directorio no existe."
        return 1
    fi

    echo "Permisos antes del cambio:"
    ls -ld "$directorio"
    read -p "Ingrese permisos en formato octal (usuario grupo otros): " permisos
    chmod "$permisos" "$directorio"
    echo "Permisos después del cambio:"
    ls -ld "$directorio"
}

fichero() {
    read -p "Ingrese el nombre del nuevo directorio: " directorio

    if [ -e "$directorio" ]; then
        echo "El directorio ya existe."
    else
        mkdir "$directorio"
        echo "Directorio creado exitosamente."
    fi
}

contenido(){
    read -p "Inserte el nombre del nuevo fichero: " fichero
    if [ -e "$fichero" ]; then
        echo "Este fichero ya fue creado"
    else
        touch "$fichero"
        echo "Fichero creado exitosamente."
    fi
}

visualizado() {
    directorio="$1"
    echo "Listando contenido de $directorio:"
    ls -R "$directorio"
}

salir(){
    echo "Gracias por usar mi programa :))"
    exit 0
}

while true; do
menu
done
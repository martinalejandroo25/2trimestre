#!/bin/bash

# Función para mostrar el menú
menu() {
    echo "-----------------------------------"
    echo "Menú de Acciones sobre Directorio"
    echo "1. Mostrar camino absoluto del directorio"
    echo "2. Cambiar permisos del directorio"
    echo "3. Crear fichero 'fich1.txt' en el directorio"
    echo "4. Añadir contenido al fichero 'fich1.txt'"
    echo "5. Visualizar contenido del directorio recursivamente"
    echo "6. Salir"
    echo "-----------------------------------"
    read -p "Seleccione una opción: " opcion
    case $opcion in
        1) mostrar_camino_absoluto ;;
        2) cambiar_permisos ;;
        3) crear_fichero ;;
        4) añadir_contenido ;;
        5) visualizar_contenido ;;
        6) echo "¡Adiós!"; exit ;;
        *) echo "Opción no válida"; menu ;;
    esac
}

# Función para mostrar el camino absoluto del directorio
mostrar_camino_absoluto() {
    read -p "Ingrese el nombre del directorio: " directorio
    if [ -d "$directorio" ]; then
        echo "El camino absoluto del directorio es: $(realpath "$directorio")"
    else
        echo "El directorio no existe. Creándolo..."
        mkdir "$directorio" && echo "Directorio creado."
    fi
}

# Función para cambiar permisos del directorio
cambiar_permisos() {
    read -p "Ingrese el nombre del directorio: " directorio
    if [ -d "$directorio" ]; then
        ls -ld "$directorio"
        read -p "Ingrese los nuevos permisos (en octal) para el directorio: " permisos
        chmod "$permisos" "$directorio"
        echo "Permisos cambiados."
        ls -ld "$directorio"
    else
        echo "El directorio no existe."
    fi
}

# Función para crear fichero 'fich1.txt' en el directorio
crear_fichero() {
    read -p "Ingrese el nombre del directorio: " directorio
    if [ -d "$directorio" ]; then
        touch "$directorio/fich1.txt"
        echo "Fichero 'fich1.txt' creado en el directorio."
    else
        echo "El directorio no existe."
    fi
}

# Función para añadir contenido al fichero 'fich1.txt'
añadir_contenido() {
    read -p "Ingrese el nombre del directorio: " directorio
    if [ -d "$directorio" ]; then
        echo "Soy $(whoami)" >> "$directorio/fich1.txt"
        echo "Contenido añadido al fichero 'fich1.txt'."
    else
        echo "El directorio no existe."
    fi
}

# Función para visualizar contenido del directorio recursivamente
visualizar_contenido() {
    read -p "Ingrese el nombre del directorio: " directorio
    if [ -d "$directorio" ]; then
        tree "$directorio"
    else
        echo "El directorio no existe."
    fi
}

# Comprobar si el usuario es root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script debe ser ejecutado como root."
    exit 1
fi

# Llamar al menú
menu

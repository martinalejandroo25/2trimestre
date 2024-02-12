#!/bin/bash

#6. Menú con 4 opciones que actúe sobre un fichero que se le pase como argumento.

#1. Buscar el fichero y mostrar su camino absoluto.
#2. Cambiar los permisos al fichero. 
#3. Buscar una cadena (que se solicita)  en el fichero.
#4. Salir

if [ $# -eq 0 ]; then
	echo "Uso: $0 <archivo>"
	exit 1
fi

archivo="$1"

#verificar que el archivo existe
if [ ! -f "$archivo" ]; then
	echo "El archivo '$archivo' no existe"
	exit 1
fi

mostrar_camino_absoluto() {
	echo "El camino absoluto del archivo es: $(realpath "$archivo")"
}

cambiar_permisos(){
	echo "Ingrese los permisos a establecer para el archivo(en formato numérico, por ejemplo, 755:)"
	read permisos
	sudo chmod "$permisos" "$archivo"
	echo "Se han cambiado los permisos del archivo a $permisos"
}

buscar_cadena() {
	echo "Ingrese la cadena a buscar en el archivo:"
	read cadena
	if grep -q "$cadena" "$archivo"; then
		echo "La cadena '$cadena' fue encontrada en el archivo"
	else
		echo "La cadena '$cadena' no fue encontrada en el archivo"
	fi
}

mostrar_menu(){
	echo "Menú de opciones"
	echo "1. Buscar el fichero y mostrar su camino absoluto."
	echo "2. Cambiar los permisos al fichero."
	echo "3. Buscar una cadena (que se solicita)  en el fichero."
	echo "4.Salir"
	echo "Seleccione una opción; "
	read opcion
	
	case $opcion in
		1) mostrar_camino_absoluto;;
		2) cambiar_permisos;;
		3) buscar_cadena;;
		4) echo "Saliendo..."; exit;;
		*) echo "Opción no válida. ";;
	esac
}

#bucle del programa
while true; do
	mostrar_menu
done


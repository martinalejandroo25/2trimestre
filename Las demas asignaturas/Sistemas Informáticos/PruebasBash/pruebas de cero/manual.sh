#!/bin/bash

nombre="Martín"
echo "Hola, $nombre"

# Estructuras de control
#Condicionales (if-else)
if [ condicion ]; then
    comando
elif [ otra_condicion ]; then
    otro_comando
else
    otro_comando
fi

# Bucles (for y while)
for i in {1..10}; do
    echo $i
done

while [ condicion ]; do
    comando
done

#Funciones
mi_funcion() {
    #cuerpo de la función
}

#LLamando a la función
mi_funcion

#parámetros y argumentos
echo "El primer argumento es: $1"
echo "El segundo argumento es: $2"

#Entrada/Salida estándar
read -p "Ingrese un valor: " valor
echo "El valor ingresado es: $valor"

#Redirecciones
comando > archvo_salida
comando < archivo_entrada
comando 2> archivo_errores

#Expansiones
echo "Lista de archivos en el directorio actual: " *
echo "El resultado de la suma es: $((2+2))"
echo "El contenido de la variable var es: ${var}"

#Comprobación de archivos y directorios
if[ -e archivo ]; then
    echo "El archivo existe"
fi

if[ -d directorio ]; then
    echo "Es un directorio"
fi

#Control de procesos
#(Ejemplos de comandos ps, kill, bg, fg, etc.)

#Comentarios
#ESte es un comentario
#Otro comentario

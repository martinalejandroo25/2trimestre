#!/bin/bash
#Se pasa un directorio como parámetro y debe comprimirlo con el #formato fecha_ nombre_directorio.tar.gz. La fecha debe estar en #el formato dd-mm-yyyy


if [ $# -eq 1 ]; then
    echo "Directorio seleccionado"
    tar -zcf $1/$2.tar.gz $1
    echo "Archivo comprimido"
    
    exit 1
else
    echo "No se introduzco ningún parámetro"
fi


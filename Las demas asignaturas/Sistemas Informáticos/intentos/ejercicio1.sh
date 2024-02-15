#!/bin/bash
#Se pasa un directorio como parámetro y debe comprimirlo con el #formato fecha_ nombre_directorio.tar.gz. La fecha debe estar en #el formato dd-mm-yyyy


if [ $# -eq 1 ]; then
    if [ -d $@ ]; then
fecha=(date +F%)
    tar -cf $fecha$@.tar $@
    gzip $fecha$@.tar
    echo "fichero compreso con exito"

    else
        echo "No se ingresó un parámetro"
    fi
fi
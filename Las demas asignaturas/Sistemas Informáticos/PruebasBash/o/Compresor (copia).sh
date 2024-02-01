#!/bin/bash

#Comprobar si se insertó un parametro
if [ $# -eq 1 ]; then
    if [ -d $@ ];then
    fecha=(date +f%)
    tar -cf $fecha$@.tar $@
    gzip $fecha$@.tar
    
    else
    echo "$@ No es un directorio"
    fi
else
    echo "No se ingresó un parametro"
fi

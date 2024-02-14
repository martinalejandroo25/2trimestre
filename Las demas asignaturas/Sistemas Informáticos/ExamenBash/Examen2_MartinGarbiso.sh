#!/bin/bash
#Se debe trabajar como usuario root y en un disco donde no esté el sistema operativo.
#Crear un menú con las siguientes opciones :
#1. Visualizar las particiones de todos los discos.

#2. Crear una partición lógica de tamaño 100MB.

#3. Formatear la partición anterior en sistema de ficheros ext4.

#4. Montar la partición en el directorio /datosExamen4

#5. Crea un usuario, solicitando su nombre y comprobando si existe en el sistema.

#6. Visualiza procesos y servicios.

if [ "$(id -u)" -ne 0 ]; then
    echo "Este script debe ser ejecutado como root."
    exit 1
fi

menu(){
    echo "****************************************"
    echo "Menu de opciones"
    echo "1.Visualizar las particiones de todos los discos
    2.Crear una partición lógica de tamaño 100MB
    3. Formatear la particion en el directorio /datosExamen4
    4.Crear un usuario, solicitando su nombre y comprobando si existe en el sistema
    5. Visualiza procesos y servicios"
    echo "****************************************"
    read opcion

    case $opcion in

        1)
            fdisk -l;;
        2)
            crearPart;;
        3)
            Format;;
        4)
            MontarPart;;
        5)
            newUser;;
        6)
            Procesos;;
        0)
}
crearPart(){

}
Format(){

}
newUser(){

}
Procesos(){

}

while true; do
menu
done
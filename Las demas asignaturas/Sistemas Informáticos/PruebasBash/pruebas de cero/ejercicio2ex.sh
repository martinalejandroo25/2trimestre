#!/bin/bash

# Comprobar si el script se está ejecutando como root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script debe ser ejecutado como root."
    exit 1
fi

# Función para mostrar el menú
menu() {
    echo "-----------------------------------"
    echo "Menú de Acciones"
    echo "1. Visualizar particiones de todos los discos"
    echo "2. Crear una partición lógica de tamaño 100MB"
    echo "3. Formatear la partición en sistema de ficheros ext4"
    echo "4. Montar la partición en el directorio /datosExamen4"
    echo "5. Crear un usuario"
    echo "6. Visualizar procesos y servicios"
    echo "7. Salir"
    echo "-----------------------------------"
    read -p "Seleccione una opción: " opcion
    case $opcion in
        1) visualizar_particiones ;;
        2) crear_particion ;;
        3) formatear_particion ;;
        4) montar_particion ;;
        5) crear_usuario ;;
        6) visualizar_procesos_servicios ;;
        7) echo "¡Adiós!"; exit ;;
        *) echo "Opción no válida"; menu ;;
    esac
}

# Función para visualizar las particiones de todos los discos
visualizar_particiones() {
    fdisk -l
}

# Función para crear una partición lógica de tamaño 100MB
crear_particion() {
    echo "Creando partición lógica de tamaño 100MB..."
    parted -s /dev/sdb mkpart primary ext4 0% 100MB
}

# Función para formatear la partición en sistema de ficheros ext4
formatear_particion() {
    echo "Formateando la partición en sistema de ficheros ext4..."
    mkfs.ext4 /dev/sdb1
}

# Función para montar la partición en el directorio /datosExamen4
montar_particion() {
    echo "Montando la partición en el directorio /datosExamen4..."
    mkdir -p /datosExamen4
    mount /dev/sdb1 /datosExamen4
}

# Función para crear un usuario
crear_usuario() {
    read -p "Ingrese el nombre de usuario a crear: " nombre_usuario
    if id "$nombre_usuario" &>/dev/null; then
        echo "El usuario ya existe."
    else
        useradd -m "$nombre_usuario"
        echo "Usuario '$nombre_usuario' creado correctamente."
    fi
}

# Función para visualizar procesos y servicios
visualizar_procesos_servicios() {
    echo "Visualizando procesos:"
    ps aux

    echo "Visualizando servicios:"
    systemctl list-units --type=service
}

# Llamar al menú
menu

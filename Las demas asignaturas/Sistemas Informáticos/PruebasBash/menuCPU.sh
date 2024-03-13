#!/bin/bash
menu() {
    echo "--------------------------------"
    echo "1.Mostrar la fecha del sistema"
    echo "2.Mostrar la información sobre qué usuarios han iniciado sesión y qué están haciendo"
    echo "3.Mostrar los 10 procesos que consumen más CPU"
    echo "4. Mostrar los 5 procesos que consumen más memoria"
    echo "6.Salir del menú"
    echo "--------------------------------"
read -p "Seleccione una opción(1-6): " select
    case $select in
        1)
            date;;
        2)
            echo who;;
        3) ps aux --sort
        
esac
}
menu 

while true; do
menu
done
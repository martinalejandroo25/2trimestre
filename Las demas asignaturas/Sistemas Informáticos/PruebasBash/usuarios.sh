#!bin/bash
#menu
mostrarMenu(){
	echo "Opciones"
	echo "1.Informacion del usuario actual"
	echo "2. Eliminar un usuario"
	echo "3. Añadir usuarios"
	echo "4. Añadir usuarios a grupos"
	echo "5. eliminar usuarios de grupos"
	echo "6.añadir grupos"
	echo "7.Eliminar grupos"
	echo "8. Salir"
}

Informacion() {
	us_actual=$(whoami)
	echo "El nombre de usuario actual es: $us_actual"
	
	direc_inicio=$(echo ~)
	echo "El directorio de inicio del usuario actual es: $direc_inicio"
	
	uid=$(id -u)
	echo "El UID del usuario actual es $uid"

	nom_completo=$(getent passwd $USER | cut -d ':' -f 5 | cut -d ',' -f 1)
	echo "El nombre completo del usuario actual es: $nom_completo"

	numero_grupos=$(id -nG | wc -w)
	echo "El usuario actual pertenece a $numero_grupos grupos"
}
deleteUser() {
	#verificar si se proporciono un nombre de usuario
	if [ $# -eq 0 ]; then
		echo "Uso: $0 nombre_de_usuario"
		exit 1
	fi
	#nombre de usuario proporcionado como argumento
	usuario=$1
	
	#Verifica si usuario existe
	if id "$usuario" &>/dev/null; then
	
		#eliminar usuario
		sudo userdel -r "$usuario"
		echo "El usuario $usuario ha sido eliminado correctamente"
	else
		echo "El usuario $usuario no existe"
	fi
}

addUsuarios() {
	#verificar si se proporciono un nombre de usuario
	if [ $# -eq 0 ]; then
		echo "Uso: $0 nombre_de_usuario"
		exit 1
	fi
	#nombre de usuario proporcionado como argumento
	usuario=$1
	
	#Verifica si usuario existe
	if id "$usuario" &>/dev/null; then
		echo "El usuario $usuario ya existe"
		exit 1
	fi
	
	#Crear el usuario
	sudo useradd -m "$usuario"
	
	#verificar si el usuario se creó
	if [ $? -eq 0]; then
		echo "El usuario $usuario se ha creado correctamente"
	else
		echo "Hubo un error al crear el usuario $usuario"
	fi
}	

addUserToGroup() {
	echo Escribe el nombre de usuario a seleccionar
	read user
    echo Escribe el nombre de grupo a seleccionar
	read group
    
    #verificar si se proporciono un nombre de usuario
	local user=$user
	#verificar si se proporciono un nombre de grupo
	local user=$group
	if groups "$user" | grep &> /dev/null "\b$group\b"; then
		echo "El usuario $user ya pertenece al grupo $group"
		exit 1
	else
		sudo usermod -aG "$group" "$user"
		echo "El usuario $user ha sido agregado al grupo $group"
	fi
}
removeUserFromGroup() {
	echo "Escribe el usuario a Seleccionar"
    read user
    echo "Escribe el grupo del cual se eliminará el usuario $user"
	read group
    
    #verificar si se proporciono un nombre de usuario
	local user=$user
    #verificar si se proporciono un nombre de grupo
    local user=$group
    if groups "$user" | grep &> /dev/null "\b$group\b"; then
		sudo gpasswd -d "$group" "$user"
	else 
		echo "El usuario $user no pertenece al grupo $group"
	fi
}
addgroup() {
	Echo "Da un nombre para el grupo a añadir"
	read $group
	if
		local group=$group
		echo "El grupo $group ya existe"
	else
		sudo groupadd "$group"
        echo "El grupo $group se ha creado correctamente"
	fi
}
deleteGroup(){
	Echo "Da un nombre de un grupo válido para eliminar"
	read $group
    if
        local group=$group
		sudo groupdel "$group"
		echo "El grupo $group se ha eliminado correctamente"
	else
		echo "El grupo $group no existe"
	fi	
}


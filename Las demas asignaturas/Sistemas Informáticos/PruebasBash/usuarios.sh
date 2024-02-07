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

}
removeUserFromGroup() {

}
addgroup() {

}
deleteGroup(){

}


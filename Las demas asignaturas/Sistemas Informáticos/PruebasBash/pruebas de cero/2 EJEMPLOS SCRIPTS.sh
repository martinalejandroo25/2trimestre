*****************************************************************************
#!/bin/bash
#EJEMPLO DE VARIABLE SOLICITADA
read -p "Introduce número " num
echo "El número introducido ha sido" $num

#EJECUCIÓN1
sh ejemplo1.sh
#EJECUCIÓN2
chmod 777 ejemplo2.sh
./ejemplo2.sh
#RESULTADO
Introduce número 56
El número introducido ha sido 56

****************************************************************************
#!/bin/bash
#Muestre el valor de 6 variables de entorno
clear
echo "La variable LOGNAME tiene el valor" $LOGNAME 
echo "La variable HOME tiene el valor" $HOME
echo "La variable SHELL tiene el valor" $SHELL
echo "La variable PWD tiene el valor " $PWD
echo "La variable USER tiene el valor" $USER
echo "La variable SSH_TTY tiene el valor" $SSH_TTY

***************************************************************************
#!/bin/bash
#UTILIZACIÓN DE PARÁMETROS
echo El parámetro '$1' es $1
echo El parametro '$2' es $2
echo El parametro '$3' es $3
echo Numero de parametros $#
echo Todos los parametros $*
echo Nombre de archivo $0

#EJECUCIÓN indicando parámetros
./script3_paramentros María Juan Martín

***************************************************************************
#!/bin/bash
#EJEMPLO IF:Pide una nota numerica y muestra la correspondiente alfabética
read -p "Introduce una nota: " nota
if [ $nota -ge 9 ];then
        echo "sobresaliente"
	elif [ $nota -ge 7 ];then
      	echo "notable"
	elif [ $nota -ge 6 ];then
       	echo "bien"
	elif [ $nota -ge 5 ];then
       	echo "suficiente"
else
        echo "Insuficiente"
fi

**************************************************************************
#!/bin/bash
#Solicita un archivo e indica el tipo de archivo y si tiene permisos de r
clear
read -p "Archivo: " archivo

# EXISTE
if [ -e $archivo ];then
	echo "El archivo" $archivo "existe"
	# TIPO DE ARCHIVO
	if [ -b $archivo ];	then
        	echo "Es un archivo especial de bloques"
		elif [ -c $archivo ];	then
		    echo "Es un archivo de caracteres"
		elif [ -d $archivo ];	then
		    echo "Es un directorio"
		elif [ -f $archivo ];	then
		    echo "Es un fichero ordinario"
		elif [ -h $archivo ];	then    
        	echo "Es un archivo simbólico"
	fi
	# PERMISOS
	if [ -r $archivo ];	then
        	echo "Tiene permiso de lectura"
	fi
else
	echo "El archivo no existe"
fi

#RESULTADO
Archivo: /dev/sda

El archivo /dev/sda existe
Es un archivo especial de bloques
Tiene el permiso de lectura
************************************************************************
#!/bin/bash
#pide dos cadena, e indica
#Si la cadenaX (NO) está vacia
#Y compara ambas cadenas
clear
read -p  "Indica la primera cadena: " cadena1
read -p "Indica la segunda cadena: "  cadena2

if [ -z $cadena1 ];then
        echo "La cadena1 esta vacia"
else
        echo "La cadena1 NO esta vacia"
fi
if [ -z $cadena2 ];then
        echo "La cadena2 esta vacia"
else
        echo "La cadena2 NO esta vacia" 
fi
if [ "$cadena1" == "$cadena2" ];then
       echo "Las cadenas son iguales"
else
        echo "Las cadenas NO son iguales"
fi

***********************************************************************
#!/bin/bash
#EJEMPLO WHILE, IF, CASE
# Pide números hasta que se pulse el 999, e indica si quiero ver los números introducidos.
# Si indico que si, me pregunta (O)orden establecido,
# (A)scendente, (D)escendente
clear
num=0
while [ $num -ne 999 ];do
        read -p "Número: " num
	if [ $num -ne 999 ];then
        echo $num >> numeros.txt
    fi
done

echo -n "¿Quieres ver los números introducidos?(s/n) "
read res
if [ $res == "s" -o $res == "S" ];then
	read -p "¿Orden estalbecido, ascendente o descentente?(o/a/d) " orden
	case $orden in
		o|O)
        cat numeros.txt;;
		a|A)
				cat numeros.txt | sort -n;;
		d|D)
				cat numeros.txt | sort -n -r;;
		*)
				echo Opción no válida;;
	esac
fi
rm numeros.txt 
echo "Gracias por utilizarnos"

*****************************************************************************
#!/bin/bash
#EJEMPLO FOR
#Pide una extensión de fichero y busca ficheros con la extensión en el directorio actual
#Nombre fichero
#contenido fichero
#Muestra separador ======

clear
read -p "Extension del fichero: " extension
for i in `ls *.$extension` ;do
    echo "Nombre de fichero: " $i
    echo "El contenido de" $i
    cat $i
    echo ==================================
done

******************************************************************************
#!/bin/bash
#EJEMPLO DE COMPROBACIÓN DE PARÁMETROS
#comprobar que se han pasado dos parámetros y solo dos, en caso contrario, indicar mensaje correspondiente:
#ningún parámetro -> Quiere introducirlos ahora s/n
#1 parámetro->quiere introducir el otro s/n
#>2 parámetros–> demasiados parámetros, utilizaremos los 2 primeros
#2 CORRECTO Y Realiza las 4 operaciones básicas con los 2 parámetros 
clear
case $# in
	0) 
		echo No ha introducido ninguno
		read -p "Quiere ahora s/n? " resp
		if [ $resp == "s" ];then
			read -p Num1: num1
			read -p Num2: num2
			echo "HAGO OPERACIONES"
		else
			exit 1 # no pongo nada
		fi
	;;
	1)
		echo "Ha introducido uno"
	  read -p "Quiere ahora s/n?" resp
    if [ $resp == "s" ]; then
          read -p Num2: num2
					num1=$1
          echo HAGO OPERACIONES
    else
          exit 2 # pongo solo 1 parámetro
    fi
  ;;
	2)
		num1=$1
		num2=$2
		echo "HAGO OPERACIONES"
  ;;
	*)
		num1=$1
		num2=$2
		echo "Demasiados parametros, cojo 2 primeros"
		echo "HAGO OPERACIONES"
	;;
esac
echo "$num1 + $num2 =" $(($num1 + $num2))
echo "$num1 - $num2 =" $(($num1 - $num2))
echo "$num1 * $num2 =" $(($num1 * $num2))
if [ $num2 -ne 0 ];then
	echo "$num1 / $num2 =" $(($num1 / $num2))
else
	echo "No se puede realizar la división por 0"
fi


********************************************************************************************************
#! /bin/bash
#EJEMPLO IF Y WIHILE Y CONTADOR DE INTENTOS
#Realiza la pregunta 2+2? tres veces e indica Correcto, si acierta, o te quedan X intentos si no acierta.
clear
intentos=1
quedan=3
while [ $quedan -gt 0 ];do
	read -p "2+2?:" result
	if  [ $result -eq 4 ];then
		echo CORRECTO, acertado en intento $intentos
		exit
	else
		quedan=$(($quedan - 1))
		if [ $quedan -ne 0 ];then
			echo Te quedan $quedan intentos
		fi
	intentos=$(($intentos + 1))
	fi
done
echo Game Over

***********************************************************************************
EJEMPLO CON INFORMACIÓN DE FICHEROS Y UTILIZACIÓN DE FILTROS
A partir del fichero puntuaciones.txt

ALONSO,12
VETTEL,10
HAMILTON,3

Lee el fichero e indica que introduzca su puntuación en la carrera.

#!/bin/bash
tot=`cat puntuaciones.txt | wc -l`
i=1
while [ $i -le $tot ];do
	jugador=`head -n$i puntuaciones.txt | tail -n1 | cut -d "," -f1`
	read -p "Puntos de $jugador: " puntos
	puntosantiguos=`head -n$i puntuaciones.txt | tail -n1 | cut -d "," -f2`
	puntosnuevos=$(($puntosantiguos+$puntos))
	echo "$jugador,$puntosnuevos" >> puntuaciones.temp
	i=$(($i+1))
done

mv puntuaciones.temp puntuaciones.txt #actualizamos el fichero
sort -nr -t "," -k2 puntuaciones.txt #ordenamos por puntuación

********************************************************************************
EJEMPLO MENÚ Y FUNCIONES
#!/bin/bash
#FUNCIONES
menu(){
	echo "Usuarios"
	echo "1.Informacion de usuario"
	echo "2.Añadir usuario"
	echo "3.Eliminar"
	echo "4.Salir"
	
}

informacion(){
	read -p "Introduzca un usuario: " usuario
	#comprobar que usuario existe
	grep -w "$usuario" /etc/passwd 1>/dev/null
  if [ $? -eq 0 ];then
	finger $usuario
	else
		echo "El usuario $usuario no existe"
	fi
}


anadir(){
	read -p "Nombre del usuario: " usuario
	grep -w $usuario /etc/passwd 1>/dev/null
	if [ $? -ne 0 ];then
			adduser  $usuario
	else
			echo  "El usuario $usuario ya existe"
	fi
}
eliminar(){
	read -p "Nombre del usuario: " $usuario
	grep -w "$usuario" /etc/passwd 1>/dev/null
  if [ $? -eq 0 ];then
			deluser $usuario
	else 
			echo "El usuario que quiere eliminar no existe"
	fi
}
 
#programa principal
#comprobación de usuario root
clear
usu=`id -u`
if [ $usu -eq 0 ];then
	x=0
	while [ "$x" != "4" ];do 
		menu
		read -p "ELige una opcion: " x
		case $x in 
			1)informacion;;
			2)anadir;;
			3)eliminar;;
			4)exit;;
			*)echo "opción no válida"
		esac
	done
else
	echo "No se puede ejecutar el script si no eres el usuario root"
fi


********************************************************************************
EJEMPLO DE FUNCIONES Y 2 MENÚS PARA USUARIOS
Crear el siguiente menú
USUARIOS
1.Información de usuario
2.Gestión de usuarios
	A.Añadir
	E.Eliminar
	V.Volver
3.Salir

#!/bin/bash

menu1(){
	echo "Usuarios"
	echo "1.Informacion de usuario"
	echo "2.Gestion de usuario"
	echo "3.Salir"
}
menu2(){
	echo "Gestion de usuarios"
	echo "A.Añadir"
	echo "E.Eliminar"
	echo "V.Volver"
}

informacion(){
	read -p "Introduzca un usuario: " usuario
	#comprobar que usuario existe
	grep -w "$usuario" /etc/passwd 1>/dev/null
  if [ $? -eq 0 ];then
	finger $usuario
	else
		echo "El usuario $usuario no existe"
	fi
}

gestion(){
x=0
while [ "$x" != "V" ];do 
	menu2
	read -p "ELige una opcion: "  x
	case $x in
		A|a)anadir;;
		E|e)eliminar;;
		V|v)return ;;
		*)echo "opción no válida";;
	esac
done
}

anadir(){
	read -p "Nombre del usuario: " usuario
	grep -w $usuario /etc/passwd 1>/dev/null
	if [ $? -ne 0 ];	then
			 	adduser  $usuario
	else
				echo  "El usuario $usuario ya existe"
	fi
}
eliminar(){
	read -p "Nombre del usuario: " $usuario
	grep -w "$usuario" /etc/passwd 1>/dev/null
  if [ $? -eq 0 ];then
			deluser $usuario
	else 
			echo "El usuario que quiere eliminar no existe"
	fi
}
 
#programa principal
#comprobación de usuario root
clear
usu=`id -u`
if [ $usu -eq 0 ];then
	x=0
	while [ "$x" != "3" ];do 
		menu1
		read -p "ELige una opcion: " x
		case $x in 
			1)informacion;;
			2)gestion;;
			3)exit;;
			*)echo "opción no válida"
		esac
	done
else
	echo "No se puede ejecutar el script si no eres el usuario root"
fi

*********************************************************************
EJEMPLO DE MENÚS, FUNCIONES Y DATOS DE FICHEROS
A partir del fichero agenda.txt de la forma
nombresocio,provincia,localidad,codigosocio, realizar un script con los menús
“1.Ver socio”
“2.Gestionar”
“3.Salir”
“Elige una opción:”

y en la opción 2
“1.Insertar socio”
“2.Eliminar socio”
“3.Modificar”
“4.Salir”
“Elige una opción:”
como el visto en clase, que en cada caso compruebe que el socio a buscar,insertar,eliminar o modificar exista o no en el fichero antes de realizar cualquier opción. (Suponemos nombredelsocio como clave primaria)

 
***********************************************************************************
#!/bin/bash
menu1 (){
	echo "1.Ver socio"
	echo "2.Gestionar"
	echo "3.Salir"
}
menu2(){
			echo "1.Insertar socio"
			echo "2.Eliminar socio"
			echo "3.Modificar"
			echo "4.Salir"
}
ver(){
	read -p "Dime el socio: " socio
		comprueba=`grep -i $socio agenda.txt|wc -l`
		if [ $comprueba>0 ];then
			grep -i $socio agenda.txt
		else
			echo "No existe ese socio"
		fi
}
gestionar(){
y=0
while [ $y -ne 4 ];do
			menu2
			read -p "Elige una opción: " y
			case $y in
				1)insertar;;
				2)eliminar;;
				3)modificar;;
				4) return;;
				*)echo "Opción no válida";;
			esac
done
}


insertar(){
read -p "Dime el socio:" socio
				consulta=`grep -i $socio agenda.txt | wc -l`
				if [ $consulta -eq 0 ];then
					read -p "Dime el nombre de su provincia: " provincia
					read -p "Dime su localidad: " localidad
					read -p "Dime su código: " codigo
					echo "$socio,$provincia,$localidad,$codigo">>agenda.txt
				else
					echo "Ya existe un socio con ese código"
				fi
}
eliminar(){
	read -p "Dime el socio:" socio1
			        consulta=`grep -i $socio1 agenda.txt | wc -l`
				if [ $consulta -eq 1 ];then
		      			grep -v $socio1 agenda.txt>agenda.temp
					mv agenda.temp agenda.txt
					echo "Realizado"
			  else
			      echo "No existe un socio con ese código"
		    fi
}
modificar(){
	read -p "Dime el socio:" socio
				consulta=`grep -i $socio agenda.txt | wc -l`
				if [ $consulta -eq 1 ];then
					grep -v $socio agenda.txt>agenda.temp
					mv agenda.temp agenda.txt
					read -p "Dime su provincia" provincia
					read -p "Dime su localidad:" localidad
					read -p "Dime su codigo:" codigo
					echo "$socio,$provincia,$localidad,$codigo">>agenda.txt
				else
					echo "No existe ese socio"
				fi
}

#comienzo programa
clear
if [ ! -e agenda.txt ];then #si no existe fichero lo crea
	touch agenda.txt
fi
x=0
while [ $x -ne 3 ];do
	menu1
	read -p "Elige una opción:" x
	case $x in
		1)ver;;
		2)gestionar;;
		3)exit;;
		*)echo "Valor no válido";;
	esac
done



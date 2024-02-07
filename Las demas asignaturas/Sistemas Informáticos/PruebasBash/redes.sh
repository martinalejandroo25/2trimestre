#!/bin/bash
#Menú de redes: 
#1) Hacer ping 
#2) Consultar IP 
#3) Cambiar IP 
#4) Cambiar máscara  
#0) Salir

hacer_ping(){

	echo "Inserta IP:"
	read ip
	ping -c 5 "$ip" 2>/dev/null	
	
}

consultar_ip(){
	
		ip addr show | awk '/inet / {print $2}'
	
}
cambiar_ip(){
	
	echo "de que adaptador?" 
	echo "escribalo tal cual aparezca en la siguiente lista"
	ip -br l | cut -d " " -f1
	read adap
	if ip link show | grep -q "$adap"; then
		sudo ip link set $adap down
		echo "da la nueva ip"
		read ip
		sudo ip addr add $ip/24 dev $adap 
	else
		echo "Error: El adaptador $adap no está disponible"
		exit 1
	fi
	
}
cambiar_masc(){
	echo "de que adaptador?" 
	echo "escribalo tal cual aparezca en la siguiente lista"
	ip -br l | cut -d " " -f1
	read adap
	if ip link show | grep -q "$adap"; then
		echo "da la nueva mascara"
		read masc
		sudo ip addr add $masc dev $adap
		sudo ip link set dev $adap down
		sudo ip link set dev $adap up 
	fi
}

mostrar_menu(){
	echo "-----------------------------------------------------"
	echo "1.Hacer ping"
	echo "2.Consultar IP"
	echo "3.Cambiar IP"
	echo "4.Cambiar Máscara"
	echo "0.Salir"
	echo "-----------------------------------------------------"
	read opcion
	
	case $opcion in
	
		1) hacer_ping;;
		2) consultar_ip;;
		3) cambiar_ip;;
		4) cambiar_masc;;
		0) echo "Adios :)"; exit 0;;
	esac
}
while true; do
mostrar_menu
done

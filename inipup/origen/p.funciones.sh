#!/bin/sh

#=============================================================
# Funciones programa
#=============================================================

mostrar(){
	echo "$1"
	echo "$1" > /dev/console
}
ejecutar(){
	res="$(eval $1)"
	echo "$res"
	echo "$res" > /dev/console
}
mostrar_y_ejecutar(){
	mostrar "$1"
	ejecutar "$1"
}
presionar_tecla(){
	mostrar "Presione una tecla para continuar $@"
	read -t7 -n1 tecla
}
guardar_log(){
	mkdir -p "$(dirname $1)"
	exec 1>$1 2>&1
}
elegir(){
echo "
2.programa.sh 

      CNTSAVE=$(expr $CNTSAVE + 1)
     done
     echo -en \"\\033[0;39m\" > /dev/console
     elegido=\"$(elegir)\"
     NUMSAVE=\"$(echo $elegido | cut -d " " -f 1)\"
     echo \"Elegido $elegido - NUMSAVE $NUMSAVE\" > /dev/console
     #--  $NUMSAVE -ne 0 = have selected a PUPSAVE ...

" >  "$(mount | grep devtmpfs | cut -d " " -f 3)/null"

	devsave="$(mount | grep dev_save | cut -d " " -f 3)"
	cantidad_sesiones="$(ls $devsave | grep -c LxPupSc64save-)"
	cero_y_sesiones="$(($cantidad_sesiones+1))"
	read -t 7 num
	if [[ "$num" == "" ]];then
		num="$(($RANDOM%$cero_y_sesiones))"
	fi
	echo "$num $cero_y_sesiones"
}

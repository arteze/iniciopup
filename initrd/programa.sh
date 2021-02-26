#!/bin/ash

esperar_bash 5 ""

montar_todo
. "$carpeta_sd_funciones/p.funciones.sh"

copiar_inipup

desmontar_todo

inicio="./inicio.sh"
if [[ -f $inicio ]];then
	. "$inicio"
else
	echo "El inicio ha fallado. No existe inicio."
	echo "Presione una tecla para continuar."
	read -t 5 -n 1 variable
	ash
fi

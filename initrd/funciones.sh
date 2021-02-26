#!/bin/ash

if [[ "$variables_asignadas" == "" ]];then
	echo "Falta variables.sh"
fi

obtener_montados(){
	[[ -d $proc ]] && echo -e "$(cat $montados 2>&1)"
}
obtener_montado(){
	montados="$(obtener_montados)"
	if [[ "$montados" != "" ]];then
		echo "$montados" | grep "$1" | cut -d " " -f 2
	fi
}
obtener_dev(){
	echo "$(obtener_montado $dev_tipo)"
}
obtener_consola(){
	echo "$(obtener_dev)$consola"
}

mostrar(){
	if [[ "$2" == "consola" ]];then
		echo "$1" > "$(obtener_consola)"
	else
		echo "$1"
	fi
}
esperar_bash(){
	mostrar "Presione una tecla para iniciar ash $2. Presione s para omitir."
	read -n 1 -t $1 tecla
	if [[ "$tecla" == "s" || "$tecla" == "" ]];then
		mostrar "Ash no iniciado" "$2"
	else
		ash
	fi
}

borrar_carpeta(){
	if [[ -d "$1" && "$(ls -A "$1")" == "" ]];then
		rm -r $1
	else
		ls "$1"
		echo "No se pudo borrar $1"
	fi
}
borrar_carpeta_forzado(){
	rm -rfv "$1"
}

montar_sistema(){
	mount -vt $@
}
montar(){
	echo "Montar $@"
	mkdir -p $3
	if [[ "$3" == "$proc" ]];then
		montar_sistema $@
	else
		if [[ "$(cat $montados| grep $3)" == "" ]];then
			montar_sistema $@
		else
			echo "Ya estaba montado '$3'"
		fi
	fi
}
montar_proc(){
	montar proc none /proc
}
montar_dev_original(){
	montar $dev_tipo none $dev_original
}
montar_dev_nuevo(){
	montar $dev_tipo none $dev_nuevo
}
montar_sd(){
	montar auto "$(obtener_dev)/$sdpart" "$sd_montar"
}
montar_todo(){
	montar_proc
	montar_dev_original
	montar_sd
}

desmontar(){
	montar_proc
	umount "$1"
	borrar_carpeta "$1"
}
desmontar_proc(){
	echo "Desmontando proc" > "$(obtener_consola)"
	desmontar /proc
	echo "Desmontado proc" > "$(obtener_consola)"
}

desmontar_dev_original(){
	desmontar $dev_original
}
desmontar_dev_nuevo(){
	desmontar $dev_nuevo
}
desmontar_dev(){
	desmontar $(obtener_dev)
}

desmontar_sd(){
	desmontar /sistema/a
}
desmontar_todo(){
	desmontar_sd
	desmontar_dev
	desmontar_proc
}

copiar_inipup(){
	cp -rfv $inip/* /
}

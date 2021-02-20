#!/bin/ash

cd $(busybox dirname $0)

obtener_enlaces(){
	busybox echo "$(busybox echo "basename cat chroot cp cpio cut
dirname find grep gzip ln ls mkdir mount mv rm sleep tr umount" |
	busybox tr "\n" " ")"
}
iterar_archivos(){
	obtener_enlaces | busybox tr " " "\n" | while read archivo; do
		if [[ "$archivo" != "" ]];then
			eval "$1"
		fi
	done
}
crear_enlaces(){
	iterar_archivos "busybox ln -s busybox ./bin/\$archivo"
}
borrar_enlaces(){
	iterar_archivos "busybox rm ./bin/\$archivo"
}

if [[ "$1" == "ash" ]];then
	busybox ln -s busybox ./bin/ash
fi

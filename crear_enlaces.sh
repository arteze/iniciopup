#!/bin/ash

cd $(busybox dirname $0)
enlaces="ash basename chroot cp cpio dirname find grep gzip ln ls mkdir mount mv rm sleep tr umount"

crear_enlaces(){
	busybox echo $enlaces | busybox tr " " "\n" | while read archivo; do
		busybox ln -sv busybox ./bin/$archivo
	done
}
borrar_enlaces(){
	busybox echo $enlaces | busybox tr " " "\n" | while read archivo; do
		busybox rm -v ./bin/$archivo
	done
}

if [[ "$1" == "ash" ]];then
	busybox ln -s busybox ./bin/ash
fi

#!/bin/ash

crear_enlaces(){
	cd $(busybox dirname $0)/bin
	enlaces="ash basename chroot cp cpio dirname find grep gzip ln ls mkdir mount mv rm sleep tr umount"
	busybox echo $enlaces | busybox tr " " "\n" | while read archivo; do
		busybox ln -s busybox $archivo
	done

}

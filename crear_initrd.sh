#!/bin/ash

. ./crear_enlaces.sh

crear_gz(){
	 find . | grep -v ./initrd.gz | cpio -H newc --create --verbose | gzip -9 > ./initrd.gz
}

crear_enlaces
crear_gz
borrar_enlaces

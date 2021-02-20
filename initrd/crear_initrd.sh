#!/bin/ash

. ./crear_enlaces.sh

crear_gz(){
	find . | grep -v ./initrd.gz | cpio -voH newc | gzip -9 > ./initrd.gz
}

crear_enlaces
crear_gz
borrar_enlaces

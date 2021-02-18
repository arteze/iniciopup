#!/bin/ash

. ./crear_enlaces.sh

crear_gz(){
	find . | grep -v ./initrd.gz | cpio -voH newc > ./initrd.cpio
}

crear_enlaces
crear_gz
borrar_enlaces

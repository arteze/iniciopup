#!/bin/ash

proc="/proc"
montados="$proc/mounts"
sistema="/sistema"

dev_tipo="devtmpfs"
dev_original="/dev"
dev_nuevo="$sistema$dev_original"

consola="/console"
sd_montar="$sistema/a"
sdpart="sda4"
inip="$sd_montar/inipup"
tmp="$sistema/tmp"
carpeta_sd_funciones="$inip/origen"
puplog="$inip/logs"
tmplog="$tmp/logs"

variables_asignadas="1"

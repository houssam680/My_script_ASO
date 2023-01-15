#!/bin/bash
#Copias de seguridad
# Realiza un script que cada vez que se ejecute genere una copia de seguridad del
#directorio /etc en el fichero /root/copia_etc_fecha.tgz (indicando la fecha cuándo se ha
#generado la copia de seguridad).

fecha=`date +%d-%m-%Y`
tar -czpf /root/copia_etc_$fecha /etc
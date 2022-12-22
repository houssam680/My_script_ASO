#!/bin/bash
#Realiza un script que busque cualquier fichero que pueda ser modificado por
#cualquier usuario (--- --- rwx) y guarde la lista de ficheros con la ruta exacta en
#el archivo archivos_peligrosos.txt (Debes utilizar expresiones regulares)

archivo=archivos_peligrosos.txt
if  [[ -e $archivo && -f $archivo ]] ; then
echo " El archivo archivos_peligrosos.txt existe "
echo " Guardamos los cambios en el mismo archivo "
ls -lR $PWD/* | grep ^-......rwx >> archivos_peligrosos.txt
else
ls -lR $PWD/* | grep ^-......rwx > archivos_peligrosos.txt
fi
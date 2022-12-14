#!/bin/bash
#Realiza un script que indique si el fichero pasado por parámetro existe o
#no existe. Además debe indicar si se trata de un fichero regular o
#directorio.

if [[ $# -eq 1 ]] ; then
    if [[ -d $1 ]] ; then
        echo "este archivo se trata de un directorio"
    elif [[ -f $1 ]] ; then
        echo "este archivo se trata de un fichero regular "
    fi
else
    echo "tienes que pasar un parametro al script"
    echo "este parametro tiene que ser un ruta absoluta al fichero"
fi
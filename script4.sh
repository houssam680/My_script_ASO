#!/bin/bash
#Realiza un script que comprueba si el fichero pasado por parámetro
#existe y tenemos permisos de lectura. En caso de tener permisos
#mostraremos el contenido del archivo.

if [[ $# -eq 1 ]] ; then
    if [[ -r $1 ]] ; then
        echo "el continido  del archivo "
        if [[ -d $1 ]] ; then
           ls -l $1
        elif [[ -f $1 ]] ; then
            cat $1 | more
        fi
    fi
else
    echo "tienes que pasar un parametro al script"
    echo "este parametro tiene que ser un ruta al fichero"
fi
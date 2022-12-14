#!/bin/bash
#Escribir un script que, dado el nombre de un directorio como parámetro,
#muestre las estadísticas de cuantos ficheros y cuantos subdirectorios
#contiene. Debes comprobar que existe el directorio que se pasa como
#parámetro y que efectivamente es un directorio.


if [[ -n $@ ]] ; then 
    if [[ -d $1 ]] ; then
        echo "------------------------------------------------------------------------"
        echo "|       cuantos ficheros        |           cuantos subdirectorios     |"
        echo "------------------------------------------------------------------------"
        echo "|     `find $1 -type f | wc -l`                         |           `find $1 -type d | wc -l`     "
        echo "------------------------------------------------------------------------"

    else
        echo "El directorio no existe"
    fi
else
    echo "tiene que pasar un parametro al script para hacer las eestadísticas  "
fi
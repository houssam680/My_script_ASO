#!/bin/bash
#Realiza un script que sume dos números que se pasan como
#parámetros y si no son pasados devolverá error y se mostrará un
#mensaje indicando la forma de ejecutar el script.

numeros_enteros='^-?[0-9]+([.][0-9]+)?$';
if [[ -n $@ ]] ; then
    if [[ $1 =~ $numeros_enteros ]] && [[ $2 =~ $numeros_enteros ]] ; then
        if [[ $# -le 2 ]] ; then
            echo "$1 + $2 "| bc
        else
            echo "El script accepta solo dos parametros"
        fi
    else
        echo "Los dos numeros tienen que ser enteros"
    fi
else
    echo "Al menos tienes que pasar dos parametros al scipt  "
    echo "Ejemplos"
    echo "script2.sh 1 2 "
fi
   
#!/bin/bash
#Realizar un script que muestre la tabla de multiplicar de un número
#pasado por parámetro.

numeros='[0-9]';
if [[ $1 =~ $numeros ]] ; then
    if [[ $# -le 1 ]] ; then
        for ((x=1 ; x <= 10 ; x++))
        do
            echo -e "$1 x $x = $(($1*x)) "
        done
    else
        echo "El script accepta solo un parametro"
    fi
else
  echo "por favor inserta un numero del 1 al 10 como parametro "
fi
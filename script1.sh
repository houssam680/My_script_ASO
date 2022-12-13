#!/bin/bash
#Se le pasan como parámetros dos números enteros y el programa me
#debe decir qué número es mayor.
numeros_enteros='^-?[0-9]+([.][0-9]+)?$';
if [[ $1 =~ $numeros_enteros ]] && [[ $2 =~ $numeros_enteros ]] ; then
    if [[ $1 -lt $2 ]] ; then
     echo "El numero $1 es menor  que $2"
    else
    echo "El numero $1 es mayor que $2"
    fi
else
  echo "por favor inserta un numero entero "
fi

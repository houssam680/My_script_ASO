#!/bin/bash
#Crea un script parimpar.sh que solicite un número y diga si es par o impar.

read -p "inserta un numero entero " numero

     if (($numero % 2 != 0 )) 
        then
         echo "El nemero es impar "
        else
         echo "El numero es par"
        fi

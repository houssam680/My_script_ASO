#!/bin/bash
#Crea un script primo.sh que verifique si el número pasado por parámetro
#es primo o no.
numeros='^-?[0-9]+([.][0-9]+)?$';
countador=1
division=0
suma=0
if [[ -n $@ ]] ; then
    if [[ $1 =~ $numeros ]]; then
        if [[ $# -le 1 ]] ; then
           while test $countador -le $1
            do
            let operacion="$1 % $countador"
                if [ $operacion -eq 0 ];then
                    let division+=1
                    let suma+=$countador
                fi
                let countador+=1
            done
            let resultado=$1+1
            if [ $suma -eq $resultado ];then
                echo "$1 es un numero primo "
            else
                echo  "$1 no es un numero primo"
            fi

        else
            echo "El script accepta solo un parametro"
        fi
    else
        echo "El parametro tiene que ser un numero "
    fi
else
    echo "Al menos tienes que pasar un parametro al scipt  "
fi
   
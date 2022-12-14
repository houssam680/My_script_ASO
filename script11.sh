#!/bin/bash
# un script juego.sh que consista en un juego de adivinar un número
#del 1 al 100. El número a adivinar se pondrá fijo al principio del script.
#Se le irán preguntando números al usuario y se dirá si el número es
#mayor o menor que el que hay que adivinar. El juego termina si el
#usuario averigua el número (Mensaje de Enhorabuena) o introduce un 0 (Se rinde )


num=1
random=$(shuf -i 0-100 -n1)
while [[ $num -ne 0 ]]
do
    read -p "inserta un numero" num

    if [[ random -gt $num ]]; then
        echo "el numero es mayor inserta un numero menor "
    elif [[ random -lt $num ]]; then
        echo "el numero es menor inserta un nemero mayor "
    elif [[ random -eq $num ]]; then
        echo "Enhorabuena , te has ganado "
    fi
    
done

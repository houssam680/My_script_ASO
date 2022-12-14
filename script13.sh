#!/bin/bash
#Haz un script que vaya dando la suma de todos los números que se
#introduzca por teclado hasta que se introduzca un 0, en cuyo caso se
#mostrará el último resultado y terminará el script.

contador=0
num=1
until [[ $num -eq 0 ]]
do
  read -p "numero a sumar " num
  if [[ "${num}" =~ ^-?[0-9]+$ ]]; then
    let contador=$contador+$num 
    echo "la suma es $contador "
  else
    echo "inserta un numero valido "
  fi
done

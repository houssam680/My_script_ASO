#!/bin/bash
#Realizar un script utilizando el bucle for que muestre el siguiente patrón:
# 1
# 22
# 333
# 4444

numeros='[0-9]';
until [[ -n $numero ]]
do
read -p "inserta un numero entero " numero
if [[ $numero =~ $numeros ]] ; then       
   for ((i=0 ; i <= numero ; i++)) 
   do 
      for ((x=0 ; x < i ; x++ ))
      do 
         echo -e "$i \c"
      done
      echo -e "\n"
   done      
else
  echo "Por favor inserta un numero valido "
fi
done

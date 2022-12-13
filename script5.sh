#!/bin/bash
#Realizar un script que imprima los números 5,4,3,2,1 usando un bucle while
i=5

while [ $i -gt 0 ]
do
    echo $i
    ((i--))
done
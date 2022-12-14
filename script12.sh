#!/bin/bash
#Realizar un script que imprima el siguiente menú:
#1 - Sumar
#2 - Restar
#3 - Dividir
#4 - Multiplicar
#0 - Salir
#Después de mostrar el menú, se pedirá que se muestre una opción. Si la
#opción elegida no está entre el 1 y el 4, se mostrará un mensaje de error.
#En caso de que la opción sea válida, se pedirán dos números por
#teclado y en función de la operación elegida se devolverá el resultado
#por pantalla.
#● Cada operación será implementada haciendo uso de funciones
#● Si la opción elegida no es válida, se volverá a mostrar el menú.
#● El programa terminará, cuando se pulse 0.

#!/bin/bash

operacion(){
    
    echo "la $tipo es : $(($num1"$op_tipo"$num2)) "
}

while [[ true ]]
do 
    echo " 1 - Sumar "
    echo " 2 - Restar "
    echo " 3 - Dividir "
    echo " 4 - Multiplicar "
    echo " 0 - Salir "
    read -p "inserta un opcion " opcion 
    if [[ "${opcion}" =~ ^-?[0-9]+$ ]]; then
    if [[ $opcion -gt 4 ]] || [[ $opcion -lt 0 ]] ;then
        clear
        echo "Inserta una opcion valida"
    fi
    if [[ $opcion -eq 0 ]] ; then
     exit
    fi
    case $opcion in
        1)
            clear
            read -p "inserta un numero 1 : " num1
            read -p "inserta un numero 2 : " num2
            op_tipo=+
            tipo=suma
            operacion
        ;;
        2)
            clear
            read -p "inserta un numero 1 : " num1
            read -p "inserta un numero 2 : " num2
            op_tipo=-
            tipo=resta
            operacion
        ;;
        3)
            clear
            read -p "inserta un numero 1 : " num1
            read -p "inserta un numero 2 : " num2
            op_tipo= "\*"
            tipo=division
            operacion
        ;;
        4)
            clear
            read -p "inserta un numero 1 : " num1
            read -p "inserta un numero 2 : " num2
            op_tipo=*
            tipo=multiplication
            operacion
        ;;
    esac
    else
    clear
    echo "tienes que insertar un numero valido "
    fi



done
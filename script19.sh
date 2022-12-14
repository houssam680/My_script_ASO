#!/bin/bash
#Realizar un shell script que copie el fichero indicado como primer parámetro
#posicional de manera que la copia tenga el nombre indicado en el segundo
#parámetro posicional. Hay que controlar:
#a) Que se indiquen dos parámetros.
#b) Que exista y sea archivo ordinario el primer parámetro.
#c) Que no exista un identificador (fichero ordinario, directorio, etc..) con el
#mismo nombre que el indicado en el segundo parámetro.
#Si se produce alguna de las situaciones anteriores se visualizará un mensaje
#de error indicativo.

if [[ -n $@ ]] ; then    
    if [[ $# -le 2 ]] ; then
        if [[ -e $1 ]] ; then
            if [[ -a $2 ]] ; then
                echo "exista un identificador con el mismo nombre indicado en el segundo parámetro"
            else           
               if [[ -d $1 ]] ; then
                    echo "El archivo es un directorio" 
                    echo "copiamos el directorio $1 en la $2"
                    cp -R $1 $2
               elif [[ -f $1 ]]; then
                    echo "El archivo es un archivo regular" 
                    echo "copiamos el directorio $1 en la $2"
                    cp $1 $2
               fi                  
            fi
        else
            echo "El archivo no existe"
        fi          
    else
        echo "El script accepta solo accepta dos parametros "
    fi   
else
    echo " es obligatorio pasar parametros al script y tiene que ser un ruta al archivo   "
fi
#!/bin/bash
#Realizar un script que reciba como único parámetro el nombre de un
#directorio, especificado mediante su nombre de ruta completo. El
#programa debe mostrar un listado no recursivo de todas las entradas
#contenidas en ese directorio, indicando para cada una de ellas si se trata
#de un fichero o de un directorio. Al final, debe mostrarse un mensaje
#indicando el número total de entradas procesadas.
if [[ -n $@ ]] ; then
    if [[ $# -le 1 ]] ; then
        if [[ -e $1 ]] ; then
            echo "------------------------------------------------------------------------------------------------"
            echo "                                                                                                "

            echo "ficheros del directorio ----------> "
                    ls -l $1 | grep ^-
            echo "subdirectorio  del directorio ----> "
                    ls -l $1 | grep ^d
            echo "------------------------------------------------------------------------------------------------"
            echo "  número total de entradas procesadas   |       ficheros      |     subdirectorio               "
            echo "------------------------------------------------------------------------------------------------"
            echo "           `ls -l $1 | wc -l `                            |        `ls -l $1 | grep ^- | wc -l `            |     `ls -l $1 | grep ^d | wc -l `                            "
            echo "------------------------------------------------------------------------------------------------"

        else
            echo " El directorio no existe "
        fi

    else
        echo "el script accepta solo un parametro"
    fi
else

    echo "el parametro no puede ser nulo "
fi

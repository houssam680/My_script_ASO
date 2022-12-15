#!/bin/bash
#Modifica el script anterior para que indique si se trata de un fichero, de un
#directorio, de un enlace simbólico, un archivo especial de bloque, archivo
#especial de caracter. Debes pasarle el directorio /dev y verificar que funciona
#bien.
if [[ -n $@ ]] ; then
    if [[ $# -le 1 ]] ; then
        if [[ -e $1 ]] ; then
            echo "------------------------------------------------------------------------------------------------"
            echo "                                                                                                "

            echo "ficheros normales del directorio ----------> "
                    ls -l $1 | grep ^-
            echo "subdirectorio  del directorio          ----> "
                    ls -l $1 | grep ^d
            echo "enlaces simbólico                ----------> "
                    ls -l $1 | grep ^l
            echo "archivos especial de bloque         -------> "
                    ls -l $1 | grep ^b
             echo "archivos especial de caracter      -------> "
                    ls -l $1 | grep ^c
            echo "------------------------------------------------------------------------------------------------"
            echo "  número total de entradas procesadas   |       ficheros      |     subdirectorio               "
            echo "------------------------------------------------------------------------------------------------"
            echo "           `ls -l $1 | wc -l `                            |        `ls -l $1 | grep ^- | wc -l `            |     `ls -l $1 | grep ^d | wc -l `                            "
            echo "------------------------------------------------------------------------------------------------"
            echo "------------------------------------------------------------------------------------------------"
            echo "  archivos especial de bloque           | enlaces simbólico   |   archivos especial de caracter  "
            echo "------------------------------------------------------------------------------------------------"
            echo "           `ls -l $1 | grep ^b | wc -l `                            |        `ls -l $1 | grep ^l | wc -l `            |     `ls -l $1 | grep ^c | wc -l `                            "
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


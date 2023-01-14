#!/bin/bash
#Realizar un script gestionusuarios.sh que permita dar de alta y de baja a
#usuario del sistema GNU/Linux indicados como argumento:
#./Script3_UT8P3.sh alta/baja nombre apellido1 apellido2 [grupo]
#- En el caso de que se le pase la opción alta:
#El script asignará al usuario un identificativo para el sistema con el
#formato aluXXYYZ donde XX son las dos primeras letras del apellido1,
#YY son las dos primeras letras del apellido2 y Z es la inicial del nombre.
#En caso de no indicar el grupo al que pertenece, se creará un nuevo
#grupo con el mismo identificativo que el usuario.
#- En el caso de que se le pase la opción baja:
#El programa debe calcular la identificación del usuario, igual que se
#indica en el menú anterior, y proceder a dar de baja la cuenta.
#- En otro caso. Indicar “Error. La sintaxis correcta es
#./Script3_UT8P3.sh alta/baja nombre apellido1 apellido2 [grupo]”
until [[ -n $1 && -e $1 ]] ; do
  echo " por favor introduce la ruta de archivo donde estan los usuario y ejecta el script "
  exit
done

nombre=(`cut -d "," -f1 $1 `)
cortador_nombre="${nombre:0:1}" ; echo "${cortador_nombre}" > /dev/null
apellido1=(`cut -d "," -f2 $1 `)
cortador_apellido1="${apellido1:0:2}" ; echo "${cortador_apellido1}" > /dev/null
apellido2=(`cut -d "," -f3 $1 `)
cortador_apellido2="${apellido2:0:2}" ; echo "${cortador_apellido2}" > /dev/null
grupo=(`cut -d "," -f4 $1 `)
estado=(`cut -d "," -f5 $1 `) #alta o baja
let $2=$nombre
let $3=$apellido1
let $4=$apellido2
let $5=$grupo
let $1=$estado

if [[ -n $@ ]] ; then
    if [ $# -eq 4 ]; then
        echo "te has pasado el siguiente parametro al script"
        echo " --> ./Script3_UT8P3.sh alta/baja nombre apellido1 apellido2"
        echo "entonces el script va crear el user alu${cortador_apellido1}${cortador_apellido2}${cortador_nombre}"
        echo "y lo va asignar al grupo alu${cortador_apellido1}${cortador_apellido2}${cortador_nombre}"
        if [ $1 == alta ]; then
            grep -q "^alu${cortador_apellido1}${cortador_apellido2}${cortador_nombre}" /etc/group ; let x=$?
            if [[ $x -eq 1 ]]
            then
                `groupadd "alu${cortador_apellido1}${cortador_apellido2}${cortador_nombre}"`
            else
                echo "el grupo ya existe no hace falta crear lo "
            fi 
            x=0
            grep -q "alu${cortador_apellido1}${cortador_apellido2}${cortador_nombre}" /etc/shadow ; let x=$?
            if [[ $x -eq 1 ]]
             then
             useradd -m -c "$nombre $apellido1 $apellido2" -g "alu${cortador_apellido1}${cortador_apellido2}${cortador_nombre}" "alu${cortador_apellido1}${cortador_apellido2}${cortador_nombre}" > /dev/null
             else
             echo "el usuario ya esxiste en el sistema "
            fi
         elif [ $1 == baja ]; then
            userdel "alu${cortador_apellido1}${cortador_apellido2}${cortador_nombre}"
	        groupdel "alu${cortador_apellido1}${cortador_apellido2}${cortador_nombre}" 
        fi
    else
    echo " Par crear el usuario sin espicificar el grupo tienes que poner estos parametros "
    echo " --> ./Script3_UT8P3.sh alta/baja nombre apellido1 apellido2"
    fi
    if [ $# -eq 5 ]; then
        echo "te has pasado el siguiente parametro al script"
        echo " --> ./Script3_UT8P3.sh alta/baja nombre apellido1 apellido2 Grupo "
        echo "entonces el script va crear el user alu${cortador_apellido1}${cortador_apellido2}${cortador_nombre}"
        echo "y lo va asignar al grupo alu$5"
        if [ $1 == alta ]; then
            x=0
            grep -q "^$5" /etc/group ; let x=$?
            if [[ $x -eq 1 ]]
             then
             `groupadd "$5"`
             else
             echo "el grupo ya existe no hace falta crear lo "
            fi 
            x=0
            grep -q "^$5" /etc/shadow ; let x=$?
            if [[ $x -eq 1 ]]
             then
              useradd -m -c "$nombre $apellido1 $apellido2" -G $5 "alu${cortador_apellido1}${cortador_apellido2}${cortador_nombre}" > /dev/null
             else
             echo "el usuario esta en el sistema "
            fi
         elif [ $1 == baja ]; then
            userdel "alu${cortador_apellido1}${cortador_apellido2}${cortador_nombre}"
	        groupdel $5
        fi
    else
        echo "Par crear el usuario y asignar lo a un grupo espicifico  al menos tienes que poner estos parametros "
        echo "./Script3_UT8P3.sh alta/baja nombre apellido1 apellido2 [grupo]"
    fi
else
echo "tienes que pasar al script parametros"
fi
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
if [ "$#" -lt 4 ]; then
    echo "Error. La sintaxis correcta es: ./Script3.sh alta/baja nombre apellido1 apellido2 [grupo]"
    exit 1
fi
nombre=${2:0:1}
apellido1=${3:0:2}
apellido2=${4:0:2}
usuario="alu${apellido1}${apellido2}${nombre}"
if [ -z "$5" ]; then
  grupo="$usuario"
  groupadd "$grupo"
else
  grupo="$5"
fi
if [ "$(id -u "$usuario" > /dev/null 2>&1; echo $?)" -eq 0 ]; then
    echo "El usuario ya existe en el sistema."
else
    # Crear el usuario y asignarlo al grupo correspondiente
    useradd -m -c "$2 $3 $4" -g "$grupo" "$usuario"
    echo "El usuario se ha creado correctamente."
fi

# Dar de baja al usuario
if [ "$1" = "baja" ]; then
    userdel -r "$usuario"
    echo "El usuario se ha eliminado correctamente."
fi

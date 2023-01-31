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

#Modificar el script anterior de manera que permita leer los datos personales de
#varios usuarios pertenecientes a un grupo desde un fichero de texto.
archivo=$1
if [ $# -lt 2 ]; then
  echo "La sintaxis correcta es ./Script3_UT8P3.sh action(alta o baja )  fichero_usuarios"
  exit 1
fi
if [ "$action" == "alta" ]; then
  while IFS=','
    read action nombre appelido1 appelido2  groupo ; do
    if [ "$count" -gt 0 ]; then
    fi
    ((count++))
    nombre=$(echo $nombre)
    apellido1=$(echo $appelido1)
    apellido2=$(echo $appelido1)

    identificativo="alu"$(echo $apellido1 | cut -c1-2)$(echo $apellido2 | cut -c1-2)$(echo $nombre | cut -c1)

    if [ -z $groupo ]; then
      sudo addgroup $identificativo
      sudo usermod -G $identificativo $identificativo
      echo "Usuario $identificativo creado en grupo $identificativo."
    else
      sudo usermod -G $grupo $identificativo
      echo "Usuario $identificativo creado en grupo $grupo."
    fi
  done < "$archivo"
elif [ "$action" == "baja" ]; then
  while IFS=','
    read action nombre appelido1 appelido2  groupo ; do
    if [ "$count" -gt 0 ]; then
    fi
    ((count++))
    nombre=$(echo $nombre)
    apellido1=$(echo $appelido1)
    apellido2=$(echo $appelido1)

    identificativo="alu"$(echo $apellido1 | cut -c1-2)$(echo $apellido2 | cut -c1-2)$(echo $nombre | cut -c1)

    sudo userdel $identificativo
    echo "Usuario $identificativo dado de baja."
  done < "$archivo"
fi

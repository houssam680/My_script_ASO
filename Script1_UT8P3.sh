#!/bin/bash

# Realiza un script que muestre la lista de los últimos usuarios que iniciaron
# sesión, incluidas las direcciones IP Origen. (Solo debes mostrar las líneas en
# las que aparece una IP) Tip: Uso del comando last y egrep.

# por este ejercicio tengo dos soluciones una utilizando el comando cut y es el mejor por q si acaso 
# tenemos el ip 1125.152.10.10.1256 y no ponemos el cut para cortar el ip y andicar el principio 
# y el final del ip el grep nos da problemas mi hecho muchas preubas con una lista de ip 
# y al final la mejor opcion para mi es este :
#################################################################
# last | cut -d " " -f11 | egrep "^([0-9]{1,3}\.){3}[0-9]{1,3}$"
#################################################################

# pero me voy a utilizar este porq para poner el limitar con cut no da problemas depiende del sistema 
# entonces para solucionar esto tenemos que jugar con -f para seleccionar el campu deseado  

last | egrep "([0-9]{1,3}\.){3}[0-9]{1,3}"

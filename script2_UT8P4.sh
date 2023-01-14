#!/bin/bash

	# Un Script que hace un menú de apagado de la manera vista acontinuación

	if [[ $1 -eq null ]];then

		echo " _______________________________________________________ "
		echo "|							                              |"
		echo "|			                MENU	                      |"
		echo "| _____________________________________________________ |"
		echo "|							                              |"
		echo "| 		1. REINICIAR                                  |"
		echo "|							                              |"
		echo "|			2. REINICIAR en X TIEMPO EN MIN               |"
		echo "| _____________________________________________________ |"
        read -p " Introduce una opción: " opt

		case $opt in
			1)
				shutdown -r now
			;;

			2)
                read -p " Introduce EL tiempo en min " tiempo
				shutdown -r $tiempo
			;;
		esac

	else 
        if [[ $# -gt 1 ]] ; then
         echo "el script acepta un parametro"
        fi
		if [[ "${1}" =~ ^-?[0-9]+$ ]]; then
        shutdown -r $1
        fi

	fi
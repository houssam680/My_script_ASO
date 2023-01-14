#!/bin/bash

	# Realiza un script que busque todos los archivos que contengan la palabra Hack y
    #los guarde en la carpeta /root/cuarentena/

	ls -r ./* | grep -iR "hack" > /root/cuarentena/fichero.txt
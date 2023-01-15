#!/bin/bash
#Escribe un script que se ejecute cada día a las 1:00 y cumpla las siguientes
#condiciones: • Si es domingo se genera una copia completa de los
#directorios /home, /etc y /root en la carpeta /copia_seguridad/completa
#• Si es cualquier otro día se realiza una copia diaria del directorio /etc y se
#guarda en la carpeta /copia_seguridad_incremental/mes_dia_ano
#(donde se indica la fecha del sistema)
#• Las copias de seguridad se realizan con el comando tar
#• Siempre se genera una copia en la misma carpeta se genera el fichero
#fecha.txt que contiene la hora exacta del sistema.

dia_real=`date +%A`
fecha=`date +%m_%d_%y`
if [[ $dia_real == "domingo" ]]
then
  if [[ -d /copia_seguridad && -d /copia_seguridad/copia_completa ]]; then
    echo "Las carpetas estan preparadas"
  else
    mkdir /copia_seguridad
    mkdir /copia_seguridad/copia_completa
  fi
  echo "Iniciando la copia de seguridad completa"
  tar -czpf /copia_seguridad/copia_completa/"completa-$fecha".tar.gz /home /etc /root
  date >> /copia_seguridad/copia_completa/fechas_copias_completas.txt
  echo " La Copia de seguridad esta creada en /copia_seguridad/copia_completa"
else
    if [[ -d /copia_seguridad_incremental ]]
    then
    else
        mkdir /copia_seguridad_incremental
    fi
  echo "Iniciando copia de seguridad incremental"
  mkdir /copia_seguridad_incremental/$fecha
  tar -czpf /copia_seguridad_incremental/$fecha/backup_incremental.tar.gz /home /etc /root
  date >> /copia_seguridad_incremental/$fecha/fecha_copia_incremental.txt
  echo "La Copia de seguridad esta creada en /copia_seguridad_incremental"
fi

	# Y para hacer que se ejecute cada dia a las 22:00
	# el crontab y añadir la siguiente linea 

	# 0 1 * * * ~/script10_UT8P4.sh >/dev/null 2>&1
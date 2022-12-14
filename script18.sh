#!/bin/bash
#Script que reciba como parámetro un nombre de usuario, y diga si está o
#no en el sistema (primero dirá si está dado de alta, y a continuación si ha
#iniciado una sesión).

user_sistem=`lastlog | grep $1 | cut -d " " -f1 `

for i in $user_sistem
do 
  if [[ $user_sistem == $1 ]] ;
      then
        echo " el usuario  $i ha dado alta en la sestema "                
        for user in `last | grep $1 | cut -d " " -f1 | head -1`
        do 
          echo "  $user ha iniciado una sesión"
          echo " la ultima fecha y hora de iniciar de sesion"                                     
          last | grep $1 | cut -d " " -f26,27,28,29 | head -1     #fecha_ultima_secion                     
        done              
    fi
done
if [[ $user_sistem != $1 ]] ; then 
    echo " El usuario no esta en el sistema "

fi

 
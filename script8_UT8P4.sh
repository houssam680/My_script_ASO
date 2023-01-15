#Realizar un shell-script que escriba en el fichero '/tmp/usuarios' una línea con
#la fecha y otra con el número de usuarios distintos que están conectados en
#ese momento cada dos minutos.

fecha='date'
usurs_conenctados='who -q'
if [[ -e /tmp/usuarios ]]
then
	echo -e "$fecha \n $usurs_conenctados " > /tmp/usuarios
else
    echo -e "$fecha \n $usurs_conenctados " >> /tmp/usuarios
fi
		
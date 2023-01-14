#!/bin/bash

	# crear un Script en el fichero /var/log/reinicios.txt la fecha de cada vez que  rieniciamos el equipo

	# podemos modificar el archivo cron tab del sistema para que cada vez reniciamos el sistema si guardan los datos en el archivo rienicios.txt

		@reboot date >> /var/log/reinicios.txt
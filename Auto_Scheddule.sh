#!/bin/bash
#this will kill all P were born from here
trap "exit" INT TERM
trap "kill 0" EXIT

#Constantes#
#Start_day=1
#min_oclock=00
#Stop_hour=17   #17
segundos=59
minutos=59
horas=23
primer_tercio=8
segundo_tercio=16
tercer_tercio=23
RANDOM=$$

#Ciclo Eterno#
while true; do
    echo "Calculamos cuando vamos a cagar post"
    activacion_primer_tercio=$(($RANDOM%$primer_tercio))
    echo "$activacion_primer_tercio"
    DIV=$(($segundo_tercio-$primer_tercio))
    activacion_segundo_tercio=$(($(($RANDOM%$DIV))+$primer_tercio))
    echo "$activacion_segundo_tercio"
    DIV=$(($tercer_tercio-$segundo_tercio))
    activacion_tercer_tercio=$(($(($RANDOM%$DIV))+$segundo_tercio))
    echo "$activacion_tercer_tercio"

    minuto_activacion=$(($RANDOM%60))
    segundo_activacion=$(($RANDOM%60))
    
    echo "Entramos con tiempo cuando sea"
    hora_actual=$(date +%H)
    minuto_actual=$(date +%M)
    segundo_actual=$(date +%S)
	
    echo "Ciclo de 23:59:59 es media noche salimos para calcular nuevos tiempos de cagar post"
	while !([ "$hora_actual" -eq "$horas" ] && [ "$minuto_actual" -eq "$minutos" ] && [ "$segundo_actual" -eq "$segundos" ]); do
	    hora_actual=$(date +%H)
            minuto_actual=$(date +%M)
	    segundo_actual=$(date +%S)
	    if [ "$hora_actual" -eq "$activacion_primer_tercio" ] && [ "$minuto_actual" -eq "$minuto_activacion" ] && [ "$segundo_actual" -eq "$segundo_activacion" ]
	    then
		#dosomething
		python3 Selene_AI.py
	    fi
	    sleep 1
	    if [ "$hora_actual" -eq "$activacion_segundo_tercio" ] && [ "$minuto_actual" -eq "$minuto_activacion" ] && [ "$segundo_actual" -eq "$segundo_activacion" ]
	    then
		#dosomething
		python3 Selene_AI.py
	    fi
	    sleep 1
	    if [ "$hora_actual" -eq "$activacion_tercer_tercio" ] && [ "$minuto_actual" -eq "$minuto_activacion" ] && [ "$segundo_actual" -eq "$segundo_activacion" ]
	    then
		#dosomething
		python3 Selene_AI.py
	    fi
	done
     echo "Salimos del dia"
     sleep 2	
#    Now_day=$(date +%w)
#    Now_mes=$(date +%m)
#    Now_year=$(date +%y)
done

#/bin/sh

status () { 

  echo -n "BAT: $(acpi | awk '{print $4}' | sed s/,//) | $(date '+%a %d-%m-%Y %H:%M') |  $(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/') "
}

while :; do
	
	xsetroot -name "$(status)"
	sleep 1

done

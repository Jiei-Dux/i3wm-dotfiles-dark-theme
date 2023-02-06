#! /usr/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar > /dev/null;
do sleep 1; 
done

desktop=$(echo $DESKTOP_SESSION)

for M in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	if [ $M == 'eDP-1' ]
	then
		MONITOR=$M polybar -c ~/.config/polybar/config.ini &

	elif [ $M == 'HDMI-1' ]
	then
		MONITOR=$M polybar -c ~/.config/polybar/config.ini &
	fi
done

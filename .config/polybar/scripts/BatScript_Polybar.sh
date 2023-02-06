#! /usr/bin/env bash

Bat_Pct=$(cat /sys/class/power_supply/BAT*/capacity)
Bat_Stat=$(cat /sys/class/power_supply/BAT*/status)

ICON=""
FORMAT=""

    if [ "$Bat_Stat" = 'Charging' ]; then
        ICON="%{F#C0A807}%{F-}  " 

    elif [ "$Bat_Stat" = 'Discharging' ]; then
        
        if [ "$Bat_Pct" -le 10 ]; then
            ICON="%{F#D10A0A}%{F-}  "
        
        elif [  "$Bat_Pct" -le 25 ]; then
            ICON="%{F#920707}%{F-}  "
        
        elif [ "$Bat_Pct" -le 40 ]; then
            ICON="%{F#1A6204}%{F-}  "
        
        elif [ "$Bat_Pct" -le 80 ]; then
            ICON="%{F#269306}%{F-}  "
        
        elif [ "$Bat_Pct" -le 100 ]; then
            ICON="%{F#3DD510}%{F-}  "
        fi
    fi

FORMAT="$FORMAT $ICON $Bat_Pct%"

echo $FORMAT

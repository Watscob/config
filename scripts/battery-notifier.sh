# !/bin/bash

write_msg=0

(while :
do
    if [ -f /sys/class/power_supply/BAT1/uevent ]
    then
        prct=$(cat /sys/class/power_supply/BAT1/uevent | grep "POWER_SUPPLY_CAPACITY=" | cut -d'=' -f2)
        charging=$(cat /sys/class/power_supply/BAT1/uevent | grep "POWER_SUPPLY_STATUS" | cut -d'=' -f2)
        if [ $prct -eq 15 ] && [ "$charging" == "Discharging" ] && [ $write_msg -eq 0 ]
        then
            notify-send -u critical -c "device" -t 15000 "Batterie faible ($prct%)"
            write_msg=1
        elif [ $prct -eq 14 ] && [ "$charging" == "Discharging" ] && [ $write_msg -eq 1 ]
        then
            write_msg=0
        fi
        sleep 15
    fi
done)

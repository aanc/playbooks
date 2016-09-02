#!/bin/bash

batteryLevel=$(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | cut -d: -f2 | sed "s/[ %]//g")
powerSupply=$(upower -i $(upower -e | grep 'AC$') | grep -E "power supply" | cut -d: -f2 | sed "s/[ %]//g")

[[ $batteryLevel -ge 95 ]] && echo -n "" && color=\#ffffff
[[ $batteryLevel -lt 95 && $batteryLevel -ge 75 ]] && echo -n "" && color=\#5ba7c3
[[ $batteryLevel -lt 75 && $batteryLevel -ge 50 ]] && echo -n "" && color=\#d0963f
[[ $batteryLevel -lt 50 && $batteryLevel -ge 25 ]] && echo -n "" && color=\#d03f3f
[[ $batteryLevel -lt 25 ]] && echo -n "" && color=\#ff3c3c

echo -n " $batteryLevel%"

[[ $powerSupply == yes ]] && echo " "

echo
echo $color

#!/bin/bash

level=$(pactl list sinks | grep '^[[:space:]]Volume:' | cut -d'/' -f2 | tr -d ' %')

[[ $level -ge 95 ]] && color=\#ff3c3c
[[ $level -lt 95 && $level -ge 75 ]] && color=\#d03f3f
[[ $level -lt 75 && $level -ge 50 ]] && color=\#d0963f
[[ $level -lt 50 ]] && color=\#ffffff

echo "$level%"
echo
echo $color

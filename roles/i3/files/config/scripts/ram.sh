#!/bin/sh

FULL=${FULL-█}
EMPTY=${EMPTY-░}
SIZE=${SIZE-10}

draw() {
    perc=$1
    size=$2

    inc=$(( perc * size / 100 ))

    for v in $(seq 0 $(( size - 1 )))
    do  
        [[ "$v" -le "$inc" ]] && out="${out}${FULL}" || out="${out}${EMPTY}"
    done

    printf '%s' "$out"
}


ram="$(free | awk '/Mem:/ {print int($3/$2 * 100.0)}')"

color=
[[ $ram -lt 50 ]] && color=\#6BC289
[[ $ram -ge 50 ]] && color=\#d0963f
[[ $ram -ge 85 ]] && color=\#d03f3f

printf "RAM:%s %s\n\n%s\n" "$ram%" "$(draw $ram $SIZE)" "$color"


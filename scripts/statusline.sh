#!/bin/bash
# Statusline custom : ccsp + CPU/RAM des processus Claude

# CPU et RAM totaux des processus Claude (hors VSCode)
read cpu ram procs <<< $(ps aux | grep -E "[c]laude" | grep -v "stream-json\|grep\|/bin/bash" | awk '{cpu+=$3; ram+=$6; n++} END {printf "%.0f %d %d", cpu, ram/1024, n}')

# Indicateur de santé
if (( ${cpu:-0} > 150 )); then
    indicator="🔴"
elif (( ${cpu:-0} > 80 )); then
    indicator="🟡"
elif (( ${procs:-0} > 2 )); then
    indicator="⚠️"
else
    indicator=""
fi

# Stats Claude
stats="${indicator}Proc:${procs:-1} CPU:${cpu:-0}% RAM:${ram:-0}M"

# Appeler ccsp si installé globalement (plus rapide que npx)
if command -v ccsp &>/dev/null; then
    ccsp_out=$(ccsp 2>/dev/null)
    echo "$ccsp_out | $stats"
else
    # Fallback: juste les stats
    echo "$stats"
fi

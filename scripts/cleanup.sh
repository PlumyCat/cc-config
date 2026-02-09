#!/bin/bash
# Diagnostic et nettoyage des processus Claude bloqués

set -e

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# PID de ce script (pour ne pas se tuer soi-même)
SELF_PID=$$
PARENT_PID=$PPID

echo ""
echo "=== Diagnostic des processus Claude ==="
echo ""
printf "%-9s %-7s %-9s %-8s %-8s %s\n" "PID" "CPU%" "RAM" "TTY" "TIME" "STATUS"
printf "%-9s %-7s %-9s %-8s %-8s %s\n" "---------" "-------" "---------" "--------" "--------" "--------"

zombies=()

while IFS= read -r line; do
    pid=$(echo "$line" | awk '{print $2}')
    cpu=$(echo "$line" | awk '{print $3}')
    rss=$(echo "$line" | awk '{print $6}')
    tty=$(echo "$line" | awk '{print $7}')
    time=$(echo "$line" | awk '{print $10}')
    cmd=$(echo "$line" | awk '{for(i=11;i<=NF;i++) printf $i" "; print ""}')

    # Skip les process bash de ce script
    if echo "$cmd" | grep -q "/bin/bash.*cleanup\|grep.*claude"; then
        continue
    fi

    ram_mb=$((rss / 1024))

    # Déterminer le statut
    if [[ "$tty" == "?" ]]; then
        if echo "$cmd" | grep -q "output-format stream-json"; then
            status="${YELLOW}vscode${NC}"
        elif (( $(echo "$cpu > 50" | bc -l) )); then
            status="${RED}ZOMBIE${NC}"
            zombies+=("$pid")
        else
            status="${YELLOW}orphelin${NC}"
            zombies+=("$pid")
        fi
    else
        status="${GREEN}OK${NC}"
    fi

    printf "%-9s %-7s %-9s %-8s %-8s %b\n" "$pid" "${cpu}%" "${ram_mb}MB" "$tty" "$time" "$status"

done < <(ps aux | grep -E "[c]laude" | grep -v "grep")

echo ""

if [ ${#zombies[@]} -eq 0 ]; then
    echo -e "${GREEN}Aucun processus zombie détecté.${NC}"
else
    echo -e "${RED}Processus à nettoyer : ${zombies[*]}${NC}"
    echo ""
    read -p "Tuer ces processus ? [y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        kill -9 "${zombies[@]}" 2>/dev/null || true
        echo -e "${GREEN}Processus tués.${NC}"
    else
        echo "Annulé. Pour tuer manuellement :"
        echo "  kill -9 ${zombies[*]}"
    fi
fi

echo ""

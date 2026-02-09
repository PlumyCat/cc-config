---
name: cleanup
description: Diagnostic et nettoyage des processus Claude bloqués/zombies
allowed-tools: Bash
---

# Diagnostic et nettoyage des processus Claude

Vérifie s'il y a des processus Claude bloqués et propose de les tuer.

## Exécuter le diagnostic

```bash
~/cc-config/scripts/cleanup.sh
```

Le script affiche :
- Liste des processus Claude avec CPU%, RAM, TTY
- Statut : OK (vert), orphelin (jaune), ZOMBIE (rouge), vscode
- Propose de tuer les zombies si détectés

## Indicateurs de la statusline

La statusline affiche maintenant : `💰 $X.XX | Np X% XXXM`

- **N p** : nombre de processus Claude
- **X%** : CPU total utilisé
- **XXXM** : RAM totale en MB
- **🟡** : CPU > 80% (attention)
- **🔴** : CPU > 150% (problème)
- **⚠️** : Plus de 2 processus (sessions multiples)

## Nettoyage manuel

Si nécessaire :

```bash
# Lister les processus
ps aux | grep "[c]laude"

# Tuer un processus spécifique
kill -9 <PID>

# Tuer tous les processus Claude orphelins (ATTENTION)
pkill -9 -f "claude.*--continue"
```

## Prévention

- Utiliser `Ctrl+C` avant de fermer un terminal avec Claude
- Éviter de lancer plusieurs sessions en parallèle
- Surveiller la statusline pour détecter les anomalies

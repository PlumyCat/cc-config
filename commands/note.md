# /note - Ajout rapide de notes

Ajoute rapidement une note dans la documentation personnelle.

## Instructions

Selon le type de note demandé, exécute la commande appropriée :

### Ajouter un tip (truc à retenir)
```bash
~/cc-config/scripts/note.sh tip "Le message"
```
→ Ajoute dans `docs/tips.md`

### Ajouter une tâche au backlog
```bash
~/cc-config/scripts/note.sh todo "Le message"
```
→ Ajoute dans `docs/backlog.md`

### Ajouter une note de veille
```bash
~/cc-config/scripts/note.sh veille "Le message"
```
→ Ajoute dans `docs/veille.md`

### Ajouter une entrée changelog
```bash
~/cc-config/scripts/note.sh changelog "Le message"
```
→ Ajoute dans `docs/changelog.md`

## Exemples d'utilisation

- `/note tip "Utiliser --resume pour reprendre une conversation"`
- `/note todo "Tester le nouveau hook pre-edit"`
- `/note veille "v1.5 : support des images dans les prompts"`
- `/note changelog "Ajout de la commande /veille"`

## Après ajout

Propose de commiter le changement :
```bash
cd ~/cc-config && git add -A && git commit -m "docs: <type> - <message>" && git push
```

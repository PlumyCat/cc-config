---
name: daily-crm-sync
description: Workflow biquotidien GitHub -> CRM Dynamics 365 pour saisir le temps d'Eric, preparer la journee, analyser les commits des repos surveilles, trouver les trous Outlook et creer des RDV lies aux CAS via bot-dataverse.
allowed-tools: Bash, mcp__bot-dataverse__*
---

# Daily CRM Sync

Utilise ce skill quand Eric veut lancer, verifier, activer, ajuster ou depanner le workflow `daily-crm-sync`, ou quand il parle de saisir son temps a partir de ses commits GitHub.

## Emplacement

Le workflow canonique est dans :

```bash
/Users/ericfer/projects/bot-dataverse/daily-crm-sync
```

Fichiers importants :

- `PROMPT.md` : orchestration complete du run matin/soir.
- `sync.py` : helpers deterministes pour GitHub, trous calendrier, propositions de creneaux.
- `config.json` : horaires, tailles de slots, comportement, `dry_run`.
- `repos.json` : whitelist GitHub et mapping repo -> CAS Dynamics.
- `.env` : PAT GitHub et username. Ne jamais afficher son contenu.

## Modes

- `morning` : saisit la veille. Le lundi, viser le vendredi precedent si Eric parle du run normal.
- `evening` : saisit la journee en cours.
- Dates et heures : timezone Europe/Paris.
- Horaires par defaut : 09:00-12:30 et 14:00-17:30.

## Workflow D'Execution

1. Lire `PROMPT.md` pour suivre la procedure exacte du run.
2. Aller dans le dossier du workflow avant les commandes :

```bash
cd /Users/ericfer/projects/bot-dataverse/daily-crm-sync
```

3. Recuperer les commits :

```bash
python sync.py fetch-commits > /tmp/commits.json
```

4. Recuperer le calendrier via `mcp__bot-dataverse__list_calendar_events`, jamais via un autre MCP Outlook/M365.
5. Convertir les evenements busy en JSON `{start,end,subject}` dans `/tmp/events.json`, en ignorant `free` et `tentative`.
6. Calculer les trous :

```bash
python sync.py compute-gaps --events /tmp/events.json --date YYYY-MM-DD > /tmp/gaps.json
```

7. Recuperer les CAS/projets actifs et leur priorite/backlog via bot-dataverse, puis produire `/tmp/incidents.json` sous la forme :

```json
[{"id":"guid","name":"Nom","backlog":1,"ticket":"CAS-..."}]
```

8. Generer la proposition :

```bash
python sync.py propose-slots --commits /tmp/commits.json --gaps /tmp/gaps.json --incidents /tmp/incidents.json > /tmp/proposals.json
```

9. Presenter un tableau clair, demander validation, appliquer les modifications demandees en langage naturel, puis seulement creer les RDV.

## Regles CRM

- Toujours demander confirmation avant creation si `config.json > behavior.ask_before_creating` est `true`.
- Si `behavior.dry_run` est `true`, ne rien creer et annoncer explicitement le mode dry-run.
- Creer les RDV avec `mcp__bot-dataverse__create_appointment`, lies a l'incident/CAS.
- Si `crm.auto_complete_after_validation` est `true`, cloturer ensuite avec `mcp__bot-dataverse__complete_appointment`.
- Ne jamais ecrire directement dans Dynamics depuis `sync.py`; le script ne sert qu'a preparer les donnees.

## Mapping Repos

Si un repo n'a pas de `crm_incident_guid` dans `repos.json`, demander a Eric s'il faut utiliser un CAS existant, creer un nouveau CAS, ou ignorer le repo pour ce run.

Pour un CAS existant : chercher avec `mcp__bot-dataverse__list_incidents`, demander confirmation, puis mettre a jour `repos.json`.

Pour un nouveau CAS : respecter les regles metier du MCP prod. Demander le titre, lister et faire choisir le sujet avec `mcp__bot-dataverse__list_incident_subjects`, lister et faire choisir le droit avec `mcp__bot-dataverse__list_entitlements`, lister et faire choisir le contact avec `mcp__bot-dataverse__list_contacts`, confirmer le proprietaire du ticket ("ce ticket est pour toi ?" avec l'email connecte si connu), puis appeler `mcp__bot-dataverse__create_incident`. Ne jamais utiliser de sujet par defaut global, et ne jamais laisser Dataverse affecter le proprietaire au compte applicatif.

Pour les commits dupliques entre plusieurs repos, demander si le temps doit etre impute sur tous les CAS, seulement le CAS prioritaire, un CAS specifique, ou ignore.

## Sortie Attendue

En fin de run, confirmer :

- nombre de RDV crees ou proposes ;
- total d'heures ;
- RDV clotures ou non ;
- erreurs et actions de retry si besoin.

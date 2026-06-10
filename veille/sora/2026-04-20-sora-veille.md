# Veille Sora / Azure AI Foundry — 2026-04-20

> **T-6 jours avant la fermeture de l'app Sora (26 avril 2026).**
> Rien de neuf côté OpenAI ce week-end sur le dossier vidéo ; mais **3 signaux importants** depuis le rapport du 17/04 : Veo 4 officialisé, un bug bloquant sur l'API Video d'Azure OpenAI documenté avec workaround, et Happy Horse 1.0 (Alibaba) qui creuse un écart historique en tête des classements.

---

## 🔴 Nouveautés Sora-2 / OpenAI

### Pas de nouvelle annonce vidéo depuis le 17/04

Les annonces OpenAI de la semaine sont orientées ailleurs :

- **14/04** — « Trusted access for the next era of cyber defense »
- **15/04** — Next evolution of the Agents SDK
- **16/04** — **GPT-Rosalind** (modèle de reasoning pour sciences de la vie / drug discovery / génomique)

→ Aucune communication nouvelle d'OpenAI sur un successeur Sora grand public ou sur un changement de roadmap vidéo. Le narratif « compute réorienté vers world-models + enterprise » reste la ligne officielle.

### Rappel deadlines (inchangées)

- **26/04/2026** — shutdown de l'app Sora (dans 6 jours)
- **24/09/2026** — discontinuation de l'API Sora (OpenAI direct)
- **Sora 2 / Sora 2 Pro** : endpoints `sora-2` et `sora-2-pro` toujours exposés, 0,10 USD/s et 0,30 USD/s respectivement

**Sources :**
- [OpenAI News — April 2026 updates](https://openai.com/news/)
- [OpenAI Help — Sora discontinuation](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [the-decoder — Two-stage Sora shutdown timeline](https://the-decoder.com/openai-sets-two-stage-sora-shutdown-with-app-closing-april-2026-and-api-following-in-september/)

---

## 🔵 Azure AI Foundry

### 🚨 Bug bloquant documenté sur l'API Video d'Azure OpenAI (Q&A MS du 15/04)

**Impact direct potentiel sur le bot de génération vidéo.** Une question Microsoft Q&A très détaillée a été publiée le 15 avril et décrit précisément un catch-22 qui **peut casser une migration v2025-05-02 → sora-2** si le code appelle encore l'ancien endpoint :

| | Ancien endpoint | Nouveau endpoint |
|-|-----------------|------------------|
| Path | `POST /openai/v1/video/generations/jobs` | `POST /openai/v1/videos?api-version=preview` |
| Nom de deployment accepté | doit être `sora` exactement | n'importe quel deployment name (y compris `sora-2`) |
| `seconds` | int (ex. 5) | **string** (`"4"`, `"8"`, `"12"`) |
| `size` | width / height int | **string** (`"720x1280"`, `"1280x720"`…) |
| Status de job | `succeeded` / `failed` | `completed` / `failed` |

L'ancien endpoint requiert un deployment nommé exactement `sora`, or **le modèle `sora` v2025-05-02 est deprecated depuis le 28/02/2026** et ne peut plus être déployé. Conséquence : toute tentative de déployer `sora-2` sur l'ancien endpoint → **HTTP 400 "Invalid model deployment. The deployed model must be 'sora'"** (9 variations testées par l'auteur, toutes en échec). Le fix est de passer à l'endpoint v1 `/openai/v1/videos` et d'adapter le schéma de payload (types des champs changent).

→ **Action concrète pour le bot** : vérifier dans le code si on hit encore `/openai/v1/video/generations/jobs`. Si oui, **migrer vers `/openai/v1/videos?api-version=preview`** AVANT toute tentative de bascule sora-2. Les types des champs `seconds` et `size` ont changé (string au lieu d'int) — casse silencieuse potentielle côté SDK ou wrapper maison.

### What's New Foundry — doc update du 17/04 : toujours pas de nouveau modèle vidéo

La page `learn.microsoft.com/azure/foundry/whats-new-foundry` a été mise à jour le 17 avril (22:08 UTC). Aucun nouveau modèle vidéo dans la liste. Les nouveautés d'avril concernent :

- **FLUX** (Black Forest Labs) disponible dans Foundry → **image uniquement**
- **Fireworks models** en preview dans Foundry
- Task Adherence guardrails, Prompt Optimizer, Browser Automation tool, LangGraph integration
- Fine-tuning updates (blog post du 16/04)
- Auto-upgrade Azure OpenAI → Microsoft Foundry (path migration)
- **Update de l'article `Azure OpenAI in Microsoft Foundry Models v1 REST API reference`** — cohérent avec le bug API ci-dessus, le nouveau endpoint est désormais la référence.

→ **Toujours pas de release sora-2 GA** ni d'alternative vidéo native MS. `sora-2` reste gated (Enterprise MCA-E / EA / 1000+CU), disponible uniquement en **Sweden Central** et **East US 2**.

### Pas de post Sora sur le Foundry blog dans la fenêtre 10-20 avril

Seul post dev blog publié dans la période : *What's New in Microsoft Foundry Fine-Tuning | April 2026* (16/04, Blanca Li) — sujets RFT Global Training pour o4-mini et GPT-4.1 graders. Rien de vidéo.

**Sources :**
- [MS Q&A — Azure OpenAI Video API rejects all sora-2 deployments (15/04)](https://learn.microsoft.com/en-us/answers/questions/5860394/azure-openai-video-api-rejects-all-sora-2-deployme)
- [Microsoft Learn — What's new in Microsoft Foundry (April 2026, updated 17/04)](https://learn.microsoft.com/en-us/azure/foundry/whats-new-foundry)
- [Microsoft Learn — v1 REST API reference (Azure OpenAI)](https://learn.microsoft.com/en-us/azure/foundry/openai/latest)
- [Microsoft Learn — Sora 2 video generation overview (preview)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Microsoft Foundry Blog — What's new in Foundry Fine-Tuning April 2026](https://devblogs.microsoft.com/foundry/whats-new-in-foundry-finetune-april-2026/)

---

## 🟢 Alternatives / concurrents

### 🆕 Veo 4 officialisé — Google (avril 2026)

Première mention explicite dans la veille (non couvert au 17/04). Sources multiples confirment une **release officielle** (et non plus un teaser comme fin mars) :

- Accès : **Google Flow**, **Gemini Ultra** (49,99 USD/mois), **Google AI Studio** (API pay-as-you-go dev)
- Google AI Pro (19,99 USD/mois) donne accès partiel
- Features annoncées : génération **30 s**, **storyboarding natif**, **output 4K**, cohérence des personnages améliorée, **zero-shot avatar creation**, multimodal input
- **Pricing API par seconde non officiellement publié** — renvoie vers la pricing page AI Studio

⚠️ **À confirmer** : la couverture vient majoritairement de médias tiers, le site DeepMind officiel n'a pas encore de model card publique dédiée Veo 4 au moment de la veille. Le signal est cohérent (plusieurs sources indépendantes, dates convergentes) mais **pas encore de post officiel Google Developers Blog / DeepMind dédié Veo 4**. **Traiter comme "released but not fully documented"** — vérifier la disponibilité réelle sur Vertex AI / Gemini API avant de baser une migration dessus.

### 🆕 Happy Horse 1.0 / Alibaba — #1 arène vidéo avec écart historique

Non couvert au 17/04. Le modèle anonyme apparu le **7 avril** sur Artificial Analysis Video Arena a été revendiqué par **Alibaba Taotian Future Life Lab** (équipe dirigée par Zhang Di, ex-VP Kuaishou, ex-Kling) le **10 avril**.

- **Text-to-Video** : Elo **1 333–1 387**, #1
- **Image-to-Video** : Elo **1 391–1 406**, #1 (record historique)
- **Écart de 74 points Elo** sur le 2e (Seedance 2.0) → **plus gros écart jamais observé** sur ce leaderboard
- 15 B paramètres
- **Audio joint** (dialogue, ambient, Foley, musique) en single forward pass — même promesse que Veo 3.1
- ⚠️ **Pas de model card publique, pas de weights, pas d'API publique, pas de site officiel à ce jour** — le déploiement et les SLAs sont inconnus

→ Happy Horse **déplace Kling 3.0 du #1** qui était signalé au 17/04. Pour le bot, c'est surtout un signal que le marché bouge vite et qu'une veille hebdo reste pertinente — pas encore d'alternative exploitable tant qu'il n'y a pas d'API.

### Veo 3.1 — rappel état de l'art opérationnel

Veo 3.1 reste, au 20/04, l'alternative **la plus immédiatement exploitable** si le bot a déjà basculé dessus :
- Audio synchronisé natif (dialogue + ambient + Foley) en un passage
- Sortie 4K 3840×2160 jusqu'à 60 fps
- Free sur comptes Google perso depuis le 02/04 (Vids / Flow)
- Veo 3.1 Fast : baisse de prix depuis le 07/04
- Veo 3.1 Lite : release 31/03 — meilleur ratio coût/qualité via Gemini API

### Seedance 2.0 (ByteDance) — mention accrue comme alternative Sora

Les guides "Sora alternatives" publiés depuis le 14/04 mettent désormais **Seedance 2.0** en premier (avant Veo 3) pour certains use cases prompt-fidelity. À surveiller si le prix/qualité devient concurrentiel de Veo.

**Sources :**
- [Veo 4 Release — Everything You Need to Know (avril 2026)](https://www.veo3ai.io/blog/veo-4-release-everything-you-need-to-know-2026)
- [Google Developers Blog — Veo 3.1 Gemini API updates](https://blog.google/innovation-and-ai/technology/developers-tools/veo-3-1-gemini-api/)
- [CNBC — Alibaba reveals it's behind HappyHorse AI video model](https://www.cnbc.com/2026/04/10/alibaba-happyhorse-ai-video-model-benchmark-reveal.html)
- [Bloomberg — Stealth Alibaba video AI model tops global ranking](https://www.bloomberg.com/news/articles/2026-04-10/stealth-alibaba-video-ai-model-tops-global-ranking-on-debut)
- [WaveSpeedAI — What is HappyHorse-1.0?](https://wavespeed.ai/blog/posts/what-is-happyhorse-1-0-ai-video-model/)
- [State of AI Video Generation April 2026 — AutoGPT](https://autogpt.net/state-of-ai-video/)
- [Decrypt — Veo 3.1 Lite cuts API costs in half as Sora exits](https://decrypt.co/363077/google-veo-3-1-lite-cuts-api-costs-half-openai-sora)

---

## 📌 Actions recommandées

| Priorité | Action | Délai |
|----------|--------|-------|
| 🔴 URGENT | **Vérifier l'endpoint Azure OpenAI utilisé par le bot** : si le code hit encore `/openai/v1/video/generations/jobs`, migrer vers `/openai/v1/videos?api-version=preview`. Attention aux types : `seconds` string, `size` string, status `completed`/`failed`. Sans ça, la bascule sora-2 lèvera HTTP 400 systématique. | **Cette semaine** |
| 🔴 URGENT | **T-6 avant shutdown app Sora (26/04)** : dernière vérification qu'aucun workflow résiduel (export, monitoring, éventuelle intégration humain-in-the-loop) n'utilise l'app Sora. L'API OpenAI direct reste live jusqu'au 24/09. | **Cette semaine** |
| 🟡 MOYEN | **Plan B Veo 4** : évaluer si un upgrade Veo 3.1 → Veo 4 fait sens (storyboarding natif + 30s + zero-shot avatar). Attention : pricing API non publié, model card DeepMind officielle absente → attendre la doc avant de baser un SLA dessus. | 2-3 semaines |
| 🟡 MOYEN | Côté Foundry : **ré-interroger le catalog** après la mise à jour doc du 17/04. Toujours pas d'alternative vidéo MS native (FLUX est image-only). Décider si on maintient un chemin sora-2 gated ou si on assume que la vidéo sort de Foundry. | Décision à prendre |
| 🟢 VEILLE | **Happy Horse 1.0 / Alibaba** : surveiller la release d'une API publique. Aujourd'hui inexploitable (pas d'API, pas de model card), mais l'écart de 74 Elo sur Seedance 2.0 mérite un bench dès qu'il devient accessible. | Dès release API |
| 🟢 VEILLE | **Seedance 2.0** : monte dans les recommandations "Sora alternative" post-14/04, à ajouter à la matrice de bench avec Veo 3.1 et Veo 4. | Ce mois-ci |

---

## 🔍 Rien de significatif aujourd'hui sur :

- Annonce Microsoft d'un chemin de migration sora v2025-05-02 → sora-2 automatisé : toujours **aucun path officiel**, l'auto-upgrade Azure OpenAI → Foundry documenté le 17/04 ne couvre pas le cas vidéo.
- Successeur Sora côté OpenAI : **aucune annonce** cette semaine (focus GPT-Rosalind, Agents SDK, cyber defense).
- Runway / Pika / Luma : pas de release majeure dans les 72h.
- Grok Imagine (xAI) : pas d'update depuis le rapport du 17/04.

---

*Rapport généré automatiquement le 2026-04-20. Sources datant de ≤ 7 jours sauf rappels de contexte explicitement marqués. Annonce Veo 4 marquée "released but not fully documented" tant que DeepMind n'a pas publié de model card officielle.*

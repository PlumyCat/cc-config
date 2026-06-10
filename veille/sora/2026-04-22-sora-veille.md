# Veille Sora / Azure AI Foundry — 2026-04-22

> **T-4 jours avant la fermeture de l'app Sora (26 avril 2026).**
> Journée dominée côté OpenAI par le lancement de **ChatGPT Images 2.0 / gpt-image-2** (21/04) : confirmation nette que le compute et la narrative produit vont à l'image + agents, pas à la vidéo. Côté Foundry, silence radio sur la vidéo (page `whats-new-foundry` toujours figée au 17/04, aucun post Foundry Blog entre le 18 et le 22/04). Happy Horse 1.0 reste la piste concurrente la plus tangible mais toujours sans API live.

---

## 🔴 Nouveautés Sora-2 / OpenAI

### 🆕 ChatGPT Images 2.0 / gpt-image-2 — lancé le 21/04/2026

Ce qui a été confirmé hier (ce que le rapport 21/04 n'avait que sous forme de rumeur « rollout progressif ») :

- **21/04** — **ChatGPT Images 2.0** lancé officiellement. Modèle `gpt-image-2` avec reasoning natif, résolution 2K, cohérence multi-image (jusqu'à 8 images cohérentes depuis un seul prompt), vérification auto des sorties.
- Rollout à **tous les utilisateurs ChatGPT + Codex** ; fonctionnalités « thinking » réservées Plus/Pro/Business.
- **Positionné comme « visual thought partner »** — angle explicite d'OpenAI : travail visuel cognitif vs simple génération.

→ **Lecture pour le bot vidéo** : la tendance interne OpenAI s'éloigne encore un peu plus de la vidéo grand public. Le narratif « on recentre sur ce qui rapporte » se solidifie, dans la lignée du shutdown Sora du 24/03.

### 🆕 DeployCo — JV de 1,5 Md$ (22/04)

- OpenAI annonce aujourd'hui une **joint venture « DeployCo »** avec un fonds PE, enveloppe totale jusqu'à 1,5 Md$, injection initiale 500 M$ d'OpenAI.
- But : déploiement enterprise de Codex et outils agent. **Aucune implication vidéo** dans le communiqué.

### 🆕 Codex — scaling enterprise officialisé (21/04)

- OpenAI annonce 3 M devs/semaine début avril → **4 M+ en deux semaines**. Codex Labs lancé, partenariats GSI.
- Pertinent uniquement comme signal macro : **les ressources produit/compute OpenAI sont orientées Codex + Image, pas vidéo**.

### Rumeur « Spud » — picked up par eWeek et MindStudio, mais toujours ⚠️ non confirmé

- Nouveauté depuis hier : **eWeek** et **MindStudio** reprennent la mention du projet « Spud » comme successeur-vidéo direct de Sora, en décrivant des « targeted improvements ».
- **Pas de post officiel OpenAI**, pas de system card, pas de date. Les deux articles qualifient eux-mêmes le nom comme « internal codename, not confirmed product name ».
- ⚠️ **Statut inchangé côté décisionnel** : ne pas baser de plan sur Spud tant qu'un blog.openai.com / tweet officiel n'existe pas.

### Rappel deadlines (inchangées)

- **26/04/2026 — T-4 JOURS** : shutdown de l'app Sora (web + mobile). Export : `sora.chatgpt.com/exports/me`
- **24/09/2026** : discontinuation de l'API Sora (OpenAI direct)
- **sora-2 / sora-2-pro** : endpoints live, 0,10 / 0,30 USD/s

**Sources :**
- [The New Stack — ChatGPT Images 2.0 (gpt-image-2)](https://thenewstack.io/chatgpt-images-20-openai/)
- [Startup Fortune — OpenAI teases gpt-image-2 noon livestream](https://startupfortune.com/openai-teases-gpt-image-2-ahead-of-a-noon-livestream-that-could-reshape-the-generative-ai-market/)
- [9to5Mac — OpenAI teases next AI announcement (21/04)](https://9to5mac.com/2026/04/21/openai-teases-next-ai-announcement-coming-today-heres-what-to-expect/)
- [OpenAI — Scaling Codex to enterprises worldwide](https://openai.com/index/scaling-codex-to-enterprises-worldwide/)
- [GuruFocus — OpenAI Plans $1.5B DeployCo JV (22/04)](https://www.gurufocus.com/news/8808002/openai-plans-15-billion-investment-in-new-joint-venture)
- [eWeek — Sora is Gone: 6 AI Video Tools Filling the Void](https://www.eweek.com/news/sora-alternatives-ai-video-tools-2026/)
- [MindStudio — OpenAI shutting down Sora: what comes next](https://www.mindstudio.ai/blog/openai-shutting-down-sora-what-happened-2)

---

## 🔵 Azure AI Foundry

### Aucune nouveauté vidéo depuis 5 jours

Vérification ce matin :

- **`learn.microsoft.com/azure/foundry/whats-new-foundry`** : `updated_at = 2026-04-17 22:08 UTC`. **Inchangé depuis le 17/04** (5 jours consécutifs, 3 rapports de veille consécutifs). Cycle de refresh habituel observé 7-10 j — un refresh est attendu ~24-25/04.
- **Foundry Blog — catégorie What's New** : dernier post « March 2026 » daté du **09/04**. **Aucun post entre le 18 et le 22/04** dans cette catégorie.
- **Azure Blog Foundry** : pas de nouveau post vidéo publié dans les 48h.

### État sora-2 sur Foundry — inchangé

- `sora-2` / `sora-2-pro` : **preview, access gated** (Enterprise MCA-E / EA / 1000+ CU, form d'application).
- Régions : **Sweden Central** et **East US 2** uniquement.
- Ancien modèle `sora v2025-05-02` : deprecated 28/02/2026, ne peut plus être déployé.
- **Bug endpoint** `/openai/v1/video/generations/jobs` (HTTP 400 sur sora-2) : **toujours non résolu** après 7+ jours (même fenêtre que le rapport du 15/04). Workaround inchangé : `/openai/v1/videos?api-version=preview` avec types `seconds: string` et `size: string`.
- Toujours **aucun migration path automatisé** communiqué par MS.

### Signaux secondaires Foundry (non-vidéo) ces 48h

Pertinent comme contexte ressources :

- **Foundry Toolkit for VS Code — GA** (21/04 annoncé, confirmé 22/04). Agent Builder low-code, Agent Workbench. **Pas de crochet vidéo.**
- RFT (Reinforcement Fine-Tuning) : Global Training pour o4-mini, 12+ régions, nouveaux graders GPT-4.1. Image + texte seulement.
- MAI-Image-2-Efficient reste le focus média (41% moins cher, image-only).

→ **Doctrine Microsoft inchangée sur la vidéo** : stack MAI sur image + voix + transcription, zéro alternative vidéo MAI native, zéro plan de migration publique sora-2.

**Sources :**
- [Microsoft Learn — What's new in Microsoft Foundry (updated 17/04, unchanged)](https://learn.microsoft.com/en-us/azure/foundry/whats-new-foundry)
- [Microsoft Learn — Sora 2 video generation overview (preview)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Foundry Blog — What's new March 2026 (last post 09/04)](https://devblogs.microsoft.com/foundry/whats-new-in-microsoft-foundry-mar-2026/)
- [MS Q&A — Azure Video API rejects sora-2 deployments (catch-22)](https://learn.microsoft.com/en-au/answers/questions/5860394/azure-openai-video-api-rejects-all-sora-2-deployme)
- [MS Q&A — sora v2025-05-02 retiring, no successor](https://learn.microsoft.com/en-us/answers/questions/5790204/azure-openai-sora-(model-sora-v2025-05-02)-retirin)
- [MS Community Hub — Foundry Toolkit for VS Code GA (21/04)](https://techcommunity.microsoft.com/blog/azuredevcommunityblog/%E2%9A%A1foundry-toolkit-for-vs-code-a-deep-dive-on-ga/4509510)

---

## 🟢 Alternatives / concurrents

### Happy Horse 1.0 — statut inchangé vs 21/04

Situation au 22/04 :

- **fal.ai/happyhorse** : landing toujours live, encore **« coming soon »** (pas d'API publique active dans les dernières 24h).
- Fenêtre « late April 2026 » toujours citée — confirmée par l'article du 14/04 de National Law Review (« rumored to be coming to fal later in April 2026 ») que reprend aussi Weekly Voice.
- **Pas de model card, pas de pricing, pas de SLA** publiés à ce jour.
- ⚠️ Pas de confirmation que l'API tombe le 30/04 exactement — le signal plus précis noté hier (date ferme) n'est pas re-confirmé aujourd'hui. **À downgrader légèrement** : « courant fin avril » plutôt que « 30/04 ferme ».
- Perfs inchangées : #1 T2V + #1 I2V sur Artificial Analysis Video Arena, 15 B params, audio joint en single forward pass, 1080p 5-8 s en 16:9/9:16.

→ Toujours le meilleur candidat pour un bench dès que l'API ouvre. Mais **garder Veo 3 en prod jusqu'à avoir un pricing et TOS publics** — pas de bascule à l'aveugle.

### Marché concurrent — consolidation post-Sora bien documentée

Plusieurs publications (eWeek, Pinggy, UlazAI, BuildMVPFast, Cyberlink, DigitalApplied) confirment la cartographie stabilisée après le shutdown Sora :

- **Runway Gen-4 / Gen-4.5** : #1 Artificial Analysis T2V à **1247 Elo** (vs Kling à 1243). Leader photorealism + temporal consistency. Pricing 12-76 USD/mois. Pas d'update dans les 72h.
- **Kling 3.0** : 4K natif, storyboard per-shot, lip-sync audio pipeline unifié. 6,99 USD/mois entry.
- **Veo 3.1 / Veo 3.1 Lite / Veo 3.1 Fast** : Veo 3.1 gratuit pour tous les comptes Google depuis avril 2026 ; Veo 3.1 Lite = « <50% du coût de Veo 3.1 Fast », positionné volume/cost-effective. Disponible via Gemini API et Vertex AI (us-central1, us-east4, europe-west4, asia-northeast1). **0,75 USD/s** video+audio sur Veo 3.
- **Pika** : positionné social/budget.
- **Seedance 2.0 (ByteDance)** : reste cité comme alternative sérieuse.

→ **Pour le bot sur Azure** : la bascule temporaire sur Veo 3 (3.1 désormais) reste la plus saine jusqu'à la fin de la fenêtre de migration. Aucun élément neuf aujourd'hui qui change la priorisation.

### Veo 4 — toujours pas de model card officielle DeepMind

- `deepmind.google/models/veo/` sans carton officiel Veo 4. Pages tierces parlent de Veo 4 mais sans source DeepMind.
- Posture inchangée : **ne pas baser un SLA sur Veo 4**. Rester sur **Veo 3.1** en prod.

**Sources :**
- [fal.ai — Happy Horse 1.0 (landing)](https://fal.ai/happyhorse-1.0)
- [fal.ai — HappyHorse-1.0 : What Do We Know So Far](https://fal.ai/learn/devs/happyhorse-1-0-what-do-we-know-so-far)
- [National Law Review — Happy Horse 1.0 rumored for fal late April 2026](https://natlawreview.com/press-releases/happy-horse-10-rumored-be-coming-fal-later-april-2026)
- [eWeek — Sora Is Gone: 6 AI Video Tools Filling the Void in 2026](https://www.eweek.com/news/sora-alternatives-ai-video-tools-2026/)
- [Pinggy — Best Video Generation AI Models in 2026](https://pinggy.io/blog/best_video_generation_ai_models/)
- [BuildMVPFast — Best Text-to-Video AI Generators April 2026](https://www.buildmvpfast.com/articles/best-llms-2026-guide/video-generation-ai)
- [Google Developers Blog — Veo 3.1 Lite](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-lite/)
- [Google Developers Blog — Veo 3.1 in Gemini API](https://developers.googleblog.com/introducing-veo-3-1-and-new-creative-capabilities-in-the-gemini-api/)
- [Vertex AI Docs — Veo 3.1](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/models/veo/3-1-generate)

---

## 📌 Actions recommandées

| Priorité | Action | Délai |
|----------|--------|-------|
| 🔴 URGENT | **T-4 avant shutdown app Sora (26/04)** : final sweep qu'aucun workflow (export, monitoring, lien humain-in-the-loop) n'utilise encore l'app Sora. API Sora OpenAI direct reste live jusqu'au 24/09. | **48-96 h** |
| 🔴 URGENT | **Endpoint Azure OpenAI Video — bug non résolu après 7 j** : si le bot hit encore `/openai/v1/video/generations/jobs`, migrer vers `/openai/v1/videos?api-version=preview` (types `seconds: string`, `size: string`, status `completed`/`failed`). Sans ça, impossible de déployer sora-2. | **Cette semaine** |
| 🟡 MOYEN | **Happy Horse 1.0** : surveiller `fal.ai/happyhorse` quotidiennement jusqu'au 30/04. Dès que l'API passe « live », lancer un mini-bench 3-5 prompts repré. du bot contre Veo 3.1. Ne PAS bascule prod avant pricing + TOS publics. | **Fin avril** |
| 🟡 MOYEN | **Plan B Veo 4 → rester sur Veo 3.1** en prod. Monter Veo 3.1 Lite comme option coût-optimisée dans la matrice de bench (< 50% du coût de 3.1 Fast). | Hold + bench |
| 🟡 MOYEN | **Foundry catalog** : re-check ciblé `whats-new-foundry` le 24-25/04 (cycle habituel) et le 26-27/04 (post-shutdown app Sora). MS pourrait rafraîchir la doc sora-2 à l'occasion du shutdown app. | T+3-5 j |
| 🟢 VEILLE | **gpt-image-2** (lancé 21/04) : suivre si OpenAI chaîne image→vidéo dans les jours qui viennent. Probabilité faible sur 7 j mais narratif qui se renforce. | Veille passive |
| 🟢 VEILLE | **« Spud » (OpenAI video)** : ⚠️ toujours non confirmé malgré reprises eWeek / MindStudio. Attendre confirmation officielle OpenAI. | Veille passive |
| 🟢 VEILLE | **DeployCo JV (1,5 Md$)** : vérifier dans les 48h si un communiqué détaillé mentionne une enveloppe ou un use case vidéo (probabilité faible, mais à écarter). | 48 h |

---

## 🔍 Rien de significatif aujourd'hui sur :

- Annonce d'un chemin de migration `sora v2025-05-02` → `sora-2` automatisé sur Azure : **toujours aucun path officiel** (inchangé depuis 4 rapports consécutifs, 8 j sans mouvement).
- Sortie d'un successeur vidéo officiel côté OpenAI : **aucune annonce officielle**. Spud toujours au stade rumeur malgré reprises médias.
- Happy Horse — confirmation d'API live le 30/04 : **non re-confirmée aujourd'hui**, fenêtre « late April » plus prudente.
- Veo 4 model card officielle : **toujours absente** sur `deepmind.google/models/veo/`.
- Runway / Pika / Luma / Kling : pas de release majeure dans les 72 h.
- GA sora-2 sur Azure : **inchangé**, toujours gated preview.

---

## 📊 Évolution vs rapports précédents

| Signal | 17/04 | 20/04 | 21/04 | 22/04 |
|--------|-------|-------|-------|-------|
| sora-2 GA Azure | Gated preview | Gated preview | Gated preview | **Gated preview** (inchangé 5j) |
| Successeur Sora OpenAI | Rien | Rien | Rumeur « Spud » | Rumeur « Spud » **reprise** par eWeek + MindStudio (⚠️ non confirmé) |
| gpt-image-2 | — | Rumeur rollout | Rollout en cours | **Lancé officiellement** (21/04) |
| Veo 4 | Teaser/rumeur | Released, pas de card | Pas de card | **Toujours pas de model card DeepMind** |
| Happy Horse API | Pas d'info | Pas d'API | API « 30/04 via fal.ai » | **« late April 2026 »** (revu à la baisse) |
| Bug endpoint Azure OpenAI Video | Documenté | Documenté | Documenté | **Documenté, non résolu depuis ≥7j** |
| Doc Foundry whats-new | Refresh 17/04 | Inchangé | Inchangé | **Inchangé 5j** |
| Sora app shutdown | T-9 | T-6 | T-5 | **T-4** |

---

*Rapport généré automatiquement le 2026-04-22. Sources ≤ 7 jours (sauf rappels de contexte explicites). gpt-image-2 confirmé par The New Stack et Startup Fortune le 21/04. DeployCo par GuruFocus le 22/04. Rumeur « Spud » toujours marquée ⚠️ non confirmée malgré reprises médias. Happy Horse API : date ferme 30/04 non re-confirmée aujourd'hui, retour à la prudence « late April ».*

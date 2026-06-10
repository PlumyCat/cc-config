# Veille Sora / Azure AI Foundry — 2026-04-23

> **T-3 jours avant la fermeture de l'app Sora (26 avril 2026).**
> Côté OpenAI, la « launch week » continue sans une seule ligne sur la vidéo : hier ont été lancés **Workspace Agents** (replacement des Custom GPTs, Codex-powered) et le **Privacy Filter** (modèle PII open-source). Côté Foundry, **3 nouveaux posts de blog le 22/04** (Toolboxes, Hosted Agents, Developer Journey) — **tous sur les agents, zéro sur la vidéo**. La doc `whats-new-foundry` reste figée au 17/04 (6 jours). Aucun mouvement sur sora-2, Spud ou Happy Horse.

---

## 🔴 Nouveautés Sora-2 / OpenAI

### 🆕 Workspace Agents dans ChatGPT — lancés le 22/04/2026

- OpenAI annonce **Workspace Agents** : remplacement officiel des Custom GPTs, **powered by Codex**, orientés équipes (tâches complexes, workflows long-running, permissions org).
- Rollout **gratuit** pour Business, Enterprise, Edu, Teachers (« Research Preview »).
- Messaging : « from preparing reports, to writing code, to responding to messages ».

→ **Lecture pour le bot vidéo** : troisième signal consécutif en 72h (gpt-image-2 21/04, Codex enterprise 21/04, Workspace Agents 22/04) que la « launch week » OpenAI est **100% orientée agents + image + enterprise**, zéro créneau vidéo. Le narratif « on redirige les ressources compute hors vidéo » se re-confirme.

### 🆕 OpenAI Privacy Filter — lancé le 22/04/2026

- Modèle open-weight (1,5 B params, Apache 2.0, GitHub + HuggingFace) pour détection + redaction de PII en local.
- **96% F1 sur PII-Masking-300k** out-of-the-box. Tourne on-device pour ne pas exposer les données sensibles.
- Implication vidéo : **aucune directe**. Pertinent si le bot remonte des données utilisateur (transcription audio, métadonnées) avant envoi aux modèles vidéo — candidat pour un étage de sanitisation en amont.

### Rumeur « Spud » — toujours ⚠️ non confirmé, aucun mouvement aujourd'hui

- Aucun post officiel OpenAI sur un successeur vidéo dans les dernières 24h.
- La mention « Spud » reste reprise par MindStudio / eWeek sans confirmation officielle, **statut inchangé vs 22/04**.
- Rappel : tant qu'il n'y a pas de blog.openai.com, de system card, ou de tweet officiel — **ne pas baser de plan dessus**.

### Rappel deadlines (inchangées)

- **26/04/2026 — T-3 JOURS** : shutdown de l'app Sora (web + mobile). Export : `sora.chatgpt.com/exports/me`
- **24/09/2026** : discontinuation de l'API Sora (OpenAI direct)
- **sora-2 / sora-2-pro** : endpoints live, 0,10 / 0,30 USD/s

**Sources :**
- [OpenAI — Introducing OpenAI Privacy Filter](https://openai.com/index/introducing-openai-privacy-filter/)
- [VentureBeat — OpenAI launches Privacy Filter (open-source PII model)](https://venturebeat.com/data/openai-launches-privacy-filter-an-open-source-on-device-data-sanitization-model-that-removes-personal-information-from-enterprise-datasets)
- [9to5Mac — OpenAI updates ChatGPT with Codex-powered Workspace Agents (22/04)](https://9to5mac.com/2026/04/22/openai-updates-chatgpt-with-codex-powered-workspace-agents-for-teams/)
- [OpenAI Privacy Filter — Model Card (PDF)](https://cdn.openai.com/pdf/c66281ed-b638-456a-8ce1-97e9f5264a90/OpenAI-Privacy-Filter-Model-Card.pdf)
- [GitHub — openai/privacy-filter](https://github.com/openai/privacy-filter)
- [OpenAI Help Center — What to know about the Sora discontinuation](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)

---

## 🔵 Azure AI Foundry

### Vague d'annonces 22/04 — toutes sur les agents, zéro sur la vidéo

Le Microsoft Foundry Blog a publié **3 posts le 22/04/2026** :

1. **Introducing Toolboxes in Foundry** (Linda, Maria, Ronak)
2. **From Local to Production: Complete Developer Journey for Building, Composing, and Deploying AI Agents** (Takuto, Jeff Hollan)
3. **Introducing new hosted agents in Foundry Agent Service: secure, scalable compute built for agents** (Takuto, Jeff Hollan, Lakshmi)

→ **Lecture** : Microsoft pousse toute son énergie produit sur l'infra agent (hosted compute, toolboxes, toolchain dev → prod). **Zéro mention de la vidéo** dans ces 3 posts. Cohérent avec la doctrine MAI observée depuis mars (image + voix + transcription, pas de vidéo MAI native).

### 🆕 Kimi K2.6 ajouté au catalogue Foundry (22/04)

- Post Community Hub 22/04 : **Kimi K2.6 (Moonshot AI)** disponible dans Foundry.
- Modèle MoE jusqu'à 1 T params, positionné **agentic + long-horizon reasoning + coding**. Pricing 0,95 USD/M input, 4 USD/M output.
- **Aucune capacité vidéo**. Signal de plus sur la direction produit Foundry = agents + reasoning.

### Aucune nouveauté vidéo — 6e jour consécutif

- **`learn.microsoft.com/azure/foundry/whats-new-foundry`** : `updated_at = 2026-04-17 22:08 UTC`. **Inchangé depuis le 17/04** (6 jours). Aucune mention vidéo ou Sora dans les articles listés pour avril.
- **Foundry Blog** : dernier post « What's new March 2026 » publié le 09/04. **Aucun post Foundry Blog mentionnant la vidéo depuis avril 2026 entier.**
- **Azure Blog** : pas de nouvelle annonce vidéo dans les 48h.

### État sora-2 sur Foundry — inchangé

- `sora-2` / `sora-2-pro` : **preview, access gated** (Enterprise MCA-E / EA / 1000+ CU, form d'application).
- Régions : **Sweden Central** et **East US 2** uniquement.
- Ancien `sora v2025-05-02` : deprecated 28/02/2026, ne peut plus être déployé.
- **Bug endpoint** `/openai/v1/video/generations/jobs` (HTTP 400 sur sora-2) : **toujours non résolu, maintenant 8+ jours** depuis la première documentation MS Q&A. Workaround inchangé : `/openai/v1/videos?api-version=preview` (types `seconds: string` et `size: string`).
- Toujours **aucun migration path automatisé** communiqué par MS pour les clients ex-`sora v2025-05-02`.

**Sources :**
- [Microsoft Foundry Blog — Introducing Toolboxes in Foundry (22/04)](https://devblogs.microsoft.com/foundry/)
- [Microsoft Foundry Blog — From Local to Production: Complete Developer Journey (22/04)](https://devblogs.microsoft.com/foundry/)
- [Microsoft Foundry Blog — Introducing new hosted agents in Foundry Agent Service (22/04)](https://devblogs.microsoft.com/foundry/)
- [MS Community Hub — Introducing Kimi K2.6 in Microsoft Foundry (22/04)](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/introducing-kimi-k2-6-in-microsoft-foundry/4513125)
- [Microsoft Learn — What's new in Microsoft Foundry (updated 17/04, unchanged 6j)](https://learn.microsoft.com/en-us/azure/foundry/whats-new-foundry)
- [Microsoft Learn — Sora 2 video generation overview (preview, unchanged)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [MS Q&A — Azure Video API rejects sora-2 deployments (catch-22, non-résolu)](https://learn.microsoft.com/en-au/answers/questions/5860394/azure-openai-video-api-rejects-all-sora-2-deployme)
- [MS Q&A — sora v2025-05-02 retiring, no successor](https://learn.microsoft.com/en-us/answers/questions/5790204/azure-openai-sora-(model-sora-v2025-05-02)-retirin)

---

## 🟢 Alternatives / concurrents

### Happy Horse 1.0 — statut inchangé vs 22/04

- **fal.ai/happyhorse** : landing page toujours « coming soon », API non live.
- Fenêtre « late April 2026 » toujours citée par Atlas Cloud, fal.ai, National Law Review.
- ⚠️ La date ferme du 30/04 **reste non re-confirmée** — pas de retour à « 30/04 ferme » aujourd'hui. Prudence sémantique : « courant fin avril » plutôt que « 30/04 exact ».
- Model weights, variante 8-step distilled, super-resolution module, inference code : **toujours pas uploadés publiquement**.
- Perfs inchangées : #1 T2V + #1 I2V sur Artificial Analysis Video Arena, 15 B params, audio joint, 1080p 5-8 s. Source révélée : **Alibaba Group** (confirmé 09/04).

→ **Plan d'action** : surveillance quotidienne de `fal.ai/happyhorse` continue. Prévoir un bench 3-5 prompts contre Veo 3.1 dès que l'API passe live, sans bascule prod avant pricing + TOS publics.

### Veo 4 — toujours pas de model card officielle DeepMind (8e jour de veille sans confirmation)

- `deepmind.google/models/veo/` : **aucun model card Veo 4 aujourd'hui**. Pages tierces (veo3ai.io, overchat.ai, aivid.video) parlent de « released April 2026 » mais **aucune source DeepMind officielle citée**.
- Prédictions analystes : vraie release Veo 4 attendue à **Google I/O 2026 (19-20 mai)**, cohérent avec le pattern Veo 1 (mai 2024) / Veo 2 (déc 2024) / Veo 3 (mai 2025).
- ⚠️ Certaines pages datées « avril 2026 » revendiquent Veo 4 released, mais après vérification : contenu spéculatif / SEO, **pas de reprise sur `deepmind.google` ni `blog.google`**.
- Posture inchangée : **ne pas baser un SLA sur Veo 4**. Rester sur **Veo 3.1** en prod.

### Marché concurrent — cartographie stable post-Sora shutdown

Aucune release majeure dans les 72h côté Runway, Kling, Pika, Luma :

- **Runway Gen-4 / Gen-4.5** : #1 Artificial Analysis T2V (1247 Elo). Pas d'update.
- **Kling 3.0** (release 05/02/2026) : 4K natif, storyboard per-shot, 6,99 USD/mois entry. **Leader price/feature**.
- **Veo 3.1** : en prod recommandée, disponible sur Gemini API / Vertex AI. **Veo 3.1 Lite** toujours « <50% coût de 3.1 Fast ».
- **Pika 2.5** : visual sharpness + camera motion, effets Pikaswaps / Pikatwists / Pikaffects.
- **Seedance 2.0 (ByteDance)** : toujours cité en alternative sérieuse.

→ **Pour le bot sur Azure** : **Veo 3.1 reste le plan B sain** jusqu'à la fin de la fenêtre de migration. Aucune raison de reconsidérer aujourd'hui.

**Sources :**
- [fal.ai — Happy Horse 1.0 landing (« coming soon », unchanged)](https://fal.ai/happyhorse-1.0)
- [fal.ai — HappyHorse-1.0 : What Do We Know So Far](https://fal.ai/learn/devs/happyhorse-1-0-what-do-we-know-so-far)
- [Atlas Cloud — HappyHorse-1.0 Takes First Place, API Coming Soon](https://www.atlascloud.ai/blog/guides/happyHorse-hits-1-api-coming-soon)
- [National Law Review — Happy Horse 1.0 rumored for fal late April 2026](https://natlawreview.com/press-releases/happy-horse-10-rumored-be-coming-fal-later-april-2026)
- [Google DeepMind — Veo (aucun model card Veo 4 officiel)](https://deepmind.google/models/veo/)
- [Google Developers Blog — Veo 3.1 Lite](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-lite/)
- [DigitalApplied — AI Video Market After Sora: Runway, Kling, Veo](https://www.digitalapplied.com/blog/ai-video-market-after-sora-runway-kling-veo-2026)

---

## 📌 Actions recommandées

| Priorité | Action | Délai |
|----------|--------|-------|
| 🔴 URGENT | **T-3 avant shutdown app Sora (26/04)** : final sweep qu'aucun workflow (export, monitoring, lien humain-in-the-loop) n'utilise encore l'app Sora. API Sora OpenAI direct reste live jusqu'au 24/09. **Exporter toute data restante via `sora.chatgpt.com/exports/me`** avant dimanche. | **48-72 h** |
| 🔴 URGENT | **Endpoint Azure OpenAI Video — bug non résolu après 8 j** : si le bot hit encore `/openai/v1/video/generations/jobs`, migrer vers `/openai/v1/videos?api-version=preview` (types `seconds: string`, `size: string`, status `completed`/`failed`). Sans ça, impossible de déployer sora-2. | **Cette semaine** |
| 🟡 MOYEN | **Happy Horse 1.0** : surveiller `fal.ai/happyhorse` quotidiennement jusqu'au 30/04. Dès que l'API passe « live », lancer un mini-bench 3-5 prompts repré. du bot contre Veo 3.1. Ne PAS bascule prod avant pricing + TOS publics. | **Fin avril** |
| 🟡 MOYEN | **Plan B Veo 4 → rester sur Veo 3.1** en prod. Attendre Google I/O (19-20/05) pour une potentielle annonce Veo 4 officielle DeepMind. Monter Veo 3.1 Lite comme option coût-optimisée dans la matrice de bench. | Hold + bench |
| 🟡 MOYEN | **Foundry catalog** : re-check ciblé `whats-new-foundry` le 24-25/04 (cycle refresh 7-10j — dernier refresh 17/04, prochain attendu 24-27/04) et le 26-27/04 (post-shutdown app Sora, MS pourrait saisir l'occasion pour un point doc). | T+1-4 j |
| 🟢 VEILLE | **OpenAI Privacy Filter** (22/04) : **candidat pour étage sanitisation amont** du bot vidéo si des inputs utilisateur contiennent PII (transcripts, noms). 1,5 B params local, Apache 2.0. | Veille active |
| 🟢 VEILLE | **OpenAI Workspace Agents** (22/04) : sans impact vidéo direct. Noter comme signal macro : OpenAI a tranché pour la 3e fois en 72h sur agents+image contre vidéo. | Veille passive |
| 🟢 VEILLE | **« Spud » (OpenAI video)** : ⚠️ toujours non confirmé, aucun mouvement aujourd'hui. Attendre confirmation officielle OpenAI. | Veille passive |
| 🟢 VEILLE | **Google I/O 2026 (19-20 mai)** : fenêtre probable pour une vraie annonce Veo 4 officielle. **Ajouter au calendrier de veille**. | T+26-27 j |

---

## 🔍 Rien de significatif aujourd'hui sur :

- Annonce d'un chemin de migration `sora v2025-05-02` → `sora-2` automatisé sur Azure : **toujours aucun path officiel** (inchangé depuis 5 rapports consécutifs, 9 j sans mouvement).
- Sortie d'un successeur vidéo officiel côté OpenAI : **aucune annonce**. Spud toujours rumeur.
- Happy Horse — API live : **toujours « coming soon »**.
- Veo 4 model card officielle : **toujours absente**. Vraie fenêtre attendue Google I/O (19-20/05).
- Runway / Pika / Luma / Kling : pas de release majeure dans les 72 h.
- GA sora-2 sur Azure : **inchangé**, toujours gated preview.
- Nouvelle doc MS Learn sur sora-2 : **inchangé**, `whats-new-foundry` figé 17/04.

---

## 📊 Évolution vs rapports précédents

| Signal | 20/04 | 21/04 | 22/04 | 23/04 |
|--------|-------|-------|-------|-------|
| sora-2 GA Azure | Gated preview | Gated preview | Gated preview | **Gated preview** (inchangé 6j) |
| Successeur Sora OpenAI | Rien | Rumeur « Spud » | Rumeur reprise médias | **Inchangé, pas de mouvement** |
| OpenAI launch week | — | gpt-image-2 | DeployCo + Codex enterprise | **Workspace Agents + Privacy Filter** |
| Focus Foundry Blog | Toolkit VS Code | Toolkit VS Code GA | MAI Efficient | **Toolboxes + Hosted Agents + Dev Journey** (22/04) |
| Veo 4 | Released tiers, pas de card | Pas de card | Pas de card | **Pas de card, 8j de veille sans source officielle** |
| Happy Horse API | Pas d'API | « 30/04 via fal.ai » | « late April 2026 » | **Inchangé, API toujours coming soon** |
| Bug endpoint Azure OpenAI Video | Documenté | Documenté | Documenté 7j | **Non résolu 8+ j** |
| Doc Foundry whats-new | Inchangé | Inchangé | Inchangé 5j | **Inchangé 6j** |
| Sora app shutdown | T-6 | T-5 | T-4 | **T-3** |

---

*Rapport généré automatiquement le 2026-04-23. Sources ≤ 7 jours (sauf rappels de contexte explicites). Workspace Agents + Privacy Filter confirmés par OpenAI et 9to5Mac / VentureBeat le 22/04. 3 posts Foundry Blog le 22/04 (Toolboxes, Hosted Agents, Dev Journey) confirmés via `devblogs.microsoft.com/foundry/`. Kimi K2.6 confirmé via Microsoft Community Hub le 22/04. Rumeur « Spud » toujours ⚠️ non confirmée — statut inchangé.*

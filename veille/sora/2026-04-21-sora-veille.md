# Veille Sora / Azure AI Foundry — 2026-04-21

> **T-5 jours avant la fermeture de l'app Sora (26 avril 2026).**
> Journée calme côté Foundry (aucune nouveauté vidéo depuis le 17/04). Côté OpenAI, April 20 a été dense mais sur des sujets non-vidéo (Codex, GPT-Image-2, outage). **Signal concret nouveau** : Happy Horse 1.0 confirme une API publique le **30 avril 2026** via fal.ai — premier concurrent Sora-2 avec une date ferme post-shutdown.

---

## 🔴 Nouveautés Sora-2 / OpenAI

### Pas de nouvelle annonce vidéo — mais une semaine OpenAI très dense sur d'autres sujets

Les 24-48 dernières heures chez OpenAI :

- **19-20/04** — **GPT-Image-2** (tentativement nommé) : rollout progressif à ChatGPT Plus/Pro signalé par les utilisateurs, significativement meilleur sur composition haute et cohérence narrative/personnage. Lecture pressée : **OpenAI pousse l'image, pas la vidéo**, cohérent avec le narratif « compute réorienté ».
- **20/04** — **Codex** reçoit une mise à jour large : marketplace installs depuis GitHub / git URLs / sources locales, history & memory TUI, expansion des APIs MCP et realtime, sandbox renforcée.
- **20/04** — **GPT-5.3 Instant Mini** en fallback sur ChatGPT Enterprise/EDU (plus naturel en chat, meilleur contexte).
- **20/04** — **Outage ChatGPT** (~90 min partial outage, ~10:05 ET). Sans impact documenté sur l'API Sora-2.
- Rumeur / mention : **« Project Spud »** évoqué par des médias tiers comme successeur interne à Sora côté OpenAI. ⚠️ **Non confirmé** — pas de post officiel OpenAI, pas de system card, pas de date.

→ **Rien de neuf côté vidéo OpenAI**. Le focus produit visible publiquement reste image + coding agents + enterprise.

### Rappel deadlines (inchangées)

- **26/04/2026 — T-5 JOURS** : shutdown de l'app Sora (web + mobile). Export utilisateur : `sora.chatgpt.com/exports/me`
- **24/09/2026** : discontinuation de l'API Sora (OpenAI direct)
- **Sora 2 / Sora 2 Pro** : endpoints `sora-2` et `sora-2-pro` live, 0,10 / 0,30 USD/s

**Sources :**
- [OpenAI Help — Sora discontinuation](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [Releasebot — OpenAI Release Notes April 2026](https://releasebot.io/updates/openai)
- [Codex changelog — OpenAI Developers](https://developers.openai.com/codex/changelog)
- [GuruFocus — OpenAI Targets Adobe (ADBE) with New Image Model](https://www.gurufocus.com/news/8803738/openai-targets-adobe-adbe-with-new-image-model)
- [AI Market Watch — OpenAI rolling out GPT-Image-2](https://www.ai-market-watch.com/news/openai-begins-rolling-out-new-gpt-image-2-model-to-chatgpt-users-42ne7s)
- [TechRadar — ChatGPT outage 20/04](https://www.techradar.com/news/live/chatgpt-down-april-2026)

---

## 🔵 Azure AI Foundry

### Pas de nouveauté vidéo depuis la mise à jour doc du 17/04

Vérification de la page `learn.microsoft.com/azure/foundry/whats-new-foundry` : **dernier `updated_at` = 2026-04-17 22:08 UTC** (identique au rapport du 20/04). Aucun changement entre le 17 et le 21.

La liste New/Updated articles reste orientée **agents + tools + RFT** :
- Task Adherence, Prompt Optimizer, Browser Automation, LangGraph, FLUX (image only), Fireworks preview
- Mise à jour `Azure OpenAI in Microsoft Foundry Models v1 REST API reference` (cohérent avec le bug endpoint doc du 15/04)

### Toujours pas de release sora-2 GA

État inchangé vs 20/04 :
- `sora-2` / `sora-2-pro` : **preview, access gated** (Enterprise MCA-E / EA / 1000+ CU, form d'application)
- Régions : **Sweden Central** et **East US 2** uniquement
- Modèle `sora` v2025-05-02 : deprecated depuis le 28/02/2026, ne peut plus être déployé
- Bug endpoint (HTTP 400 si tentative de déployer sora-2 sur `/openai/v1/video/generations/jobs`) : **toujours non résolu officiellement**. Workaround documenté : migrer vers `/openai/v1/videos?api-version=preview` avec types `seconds: string` et `size: string`.

### Blog Foundry calme ces 24h

Pas de nouveau post dev blog Foundry vidéo entre le 20 et le 21. Derniers posts pertinents restent :
- **14/04** : MAI-Image-2-Efficient (41% moins cher, +22% vitesse, 4× throughput/GPU H100) — **image uniquement**
- **02/04** : Family launch MAI-Transcribe-1 / MAI-Voice-1 / MAI-Image-2
- **16/04** : What's new in Foundry Fine-Tuning (RFT, GPT-4.1 graders)

→ **Microsoft continue de pousser sa stack MAI (image + voix + transcription)** sans produire d'alternative vidéo native. Pas de migration path automatisé sora v2025-05-02 → sora-2 annoncé. **Aucun changement dans la doctrine depuis 3 rapports consécutifs.**

**Sources :**
- [Microsoft Learn — What's new in Microsoft Foundry (updated 17/04)](https://learn.microsoft.com/en-us/azure/foundry/whats-new-foundry)
- [Microsoft Learn — Sora 2 video generation overview (preview)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Azure Blog — Sora 2 in Azure AI Foundry](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [MS Community Hub — MAI-Image-2-Efficient](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/introducing-mai-image-2-efficient-faster-more-efficient-image-generation/4510918)
- [Microsoft AI — MAI-Image-2-Efficient (41% lower cost)](https://microsoft.ai/news/mai-image-2-efficient/)

---

## 🟢 Alternatives / concurrents

### 🆕 Happy Horse 1.0 — API publique confirmée **30/04/2026** (fal.ai day-one)

Mise à jour importante par rapport au 20/04 où l'API était « inconnue / pas d'accès public » :

- **Date API publique : 30 avril 2026** (T+9 jours) — source : `happyhorse101.com` (update 15/04), landing page `fal.ai/happyhorse` live
- **fal.ai** confirmé comme l'un des premiers providers day-one pour entreprises/développeurs
- **Private beta en cours** au 15/04
- Pas de model card publique ni de pricing encore communiqué
- ⚠️ L'info d'API date vient d'un resource site indépendant non affilié — **pricing et SLAs inconnus, à revérifier après le 30/04**

Rappel des perfs (couvert au 20/04) : #1 text-to-video + #1 image-to-video Artificial Analysis, écart de 74 Elo sur Seedance 2.0 (record historique), 15 B params, audio joint en single forward pass.

→ **C'est le premier concurrent post-Sora avec une date d'API ferme qui tombe juste après le shutdown app Sora (26/04).** À intégrer dans la matrice de bench dès le 01/05.

### Veo 4 / Google — état inchangé depuis le 20/04

- Toujours pas de model card officielle DeepMind / post Google Developers Blog dédié Veo 4 au 21/04
- Accès : Google Flow, Gemini Ultra, Google AI Studio (API tier via VideoFX API)
- Pricing par seconde non publié
- Statut : **« released but not fully documented »** — même posture que hier

### Reste du marché : quasi silence radio

- **Kling 3.0** : reste référencé comme leader ELO général (1243) dans certains guides 2026, mais Happy Horse le dépasse sur les deux pistes (T2V / I2V) sur Artificial Analysis
- **Runway Gen-4.5** : toujours cité pour camera control / character consistency commerciale — pas de release dans les 72h
- **Pika 2.5 / Luma / Grok Imagine** : pas d'update significative
- **Seedance 2.0 (ByteDance)** : toujours monté comme alternative sérieuse Sora dans les guides post-14/04

**Sources :**
- [Happy Horse 1.0 — API Status, Benchmarks and Release Watch](https://happyhorse101.com/)
- [fal.ai — Happy Horse 1.0](https://fal.ai/happyhorse-1.0)
- [Bloomberg — Alibaba's Happy Horse AI Model Gives China the Video-Creation Crown](https://www.bloomberg.com/news/newsletters/2026-04-14/alibaba-s-happy-horse-ai-model-gives-china-the-video-creation-crown)
- [Google DeepMind — Veo](https://deepmind.google/models/veo/)
- [Veo 4 Release — Everything You Need to Know (avril 2026)](https://www.veo3ai.io/blog/veo-4-release-everything-you-need-to-know-2026)
- [BuildMVPFast — Best Text-to-Video AI Generators April 2026](https://www.buildmvpfast.com/articles/best-llms-2026-guide/video-generation-ai)

---

## 📌 Actions recommandées

| Priorité | Action | Délai |
|----------|--------|-------|
| 🔴 URGENT | **T-5 avant shutdown app Sora (26/04)** : dernier check qu'aucun workflow résiduel (export, monitoring, lien intégration humain-in-the-loop) n'utilise encore l'app Sora. API Sora OpenAI direct live jusqu'au 24/09. | **Cette semaine** |
| 🔴 URGENT | **Endpoint Azure OpenAI Video** : si le bot hit encore `/openai/v1/video/generations/jobs`, migrer vers `/openai/v1/videos?api-version=preview` (types `seconds: string`, `size: string`, status `completed`/`failed`). Sans ça, toute bascule sora-2 lèvera HTTP 400. **Rappel du 20/04, pas résolu côté MS.** | **Cette semaine** |
| 🟡 MOYEN | **Happy Horse 1.0 API — 30/04 day-one** : préparer un mini bench (3-5 prompts représentatifs du bot) pour comparer fal.ai/happyhorse vs Veo 3.1 sur le bot en A/B, dès que l'API ouvre. Vérifier pricing et TOS avant test. | T+9 jours |
| 🟡 MOYEN | **Plan B Veo 4** : toujours pas de model card DeepMind officielle → rester sur Veo 3.1 en production tant qu'il n'y a pas de doc stable. Ne pas baser un SLA sur Veo 4 tant que la page DeepMind n'a pas un carton officiel. | Hold |
| 🟡 MOYEN | **Foundry catalog** : re-check à chaque refresh de `whats-new-foundry`. Au prochain update (attendu ~24-25/04 d'après le cycle 7-10j observé), vérifier si un post sora-2 GA ou un auto-migration path tombe avec la fin du shutdown app. | Semaine prochaine |
| 🟢 VEILLE | **GPT-Image-2** : suivre si OpenAI documente un lien vidéo (image→vidéo chaîné). Probabilité faible sur 7j, mais narratif « image plutôt que vidéo » se confirme. | Veille passive |
| 🟢 VEILLE | **Project Spud (OpenAI video replacement)** : ⚠️ non confirmé. Chercher une confirmation officielle (blog / tweet officiel OpenAI). Ne pas baser de plan dessus. | Veille passive |

---

## 🔍 Rien de significatif aujourd'hui sur :

- Annonce Microsoft d'un chemin de migration sora v2025-05-02 → sora-2 automatisé : **toujours aucun path officiel** (inchangé depuis 3 rapports).
- Sortie d'un successeur Sora côté OpenAI : **aucune annonce officielle** (la mention « Project Spud » reste un signal tiers non confirmé).
- Runway / Pika / Luma / Kling : pas de release dans les 72h.
- Veo 4 model card officielle DeepMind : toujours absente.
- GA sora-2 sur Azure : **inchangé**, toujours gated preview.

---

## 📊 Évolution vs rapports précédents

| Signal | 17/04 | 20/04 | 21/04 |
|--------|-------|-------|-------|
| sora-2 GA Azure | Gated preview | Gated preview | **Gated preview** (inchangé) |
| Successeur Sora OpenAI | Rien | Rien | Rumeur « Spud » (⚠️ non confirmé) |
| Veo 4 | Teaser/rumeur | Released, pas de model card | Released, **toujours pas de model card** |
| Happy Horse API | Pas d'info | Pas d'API | **API publique confirmée 30/04 via fal.ai** |
| Bug endpoint Azure OpenAI | Documenté | Documenté | **Documenté, non résolu** |

---

*Rapport généré automatiquement le 2026-04-21. Sources datant de ≤ 7 jours sauf rappels de contexte explicites. Signal Happy Horse API marqué confirmé (source : happyhorse101.com + fal.ai landing). Signal « Project Spud » marqué ⚠️ non confirmé.*

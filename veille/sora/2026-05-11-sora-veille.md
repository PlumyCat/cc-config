# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-05-11

**Période couverte :** 2026-05-09 → 2026-05-11 (~48h, week-end inclus depuis dernier rapport).
**Fenêtre filtrage :** sources ≤ 7 jours, doublons par rapport au rapport 09/05 supprimés.
**Tonalité du jour :** **🟡 Lundi calme post-week-end — pas de rebondissement majeur, mais compteurs critiques avancent.** Statu quo sur tous les signaux critiques côté Foundry : retirement Sora-2 = **06/06/2026 (J-26)** sans extension MS, légacy `sora-2-2025-10-06` retirée **02/06 (J-22)**, gated preview Foundry **J+22** sans GA. Côté OpenAI : aucune communication 48h sur successeur vidéo — confirme que la stratégie "no recommended replacement" pour `/v1/videos` est **gelée et assumée**. Côté Google : I/O 2026 **T-8 jours**, accumulation de fuites (Omni, Gemini 4, **leak "Veo 3.2"** apparu sur SuperMaker AI). Côté Foundry whats-new : page toujours "April 2026" au 11/05 = **J+7 d'anomalie consécutive — nouveau record local**. Côté HappyHorse : **uplift Elo 1381 d'hier non confirmé sur Artificial Analysis officiel** (T2V toujours 1355, I2V 1397) — signal blog tiers à dégrader. Côté MS Foundry catalogue : drops May 1 (**DeepSeek V4 Flash + V4 Pro**) et May 8 (**GPT-Realtime-2 / Translate / Whisper**) confirmés — **aucun = vidéo**. App Sora **T+15 post-shutdown**, API Sora live **136 jours runway**.

---

## 🔴 Nouveautés Sora-2 / OpenAI

### App Sora — T+15 post-shutdown
- App shutdown effectif depuis **26/04/2026**. Aujourd'hui = **T+15**.
- **API Sora reste live jusqu'au 24/09/2026** (rappel **136 jours runway**) : `Videos API, sora-2, sora-2-pro, sora-2-2025-10-06, sora-2-2025-12-08, sora-2-pro-2025-10-06`.
- **Aucune communication OpenAI sur successeur vidéo** entre 09/05 et 11/05 sur le périmètre primaire (OpenAI News, Newsroom, Index, Deprecations, Changelog).
- **Pas de drop changelog `/v1/videos`** sur la fenêtre 48h.
- **OpenAI Deprecations page** : sora-2 family + Videos API → shutdown 24/09/2026, **no recommended replacement** (statut inchangé, reconfirmé 11/05). Position OpenAI : gelée, assumée comme stratégique.

### OpenAI focus produit — toujours hors-vidéo (48h)
- **Annonces récentes du périmètre** : nouveaux modèles voice realtime API (**GPT-Realtime-2**, **GPT-Realtime-Translate**, **GPT-Realtime-Whisper**), GPT-5.5 Instant rollout depuis 05/05, propagation Trusted Contact / ads ChatGPT / voice intelligence / ChatGPT Futures Class 2026.
- **Aucune annonce vidéo OpenAI** sur la fenêtre 48h. Pas de signal nouveau "Spud" ou autre codename successeur.
- **Confirme la trajectoire** : OpenAI pousse fort sur agents / voice / sécurité / monétisation, **pas sur vidéo**.

### "Spud" — toujours non confirmé
- Pas de clarification 09/05-11/05 sur l'attribution contradictoire (codename GPT-5.5 texte/agents vs alleged successeur vidéo). À traiter comme rumeur de bas niveau.

---

## 🔵 Azure AI Foundry

### 🚨 Retirement Sora-2 Foundry = 06/06/2026 (J-26) — INCHANGÉ
- **Aucune extension annoncée** par MS sur la fenêtre 09/05-11/05.
- **Date de retirement Foundry confirmée** : **06/06/2026 pour Sora-2 overall**, **02/06/2026 (J-22) pour version legacy `sora-2-2025-10-06`**.
- Position MS dans la doc retirement schedule : *"retirement dates are not extendable"* — pas de procédure standard pour décaler.
- **Pas d'évolution** sur le thread OpenAI Developer Community (#1380475) ni le thread MS Q&A (#5881436) sur 48h.
- **Implication critique inchangée et durcie** : aucun modèle alternatif first-party vidéo dans Foundry au 11/05. Si Sora-2 est retiré le 06/06 et qu'aucun remplaçant n'arrive avant, **vidéo génératives disparaît de Foundry**, pas juste une migration.

### Sora-2 — gated preview inchangée (J+22 sans GA)
- **Aucune annonce de GA** sora-2 sur Foundry entre 09/05 et 11/05. **Statut gated preview maintenu, 22 jours d'inertie continue**.
- `learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation` : doc inchangée, "preview in Global Standard regions (East US 2 and Sweden Central)".
- `ai.azure.com/catalog/models/sora-2` : page inchangée, gating MCA-E/EA + 1000+CU toujours en place.
- **Pricing inchangé** : Standard $0.10/s, Pro Global $0.30/s, Pro High-Res $0.50/s.

### Catch-22 endpoint — toujours pas de fix officiel MS
- Pas d'évolution 09/05-11/05. Workaround maintenu : `POST {endpoint}/openai/v1/videos?api-version=preview`.

### What's new Foundry — page TOUJOURS "April 2026" au 11/05 (J+7 anomalie consécutive — NOUVEAU RECORD LOCAL)
- **Page learn.microsoft.com/en-us/azure/foundry/whats-new-foundry** toujours intitulée "What's new for April 2026" au 11/05.
- **J+7 d'anomalie consécutive sans bascule mai** = **nouveau record sur la séquence courante** (vs J+5 hier). Au-delà de 7 jours, retard documentaire **majeur** confirmé et probablement structurel.
- Hypothèses inchangées : (a) volume annonces mai trop faible, (b) refonte du processus éditorial pré-Build 2026, (c) embargo pré-Build (peu probable).
- `devblogs.microsoft.com/foundry/category/whats-new/feed/` : pas de post 09/05-11/05 video-related.

### Drops Foundry catalogue récents — confirmés mais HORS-VIDÉO
- **01/05/2026** : **DeepSeek V4 Flash + DeepSeek V4 Pro** ajoutés à Foundry (low-latency + complex reasoning, multimodal). Hubsite365 + Releasebot confirment. **NON vidéo**.
- **08/05/2026** : **GPT-Realtime-2 / GPT-Realtime-Translate / GPT-Realtime-Whisper** ajoutés à Foundry (low-latency voice/transcription). **NON vidéo**.
- **Implication** : MS ajoute des modèles activement à Foundry, mais **aucun ne couvre le vide vidéo** ouvert par le retirement Sora-2.

### Pas de MAI-Video first-party
- **15 jours après la fin d'exclusivité OpenAI** : toujours aucun signal d'un MAI-Video first-party Microsoft.
- **MAI-Image-2** reste positionné comme texte-vers-image (lancé 19/03/2026). HyperFRAME Research mentionne *"video capabilities in development"* pour MAI-Image-2 mais **pas corroboré par doc officielle MS au 11/05**.
- **MAI-Image-2-Efficient** (14/04/2026) cité par SiliconANGLE comme étape de "move away from OpenAI" mais reste image-only.
- **La vidéo reste un blanc dans le périmètre MAI publique**.

### Microsoft Build 2026 (T-22 jours, 02-03/06 San Francisco)
- Pas de nouveauté 09/05-11/05 au-delà du startup playbook publié 05/05.
- Pillars confirmés : **AI production systems, agentic workflows, model-cost control**.
- Annonces attendues : **Maia 100 accelerator details + Tokenomics Dashboard** (cost analytics multi-models multi-régions).
- **Aucune mention vidéo explicite** ; probabilité GA sora-2 / annonce MAI-Video à Build = **modérée à basse**. **Calendrier critique** : Build tombe APRÈS retirement legacy 02/06 et AVANT retirement overall 06/06 — fenêtre étroite de 1 jour pour un sauvetage tardif.

### Foundry agents — rappel deadline migration 22/05 (J-11)
- Hosted agent migration deadline **22/05/2026** : J-11 aujourd'hui. Pas de news additionnelle 09/05-11/05.

### Microsoft Agent 365 — GA depuis 01/05/2026 (rappel J+10)
- Stable. Hors scope vidéo direct.

---

## 🟢 Alternatives / concurrents

### Google I/O 2026 — T-8 jours (keynote 19/05)
- **Date keynote confirmée** : 19/05/2026 à 13h ET / 10h PT, Mountain View + livestream YouTube.
- **Trois axes d'annonce attendus** sur la vidéo (rappel) :
  1. **Veo 4** (probable, basé sur précédent : Veo 1 à I/O 2024, Veo 3 à I/O 2025).
  2. **"Omni"** (leak UI Gemini "Powered by Omni") — modèle multimodal unifié image+vidéo.
  3. **Gemini 4** — model unifié avec génération image+vidéo intégrée native (rumeur).
- 🆕 **Leak "Veo 3.2"** apparu sur SuperMaker AI (article "Veo 3.2 Is Coming") — pourrait être **étape intermédiaire avant Veo 4** ou nom interne. ⚠️ **Non confirmé par DeepMind**.
- **Polymarket Veo 4 avant juin 2026** : ~69% inchangé.

### "Omni" Google — leak UI Gemini persistant (T-8 I/O)
- UI string toujours présente : *"Start with an idea or try a template. Powered by Omni."* — couvert par WaveSpeed, TestingCatalog, RoboRhythms.
- ⚠️ **Leak UI, non officielle**. Confirmation attendue à I/O 19-20/05.
- **Trois hypothèses** : (1) Omni = nouveau nom marketing pour Veo pathway ; (2) modèle Gemini-trained alongside Veo ; (3) Gemini omni-model unifié image+vidéo. Hypothèse (3) couplée aux rumeurs Gemini 4 = scenario stratégique le plus disruptif.

### Veo 3.1 / Veo 4 (Google DeepMind) — T-8 Google I/O 2026
- **Veo 4 toujours non officiellement annoncé**. Pas de model card sur `deepmind.google/models/veo/`. **Inchangé depuis 26+ jours**.
- **Veo 3.1 Lite** : production-ready actuelle pour le bot, **paid preview Gemini API + Google AI Studio + Vertex AI** (rolled out 31/03/2026). Pas encore GA toutes régions.
- **Veo 3 / Veo 3 Fast** : **GA confirmé** sur Vertex AI (rappel) — versions stables prod-ready.
- **Veo upscaling capability** (1080p / 4K) : toujours en private preview, "coming soon to public preview" sur Vertex AI. **Pas de bascule public preview détectée 09/05-11/05.**
- **Vertex AI release notes 09/05-11/05** : pas de drop spécifique vidéo. Note de migration toujours active : `veo-3.0-generate-001` → `veo-3.1-generate-001` avant **30/06/2026**.
- **Anticipations Veo 4 maintenues** (20-30s native, native storyboarding, 4K natif TPU-rendered, lightweight ID-embedding 3-5 ref images, camera commands, per-source audio layers).

### HappyHorse-1.0 — ⚠️ Uplift Elo 1381 d'hier NON CONFIRMÉ sur Arena officielle
- **Recheck Artificial Analysis 11/05** :
  - **T2V (no audio)** : HappyHorse-1.0 toujours **Elo 1355** (#1).
  - **I2V (no audio)** : HappyHorse-1.0 **Elo 1397** (#1, leadership renforcé).
  - **T2V avec audio** : Dreamina Seedance 2.0 720p = 1221 (#1), HappyHorse-1.0 = 1218 (#2).
- **Conclusion** : l'uplift à 1381 reporté par VidAU.ai blog hier **n'est pas répliqué sur le leaderboard officiel** à 48h. ⚠️ **Signal blog tiers à dégrader** — VidAU semble avoir confondu T2V (1355) et I2V (1397).
- **Pricing officiel Alibaba Cloud Bailian** maintenu : ¥0.9/s 720p, ¥1.6/s 1080p (HappyHorse-1.0-T2V).
- Multi-canalité opérationnelle confirmée : fal.ai + Alibaba Cloud Bailian + Pixazo API + APIYI + Replicate + AtlasCloud.
- 4 endpoints stables : `text-to-video`, `image-to-video`, `reference-to-video`, `video-edit`.

### Wan 2.7 (Alibaba Tongyi Lab) — rappel
- **Sorti 06/04/2026**, suite complète disponible sur Together AI depuis 03/04.
- **Architecture** : thinking mode (reasoning step avant génération), 4 capabilities (T2V 720p/1080p, I2V, reference-to-video, video edit).
- **Pricing** : **$0.10/s pour 720p** via API (compétitif vs Sora-2 Standard).
- **⚠️ Weights NOT publicly released** (contrairement à Wan 2.1). API-only.
- **Wan 3.0 pré-annoncé** : 60B params, 4K, 30s, Apache 2.0, mid-2026.

### Grok Imagine Video (xAI) — point de friction 1080p sur SuperGrok (rappel)
- **Grok Imagine #3 sur Image-to-Video avec audio** (Elo ~1087).
- **Limitation** : Grok Imagine Pro 1080p toujours pas livré sur SuperGrok, le tier consumer plafonne à **720p**.
- **Pas de news 09/05-11/05**.

### Runway / Kling / Pika / Seedance / Luma
- **Runway** : Gen-4.5 toujours en panel premium 1080p+. Plateforme intégrée Sora 2 Pro. Pas d'annonce 09/05-11/05. Elo Gen-4.5 = **1247** (Artificial Analysis early 2026).
- **Kling 3.0 Omni** (rappel 05/02/2026) : 4K natif stable, text-instructed edits sur clips 3-10s, native lip-synced audio. Pas d'annonce 09/05-11/05.
- **Pika 2.5** : stable, Pikaframes (start-image + end-image transition), Pikaswaps, Pikaffects. Pas de news 48h.
- **Seedance 2.0** : disponible Runway et fal.ai. **Toujours #1 T2V avec audio (Elo 1221)**. Stable.
- **Luma Dream Machine / Ray3** : aucun mouvement.

### Marché global — top leaderboard mai 2026 (rappel)
- **T2V (no audio)** : HappyHorse 1.0 #1 (Elo **1355** — pas 1381), Veo 3.1 family proche.
- **I2V (no audio)** : HappyHorse 1.0 #1 (**Elo 1397**), Seedance 2.0 et Veo dans top 3.
- **T2V avec audio** : Seedance 2.0 720p #1 (1221), HappyHorse #2 (1218).
- **I2V avec audio** : Seedance #1, HappyHorse #2 (1164), Grok Imagine #3 (1087), Veo 3.1 Fast #4 (1086), Veo 3.1 #5 (1081).
- **Implication** : marché mature et fragmenté ; sora-2 toujours absent des top leaderboards publics 2026.

---

## 📌 Actions recommandées

| Priorité | Action | Délai |
|----------|--------|-------|
| 🚨 CRITIQUE | **Migration Sora-2 → Veo 3.1 / HappyHorse à exécuter immédiatement.** Date retirement Foundry **06/06/2026 (J-26)** non extensible, version legacy retirée **02/06 (J-22)**. Build (02-03/06) tombe trop tard sur la version legacy ; aucun rescue MS attendu. | **Cette semaine** |
| 🚨 CRITIQUE | **Auditer le tenant bot** : confirmer notification de retirement 06/06 (ou 02/06 sur version legacy) dans le portail Azure AI Foundry. Si oui = signal opérationnel définitif. | **Aujourd'hui (lundi)** |
| 🔴 IMPORTANT | **Si bot vidéo s'appuie sur Foundry agents legacy** : auditer dépendance avant **22/05/2026** (J-11, deadline migration hosted agents). | Avant 22/05 |
| 🔴 IMPORTANT | **Audit endpoint bot** (rappel) : confirmer usage `/openai/v1/videos?api-version=preview`. Toujours pas de fix MS officiel pour le catch-22 au 11/05. | Cette semaine |
| 🔴 STRATÉGIQUE | **Préparer plan de bench Veo 4 + "Omni" + Gemini 4 + Veo 3.2** : Google I/O 2026 **J-8**. Lister 5 prompts de référence pour passage J+1 post-I/O. **Probabilité élevée d'au moins un drop vidéo Google majeur** (Veo 4 ou Omni unifié ou les deux). | Avant 19/05 |
| 🔴 STRATÉGIQUE | **Fenêtre Build MS (02-03/06)** : tomber **après** la date retirement 02/06 (legacy) et avant 06/06 (overall). **Maintenir hypothèse "no rescue from MS"**. | Avant 02/06 |
| 🟡 MOYEN | **Bench HappyHorse-1.0** : ⚠️ Uplift Elo 1381 d'hier **non confirmé** sur Arena officielle (T2V toujours 1355, I2V 1397). Bench sur les vrais chiffres. | Cette semaine |
| 🟡 MOYEN | **Évaluer Wan 2.7** comme alternative (T2V 720p à $0.10/s sur API Tongyi, thinking mode) — concurrent direct Sora-2 Standard sur pricing. ⚠️ API-only, weights closed. | Cette semaine |
| 🟡 MOYEN | **Vertex AI deprecations 30/06/2026** : si bot consomme `veo-3.0-generate-001`, migration vers `veo-3.1-generate-001` requise. | Avant fin mai |
| 🟡 MOYEN | **Recheck Foundry whats-new** : **J+7 d'anomalie consécutive** (page toujours "April 2026" au 11/05 — record local). Recheck quotidien — pourrait basculer brutalement. | Continu |
| 🟢 VEILLE | **Successeur vidéo OpenAI** : aucun signal nouveau 09/05-11/05. "Spud" toujours non confirmé. Stratégie "no recommended replacement" confirmée comme gelée. | Veille passive |
| 🟢 VEILLE | **MAI-Video first-party MS** : aucun signal au 11/05 (J+15 post-renégo). MAI-Image-2 "video capabilities in development" — non corroboré par doc officielle. | Veille passive |

---

## 🔍 Rien de significatif aujourd'hui sur :

- **GA sora-2 Azure** : toujours gated preview (J+22 inchangé).
- **Annonce successeur vidéo OpenAI** : confirmé absent sur sources primaires (Index, Newsroom, Deprecations, Changelog).
- **Veo 4 model card officielle DeepMind** : 26+ jours sans source primaire.
- **Runway / Pika / Luma / Kling / Seedance** : silence sur la fenêtre 48h.
- **MAI-Video first-party Microsoft** : toujours absent (J+15 post-renégo).
- **Devblogs Foundry** : pas de post 09/05-11/05 video-related.
- **Vertex AI release notes** : pas de drop vidéo 09/05-11/05.
- **OpenAI changelog `/v1/videos`** : pas de drop sur la fenêtre 48h.
- **Foundry whats-new page** : toujours "April 2026" au 11/05 (J+7 anomalie consécutive — record local).
- **HappyHorse-1.0** : pas de drop pricing/feature 48h, uplift Elo 1381 non confirmé.
- **OpenAI sur AWS Bedrock** : pas de mouvement vidéo.
- **Wan / Tongyi / Kling** : statu quo 48h.
- **Microsoft Build 2026** : pas de teaser vidéo, focus AI production / agentic / model-cost confirmé.

---

## 📊 Évolution vs rapports précédents

| Signal | 08/05 | 09/05 | **11/05 (lundi)** |
|--------|-------|-------|-----------|
| sora-2 GA Azure | Gated preview (19j) | Gated preview (20j) | **Gated preview (22j)** |
| Sora app status | T+12 | T+13 | **T+15 post-shutdown** |
| API Sora OpenAI | Live (139j runway) | Live (138j runway) | **Live (136j runway)** |
| Successeur vidéo OpenAI | "Spud" non confirmé | Vacuum + focus OpenAI hors-vidéo | **Vacuum confirmé (48h) + new realtime voice models 06-08/05 — toujours hors vidéo** |
| MS-OpenAI exclusivité | ENDED J+12 | ENDED J+13 | **ENDED J+15** |
| OpenAI sur AWS Bedrock | Inchangé (pas de vidéo) | Inchangé (pas de vidéo) | **Inchangé (pas de vidéo)** |
| Veo 4 | Pas de card 23+ j, T-11j I/O | Pas de card 24+ j, T-10j I/O | **Pas de card 26+ j, T-8j I/O** |
| HappyHorse 1.0 | Stable (T2V #1, Elo 1355) | ⚠️ Uplift Elo 1381 reporté blog tiers | **⚠️ Uplift NON confirmé Arena officielle — T2V 1355, I2V 1397** |
| Catch-22 endpoint Azure Video | Pas de fix MS officiel | Pas de fix MS officiel | **Toujours pas de fix MS officiel** |
| Doc Foundry whats-new | "April 2026" au 08/05 (J+4 anomalie) | "April 2026" au 09/05 (J+5 anomalie) | **"April 2026" au 11/05 (J+7 anomalie — NOUVEAU RECORD LOCAL)** |
| Catalogue Foundry | Stable | Stable (rien de neuf vidéo) | **DeepSeek V4 Flash+Pro (01/05) + GPT-Realtime-2/Translate/Whisper (08/05) — non vidéo** |
| Foundry agents | Stable (rappel J-14) | Stable (rappel J-13) | **Stable (rappel J-11)** |
| OpenAI hors vidéo | Workspace agents credit-based acté | Trusted Contact / ads / voice en propagation | **GPT-Realtime-2/Translate/Whisper API + GPT-5.5 Instant rollout (05/05)** |
| MS Build 2026 | Maia 100 + Tokenomics (T-25j) | Stable (T-24j) | **Stable (T-22j), pas de teaser vidéo** |
| Microsoft Agent 365 | 🆕 GA confirmé 01/05/2026 (J+7) | GA stable (J+8) | **GA stable (J+10)** |
| Top leaderboard T2V | Stable (HappyHorse #1, Elo 1355) | HappyHorse Elo 1381 reporté blog | **HappyHorse #1 confirmé Arena officielle : T2V 1355 / I2V 1397 — blog tiers erroné** |
| 🚨 Retirement sora-2 Foundry 06/06 | 🚨 CONFIRMÉ par OpenAI Dev Community + MS Q&A | 🚨 Inchangé J-28 (legacy J-24) | **🚨 Inchangé J-26 (legacy J-22) — pas d'extension MS annoncée** |
| 🆕 Google "Omni" video model | 🆕 ⚠️ Leak UI Gemini (T-11 I/O) | ⚠️ Leak persistant (T-10 I/O) | **⚠️ Leak persistant (T-8 I/O) — couvert WaveSpeed, TestingCatalog, RoboRhythms** |
| 🆕 Gemini 4 video integration | n/a | 🆕 Rumeur model unifié image+vidéo native I/O 2026 | **Rumeur persistante (T-8 I/O)** |
| 🆕 Leak "Veo 3.2" | n/a | n/a | **🆕 Article SuperMaker AI "Veo 3.2 Is Coming" — possible étape intermédiaire avant Veo 4 ⚠️ non confirmé** |

---

## Sources

### 🚨 Retirement Sora-2 Foundry (priorité absolue)
- [OpenAI Developer Community — Azure OpenAI is prematurely cutting off support for Sora 2 too early](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475)
- [Microsoft Q&A — Azure AI Foundry Sora 2 retirement date feels too early (06/06 vs 24/09)](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)
- [Microsoft Foundry — Foundry Models lifecycle and support policy](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)
- [Microsoft Foundry — Model retirement schedule](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirement-schedule)
- [Azure OpenAI Foundry Model Availability — Retirements](https://jinlee794.github.io/foundry-model-availability-notifications/retirements/)
- [Microsoft Foundry — Model deprecation and retirement for Foundry Models](https://learn.microsoft.com/en-us/azure/ai-foundry/concepts/model-lifecycle-retirement?view=foundry-classic)

### Sora app shutdown / OpenAI (T+15)
- [OpenAI Help Center — What to know about the Sora discontinuation](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [OpenAI Index — Sora 2 is here](https://openai.com/index/sora-2/)
- [OpenAI Deprecations — Videos API + sora-2 family shutdown 2026-09-24](https://developers.openai.com/api/docs/deprecations)
- [OpenAI Changelog](https://developers.openai.com/api/docs/changelog)
- [OpenAI News — Latest updates](https://openai.com/news/)
- [OpenAI Newsroom — Company announcements](https://openai.com/news/company-announcements/)
- [Sora 2 Model API doc](https://developers.openai.com/api/docs/models/sora-2)
- [Sora 2 System Card](https://openai.com/index/sora-2-system-card/)
- [OpenAI Help Center — Sora Release Notes](https://help.openai.com/en/articles/12593142-sora-release-notes)
- [Futurum Group — OpenAI Sora Discontinuation: What the End of a Platform Means for Enterprise AI](https://futurumgroup.com/insights/openai-sora-discontinuation-what-the-end-of-a-platform-means-for-enterprise-ai-strategy/)

### Sora-2 sur Azure AI Foundry (contexte)
- [Microsoft Foundry Docs — Sora 2 video generation overview (preview)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Microsoft Foundry Docs — What's New for April 2026 (titre HTML toujours "April 2026" au 11/05 — J+7 anomalie)](https://learn.microsoft.com/en-us/azure/foundry/whats-new-foundry)
- [Azure Blog — Sora 2 in Azure AI Foundry: Create videos with responsible AI](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [Azure AI catalog — OpenAI Sora-2](https://ai.azure.com/catalog/models/sora-2)
- [Microsoft Q&A — Azure OpenAI Video API rejects all sora-2 deployments (catch-22)](https://learn.microsoft.com/en-us/answers/questions/5860394/azure-openai-video-api-rejects-all-sora-2-deployme)
- [Microsoft Foundry classic — What's new in Azure OpenAI](https://learn.microsoft.com/en-us/azure/foundry-classic/openai/whats-new)
- [Foundry Models sold directly by Azure](https://learn.microsoft.com/en-us/azure/foundry/foundry-models/concepts/models-sold-directly-by-azure)

### Microsoft Build 2026, Foundry & catalogue (drops mai)
- [Hubsite365 — Azure Update 1st May 2026 (DeepSeek V4 Flash + Pro)](https://www.hubsite365.com/en-ww/crm-pages/azure-update-1st-may-2026.htm)
- [Hubsite365 — Azure Update 8th May 2026 (GPT-Realtime-2/Translate/Whisper)](https://www.hubsite365.com/en-ww/crm-pages/azure-update-8th-may-2026-a0cd0da1-3daf-402d-9a73-e61df7bdcda2.htm)
- [Windows News — Microsoft Build 2026: Startup Playbook (05/05/2026)](https://windowsnews.ai/article/microsoft-build-2026-the-startup-playbook-for-ai-production-systems-and-agentic-workflows.416585)
- [Microsoft Security Blog — Microsoft Agent 365 GA (01/05/2026)](https://www.microsoft.com/en-us/security/blog/2026/05/01/microsoft-agent-365-now-generally-available-expands-capabilities-and-integrations/)
- [Microsoft Build 2026 — Official site (02-03/06, San Francisco)](https://build.microsoft.com/en-US/home)
- [Microsoft Foundry Blog — Devblogs](https://devblogs.microsoft.com/foundry/)
- [Microsoft Foundry — March 2026 What's new](https://devblogs.microsoft.com/foundry/whats-new-in-microsoft-foundry-mar-2026/)
- [Microsoft Foundry — Feb 2026 What's new](https://devblogs.microsoft.com/foundry/whats-new-in-microsoft-foundry-feb-2026/)
- [Microsoft Learn — Migrate hosted agents (deadline 22/05)](https://learn.microsoft.com/en-us/azure/foundry/agents/how-to/migrate-hosted-agent-preview)

### MAI Microsoft (contexte vidéo first-party)
- [TechCrunch — Microsoft takes on AI rivals with three new foundational models (02/04/2026)](https://techcrunch.com/2026/04/02/microsoft-takes-on-ai-rivals-with-three-new-foundational-models/)
- [HyperFRAME Research — Microsoft Foundry Deepens Multimedia Stack: In-House MAI Models](https://hyperframeresearch.com/2026/04/09/microsoft-foundry-deepens-multimedia-stack-in-house-mai-models-aim-to-lower-the-cost-of-intelligence/)
- [SiliconANGLE — Microsoft's MAI-Image-2-Efficient accelerates move away from OpenAI (14/04/2026)](https://siliconangle.com/2026/04/14/microsofts-mai-image-2-efficient-model-accelerates-companys-move-away-openai/)
- [MAI-Image-2 Model Card (PDF, 18/03/2026)](https://microsoft.ai/pdf/MAI-Image-2-Model-Card.pdf)
- [VentureBeat — Microsoft launches 3 new AI models](https://venturebeat.com/technology/microsoft-launches-3-new-ai-models-in-direct-shot-at-openai-and-google)

### Google I/O 2026 — T-8 jours
- [Google I/O 2026 — Official site](https://io.google/2026/)
- [Beebom — Google I/O 2026 Dates Announced](https://gadgets.beebom.com/news/google-io-2026-dates-announced-gemini-and-next-gen-ai-to-lead-announcements)
- [Yahoo Tech — What to expect at Google I/O 2026: Android 17, AI](https://tech.yahoo.com/general/article/what-to-expect-at-google-io-2026-android-17-ai-announcements-and-more-131200028.html)
- [Android Authority — What to Expect from Google I/O 2026](https://www.androidauthority.com/what-to-expect-from-google-io-2026-3664979/)
- [PCWorld — Gemini may finally leap out of the chatbox at Google I/O](https://www.pcworld.com/article/3134059/gemini-may-finally-leap-out-of-the-chatbox-at-google-i-o.html)

### 🆕 Google "Omni" + Veo 3.2 leaks
- [WaveSpeed Blog — Google's Mysterious 'Omni' Video Model](https://wavespeed.ai/blog/posts/google-omni-video-model-leak-i-o-2026/)
- [TestingCatalog — Google is testing new Omni model for video generation ahead of I/O](https://www.testingcatalog.com/google-is-testing-new-omni-model-for-video-generation-ahead-of-i-o/)
- [RoboRhythms — Google Just Leaked Its Gemini Omni Video Tool Days Before I/O 2026](https://www.roborhythms.com/google-gemini-omni-leak-may-2026/)
- [🆕 SuperMaker AI — Veo 3.2 Is Coming: Google's Next AI Video Leap Leaked](https://supermaker.ai/blog/veo-32-is-coming-googles-next-ai-video-leap-leaked-and-what-it-could-mean/)
- [YouTube — GEMINI 4 + VEO 4: Google I/O 2026 (préview/leaks)](https://www.youtube.com/watch?v=AYiY-cmNSjk)

### Veo / DeepMind / Vertex AI
- [Google DeepMind — Veo models page](https://deepmind.google/models/veo/)
- [Google Developers Blog — Introducing Veo 3.1 in Gemini API](https://developers.googleblog.com/introducing-veo-3-1-and-new-creative-capabilities-in-the-gemini-api/)
- [Google Cloud Blog — Veo 3.1 Lite and Veo upscaling on Vertex AI](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)
- [Vertex AI — Generative AI release notes](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes)
- [Vertex AI — Veo 3.1 doc](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/models/veo/3-1-generate)
- [Vertex AI — Veo 3 doc](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/models/veo/3-0-generate)
- [Gemini API — Veo 3.1 Lite Preview](https://ai.google.dev/gemini-api/docs/models/veo-3.1-lite-generate-preview)
- [evolink.ai — Veo 4 Release Date 2026](https://evolink.ai/blog/veo-4-release-date-2026)
- [Polymarket — VEO 4 released by...?](https://polymarket.com/event/veo-4-released-by)
- [veo3ai.io — Veo 4 Release: Everything You Need to Know (April 2026)](https://www.veo3ai.io/blog/veo-4-release-everything-you-need-to-know-2026)
- [Imagine.art — Veo 4 Updates](https://www.imagine.art/blogs/google-veo-4-updates)

### HappyHorse / Wan 2.7 / Grok / Marché global
- [Artificial Analysis — Image to Video Leaderboard](https://artificialanalysis.ai/video/leaderboard/image-to-video)
- [Artificial Analysis — Text to Video Leaderboard](https://artificialanalysis.ai/video/leaderboard/text-to-video)
- [Artificial Analysis — happyhorse model family analysis](https://artificialanalysis.ai/video/model-families/happyhorse)
- [fal.ai — Happy Horse 1.0 #1 Ranked](https://fal.ai/happyhorse-1.0)
- [AtlasCloud — Happy Horse 1.0 API](https://www.atlascloud.ai/collections/happyhorse)
- [WaveSpeed — HappyHorse 1.0 Complete Guide](https://wavespeed.ai/blog/posts/what-is-happyhorse-1-0-ai-video-model/)
- [Tellers.ai — Wan 2.7 Has a Thinking Mode and Closed Weights (15/04/2026)](https://tellers.ai/blog/wan_2_7_thinking_mode_ai_video_generation_2026-04-15.mdx/)
- [Cliprise — Wan 2.7 Video Suite Is Here (Alibaba)](https://www.cliprise.app/news/wan-2-7-video-release)
- [Invideo — Wan 2.7 Complete Guide](https://invideo.io/blog/wan-2-7-complete-guide/)
- [FinancialContent — Alibaba Launches Wan 2.7 (06/04/2026)](https://markets.financialcontent.com/stocks/article/abnewswire-2026-4-6-alibaba-launches-wan-27-breakthrough-ai-image-and-video-generation-model-with-thinking-mode)
- [Pixflow — Best AI Video Generator in 2026](https://pixflow.net/blog/best-ai-video-generator/)
- [Grok Imagine API | xAI](https://x.ai/news/grok-imagine-api)
- [Soloa — Runway vs Kling vs Pika vs Luma Compared 2026](https://soloa.ai/blog/runway-vs-kling-vs-pika-vs-luma-ai-video-2026)

### Releases bots aggregators (cross-check)
- [Releasebot — OpenAI updates May 2026](https://releasebot.io/updates/openai)
- [Releasebot — ChatGPT updates May 2026](https://releasebot.io/updates/openai/chatgpt)
- [Releasebot — Google Vertex AI](https://releasebot.io/updates/google/vertex-ai)
- [Releasebot — Google Gemini May 2026](https://releasebot.io/updates/google/gemini)
- [llm-stats — AI Updates Today (May 2026)](https://llm-stats.com/llm-updates)

---

*Rapport généré automatiquement le 2026-05-11 (lundi). Sources ≤ 7 jours sauf rappels de contexte explicites. **Tonalité : lundi calme post-week-end — pas de rebondissement majeur 48h, mais compteurs critiques avancent.** Statu quo critique : retirement Sora-2 Foundry **toujours 06/06/2026 (J-26)** sans extension annoncée par MS, légacy `sora-2-2025-10-06` retirée 02/06 (J-22), gated preview Foundry inchangée (J+22), aucune alternative first-party Foundry (J+15 post-renégo MS-OpenAI). OpenAI : focus produit hors-vidéo confirmé sur 48h (GPT-Realtime-2/Translate/Whisper, GPT-5.5 Instant) — stratégie "no recommended replacement" pour `/v1/videos` désormais à considérer comme gelée. Google : I/O 2026 J-8, leak "Omni" persistant + rumeur Gemini 4 unifié image+vidéo + nouveau leak "Veo 3.2" (SuperMaker AI). ⚠️ Uplift HappyHorse-1.0 Elo 1381 d'hier **non confirmé** sur Arena officielle (vrais chiffres : T2V 1355, I2V 1397). Foundry whats-new toujours "April 2026" au 11/05 (J+7 anomalie consécutive — NOUVEAU RECORD LOCAL). Foundry catalogue drops mai (DeepSeek V4 Flash+Pro, GPT-Realtime-2/Translate/Whisper) = aucun vidéo. **Action critique inchangée : la migration Veo 3.1 / HappyHorse / Wan 2.7 doit être exécutée cette semaine ; Build 2026 (02-03/06) tombe trop tard.***

# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-05-11 (re-run 08h UTC)

**Période couverte :** 2026-05-11 07:13 → 08:01 UTC (~50 min depuis le rapport principal du matin).
**Fenêtre filtrage :** sources ≤ 7 jours, doublons par rapport au rapport `2026-05-11-sora-veille.md` (07:13) supprimés.
**Tonalité du jour :** **🟢 Re-run ultra-court — aucun signal nouveau sur la fenêtre 50 min.** Tous les compteurs critiques restent inchangés. Ce fichier est un *delta* du rapport principal du matin, à lire comme une simple vérification "rien n'a bougé en 1h". Conserver le rapport `2026-05-11-sora-veille.md` (07:13) comme document de référence du jour.

---

## 🔴 Nouveautés Sora-2 / OpenAI

**Pas de nouveauté significative sur la fenêtre 50 min.**

- App Sora : **T+15 post-shutdown** (inchangé).
- API Sora : **live jusqu'au 24/09/2026 (136 jours runway)** (inchangé).
- **Aucune communication OpenAI** entre 07:13 et 08:01 sur successeur vidéo / news vidéo.
- **OpenAI Deprecations page** : sora-2 family + Videos API → shutdown 24/09/2026, **"no recommended replacement"** (statut inchangé, reconfirmé 08:01).
- Focus produit OpenAI 7 derniers jours : voice (GPT-Realtime-2 / Translate / Whisper publiés 07/05), pas de vidéo.
- "Spud" : toujours non confirmé, rumeur basse priorité.

## 🔵 Azure AI Foundry

**Pas de nouveauté significative sur la fenêtre 50 min.**

- 🚨 **Retirement Sora-2 Foundry = 06/06/2026 (J-26)** — INCHANGÉ. Aucune extension MS communiquée.
- **Legacy `sora-2-2025-10-06` retirement = 02/06/2026 (J-22)** — INCHANGÉ.
- **Gated preview Foundry** : J+22 sans GA, pricing inchangé ($0.10/s standard, $0.30/s Pro Global, $0.50/s Pro High-Res).
- **Catch-22 endpoint** : workaround `POST {endpoint}/openai/v1/videos?api-version=preview` toujours nécessaire.
- 🆕 **Précision documentaire (vérifiée 08:01)** : la page `learn.microsoft.com/en-us/azure/foundry-classic/openai/whats-new` (Foundry **classic**) a bien une section **May 2026** (entrées GPT Realtime Translate + Whisper, `meta-updated_at: 2026-05-08T06:08:00Z`). C'est la page Foundry **nouveau portail** `whats-new-foundry` qui reste estampillée "April 2026" (anomalie J+7 maintenue, à reconfirmer dans la journée). Distinction utile à garder en tête : **la doc Foundry classic n'est PAS en retard documentaire**, seul le nouveau portail l'est.
- Aucun drop Foundry catalogue video-related entre 07:13 et 08:01.
- MAI-Video first-party : pas de signal nouveau 50 min. MAI-Image-2 toujours image-only au 11/05 selon doc officielle ; mention HyperFRAME *"video capabilities in development"* toujours non corroborée par MS.
- **Microsoft Build 2026** (T-22 jours, 02-03/06 SF) : pas de news 50 min. Aucune mention vidéo explicite dans le pré-Build communication. Fenêtre étroite confirmée : Build tombe **APRÈS retirement legacy 02/06** et **AVANT retirement overall 06/06**.

## 🟢 Alternatives / concurrents

**Pas de nouveauté significative sur la fenêtre 50 min.**

- **Google I/O 2026** : T-8 jours (keynote 19/05) — inchangé.
- **Veo 4** : toujours non officiellement annoncé (J+26 d'attente, Polymarket ~69% avant juin 2026 inchangé). Pas de model card sur `deepmind.google/models/veo/`.
- **"Omni" Google** : leak UI Gemini *"Powered by Omni"* persistant ⚠️ non confirmé.
- **"Veo 3.2"** : leak SuperMaker AI ⚠️ non confirmé par DeepMind, **aucun report mainstream entre 07:13 et 08:01**.
- **Veo 3.1 Lite** : paid preview Gemini API / AI Studio / Vertex AI (production-ready actuelle pour le bot).
- **Veo 3 / Fast** : GA Vertex AI confirmé (statut prod-ready).
- **HappyHorse / Wan 2.7 / Runway / Pika / Kling / Grok Imagine** : pas de news majeure 50 min.

---

## 📌 Actions recommandées (inchangées vs rapport 07:13)

1. **Critique** — Confirmer la migration **Veo 3.1 Lite (Vertex AI) ou HappyHorse / Wan 2.7** comme fallback prod **avant 06/06/2026**. Build 2026 (02-03/06) trop tardif pour s'y fier comme bouée de sauvetage : 1 jour de fenêtre entre Build et retirement.
2. **Suivre** — Page `whats-new-foundry` (nouveau portail) : J+7 d'anomalie consécutive sur "April 2026". Si bascule mai dans la journée → vérifier si video-related. Si J+8 demain → escalade journalistique légitime ; signal possible d'embargo pré-Build.
3. **Surveiller activement** — Google I/O 19-20/05 (T-8) : Veo 4 ou Omni ou Gemini 4 unifié. Toute confirmation Veo 4 modifie le calcul migration : Veo 3.1 Lite ↔ Veo 4 vs. autres options.
4. **Bas niveau** — Thread OpenAI Developer Community #1380475 et MS Q&A #5881436 : checker dans la journée pour toute réaction MS sur la deadline 06/06.
5. **Surveillance proactive** — Repos `microsoft.github.io/azure-docs` ou `azure-ai-docs` PRs : Foundry whats-new May 2026 (nouveau portail) probablement en attente de PR de MicrosoftDocs, surveiller l'ouverture.

---

## Sources

### Sora-2 / OpenAI (vérifiées 08:01 UTC)
- [Sora 2 is here | OpenAI](https://openai.com/index/sora-2/)
- [Sora — Release Notes (OpenAI Help)](https://help.openai.com/en/articles/12593142-sora-release-notes)
- [What to know about the Sora discontinuation | OpenAI Help](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [Deprecations | OpenAI API](https://developers.openai.com/api/docs/deprecations)
- [Changelog | OpenAI API](https://developers.openai.com/api/docs/changelog)
- [OpenAI News](https://openai.com/news/)
- [Releasebot — OpenAI updates May 2026](https://releasebot.io/updates/openai)

### Azure AI Foundry — Sora-2 retirement & docs (vérifiées 08:01 UTC)
- [Azure AI Foundry Sora 2 retirement date — MS Q&A #5881436](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)
- [Foundry Models lifecycle and support policy](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)
- [Model retirement schedule (Foundry)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirement-schedule)
- [AI Model Catalog — sora-2](https://ai.azure.com/catalog/models/sora-2)
- [Azure OpenAI prematurely cutting off Sora 2 — OpenAI Dev Community #1380475](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475)
- [What's new in Azure OpenAI Foundry **classic** (a May 2026 section)](https://learn.microsoft.com/en-us/azure/foundry-classic/openai/whats-new)
- [Sora 2 in Azure AI Foundry — Microsoft Azure Blog (déc. 2025)](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)

### MAI / Microsoft alternatives first-party (vérifiées 08:01 UTC)
- [Microsoft Foundry Deepens Multimedia Stack — HyperFRAME Research](https://hyperframeresearch.com/2026/04/09/microsoft-foundry-deepens-multimedia-stack-in-house-mai-models-aim-to-lower-the-cost-of-intelligence/)
- [Microsoft launches 3 new AI models — VentureBeat](https://venturebeat.com/technology/microsoft-launches-3-new-ai-models-in-direct-shot-at-openai-and-google)
- [MAI-Image-2 Model Card (Microsoft AI)](https://microsoft.ai/pdf/MAI-Image-2-Model-Card.pdf)

### Veo / Google DeepMind (vérifiées 08:01 UTC)
- [Veo — Google DeepMind](https://deepmind.google/models/veo/)
- [Veo 4 Release Date 2026 — Evolink](https://evolink.ai/blog/veo-4-release-date-2026)
- [Polymarket — VEO 4 released by?](https://polymarket.com/event/veo-4-released-by)
- [WaveSpeed — Google's Mysterious 'Omni' Video Model](https://wavespeed.ai/blog/posts/google-omni-video-model-leak-i-o-2026/)
- [TestingCatalog — Google testing Omni for video ahead of I/O](https://www.testingcatalog.com/google-is-testing-new-omni-model-for-video-generation-ahead-of-i-o/)
- [Introducing Veo 3.1 in Gemini API — Google Developers Blog](https://developers.googleblog.com/introducing-veo-3-1-and-new-creative-capabilities-in-the-gemini-api/)

---

*Rapport delta généré automatiquement le 2026-05-11 ~08:01 UTC (re-run ~50 min après le rapport principal du matin). **Conclusion : 50 min sans signal nouveau ; tous les compteurs critiques restent inchangés.** Le rapport principal `2026-05-11-sora-veille.md` (07:13) demeure le document de référence du jour. **Action critique inchangée** : la migration Veo 3.1 Lite / HappyHorse / Wan 2.7 doit être actée cette semaine ; Build 2026 (02-03/06) trop tardif pour servir de bouée de sauvetage.*

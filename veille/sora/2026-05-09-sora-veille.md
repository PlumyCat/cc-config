# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-05-09

**Période couverte :** 2026-05-08 → 2026-05-09 (24h depuis dernier rapport).
**Fenêtre filtrage :** sources ≤ 7 jours, doublons par rapport au rapport 08/05 supprimés.
**Tonalité du jour :** **🟡 Samedi calme — pas de rebondissement majeur 24h.** Statu quo sur les signaux critiques : retirement Sora-2 Foundry **toujours = 06/06/2026 (J-28)** sans annonce d'extension MS, légacy `sora-2-2025-10-06` retirée **02/06 (J-24)**, gated preview Foundry inchangée (**J+20**), aucune alternative first-party Foundry. Côté OpenAI : aucune communication 24h sur successeur vidéo, focus produit ailleurs (Trusted Contact, ads ChatGPT, voice intelligence, ChatGPT Futures Class of 2026 — tous **hors scope vidéo**). Côté Google : signaux "Omni" + "Gemini 4 + Veo 4" pour **I/O 2026 (T-10 jours)** continuent de s'accumuler dans les fuites/previews ; **HappyHorse 1.0 monterait à Elo 1381 (T2V Arena)** vs 1355 hier — uplift à confirmer. Foundry whats-new toujours "April 2026" au 09/05 — **J+5 d'anomalie consécutive** (record local). App Sora **T+13 post-shutdown**, API Sora live **138 jours runway**.

---

## 🔴 Nouveautés Sora-2 / OpenAI

### App Sora — T+13 post-shutdown
- App shutdown effectif depuis **26/04/2026**. Aujourd'hui = **T+13**.
- **API Sora reste live jusqu'au 24/09/2026** (rappel **138 jours runway**) : `Videos API, sora-2, sora-2-pro, sora-2-2025-10-06, sora-2-2025-12-08, sora-2-pro-2025-10-06`.
- **Aucune nouvelle communication OpenAI sur successeur vidéo** entre 08/05 et 09/05. Pivot équipe Sora vers core enterprise produits / agents reste durable.
- **Pas de drop changelog `/v1/videos`** sur la fenêtre 24h.
- **OpenAI Deprecations page** : sora-2 family + Videos API → shutdown 24/09/2026, **no recommended replacement** (statut inchangé, reconfirmé 09/05).

### OpenAI focus produit — toujours hors-vidéo
- **Annonces 07/05 toujours en propagation** : Trusted Contact in ChatGPT, ads ChatGPT en test, voice intelligence (nouveaux modèles audio API), ChatGPT Futures Class of 2026, Advanced Account Security.
- **Aucune annonce vidéo OpenAI** 24h. Pas de signal nouveau "Spud" ou autre codename successeur.
- **Confirme la trajectoire** : OpenAI pousse fort sur agents / voice / sécurité / monétisation, **pas sur vidéo**.

### "Spud" — toujours non confirmé
- Pas de clarification 08/05-09/05 sur l'attribution contradictoire (codename GPT-5.5 texte/agents vs alleged successeur vidéo). À traiter comme rumeur.

---

## 🔵 Azure AI Foundry

### 🚨 Retirement Sora-2 Foundry = 06/06/2026 (J-28) — INCHANGÉ
- **Aucune extension annoncée** par MS sur la fenêtre 08/05-09/05.
- **Date de retirement Foundry confirmée** : **06/06/2026 pour Sora-2 overall**, **02/06/2026 (J-24) pour version legacy `sora-2-2025-10-06`**.
- Position MS dans la doc retirement schedule : *"retirement dates are not extendable"* — pas de procédure standard pour décaler.
- **Pas d'évolution** sur le thread OpenAI Developer Community (#1380475) ni le thread MS Q&A (#5881436) sur 24h.
- **Implication critique inchangée** : aucun modèle alternatif first-party vidéo dans Foundry au 09/05. Si Sora-2 est retiré le 06/06 et qu'aucun remplaçant n'arrive avant, le bot est **coupé net** côté Azure.

### Sora-2 — gated preview inchangée (J+20 sans GA)
- **Aucune annonce de GA** sora-2 sur Foundry entre 08/05 et 09/05. **Statut gated preview maintenu, 20 jours d'inertie continue**.
- `learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation` : doc inchangée, "preview in Global Standard regions (East US 2 and Sweden Central)".
- `ai.azure.com/catalog/models/sora-2` : page inchangée, gating MCA-E/EA + 1000+CU toujours en place.
- **Pricing inchangé** : Standard $0.10/s, Pro Global $0.30/s, Pro High-Res $0.50/s.

### Catch-22 endpoint — toujours pas de fix officiel MS
- Pas d'évolution 08/05-09/05. Workaround maintenu : `POST {endpoint}/openai/v1/videos?api-version=preview`.

### What's new Foundry — page TOUJOURS "April 2026" au 09/05 (J+5 anomalie consécutive — record local)
- **Page learn.microsoft.com/en-us/azure/foundry/whats-new-foundry** toujours intitulée "What's new for April 2026" au 09/05.
- **J+5 d'anomalie consécutive sans bascule mai** = **record sur la séquence courante**. Le rythme de bascule habituel des "What's new" MS est mensuel à 1-3 jours du mois ; au-delà de J+5, retard documentaire **majeur** confirmé.
- Hypothèses inchangées : (a) volume annonces mai trop faible, (b) refonte du processus éditorial pré-Build 2026, (c) embargo pré-Build (peu probable).
- `devblogs.microsoft.com/foundry/category/whats-new/feed/` : pas de post 08/05-09/05 video-related.

### Pas de MAI-Video first-party
- **13 jours après la fin d'exclusivité OpenAI** : toujours aucun signal d'un MAI-Video first-party Microsoft.
- **MAI-Image-2 reste positionné comme texte-vers-image** (lancé 19/03/2026). Mention isolée de "video capabilities in development" non corroborée par doc officielle MS au 09/05.
- **La vidéo reste un blanc dans le périmètre MAI publique**.

### Microsoft Build 2026 (T-24 jours)
- Pas de nouveauté 08/05-09/05 au-delà du startup playbook publié 05/05.
- Pillars confirmés : **AI production systems, agentic workflows, model-cost control**.
- Annonces attendues : **Maia 100 accelerator details + Tokenomics Dashboard** (cost analytics multi-models multi-régions).
- **Aucune mention vidéo explicite** ; probabilité GA sora-2 / annonce MAI-Video à Build = **modérée à basse**.

### Foundry agents — rappel deadline migration 22/05 (J-13)
- Hosted agent migration deadline **22/05/2026** : J-13 aujourd'hui. Pas de news additionnelle 08/05-09/05.

### Microsoft Agent 365 — GA depuis 01/05/2026 (rappel J+8)
- Stable. Hors scope vidéo direct mais confirme l'orientation MS "agents-first" pour Build 2026.

---

## 🟢 Alternatives / concurrents

### Google I/O 2026 — T-10 jours (keynote 19/05)
- **Date keynote confirmée** : 19/05/2026 à 13h ET / 10h PT, Mountain View + livestream YouTube.
- **Trois axes d'annonce attendus** sur la vidéo :
  1. **Veo 4** (probable, basé sur précédent : Veo 1 à I/O 2024, Veo 3 à I/O 2025).
  2. **"Omni"** (leak UI Gemini "Powered by Omni") — modèle multimodal unifié image+vidéo.
  3. **Gemini 4** — model unifié avec génération image+vidéo intégrée native (rumeur).
- **Polymarket Veo 4 avant juin 2026** : ~69% inchangé.

### "Omni" Google — leak UI Gemini (rappel)
- Apparition d'une chaîne UI dans le Gemini video generation tab : *"Start with an idea or try a template. Powered by Omni."*
- ⚠️ **Leak UI, non officielle**. Confirmation attendue à I/O 19-20/05.
- **Implication bot** : si Omni = unification image+vidéo de qualité supérieure, alternative crédible à Sora-2 sur Vertex AI.

### Veo 3.1 / Veo 4 (Google DeepMind) — T-10 Google I/O 2026
- **Veo 4 toujours non officiellement annoncé**. Pas de model card sur `deepmind.google/models/veo/`. **Inchangé depuis 24+ jours**.
- **Veo 3.1 Lite** : production-ready actuelle pour le bot, **paid preview Gemini API + Google AI Studio** (rolled out 31/03/2026). Pas encore GA toutes régions Vertex AI.
- **Veo 3 / Veo 3 Fast** : **GA confirmé** sur Vertex AI (rappel) — versions stables prod-ready.
- **Veo 3.1 / Veo 3.1 Fast** : paid preview Gemini API, Google AI Studio, Vertex AI.
- **Veo upscaling capability** (1080p / 4K) : toujours en private preview, "coming soon to public preview" sur Vertex AI. **Pas de bascule public preview détectée 08/05-09/05.**
- **Vertex AI release notes 08/05-09/05** : pas de drop spécifique vidéo. Note de migration toujours active : `veo-3.0-generate-001` → `veo-3.1-generate-001` avant **30/06/2026**.
- **Anticipations Veo 4 maintenues** (20-30s native, native storyboarding, 4K natif TPU-rendered, lightweight ID-embedding 3-5 ref images, camera commands, per-source audio layers).

### HappyHorse-1.0 — ⚠️ uplift Elo signalé 1355 → 1381 (T2V)
- **Source** : VidAU.ai blog "HappyHorse 1.0: Is This the Best New AI Video Model Right Now" — **score Elo Arena reporté à 1381 sur Text-to-Video** vs **1355 hier** (Artificial Analysis).
- **Uplift de 26 points** = signal positif si confirmé sur le leaderboard officiel. ⚠️ **À vérifier directement sur artificialanalysis.ai** dans les prochaines heures (un blog tiers seul ne suffit pas).
- **Margin reportée** : 107 pts vs #2 (cohérent avec leadership renforcé), ~139 pts vs Kling 3.0 Pro, ~158 pts vs Runway Gen-4.5.
- **Pricing officiel Alibaba Cloud Bailian** maintenu : ¥0.9/s 720p, ¥1.6/s 1080p (HappyHorse-1.0-T2V).
- Multi-canalité opérationnelle : fal.ai + Alibaba Cloud Bailian + Pixazo API + APIYI.
- 4 endpoints stables : `text-to-video`, `image-to-video`, `reference-to-video`, `video-edit`.

### Grok Imagine Video (xAI) — point de friction 1080p sur SuperGrok (rappel)
- **Grok Imagine #3 sur Image-to-Video avec audio** (Elo ~1087).
- **Limitation détectée** : Grok Imagine Pro 1080p toujours pas livré sur SuperGrok, le tier consumer plafonne à **720p**.
- **Pas de news 08/05-09/05**.

### Wan 2.6 / Wan 2.7 (Alibaba Tongyi Lab)
- Pas de news 08/05-09/05. Statu quo : Wan 2.6 toujours top-3 leaderboard T2V, Wan 2.7 pas un alias HappyHorse.

### Runway / Kling / Pika / Seedance / Luma
- **Runway** : Gen-4.5 toujours en panel premium 1080p+. Plateforme intégrée Sora 2 Pro. Pas d'annonce 24h.
- **Kling 3.0** : 4K natif stable depuis 05/02/2026. Pas d'annonce.
- **Pika 2.5** : stable, pas de news 24h. Spécialité Pikaformance lip-sync.
- **Seedance 2.0** : disponible Runway et fal.ai. Stable.
- **Luma Dream Machine / Ray3** : aucun mouvement.

### Marché global — top leaderboard mai 2026 (rappel)
- **HappyHorse 1.0** : #1 T2V (Elo **1381 reporté** vs 1355 hier — à confirmer).
- **Image-to-Video avec audio** : Seedance #1, HappyHorse #2 (1164), Grok Imagine #3 (1087), Veo 3.1 Fast #4 (1086), Veo 3.1 #5 (1081).
- **Implication** : marché mature et fragmenté ; sora-2 toujours absent des top leaderboards publics 2026.

---

## 📌 Actions recommandées

| Priorité | Action | Délai |
|----------|--------|-------|
| 🚨 CRITIQUE | **Migration Sora-2 → Veo 3.1 / HappyHorse à exécuter cette semaine.** Date retirement Foundry **06/06/2026 (J-28)** non extensible, version legacy retirée **02/06 (J-24)**. Aucun rescue MS attendu (Build = 02-03/06, trop tard). | **Cette semaine** |
| 🚨 CRITIQUE | **Auditer le tenant bot** : confirmer notification de retirement 06/06 (ou 02/06 sur version legacy) dans le portail Azure AI Foundry. Si oui = signal opérationnel definitif. | **Aujourd'hui / lundi** |
| 🔴 IMPORTANT | **Si bot vidéo s'appuie sur Foundry agents legacy** : auditer dépendance avant **22/05/2026** (J-13, deadline migration hosted agents). | Avant 22/05 |
| 🔴 IMPORTANT | **Audit endpoint bot** (rappel) : confirmer usage `/openai/v1/videos?api-version=preview`. Toujours pas de fix MS officiel pour le catch-22 au 09/05. | Cette semaine |
| 🔴 STRATÉGIQUE | **Préparer plan de bench Veo 4 + "Omni" + Gemini 4** : Google I/O 2026 J-10. Lister 5 prompts de référence pour passage J+1 post-I/O sur tout ce qui sort. **Probabilité élevée d'au moins un drop vidéo Google** (Veo 4 ou Omni unifié ou les deux). | Avant 19/05 |
| 🔴 STRATÉGIQUE | **Fenêtre Build MS (02-03/06)** : tomber **après** la date retirement 02/06 (legacy) et avant 06/06 (overall). **Préparer hypothèse "no rescue from MS"**. | Avant 02/06 |
| 🟡 MOYEN | **Bench HappyHorse-1.0 + Grok Imagine Video** dans le panel comparatif. ⚠️ Vérifier l'uplift Elo 1381 sur artificialanalysis.ai avant de réajuster les recos. | Cette semaine |
| 🟡 MOYEN | **Vertex AI deprecations 30/06/2026** : si bot consomme `veo-3.0-generate-001`, migration vers `veo-3.1-generate-001` requise. | Avant fin mai |
| 🟡 MOYEN | **Recheck Foundry whats-new** : **J+5 d'anomalie consécutive** (page toujours "April 2026" au 09/05). Recheck quotidien — pourrait basculer brutalement avec annonce vidéo embarquée. | Continu |
| 🟢 VEILLE | **Successeur vidéo OpenAI** : aucun signal nouveau 08/05-09/05. "Spud" toujours non confirmé. | Veille passive |
| 🟢 VEILLE | **MAI-Video first-party MS** : aucun signal au 09/05 (J+13 post-renégo). | Veille passive |

---

## 🔍 Rien de significatif aujourd'hui sur :

- **GA sora-2 Azure** : toujours gated preview (J+20 inchangé).
- **Annonce successeur vidéo OpenAI** : confirmé absent sur sources primaires.
- **Veo 4 model card officielle DeepMind** : 24+ jours sans source primaire.
- **Runway / Pika / Luma / Kling / Seedance** : silence sur la fenêtre 24h.
- **MAI-Video first-party Microsoft** : toujours absent (J+13 post-renégo).
- **Devblogs Foundry** : pas de post 08/05-09/05 video-related.
- **Vertex AI release notes** : pas de drop vidéo 08/05-09/05.
- **OpenAI changelog `/v1/videos`** : pas de drop sur la fenêtre 24h.
- **Foundry whats-new page** : toujours "April 2026" au 09/05 (J+5 anomalie consécutive).
- **HappyHorse-1.0** : uplift Elo 1381 reporté côté blog tiers — pas de drop pricing/feature 24h.
- **OpenAI sur AWS Bedrock** : pas de mouvement vidéo.
- **Wan / Tongyi / Kling** : statu quo.

---

## 📊 Évolution vs rapports précédents

| Signal | 07/05 | 08/05 | **09/05** |
|--------|-------|-------|-----------|
| sora-2 GA Azure | Gated preview (18j) | Gated preview (19j) | **Gated preview (20j)** |
| Sora app status | T+11 | T+12 | **T+13 post-shutdown** |
| API Sora OpenAI | Live (140j runway) | Live (139j runway) | **Live (138j runway)** |
| Successeur vidéo OpenAI | ⚠️ rumeur "Spud" attribution contradictoire | "Spud" toujours non confirmé | **Vacuum + focus produit OpenAI hors-vidéo (Trusted Contact, ads, voice)** |
| MS-OpenAI exclusivité | ENDED J+11 | ENDED J+12 | **ENDED J+13** |
| OpenAI sur AWS Bedrock | Inchangé (pas de vidéo) | Inchangé (pas de vidéo) | **Inchangé (pas de vidéo)** |
| Veo 4 | Pas de card 22+ j, T-12j I/O | Pas de card 23+ j, T-11j I/O | **Pas de card 24+ j, T-10j I/O** |
| HappyHorse 1.0 | Stable (fin promo PixVerse 07/05) | Stable post-fin promo (T2V #1, I2V #2, Elo 1355) | **⚠️ Uplift Elo 1381 reporté côté VidAU (à confirmer Arena officielle)** |
| Catch-22 endpoint Azure Video | Pas de fix MS officiel | Pas de fix MS officiel | **Toujours pas de fix MS officiel** |
| Doc Foundry whats-new | "April 2026" au 07/05 (J+3 anomalie) | "April 2026" au 08/05 (J+4 anomalie) | **"April 2026" au 09/05 (J+5 anomalie consécutive — record local)** |
| Catalogue Foundry | Stable | Stable (rien de neuf vidéo) | **Stable (rien de neuf vidéo)** |
| Foundry agents | Stable (rappel J-15) | Stable (rappel J-14) | **Stable (rappel J-13)** |
| OpenAI hors vidéo | Workspace agents passent à credit-based pricing 06/05 | Workspace agents credit-based acté (J+2) | **Trusted Contact / ads ChatGPT / voice intelligence (07/05) en propagation** |
| MS Build 2026 | Startup guide 05/05 (T-26j) | Maia 100 + Tokenomics attendus (T-25j) | **Stable, pillars AI production / agentic / model-cost (T-24j)** |
| Microsoft Agent 365 | n/a | 🆕 GA confirmé depuis 01/05/2026 (J+7) | **GA stable (J+8)** |
| Top leaderboard T2V | Stable (HappyHorse #1 reporté Elo 1355) | HappyHorse 1.0 #1 (Elo 1355) - reconfirmé Artificial Analysis | **HappyHorse #1, Elo 1381 reporté blog tiers (⚠️ vs 1355 Arena officielle hier)** |
| 🚨 Retirement sora-2 Foundry 06/06 | ⚠️ Q&A MS signal non confirmé | 🚨 CONFIRMÉ par OpenAI Dev Community + MS Q&A (legacy 02/06) | **🚨 Inchangé J-28 (legacy J-24) — pas d'extension MS annoncée** |
| 🆕 Google "Omni" video model | n/a | 🆕 ⚠️ Leak UI Gemini (T-11 I/O) | **⚠️ Leak persistant (T-10 I/O) — couplé à rumeurs Gemini 4 unifié image+vidéo** |
| 🆕 Gemini 4 video integration | n/a | n/a | **🆕 Rumeur model unifié image+vidéo native pour I/O 2026 — possible coverage de "Omni"** |

---

## Sources

### 🚨 Retirement Sora-2 Foundry (priorité absolue)
- [OpenAI Developer Community — Azure OpenAI is prematurely cutting off support for Sora 2 too early](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475)
- [Microsoft Q&A — Azure AI Foundry Sora 2 retirement date feels too early (06/06 vs 24/09)](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)
- [Microsoft Foundry — Foundry Models lifecycle and support policy](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)
- [Azure OpenAI Foundry Model Availability — Retirements](https://jinlee794.github.io/foundry-model-availability-notifications/retirements/)

### Sora app shutdown / OpenAI (T+13)
- [OpenAI Help Center — What to know about the Sora discontinuation](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [OpenAI Index — Sora 2 is here](https://openai.com/index/sora-2/)
- [OpenAI Deprecations — Videos API + sora-2 family shutdown 2026-09-24](https://developers.openai.com/api/docs/deprecations)
- [OpenAI Changelog](https://developers.openai.com/api/docs/changelog)
- [OpenAI News — Latest updates](https://openai.com/news/)
- [OpenAI Newsroom — Company announcements](https://openai.com/news/company-announcements/)
- [Sora 2 Model API doc](https://developers.openai.com/api/docs/models/sora-2)
- [Sora 2 System Card](https://openai.com/index/sora-2-system-card/)
- [OpenAI Help Center — Sora Release Notes](https://help.openai.com/en/articles/12593142-sora-release-notes)

### Sora-2 sur Azure AI Foundry (contexte)
- [Microsoft Foundry Docs — Sora 2 video generation overview (preview)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Microsoft Foundry Docs — What's New for April 2026 (titre HTML toujours "April 2026" au 09/05)](https://learn.microsoft.com/en-us/azure/foundry/whats-new-foundry)
- [Azure Blog — Sora 2 in Azure AI Foundry: Create videos with responsible AI](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [Azure AI catalog — OpenAI Sora-2](https://ai.azure.com/catalog/models/sora-2)
- [Microsoft Q&A — Azure OpenAI Video API rejects all sora-2 deployments (catch-22)](https://learn.microsoft.com/en-us/answers/questions/5860394/azure-openai-video-api-rejects-all-sora-2-deployme)
- [Microsoft Foundry classic — What's new in Azure OpenAI](https://learn.microsoft.com/en-us/azure/foundry-classic/openai/whats-new)
- [Azure OpenAI Foundry Model Availability — Retirements](https://jinlee794.github.io/foundry-model-availability-notifications/retirements/)

### Microsoft Build 2026, Foundry & Agent 365
- [Windows News — Microsoft Build 2026: Startup Playbook (05/05/2026)](https://windowsnews.ai/article/microsoft-build-2026-the-startup-playbook-for-ai-production-systems-and-agentic-workflows.416585)
- [Microsoft Security Blog — Microsoft Agent 365 GA (01/05/2026)](https://www.microsoft.com/en-us/security/blog/2026/05/01/microsoft-agent-365-now-generally-available-expands-capabilities-and-integrations/)
- [Microsoft Build 2026 — Official site (02-03/06, San Francisco)](https://build.microsoft.com/en-US/home)
- [Microsoft Foundry Blog — Devblogs](https://devblogs.microsoft.com/foundry/)
- [Microsoft Foundry — March 2026 What's new](https://devblogs.microsoft.com/foundry/whats-new-in-microsoft-foundry-mar-2026/)
- [Microsoft Foundry — Feb 2026 What's new](https://devblogs.microsoft.com/foundry/whats-new-in-microsoft-foundry-feb-2026/)
- [Microsoft Learn — Migrate hosted agents (deadline 22/05)](https://learn.microsoft.com/en-us/azure/foundry/agents/how-to/migrate-hosted-agent-preview)
- [Windows News — Red Bull Basement / Azure AI Foundry partnership (08/05/2026)](https://windowsnews.ai/article/microsoft-and-red-bull-basement-azure-ai-tools-as-a-founder-first-infrastructure-stack.417174)

### Google I/O 2026 — T-10 jours
- [Google I/O 2026 — Official site](https://io.google/2026/)
- [Yahoo Tech — What to expect at Google I/O 2026: Android 17, AI](https://tech.yahoo.com/general/article/what-to-expect-at-google-io-2026-android-17-ai-announcements-and-more-131200028.html)
- [Android Authority — What to Expect from Google I/O 2026](https://www.androidauthority.com/what-to-expect-from-google-io-2026-3664979/)
- [9to5Google — Google previews I/O 2026 sessions](https://9to5google.com/2026/04/14/google-i-o-2026-sessions/)
- [PCWorld — Gemini may finally leap out of the chatbox at Google I/O](https://www.pcworld.com/article/3134059/gemini-may-finally-leap-out-of-the-chatbox-at-google-i-o.html)

### 🆕 Google "Omni" leak (rappel)
- [WaveSpeed Blog — Google's Mysterious 'Omni' Video Model](https://wavespeed.ai/blog/posts/google-omni-video-model-leak-i-o-2026/)
- [TestingCatalog — Google is testing new Omni model for video generation ahead of I/O](https://www.testingcatalog.com/google-is-testing-new-omni-model-for-video-generation-ahead-of-i-o/)
- [RoboRhythms — Google Just Leaked Its Gemini Omni Video Tool Days Before I/O 2026](https://www.roborhythms.com/google-gemini-omni-leak-may-2026/)

### Veo / DeepMind / Vertex AI
- [Google DeepMind — Veo models page](https://deepmind.google/models/veo/)
- [Google Developers Blog — Introducing Veo 3.1 in Gemini API](https://developers.googleblog.com/introducing-veo-3-1-and-new-creative-capabilities-in-the-gemini-api/)
- [Google Blog — Build with Veo 3.1 Lite, our most cost-effective video generation model](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-lite/)
- [Vertex AI — Generative AI release notes](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes)
- [Vertex AI — Veo 3.1 doc](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/models/veo/3-1-generate)
- [Gemini API — Veo 3.1 Lite Preview](https://ai.google.dev/gemini-api/docs/models/veo-3.1-lite-generate-preview)
- [evolink.ai — Veo 4 Release Date 2026](https://evolink.ai/blog/veo-4-release-date-2026)
- [Polymarket — VEO 4 released by...?](https://polymarket.com/event/veo-4-released-by)
- [NetNewsLedger — Veo 4: Everything We Know (08/05/2026)](https://www.netnewsledger.com/2026/05/08/veo-4-everything-we-know-about-googles-upcoming-ai-video-model/)

### HappyHorse-1.0 / Grok / Marché global
- [Artificial Analysis — Image to Video Leaderboard](https://artificialanalysis.ai/video/leaderboard/image-to-video)
- [Artificial Analysis — Text to Video Leaderboard](https://artificialanalysis.ai/video/leaderboard/text-to-video)
- [Artificial Analysis — happyhorse model family analysis](https://artificialanalysis.ai/video/model-families/happyhorse)
- [⚠️ VidAU — HappyHorse 1.0: Is This the Best New AI Video Model Right Now (Elo 1381 reporté, à confirmer)](https://www.vidau.ai/happyhorse-1-0-is-this-the-best-new-ai-video-model-right-now/)
- [WaveSpeed — HappyHorse 1.0 Complete Guide](https://wavespeed.ai/blog/posts/what-is-happyhorse-1-0-ai-video-model/)
- [Pixflow — Best AI Video Generator in 2026: Runway, Veo, Seedance, Kling & More](https://pixflow.net/blog/best-ai-video-generator/)
- [Grok Imagine API | xAI](https://x.ai/news/grok-imagine-api)

### Releases bots aggregators (cross-check)
- [Releasebot — OpenAI updates May 2026](https://releasebot.io/updates/openai)
- [Releasebot — ChatGPT updates May 2026](https://releasebot.io/updates/openai/chatgpt)
- [Releasebot — Google Vertex AI](https://releasebot.io/updates/google/vertex-ai)
- [Releasebot — Google Gemini May 2026](https://releasebot.io/updates/google/gemini)
- [llm-stats — AI Updates Today (May 2026)](https://llm-stats.com/llm-updates)

---

*Rapport généré automatiquement le 2026-05-09 (samedi). Sources ≤ 7 jours sauf rappels de contexte explicites. **Tonalité du jour : samedi calme, pas de rebondissement majeur 24h.** Statu quo critique : retirement Sora-2 Foundry **toujours 06/06/2026 (J-28)** sans extension annoncée par MS, légacy `sora-2-2025-10-06` retirée 02/06 (J-24), gated preview Foundry inchangée (J+20), aucune alternative first-party Foundry (J+13 post-renégo MS-OpenAI). OpenAI : focus produit hors-vidéo (Trusted Contact, ads ChatGPT, voice intelligence, ChatGPT Futures) — aucun signal successeur Sora. Google : I/O 2026 J-10, leak "Omni" persistant + rumeur Gemini 4 unifié image+vidéo. ⚠️ Uplift HappyHorse-1.0 Elo 1381 reporté côté blog tiers (vs 1355 Arena officielle hier) — à confirmer. Foundry whats-new toujours "April 2026" au 09/05 (J+5 anomalie consécutive — record local). **Action critique inchangée : déclencher la migration Veo 3.1 / HappyHorse cette semaine, ne pas attendre Build 2026 (02-03/06) qui tombe trop tard sur la version legacy.***

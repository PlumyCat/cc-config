# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-05-08

**Période couverte :** 2026-05-07 → 2026-05-08 (24h depuis dernier rapport).
**Fenêtre filtrage :** sources ≤ 7 jours, doublons par rapport au rapport 07/05 supprimés.
**Tonalité du jour :** **🚨 ALERTE CONFIRMÉE — la date de retirement Sora-2 sur Azure AI Foundry est désormais corroborée par DEUX sources** : (1) le Microsoft Q&A déjà cité hier, et (2) un nouveau thread sur le **OpenAI Developer Community** ("Azure OpenAI is prematurely cutting off support for Sora 2 too early"). **Date de retirement Foundry = 06/06/2026 pour Sora-2 (J-29)**, avec la version legacy `sora-2-2025-10-06` retirée dès **02/06/2026** (J-25). Le différentiel avec OpenAI (24/09/2026) est désormais explicitement reconnu — MS confirme que les dates de retirement sont **non extensibles** par procédure standard. **Aucune alternative vidéo first-party Foundry à ce jour.** Foundry whats-new toujours "April 2026" au 08/05 (J+8 du mois, **J+4 d'anomalie consécutive** — confirmé fetch direct). Côté Google : **🆕 fuite "Omni"** — un nouveau modèle vidéo Gemini en staging (chaîne UI "Powered by Omni" sur le Gemini video tab), Google I/O 2026 J-11. Côté OpenAI : aucune communication 24h sur successeur vidéo. Sora-2 toujours gated preview Foundry (**J+19**), API Sora live **139 jours runway**, App Sora **T+12 post-shutdown**.

---

## 🔴 Nouveautés Sora-2 / OpenAI

### App Sora — T+12 post-shutdown
- App shutdown effectif depuis **26/04/2026**. Aujourd'hui = **T+12**.
- **API Sora reste live jusqu'au 24/09/2026** (rappel **139 jours runway**) : `Videos API, sora-2, sora-2-pro, sora-2-2025-10-06, sora-2-2025-12-08, sora-2-pro-2025-10-06`.
- **Aucune nouvelle communication OpenAI sur successeur vidéo** entre 07/05 et 08/05. Pivot équipe Sora vers world-models/robotique reste durable.
- **Pas de drop changelog `/v1/videos`** sur la fenêtre 24h. Doc Sora API stable : reusable character refs, 20s max, sora-2-pro 1080p, `/v1/videos/edits` qui remplace `/remix`.
- **OpenAI Deprecations page** : sora-2 family + Videos API → shutdown 24/09/2026, **no recommended replacement** (statut inchangé, reconfirmé 08/05).

### Workspace agents — credit-based pricing acté hier (06/05/2026)
- Bascule effective depuis 06/05. Pas de nouveau signal 07/05-08/05.
- **Hors scope vidéo** mais confirme la trajectoire OpenAI "agents > vidéo" + monétisation enterprise accélérée.

### "Spud" — toujours non confirmé
- Pas de clarification 07/05-08/05 sur l'attribution contradictoire (codename GPT-5.5 texte/agents vs alleged successeur vidéo). À traiter comme rumeur.

---

## 🔵 Azure AI Foundry

### 🚨 CONFIRMÉ — Retirement Sora-2 Foundry = 06/06/2026 (J-29) — corroboration croisée
- **Nouveau thread primaire** sur OpenAI Developer Community : *"Azure OpenAI is prematurely cutting off support for Sora 2 too early"* (community.openai.com/t/.../1380475). Confirme la date **06/06/2026** côté Foundry overall (vs **24/09/2026** côté OpenAI).
- **Recoupement avec le MS Q&A** d'hier (learn.microsoft.com/en-in/answers/.../5881436) : même signal, même demande d'extension utilisateur.
- **Détail nouveau** : la version legacy **`sora-2-2025-10-06` est listée comme retirée le 02/06/2026 à 19:00 local** dans le portail Foundry (donc **J-25**). La date "globale" 06/06 cible la version dépréciée la plus tardive de la famille.
- **Position MS** explicitée dans la doc retirement schedule : *"retirement dates are not extendable"* — pas de procédure standard pour décaler.
- **Implication critique** : **aucun modèle alternatif first-party vidéo dans Foundry** au 08/05. Si Sora-2 est retiré le 06/06 et qu'aucun remplaçant n'arrive avant, le bot est **coupé net** côté Azure → migration Veo 3.1 (Vertex AI) ou HappyHorse (fal.ai / Bailian) **obligatoire avant fin mai**.
- **Note de scope** : la justification MS (différentiel "version-specific lifecycle" vs "overall model availability") est cohérente avec la politique Foundry standard, mais **ne résout pas le problème opérationnel** pour les bots qui consomment l'API.

### Sora-2 — gated preview inchangée (J+19 sans GA)
- **Aucune annonce de GA** sora-2 sur Foundry entre 07/05 et 08/05. **Statut gated preview maintenu, 19 jours d'inertie continue**. Combiné au signal retirement, **probabilité GA avant 06/06 = très faible**.
- `learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation` : doc inchangée, "preview in Global Standard regions (East US 2 and Sweden Central)".
- `ai.azure.com/catalog/models/sora-2` : page inchangée, gating MCA-E/EA + 1000+CU toujours en place.
- **Pricing inchangé** : Standard $0.10/s, Pro Global $0.30/s, Pro High-Res $0.50/s.

### Catch-22 endpoint — toujours pas de fix officiel MS
- Pas d'évolution 07/05-08/05. Workaround maintenu : `POST {endpoint}/openai/v1/videos?api-version=preview`.
- LiteLLM #16568 toujours actif.

### What's new Foundry — page TOUJOURS "April 2026" au 08/05 (J+4 anomalie consécutive)
- **Confirmé par fetch direct** sur `learn.microsoft.com/en-us/azure/foundry/whats-new-foundry` (HTTP 200, `<title>` HTML toujours "Microsoft Foundry docs: What's new for April 2026", meta description toujours "April 2026") au 08/05.
- **J+4 d'anomalie consécutive sans bascule mai**. Le rythme de bascule habituel des "What's new" MS est mensuel à 1-3 jours du mois ; au-delà de J+5, il s'agit d'un retard documentaire **majeur**.
- Hypothèses : (a) volume annonces mai trop faible/non encore prêt (cohérent avec rapports précédents), (b) refonte du processus éditorial MS pré-Build 2026, (c) signal interne "embargo" pré-Build (peu probable, le whats-new n'est pas product-driven).
- `devblogs.microsoft.com/foundry/category/whats-new/feed/` : feed actif mais pas de post vidéo-related entre 07/05 et 08/05.

### Microsoft Agent 365 — GA depuis 01/05/2026 (rappel)
- Microsoft Security Blog confirme **Agent 365 GA depuis 01/05/2026** (J+7) avec capacités étendues et intégrations.
- **Hors scope vidéo direct** mais confirme l'orientation MS "agents-first" pour Build 2026.

### Microsoft Build 2026 (T-25 jours)
- Pas de nouveauté 07/05-08/05 au-delà du startup playbook publié 05/05.
- Pillars confirmés : **AI production systems, agentic workflows, model-cost control**.
- Annonces attendues : **Maia 100 accelerator details + Tokenomics Dashboard** (cost analytics multi-models multi-régions).
- **Aucune mention vidéo explicite** ; probabilité GA sora-2 / annonce MAI-Video à Build = **modérée à basse**.

### Foundry agents — rappel deadline migration 22/05 (J-14)
- Hosted agent migration deadline **22/05/2026** : J-14 aujourd'hui. Pas de news additionnelle 07/05-08/05.

### Pas de MAI-Video first-party
- 12 jours après la fin d'exclusivité OpenAI : **toujours aucun signal** d'un MAI-Video first-party Microsoft. La vidéo reste un blanc dans le périmètre MAI publique.

---

## 🟢 Alternatives / concurrents

### 🆕 ⚠️ Google "Omni" — fuite UI Gemini ahead of I/O 2026 (J-11)
- **Apparition d'une chaîne UI dans le Gemini video generation tab** : *"Start with an idea or try a template. Powered by Omni."* (sources : WaveSpeed blog, TestingCatalog, Wes Roth sur X, threads.com).
- **Interprétations plausibles** : (1) nouveau nom public du pathway Veo, (2) modèle Gemini-trained additionnel à Veo, (3) **modèle multimodal unifié image+vidéo** (remplaçant ou complétant Nano Banana + Veo).
- **Codename interne précédent** : "Toucan" (lié à Gemini video tool).
- ⚠️ **Source : leak UI**, non officielle. Mais cohérente avec le pattern Google I/O.
- **Signal stratégique** : Google pousserait vers un **modèle multimodal unifié**, structurellement différent du Sora autonome OpenAI. Si confirmé à I/O (19-20/05), pourrait reconfigurer la tier list vidéo.
- **Implication bot** : si Omni = unification image+vidéo de qualité supérieure, alternative crédible à Sora-2 sur Vertex AI. **À benchmarker dès J+1 post-I/O**.

### Veo 3.1 / Veo 4 (Google DeepMind) — T-11 Google I/O 2026
- **Veo 4 toujours non officiellement annoncé**. Pas de model card sur `deepmind.google/models/veo/`. **Inchangé depuis 23+ jours**.
- **Google I/O 2026 = 19-20/05/2026** → **T-11 jours**. Polymarket : ~69% odds avant juin 2026.
- **Veo 3.1 Lite** : production-ready actuelle pour le bot, public preview Vertex AI. Toujours présent sur la doc Vertex AI.
- **Veo upscaling capability** (1080p / 4K) : toujours en private preview, "coming soon to public preview" sur Vertex AI. **Pas de bascule public preview détectée 07/05-08/05.**
- **Vertex AI release notes 07/05-08/05** : pas de drop spécifique vidéo. Note de migration toujours active : `veo-3.0-generate-001` → `veo-3.1-generate-001` avant **30/06/2026**.
- **Anticipations Veo 4 maintenues** (20-30s native, native storyboarding, 4K natif TPU-rendered, lightweight ID-embedding 3-5 ref images, camera commands, per-source audio layers).
- **Probabilité I/O 19-20/05** : Veo 4 OU Omni OU les deux comme bascule consumer.

### HappyHorse-1.0 — stable post-fin promo PixVerse
- Promotion gratuite PixVerse expirée hier 07/05 comme prévu. Pas de news majeure 24h.
- **Leaderboards confirmés Artificial Analysis** :
  - **Text-to-Video sans audio** : HappyHorse 1.0 **#1 (Elo 1355)**.
  - **Image-to-Video avec audio** : HappyHorse 1.0 **#2 (Elo 1164)**, devant Grok Imagine Video (1087), Veo 3.1 Fast (1086) et Veo 3.1 (1081).
- **Pricing officiel Alibaba Cloud Bailian** maintenu : ¥0.9/s 720p, ¥1.6/s 1080p (HappyHorse-1.0-T2V).
- Multi-canalité opérationnelle : fal.ai + Alibaba Cloud Bailian + Pixazo API + APIYI.
- 4 endpoints stables : `text-to-video`, `image-to-video`, `reference-to-video`, `video-edit`.
- **Pas de news 07/05-08/05** : stable.

### Grok Imagine Video (xAI) — point de friction 1080p sur SuperGrok
- **Grok Imagine #3 sur Image-to-Video avec audio** (Elo 1087, derrière HappyHorse et Seedance).
- **Limitation détectée** (BuildFastWithAI 04-05/05) : **Grok Imagine Pro 1080p toujours pas livré sur SuperGrok**, le tier consumer plafonne à **720p**. Engagement Musk fin avril dépassé sans nouveau timeline public.
- Génération typique : **17-30s par clip**, native audio sync. API live xAI + fal.ai.
- **Implication bot** : si requirement bot = ≥ 1080p sustained, **Veo 3.1 et Runway restent les options 1080p+** stables. Grok = option backup mais pas full-fat.

### Wan 2.6 / Wan 2.7 (Alibaba Tongyi Lab)
- Pas de news 07/05-08/05. Statu quo : Wan 2.6 toujours #3 leaderboard T2V, Wan 2.7 pas un alias HappyHorse (réfuté).

### Runway / Kling / Pika / Seedance / Luma
- **Runway** : Gen-4.5 toujours en panel premium 1080p+. Plateforme intégrée Sora 2 Pro. Pas d'annonce 24h.
- **Kling 3.0** : 4K natif stable depuis 05/02/2026. Pas d'annonce.
- **Pika 2.5** : stable, pas de news 24h.
- **Seedance 2.0** : disponible Runway et fal.ai. Toujours **#1 sur ranking vidéo+audio** Arena. Stable.
- **Luma Dream Machine / Ray3** : aucun mouvement.

### Marché global — top leaderboard mai 2026 (rappel)
- **HappyHorse 1.0** : #1 T2V sans audio (Elo 1355).
- **Image-to-Video avec audio** : Seedance #1, HappyHorse #2 (1164), Grok Imagine #3 (1087), Veo 3.1 Fast #4 (1086), Veo 3.1 #5 (1081).
- **Implication** : marché mature et fragmenté ; sora-2 absent des top leaderboards publics 2026.

---

## 📌 Actions recommandées

| Priorité | Action | Délai |
|----------|--------|-------|
| 🚨 CRITIQUE NOUVEAU | **Retirement Sora-2 Foundry CONFIRMÉ au 06/06/2026 (J-29)** par recoupement OpenAI Dev Community + MS Q&A. Version legacy `sora-2-2025-10-06` retirée **02/06/2026 (J-25)**. **Activer plan de contingence migration sans attendre** — option Veo 3.1 (Vertex AI, prod-ready) OU HappyHorse (fal.ai/Bailian, #1 T2V Arena). **Aucune alternative first-party Foundry**. | **Cette semaine** |
| 🚨 CRITIQUE | **Auditer le tenant bot** : confirmer que la notification de retirement 06/06 (ou 02/06 sur la version legacy) apparaît bien dans le portail Azure AI Foundry. Si oui = signal opérationnel definitif. | **Aujourd'hui** |
| 🔴 IMPORTANT | **Si bot vidéo s'appuie sur Foundry agents legacy** : auditer dépendance avant **22/05/2026** (J-14, deadline migration hosted agents). | Avant 22/05 |
| 🔴 IMPORTANT | **Audit endpoint bot** (rappel) : confirmer usage `/openai/v1/videos?api-version=preview`. Toujours pas de fix MS officiel pour le catch-22 au 08/05. | Aujourd'hui |
| 🔴 STRATÉGIQUE | **Préparer plan de bench Veo 4 + "Omni"** : Google I/O 2026 J-11. Lister 5 prompts de référence pour passage J+1 post-I/O sur tout ce qui sort. **Probabilité élevée d'au moins un drop vidéo Google** (Veo 4 ou Omni unifié). | Avant 19/05 |
| 🔴 STRATÉGIQUE | **Fenêtre Build MS (02-03/06)** : tomber **après** la date retirement 02/06 (legacy) et avant 06/06 (overall). Si MS annonce un MAI-Video ou GA sora-2 à Build, **timing extrêmement tendu** pour migration. **Préparer hypothèse "no rescue from MS"**. | Avant 02/06 |
| 🟡 MOYEN | **Bench HappyHorse-1.0 + Grok Imagine Video** dans le panel comparatif (T2V #1 et I2V #2/#3 respectivement). HappyHorse via fal.ai recommandé pour test rapide. | Cette semaine |
| 🟡 MOYEN | **Vertex AI deprecations 30/06/2026** : si bot consomme `veo-3.0-generate-001`, migration vers `veo-3.1-generate-001` requise. | Avant fin mai |
| 🟡 MOYEN | **Recheck Foundry whats-new** : **J+4 d'anomalie consécutive** (page toujours "April 2026" au 08/05). Recheck quotidien — pourrait basculer brutalement avec annonce vidéo embarquée. | Continu |
| 🟢 VEILLE | **Successeur vidéo OpenAI** : "Spud" toujours non confirmé, attribution texte/vidéo contradictoire. | Veille passive |
| 🟢 VEILLE | **MAI-Video first-party MS** : aucun signal au 08/05 (J+12 post-renégo). | Veille passive |

---

## 🔍 Rien de significatif aujourd'hui sur :

- **GA sora-2 Azure** : toujours gated preview (J+19 inchangé).
- **Annonce successeur vidéo OpenAI** : confirmé absent sur sources primaires.
- **Veo 4 model card officielle DeepMind** : 23+ jours sans source primaire.
- **Runway / Pika / Luma / Kling / Seedance** : silence sur la fenêtre 24h.
- **MAI-Video first-party Microsoft** : toujours absent (J+12 post-renégo).
- **Devblogs Foundry** : pas de post 07/05-08/05 video-related.
- **Vertex AI release notes** : pas de drop vidéo 07/05-08/05.
- **OpenAI changelog `/v1/videos`** : pas de drop sur la fenêtre 24h.
- **Foundry whats-new page** : toujours "April 2026" au 08/05 (J+4 anomalie consécutive — fetch confirmé).
- **HappyHorse-1.0** : pas de news 24h, stable post-fin promo PixVerse.
- **OpenAI sur AWS Bedrock** : pas de mouvement vidéo.
- **Wan / Tongyi / Kling** : statu quo.

---

## 📊 Évolution vs rapports précédents

| Signal | 06/05 | 07/05 | **08/05** |
|--------|-------|-------|-----------|
| sora-2 GA Azure | Gated preview (17j) | Gated preview (18j) | **Gated preview (19j)** |
| Sora app status | T+10 | T+11 | **T+12 post-shutdown** |
| API Sora OpenAI | Live (141j runway) | Live (140j runway) | **Live (139j runway)** |
| Successeur vidéo OpenAI | Vacuum + GPT-5.5 trajectory non-vidéo | Vacuum + ⚠️ rumeur "Spud" attribution contradictoire | **Vacuum + "Spud" toujours non confirmé** |
| MS-OpenAI exclusivité | ENDED J+10 | ENDED J+11 | **ENDED J+12** |
| OpenAI sur AWS Bedrock | Inchangé (pas de vidéo) | Inchangé (pas de vidéo) | **Inchangé (pas de vidéo)** |
| Veo 4 | Pas de card 21+ j, T-13j I/O | Pas de card 22+ j, T-12j I/O | **Pas de card 23+ j, T-11j I/O** |
| HappyHorse 1.0 | Stable | Stable (fin promo PixVerse 07/05) | **Stable post-fin promo (T2V #1, I2V #2)** |
| Catch-22 endpoint Azure Video | Pas de fix MS officiel | Pas de fix MS officiel | **Toujours pas de fix MS officiel** |
| Doc Foundry whats-new | "April 2026" au 06/05 (J+2 anomalie) | "April 2026" au 07/05 (J+3 anomalie) | **"April 2026" au 08/05 (J+4 anomalie consécutive — fetch direct)** |
| Catalogue Foundry | GPT-5.5 Instant comme `GPT-chat-latest` | Stable | **Stable (rien de neuf vidéo)** |
| Foundry agents | Stable (rappel J-16) | Stable (rappel J-15) | **Stable (rappel J-14)** |
| OpenAI hors vidéo | GPT-5.5 Instant default ChatGPT | Workspace agents passent à credit-based pricing 06/05 | **Workspace agents credit-based acté (J+2)** |
| MS Build 2026 | Confirmé 02-03/06 (T-27j) | Startup guide 05/05 (T-26j) | **Maia 100 + Tokenomics Dashboard attendus, no video signal (T-25j)** |
| Microsoft Agent 365 | n/a | n/a | **🆕 GA confirmé depuis 01/05/2026 (J+7)** |
| Top leaderboard T2V | Grok Imagine #1 (724) | Stable | **HappyHorse 1.0 #1 (Elo 1355) - reconfirmé Artificial Analysis** |
| 🚨 Retirement sora-2 Foundry 06/06 | n/a | ⚠️ Q&A MS signal non confirmé | **🚨 CONFIRMÉ par OpenAI Dev Community + MS Q&A — date 06/06/2026 (legacy 02/06)** |
| 🆕 Google "Omni" video model | n/a | n/a | **🆕 ⚠️ Leak UI Gemini ("Powered by Omni") — modèle multimodal unifié image+vidéo en staging, T-11 I/O** |

---

## Sources

### 🚨 Retirement Sora-2 Foundry confirmé (priorité absolue)
- [OpenAI Developer Community — Azure OpenAI is prematurely cutting off support for Sora 2 too early](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475)
- [Microsoft Q&A — Azure AI Foundry Sora 2 retirement date feels too early (06/06 vs 24/09)](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)
- [Microsoft Foundry — Model retirement schedule (politique non extensible)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirement-schedule)
- [Azure OpenAI Foundry Model Availability — Retirements](https://jinlee794.github.io/foundry-model-availability-notifications/retirements/)

### Sora app shutdown / OpenAI (T+12)
- [OpenAI Help Center — What to know about the Sora discontinuation](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [OpenAI Index — Sora 2 is here](https://openai.com/index/sora-2/)
- [OpenAI Deprecations — Videos API + sora-2 family shutdown 2026-09-24](https://developers.openai.com/api/docs/deprecations)
- [OpenAI Changelog](https://developers.openai.com/api/docs/changelog)
- [OpenAI News — Latest updates](https://openai.com/news/)
- [Sora 2 Model API doc](https://developers.openai.com/api/docs/models/sora-2)

### Sora-2 sur Azure AI Foundry (contexte)
- [Microsoft Foundry Docs — Sora 2 video generation overview (preview)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Microsoft Foundry Docs — What's New for April 2026 (titre HTML toujours "April 2026" au 08/05)](https://learn.microsoft.com/en-us/azure/foundry/whats-new-foundry)
- [Azure Blog — Sora 2 in Azure AI Foundry: Create videos with responsible AI](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [Azure AI catalog — OpenAI Sora-2](https://ai.azure.com/catalog/models/sora-2)
- [Microsoft Q&A — Azure OpenAI Video API rejects all sora-2 deployments (catch-22)](https://learn.microsoft.com/en-us/answers/questions/5860394/azure-openai-video-api-rejects-all-sora-2-deployme)

### Microsoft Build 2026 et Agent 365
- [Windows News — Microsoft Build 2026: Startup Playbook (05/05/2026)](https://windowsnews.ai/article/microsoft-build-2026-the-startup-playbook-for-ai-production-systems-and-agentic-workflows.416585)
- [Microsoft Security Blog — Microsoft Agent 365 GA (01/05/2026)](https://www.microsoft.com/en-us/security/blog/2026/05/01/microsoft-agent-365-now-generally-available-expands-capabilities-and-integrations/)
- [Microsoft Build 2026 — Official site (02-03/06, San Francisco)](https://build.microsoft.com/en-US/home)
- [Microsoft Foundry Blog — Devblogs](https://devblogs.microsoft.com/foundry/)
- [Microsoft Learn — Migrate hosted agents (deadline 22/05)](https://learn.microsoft.com/en-us/azure/foundry/agents/how-to/migrate-hosted-agent-preview)

### 🆕 Google "Omni" leak
- [WaveSpeed Blog — Google's Mysterious 'Omni' Video Model: What the Gemini UI Leak Tells Us Ahead of I/O 2026](https://wavespeed.ai/blog/posts/google-omni-video-model-leak-i-o-2026/)
- [TestingCatalog — Google is testing new Omni model for video generation ahead of I/O](https://www.testingcatalog.com/google-is-testing-new-omni-model-for-video-generation-ahead-of-i-o/)
- [RoboRhythms — Google Just Leaked Its Gemini Omni Video Tool Days Before I/O 2026](https://www.roborhythms.com/google-gemini-omni-leak-may-2026/)
- [⚠️ Wes Roth on X — Omni leak](https://x.com/WesRoth/status/2051180018697470401)
- [⚠️ TestingCatalog on X — Omni Gemini video tab leak](https://x.com/testingcatalog/status/2050705594458292496)

### Veo / DeepMind / Vertex AI / Google I/O 2026
- [Google DeepMind — Veo models page](https://deepmind.google/models/veo/)
- [Vertex AI — Generative AI release notes](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes)
- [Veo 3.1 — Vertex AI doc](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/models/veo/3-1-generate)
- [Google Cloud Blog — Veo 3.1 Lite and Veo upscaling](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)
- [Google I/O 2026 official site](https://io.google/2026/)
- [evolink.ai — Veo 4 Release Date 2026](https://evolink.ai/blog/veo-4-release-date-2026)
- [Polymarket — VEO 4 released by...?](https://polymarket.com/event/veo-4-released-by)

### HappyHorse-1.0 / Grok / Marché global
- [Artificial Analysis — Image to Video Leaderboard](https://artificialanalysis.ai/video/leaderboard/image-to-video)
- [Artificial Analysis — Text to Video Leaderboard](https://artificialanalysis.ai/video/leaderboard/text-to-video)
- [Artificial Analysis — happyhorse model family analysis](https://artificialanalysis.ai/video/model-families/happyhorse)
- [WaveSpeed — HappyHorse 1.0 Complete Guide](https://wavespeed.ai/blog/posts/what-is-happyhorse-1-0-ai-video-model/)
- [WaveSpeed — Grok Imagine Video vs Sora 2, Veo 3.1, Seedance, WAN, Vidu Q3 Comparison 2026](https://wavespeed.ai/blog/posts/grok-imagine-video-vs-sora-2-veo-3-seedance-wan-vidu-comparison-2026/)
- [BuildFastWithAI — SuperGrok Video & Image Generation 2026](https://www.buildfastwithai.com/blogs/supergrok-video-image-generation-2026-speed-pricing-math-comparison)
- [Grok Imagine API | xAI](https://x.ai/news/grok-imagine-api)

### "Spud" — toujours non confirmé
- [⚠️ ai.cc — OpenAI Sora Shutdown 2026 (Spud comme successeur vidéo, non confirmé)](https://www.ai.cc/blogs/openai-sora-shutdown-best-ai-video-generation-api-alternatives-2026-migration-guide/)

---

*Rapport généré automatiquement le 2026-05-08 (vendredi). Sources ≤ 7 jours sauf rappels de contexte explicites. **Tonalité critique** : retirement Sora-2 Foundry **CONFIRMÉ** au 06/06/2026 par recoupement OpenAI Dev Community + MS Q&A (legacy `sora-2-2025-10-06` retirée 02/06). Microsoft confirme dates non extensibles. **Aucune alternative first-party Foundry** au 08/05. Sora-2 toujours gated preview (J+19), pas de GA en vue avant retirement → **migration Veo 3.1 ou HappyHorse obligatoire avant fin mai**. Foundry whats-new toujours "April 2026" au 08/05 (J+4 anomalie). Côté Google : 🆕 leak UI "Omni" sur Gemini video tab, T-11 I/O — modèle multimodal unifié image+vidéo en staging probable. Côté OpenAI : aucune communication 24h sur successeur vidéo. App Sora T+12, API runway 139 jours. **Action critique : déclencher la migration Veo 3.1 / HappyHorse cette semaine, ne pas attendre Build 2026 (02-03/06) qui tombe trop tard sur la version legacy.***

# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-05-06

**Période couverte :** 2026-05-05 → 2026-05-06 (24h depuis dernier rapport).
**Fenêtre filtrage :** sources ≤ 7 jours, doublons par rapport au rapport 05/05 supprimés.
**Tonalité du jour :** **journée calme côté vidéo** — aucune nouveauté Sora-2 ni Foundry vidéo en 24h. Statu quo strict : Sora-2 Foundry **toujours gated preview (J+17)**, page whats-new Foundry **toujours "April 2026"** au 06/05 (J+6 du mois, anomalie persistante). Côté OpenAI : **GPT-5.5 Instant rolled out comme nouveau ChatGPT default** le 05/05 (TechCrunch), arrivée concomitante en Foundry comme `GPT-chat-latest` — **hors scope vidéo**. Côté Veo 4 : **T-13 jours** de Google I/O 2026 (19-20/05), toujours aucune model card. **Microsoft Build 2026 confirmé 02-03/06** (T-27 jours) — fenêtre potentielle d'annonce vidéo MS post-I/O. HappyHorse-1.0 stable. **Pas de signal d'accélération sur la stratégie vidéo du bot — statut quo intégral.**

---

## 🔴 Nouveautés Sora-2 / OpenAI

### App Sora — T+10 post-shutdown
- App shutdown effectif depuis **26/04/2026**. Aujourd'hui = **T+10**.
- **API Sora reste live jusqu'au 24/09/2026** (rappel 141 jours runway) : `Videos API, sora-2, sora-2-pro, sora-2-2025-10-06, sora-2-2025-12-08, sora-2-pro-2025-10-06`.
- **Aucune nouvelle communication OpenAI sur successeur vidéo** entre 05/05 et 06/05. Pivot équipe Sora vers world-models robotique reste durable.
- **Pas de drop changelog `/v1/videos`** sur la fenêtre 24h. Doc Sora API stable : reusable character refs, 20s max, sora-2-pro 1080p $0.70/s, `/v1/videos/edits` qui remplace `/remix`.
- **OpenAI Deprecations page** : sora-2 family + Videos API → shutdown 24/09/2026, **no recommended replacement** (statut inchangé, reconfirmé sur la fenêtre).

### 🆕 OpenAI — GPT-5.5 Instant rollout (05/05/2026, hors scope vidéo)
- **GPT-5.5 Instant** annoncé par OpenAI le 05/05 et rolled out en ChatGPT comme **nouveau modèle par défaut**, remplaçant GPT-5.3 Instant (TechCrunch 05/05/2026).
- **Fast answers** déployé en parallèle (ChatGPT) : réponses rapides sur questions information-seeking à haute confiance.
- GPT-5.5 (release initiale 23/04) reste positionné "smartest and most intuitive model" : agentic coding, tool use, persistance multi-step renforcée.
- **Hors scope vidéo intégral** : aucune capacité vidéo annoncée dans GPT-5.5/Instant. Confirme la position d'OpenAI selon laquelle "le futur n'est pas la vidéo grand public mais les agents pour entreprises" (Spud / GPT-5.5 codename, citation analyste Pasquale Pillitteri).
- **Pas d'impact bot vidéo** mais signal continu : OpenAI investit hors-vidéo, le vacuum vidéo s'élargit.

### OpenAI deprecations — page inchangée
- Statut deprecations Videos API + sora-2 family inchangé : **shutdown 24/09/2026, no recommended replacement**.
- Listes alternatives recommandées par tiers (apiyi, kaopiz, digen.ai, cyberlink) convergent sur **Veo 3, Seedance 2.0, Luma Dream Machine, Runway Gen-4.5, Kling 3.0**. Aucune ne mentionne un futur successeur OpenAI.

---

## 🔵 Azure AI Foundry

### Sora-2 — gated preview inchangée (J+17 sans GA)
- **Aucune annonce de GA** sora-2 sur Foundry entre 05/05 et 06/05. **Statut gated preview maintenu, 17 jours d'inertie continue**.
- `learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation` : doc inchangée, marquée "preview in Global Standard regions (East US 2 and Sweden Central)".
- `ai.azure.com/catalog/models/sora-2` : page inchangée, gating MCA-E/EA + 1000+CU toujours en place.
- **Pricing inchangé** : Standard $0.10/s, Pro Global $0.30/s, Pro High-Res $0.50/s.
- Aucun mouvement post-renégociation Microsoft-OpenAI : la renégo continue à n'avoir **aucun impact** sur la sortie de gated preview pour sora-2.

### 🆕 GPT-5.5 Instant en Foundry (05/05) — hors vidéo
- **OpenAI GPT-5.5 Instant arrivé en Microsoft Foundry comme `GPT-chat-latest`** le 05/05/2026 (Microsoft Community Hub : "Introducing OpenAI's newest chat model in Microsoft Foundry").
- **Hors scope vidéo** mais signal de cadence rapide LLM Foundry : Microsoft maintient la parité OpenAI sur le chat alors que sora-2 reste bloqué en gated preview depuis 17 jours. **Asymétrie persistante chat vs vidéo dans Foundry.**

### Catch-22 endpoint — toujours pas de fix officiel MS
- Issue MS Q&A "Azure OpenAI Video API rejects all sora-2 deployments — gateway validates for deprecated sora model name" : **pas de fix officiel MS visible** au 06/05.
- **Workaround officiel maintenu** : `POST {endpoint}/openai/v1/videos?api-version=preview` (et non l'ancien `/openai/deployments/{name}/video/generations/jobs`).
- Bug LiteLLM (#16568) toujours référencé : Sora 2 Model Authentication Error sur Azure. À monitorer pour le wrapper bot.
- **Bug retirement collatéral** : Q&A "Azure OpenAI Sora (model sora v2025-05-02) retiring Feb 28, 2026 — no successor available (Sora 2 not visible) + video content download endpoint returns 404" toujours actif. Confirme que la migration sora v1 → sora-2 reste douloureuse pour les enterprises non-gated.

### What's new Foundry — page TOUJOURS "April 2026" au 06/05 (J+6 du mois)
- `learn.microsoft.com/en-us/azure/foundry/whats-new-foundry` : page **toujours intitulée "Microsoft Foundry docs: What's new for April 2026"** au 06/05 (titre HTML confirmé par fetch direct). **Pas de bascule mai détectée à J+6 du mois.** **Anomalie persistante depuis J+5 : 2 jours consécutifs en mai sans bascule.**
- `devblogs.microsoft.com/foundry/category/whats-new/feed/` : feed actif mais pas de post vidéo-related entre 05/05 et 06/05.

### 🆕 Microsoft Build 2026 confirmé 02-03/06 — fenêtre potentielle vidéo
- **Microsoft Build 2026** confirmé officiellement **02-03/06/2026** à San Francisco (Fort Mason Center) — keynote Satya Nadella.
- **T-27 jours**. **Fenêtre potentielle d'annonce vidéo MS** post-I/O 2026 (19-20/05) : si Google annonce Veo 4, MS pourrait répondre avec sora-2 GA et/ou MAI-Video lors de Build.
- Sessions Foundry confirmées : MCP, Foundry Agent Service, Foundry IQ, Foundry Labs. **Aucune session vidéo identifiée explicitement** dans le catalogue actuel.
- **Implication bot** : prévoir un point de veille spécifique 02-03/06 (Build) pour décision migration sora-2 GA si annoncée.

### Foundry agents — rappel deadline migration 22/05
- Hosted agent migration deadline **22/05/2026** (J-16) : ancien backend supporté uniquement jusqu'à cette date.
- Si le bot vidéo s'appuie sur l'ancien backend Foundry agents, action requise avant cette date.
- **Pas de news additionnelle 05/05-06/05** sur Agent 365 ou Agent Framework.

### Pas de MAI-Video first-party
- Aucun mouvement MAI-Video : MAI-Image-2 (image gen) reste le top first-party MS, pas d'extension vidéo annoncée. **10 jours après la fin d'exclusivité OpenAI, Microsoft n'a toujours pas accéléré un first-party vidéo.**
- Trio MAI-Transcribe-1 / MAI-Voice-1 / MAI-Image-2 reste le périmètre multimédia first-party de Foundry — la vidéo reste un blanc dans la roadmap MAI publique.

---

## 🟢 Alternatives / concurrents

### Veo 3.1 / Veo 4 (Google DeepMind)
- **Veo 4 toujours non officiellement annoncé**. Pas de model card sur `deepmind.google/models/veo/`. **Inchangé depuis 21+ jours**.
- **Google I/O 2026 = 19-20/05/2026** → **T-13 jours**. Fenêtre haute probabilité Veo 4 (Polymarket : ~69% odds avant juin 2026, historique Google = Veo 1 à I/O 2024, Veo 3 à I/O 2025).
- "Code the Countdown" lancé 01/05 par Google : engagement programme pour le keynote I/O 2026, toujours en cours.
- **Veo 3.1 Lite** : production-ready actuelle pour le bot, prix ~$0.05/sec, public preview Vertex AI. Toujours présent sur la doc Vertex AI.
- **Veo upscaling capability** (1080p / 4K) : toujours en private preview, "coming soon to public preview" sur Vertex AI. **Pas de bascule public preview détectée 05/05-06/05.**
- **Vertex AI release notes 05/05-06/05** : pas de drop spécifique vidéo. Note de migration toujours active : `veo-3.0-generate-001` → `veo-3.1-generate-001` avant **30/06/2026**.
- 🆕 **Anticipations Veo 4 consolidées** (Tom's Guide, evolink.ai, artlist) : 30s native, native storyboarding, 4K natif (rendu, pas upscalé), zero-shot avatar, character consistency renforcée. **Tout reste informed expectation, pas fact** — à confirmer J=I/O 2026.

### HappyHorse-1.0 — stable, commercial launch en cours
- **Pricing officiel Alibaba Cloud Bailian** maintenu : ¥0.9/s 720p, ¥1.6/s 1080p (HappyHorse-1.0-T2V).
- **Multi-canalité opérationnelle** : fal.ai (live depuis 26/04) + Alibaba Cloud Bailian (commercial mai en cours) + Pixazo API (29/04) + APIYI (10% off via partenariat officiel).
- **Toujours #1 Elo Artificial Analysis Video Arena** (1379 Elo points T2V sans audio, 106 points devant Seedance 2.0).
- **Sur le ranking video+audio**, HappyHorse reste #2 derrière Seedance 2.0 (gap audio natif).
- 4 endpoints stables : `text-to-video`, `image-to-video`, `reference-to-video`, `video-edit`.
- 15B params, lip-sync 7 langues, audio inclus.
- **Pas de news majeure 05/05-06/05** : stable.

### Wan 2.6 / Wan 2.7 (Alibaba Tongyi Lab)
- 🆕 **Mention émergente** sur llm-stats : Wan Video 2.6 = **#3 leaderboard text-to-video Mai 2026** avec Arena score 577 (derrière Grok Imagine Video 724 et Veo 3.1 618).
- Wan 2.7 mentionné comme image/video model d'Alibaba Tongyi Lab released avril 2026.
- **À monitorer** : si Wan 2.7 monte au niveau de HappyHorse côté Arena Elo, le portfolio Alibaba devient encore plus dense.

### Runway / Kling / Pika / Seedance / Luma
- **Runway** : Gen-4.5 toujours #1 Artificial Analysis Text-to-Video Elo (1247). Plateforme intégrée Kling 3.0 / Kling 2.6 Pro / Kling 2.5 Turbo Pro / WAN2.2 Animate / GPT-Image-1.5 / **Sora 2 Pro** (intégration confirmée). Pas d'annonce produit majeure 05/05-06/05.
- **Kling 3.0** : 4K natif stable depuis 05/02/2026, storyboard tool, native lip-sync audio. Pas d'annonce.
- **Kling O3** : mentionné sur upuply.com comme dépassant Gen-4 sur dynamic action / nature footage. À monitorer.
- **Pika 3.0** : positionné "fun et expérimental" (anime, claymation, 3D render, Sound FX). Pas de news 24h.
- **Seedance 2.0** : disponible via Runway et fal.ai. **#1 sur ranking video+audio** Arena (combat HappyHorse). Stable.
- **Luma Dream Machine / Ray3** : aucun mouvement.

### Marché global — top leaderboard mai 2026
- **Grok Imagine Video (xAI)** : 🆕 **#1 leaderboard text-to-video Arena 724**. À monitorer sérieusement (xAI entre dans la conversation vidéo).
- **Veo 3.1** : #2 (618).
- **Wan Video 2.6** : #3 (577).
- **Position sora-2** : non-leaderboard explicite côté llm-stats (fragmentation des benchmarks selon Arena vs. Artificial Analysis).
- **Implication** : le marché vidéo se densifie ; sora-2 n'est plus dominant sur les benchmarks publics. **Pour le bot, le coût de switch sora-2 → Veo 3.1 / HappyHorse / Grok Imagine reste justifié sur des critères qualité, et la diversité des fournisseurs croît.**

---

## 📌 Actions recommandées

| Priorité | Action | Délai |
|----------|--------|-------|
| 🔴 NOUVEAU | **Préparer point veille Microsoft Build 02-03/06** : fenêtre potentielle GA sora-2 et/ou annonce MAI-Video. Lister 3 prompts représentatifs pour bench J+1 si annonce. | Avant 02/06 |
| 🔴 IMPORTANT | **Si bot vidéo s'appuie sur Foundry agents legacy** : auditer dépendance avant **22/05/2026** (J-16, deadline migration hosted agents). Ancien backend ne sera plus supporté. | Avant 22/05 |
| 🔴 IMPORTANT | **Audit endpoint bot** (rappel) : confirmer usage `/openai/v1/videos?api-version=preview` (pas l'ancien path). Toujours pas de fix MS officiel pour le catch-22 au 06/05, workaround toujours requis. | Aujourd'hui |
| 🔴 STRATÉGIQUE | **Préparer plan de bench Veo 4** : Google I/O 2026 J-13. Lister 5 prompts de référence à passer dès J+1 si Veo 4 est annoncé le 19 ou 20/05. | Avant 19/05 |
| 🔴 STRATÉGIQUE | **Bench HappyHorse-1.0 vs Veo 3.1 vs sora-2** : maintenir l'objectif (5 prompts représentatifs, qualité + latence + coût). Pricing Bailian officiel disponible pour calcul TCO réel. | Cette semaine |
| 🟡 MOYEN | **Évaluer Grok Imagine Video** (#1 leaderboard Arena 724) : nouveau signal qualité xAI, à benchmark si accessible API. | Cette semaine |
| 🟡 MOYEN | **Vertex AI deprecations 30/06/2026** : si bot consomme `veo-3.0-generate-001` ou `veo-3.0-fast-generate-001`, migration vers `veo-3.1-generate-001` / `veo-3.1-fast-generate-001` requise. | Avant fin mai |
| 🟡 MOYEN | **Recheck Foundry whats-new** : page "April 2026" pas encore basculée en mai au 06/05 (J+6 du mois, J+2 d'anomalie consécutive). Recheck quotidien. | Continu |
| 🟢 VEILLE | **Successeur vidéo OpenAI sur Bedrock** : monitorer si AWS finit par exposer sora-2 (improbable court terme, OpenAI pivot world-models confirmé par GPT-5.5 trajectory). | Veille passive |
| 🟢 VEILLE | **MAI-Video first-party MS** : monitorer si la fin d'exclusivité accélère un first-party Microsoft. **Aucun signal au 06/05 (J+10 post-renégo).** | Veille passive |

---

## 🔍 Rien de significatif aujourd'hui sur :

- **GA sora-2 Azure** : toujours gated preview (17 jours inchangé).
- **Annonce successeur vidéo OpenAI** : confirmé absent, et GPT-5.5 trajectory confirme pivot non-vidéo.
- **Veo 4 model card officielle DeepMind** : 21+ jours sans source primaire.
- **Runway / Pika / Luma / Kling / Seedance** : silence sur la fenêtre 24h.
- **MAI-Video first-party Microsoft** : toujours absent (J+10 post-renégo, fenêtre opportunité ratée).
- **Devblogs Foundry** : pas de post 05/05-06/05 video-related.
- **Vertex AI release notes** : pas de drop vidéo 05/05-06/05.
- **OpenAI changelog `/v1/videos`** : pas de drop sur la fenêtre 24h.
- **Foundry whats-new page** : toujours "April 2026" au 06/05 (anomalie continue J+6 du mois, J+2 d'anomalie consécutive).
- **HappyHorse-1.0** : pas de news 24h, stable.

---

## 📊 Évolution vs rapports précédents

| Signal | 04/05 | 05/05 | **06/05** |
|--------|-------|-------|-----------|
| sora-2 GA Azure | Gated preview (15j) | Gated preview (16j) | **Gated preview (17j)** |
| Sora app status | T+8 | T+9 | **T+10 post-shutdown** |
| API Sora OpenAI | Live (143j runway) | Live (142j runway) | **Live (141j runway)** |
| Successeur vidéo OpenAI | Vacuum confirmé même sur AWS | Vacuum confirmé (rien sur 24h) | **Vacuum confirmé + GPT-5.5 trajectory non-vidéo** |
| MS-OpenAI exclusivité | ENDED 27/04 (rétroactif) | ENDED J+9 | **ENDED J+10** |
| OpenAI sur AWS Bedrock | GPT-5.5/5.4/Codex/Agents 28/04 (PAS de vidéo) | Inchangé (pas de vidéo) | **Inchangé (pas de vidéo)** |
| Veo 4 | Pas de card 19+ j, T-15j I/O | Pas de card 20+ j, T-14j I/O | **Pas de card 21+ j, T-13j I/O** |
| HappyHorse 1.0 | Pricing Bailian officiel publié | Stable (pas de news 24h) | **Stable (pas de news 24h, #1 T2V Arena confirmé)** |
| Catch-22 endpoint Azure Video | Toujours pas de fix MS officiel | Toujours pas de fix MS officiel | **Toujours pas de fix MS officiel** |
| Doc Foundry whats-new | Toujours "April 2026" au 04/05 | Toujours "April 2026" au 05/05 (J+5) | **Toujours "April 2026" au 06/05 (J+6, J+2 d'anomalie consécutive)** |
| Catalogue Foundry | DeepSeek V4 Flash + Pro 01/05 | Stable (rien de neuf vidéo) | **🆕 GPT-5.5 Instant comme `GPT-chat-latest` 05/05 (hors vidéo)** |
| Foundry agents | Memory preview, AF 1.0 GA | AF 1.2.2, hosted migration deadline 22/05 | **Stable (rappel J-16 migration)** |
| OpenAI hors vidéo | n/a | Advanced Account Security, JV $10B PE firms | **🆕 GPT-5.5 Instant default ChatGPT 05/05 (TechCrunch)** |
| MS Build 2026 | n/a | n/a | **🆕 Confirmé 02-03/06 (T-27j) — fenêtre potentielle vidéo** |
| Top leaderboard T2V | n/a | n/a | **🆕 Grok Imagine Video #1 (724) — xAI entre la conversation** |

---

## Sources

### Sora app shutdown / OpenAI (T+10)
- [OpenAI Help Center — What to know about the Sora discontinuation](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [OpenAI Index — Sora 2 is here](https://openai.com/index/sora-2/)
- [OpenAI Deprecations — Videos API + sora-2 family shutdown 2026-09-24](https://developers.openai.com/api/docs/deprecations)
- [OpenAI Changelog](https://developers.openai.com/api/docs/changelog)
- [OpenAI News — Latest updates](https://openai.com/news/)
- [OpenAI Release Notes — May 2026 Latest Updates (Releasebot)](https://releasebot.io/updates/openai)
- [Apiyi — Sora-2 API shutdown date announced (Sep 24) + alternatives](https://help.apiyi.com/en/sora-2-api-shutdown-alternatives-2026-en.html)

### OpenAI hors vidéo (05/05/2026 — GPT-5.5 Instant)
- [TechCrunch — OpenAI releases GPT-5.5 Instant, a new default model for ChatGPT (05/05/2026)](https://techcrunch.com/2026/05/05/openai-releases-gpt-5-5-instant-a-new-default-model-for-chatgpt/)
- [OpenAI — Introducing GPT-5.5](https://openai.com/index/introducing-gpt-5-5/)
- [Microsoft Community Hub — Introducing OpenAI's newest chat model in Microsoft Foundry](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/introducing-openais-newest-chat-model-in-microsoft-foundry/4516848)
- [Pasquale Pillitteri — GPT-5.5 Spud, vision OpenAI agents > video](https://pasqualepillitteri.it/en/news/621/gpt-5-5-spud-openai-next-model)
- [GPT-5.5 — Wikipedia](https://en.wikipedia.org/wiki/GPT-5.5)

### Sora-2 sur Azure AI Foundry
- [Microsoft Foundry Docs — Sora 2 video generation overview (preview)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Microsoft Foundry Docs — What's New for April 2026 (titre HTML toujours "April 2026" au 06/05)](https://learn.microsoft.com/en-us/azure/foundry/whats-new-foundry)
- [Azure Blog — Sora 2 in Azure AI Foundry: Create videos with responsible AI](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [Azure AI catalog — OpenAI Sora-2](https://ai.azure.com/catalog/models/sora-2)
- [Microsoft Q&A — Azure OpenAI Video API rejects all sora-2 deployments (catch-22)](https://learn.microsoft.com/en-us/answers/questions/5860394/azure-openai-video-api-rejects-all-sora-2-deployme)
- [Microsoft Q&A — Sora 2 Not Available in Azure AI Foundry Model List](https://learn.microsoft.com/en-us/answers/questions/5774829/sora-2-not-available-in-azure-ai-foundry-model-lis)
- [Microsoft Q&A — Access to Sora 2](https://learn.microsoft.com/en-us/answers/questions/5774773/access-to-sora-2)
- [Microsoft Q&A — Azure OpenAI Sora (sora v2025-05-02) retiring Feb 28 2026, no successor visible](https://learn.microsoft.com/en-us/answers/questions/5790204/azure-openai-sora-(model-sora-v2025-05-02)-retirin)
- [Microsoft Q&A — Unable to deploy sora-2](https://learn.microsoft.com/en-us/answers/questions/5594583/unable-to-deploy-sora-2)
- [LiteLLM Issue #16568 — Azure OpenAI Sora 2 Authentication Error](https://github.com/BerriAI/litellm/issues/16568)

### Microsoft Build 2026 et Foundry plateforme (mai-juin)
- [Microsoft Build 2026 — Official site (02-03/06, San Francisco)](https://build.microsoft.com/en-US/home)
- [Neowin — Microsoft announces Build 2026 dates, "no-fluff" event](https://www.neowin.net/news/microsoft-announces-build-2026-dates-promises-a-no-fluff-event/)
- [Thurrott — Microsoft's Build 2026 Session Catalog Live](https://www.thurrott.com/microsoft/334704/microsofts-build-2026-session-catalog-is-now-live)
- [Microsoft for Startups — Build 2026 sessions every startup should attend](https://www.microsoft.com/en-us/startups/blog/microsoft-build-2026-sessions-every-startup-should-attend/)
- [Microsoft Foundry Blog — Devblogs](https://devblogs.microsoft.com/foundry/)
- [Microsoft Learn — Migrate hosted agents to refreshed public preview (deadline 22/05)](https://learn.microsoft.com/en-us/azure/foundry/agents/how-to/migrate-hosted-agent-preview)

### HappyHorse-1.0 / Wan / Seedance (stable)
- [Apiyi — HappyHorse pricing vs Seedance 2.0](https://help.apiyi.com/en/happyhorse-pricing-vs-seedance-2-comparison-en.html)
- [Apiyi — HappyHorse model decryption (Arena #1 then mystery)](https://help.apiyi.com/en/happyhorse-model-mystery-ai-video-lmarena-analysis-en.html)
- [Apiyi — HappyHorse API live on Alibaba Cloud Bailian (10% off)](https://help.apiyi.com/en/happyhorse-api-bailian-launch-apiyi-en.html)
- [PRNewswire — fal Launches HappyHorse-1.0 as Official API Partner](https://www.prnewswire.com/news-releases/fal-launches-happyhorse-1-0--the-1-ranked-ai-video-model-as-official-api-partner-302755003.html)
- [fal.ai — HappyHorse-1.0 landing page](https://fal.ai/happyhorse-1.0)
- [Imagine.art — HappyHorse 1.0 vs Seedance 2.0](https://www.imagine.art/blogs/happyhorse-vs-seedance)

### Veo / DeepMind / Vertex AI / Google I/O 2026
- [Google DeepMind — Veo models page](https://deepmind.google/models/veo/)
- [Vertex AI — Generative AI release notes](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes)
- [Veo 3.1 — Vertex AI doc](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/models/veo/3-1-generate)
- [Google Cloud Blog — Veo 3.1 Lite and Veo upscaling](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)
- [evolink.ai — Veo 4 Release Date 2026](https://evolink.ai/blog/veo-4-release-date-2026)
- [Tom's Guide — Google I/O 2026: Date, time, potential announcements](https://www.tomsguide.com/phones/google-pixel-phones/google-i-o-2026-date-time-potential-announcements-and-everything-else-you-need-to-know)
- [Google I/O 2026 official site](https://io.google/2026/)
- [Imagine.art — Veo 4 Updates](https://www.imagine.art/blogs/google-veo-4-updates)

### Marché global et concurrents
- [Llm-stats — Best AI Video Generator (May 2026) leaderboard](https://llm-stats.com/leaderboards/best-ai-for-video-generation)
- [Llm-stats — AI Updates Today (May 2026)](https://llm-stats.com/llm-updates)
- [Pixflow — Best AI Video Generator 2026 (Runway, Veo, Seedance, Kling)](https://pixflow.net/blog/best-ai-video-generator/)
- [Runway Changelog](https://runwayml.com/changelog)
- [Releasebot — OpenAI Release Notes May 2026](https://releasebot.io/updates/openai)

---

*Rapport généré automatiquement le 2026-05-06 (mercredi). Sources ≤ 7 jours sauf rappels de contexte explicites. Tonalité du jour : **journée calme côté vidéo**, statu quo strict 24h. Sora-2 toujours gated preview Foundry (J+17), Foundry whats-new page toujours "April 2026" au J+6 du mois (J+2 anomalie consécutive). Pas d'annonce vidéo OpenAI ni MS. Côté concurrents : Veo 4 toujours absent à T-13 jours de Google I/O 2026, HappyHorse-1.0 stable, Grok Imagine Video repéré #1 leaderboard Arena T2V (signal entrée xAI). Côté OpenAI hors vidéo : GPT-5.5 Instant default ChatGPT 05/05 + arrivée Foundry comme GPT-chat-latest — confirme pivot non-vidéo OpenAI. **Microsoft Build 2026 confirmé 02-03/06** (T-27j) = fenêtre potentielle GA sora-2 et/ou MAI-Video à monitorer. **Pas d'action critique nouvelle**, sauf vigilance migration Foundry hosted agents avant 22/05/2026 (J-16) si dépendance legacy.*

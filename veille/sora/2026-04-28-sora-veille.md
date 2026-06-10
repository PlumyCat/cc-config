# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-04-28

**Période couverte :** 2026-04-27 (après-midi) → 2026-04-28 matin (24 h depuis dernier rapport).
**Fenêtre filtrage :** sources ≤ 7 jours, doublons par rapport au rapport 27/04 supprimés.
**Tonalité du jour :** **événement structurant** — HappyHorse-1.0 (Alibaba) **EST LIVE** sur fal.ai depuis le 26/04 21h PST, avec annonce officielle du partenariat fal le 27/04. Pricing et endpoints publiés. Côté OpenAI/Azure, aucune nouveauté (T+2 post-shutdown app Sora). Veo 4 toujours absent.

---

## 🔴 Nouveautés Sora-2 / OpenAI

### App Sora — T+2 post-shutdown (rappel statut)
- Shutdown app exécuté **26/04/2026** (rappel). Aujourd'hui = T+2.
- **API Sora reste live jusqu'au 24/09/2026** — page deprecations OpenAI confirme : `Videos API, sora-2, sora-2-pro, sora-2-2025-10-06, sora-2-2025-12-08, sora-2-pro-2025-10-06` shut down le 24/09/2026.
- **Aucune communication post-shutdown** d'OpenAI sur 27-28/04 : pas de billet `openai.com/news`, pas de tweet officiel, pas de roadmap publiée. Help Center inchangé.

### Roadmap vidéo OpenAI — toujours vide
- Pas de successeur Sora-3 attendu (pivot équipe Sora vers world-models robotique confirmé le 23-27/04, rappel rapport précédent).
- **Pas de nouvelle fuite ni rumeur** sur 27-28/04. Tracking officiellement clos côté consumer/créatif.

### API OpenAI — pas de changelog
- `developers.openai.com/api/docs/changelog` : pas de modification `/v1/videos` sur 27-28/04.
- Doc `platform.openai.com/docs/models/sora-2` toujours en place avec mention "deprecated, shut down 2026-09-24".

---

## 🔵 Azure AI Foundry

### Sora-2 — gated preview inchangée (J+9 sans GA)
- **Aucune annonce de GA** sora-2 sur Foundry sur 27-28/04. **Statut gated preview maintenu, 9+ jours d'inertie**.
- `learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation` : doc inchangée, pricing $0.10/s Standard, $0.30/s Pro Global, $0.50/s Pro High-Res.
- `ai.azure.com/catalog/models/sora-2` : page model card inchangée, gating MCA-E/EA + 1000+CU toujours en place.
- 5 endpoints documentés (rappel) : Create Video, Get Video Status, Download Video, List Videos, Delete Videos. **Bug `/v1/video/generations/jobs` toujours non corrigé**, workaround `/openai/v1/videos?api-version=preview` reste la voie officielle.

### Devblogs / TechCommunity Foundry — calme plat
- `devblogs.microsoft.com/foundry/` : **pas de nouveau post 27-28/04** sur la vidéo. Derniers posts pertinents = ceux du 23-24/04 déjà couverts.
- TechCommunity Foundry : pas d'article video-related sur 27-28/04.
- Page `whats-new-foundry` (Foundry Docs) : page consolidée avril 2026, **pas de refresh post-24/04 détecté**. Refresh ciblé attendu cette semaine (T+0 à T+6 selon cycle 7-10j).

### Pas de MAI-Video first-party
- Foundry Labs avril 2026 (rappel) : MAI-Transcribe-1, MAI-Voice-1, MAI-Image-2. Toujours **aucun MAI-Video** annoncé. Microsoft ne pousse pas de modèle vidéo propriétaire malgré le vacuum OpenAI.

---

## 🟢 Alternatives / concurrents

### 🚨 HappyHorse-1.0 (Alibaba) — **API LIVE sur fal.ai depuis 26/04 21h PST**

**Événement majeur du jour.** Le modèle qu'on monitorait quotidiennement depuis 19+ jours est officiellement disponible.

- **Annonce officielle** : PRNewswire / Morningstar / Yahoo Finance datés **2026-04-27** — "fal Launches HappyHorse-1.0, the #1-Ranked AI Video Model, as Official API Partner".
- **Go-live effectif** : **26/04/2026 à 21h PST** (= 27/04 06h CEST), confirmé par fal.ai/learn.
- **Endpoints live** sur fal :
  - `/models/alibaba/happy-horse/text-to-video`
  - `/models/alibaba/happy-horse/image-to-video`
  - `/models/alibaba/happy-horse/reference-to-video`
  - `/models/alibaba/happy-horse/video-edit`
- **Pricing** : **$0.14/seconde en 720p**, **$0.28/seconde en 1080p**. Pay-per-second, sans minimums ni abonnement.
- **Specs** : 15B params, transformer unifié texte+image+vidéo+audio, lip-sync natif **7 langues** (mandarin, cantonais, anglais, japonais, coréen, allemand, français).
- **SDKs** Python + JavaScript fournis par fal (réduit l'intégration REST manuelle).
- **Disponibilité aussi sur Alibaba Cloud Bailian** (en testing entreprise) — second canal d'accès, intéressant pour redondance/latence APAC.
- **Position concurrentielle (rappel)** : #1 Elo 1355 sur Artificial Analysis Video Arena en text-to-video ET image-to-video, devant sora-2-pro, Seedance 2.0, Kling 3.0.

**Comparaison pricing vs concurrents (1080p) :**

| Modèle | Prix /seconde 1080p | Notes |
|--------|---------------------|-------|
| **HappyHorse-1.0** | **$0.28** | Lip-sync natif 7 langues, audio inclus |
| Sora-2 Pro High-Res (Azure) | $0.50 | Gated preview |
| Sora-2 Pro Global (Azure) | $0.30 | Gated preview |
| Veo 3.1 Lite (Vertex) | ~$0.05 | Pas de spec exacte 1080p, le moins cher du marché |
| Sora-2 Standard (Azure) | $0.10 | 720p typique |

**Implication directe pour le bot :** Plan B/C élargi. HappyHorse devient **plan C compétitif** vs Veo (plan A) et sora-2 Azure (plan B).

### Veo 3.1 / Veo 4 (Google DeepMind)
- **Veo 4 toujours non officiellement annoncé**. Pas de model card sur `deepmind.google/models/veo/`. Tous les "guides Veo 4" continuent d'être des spéculations SEO. **Inchangé depuis 13+ jours**.
- **Veo 3.1 Lite** : preview Vertex AI confirmée (release 03/04/2026, prix ~$0.05/sec). Reste la voie de prod actuelle pour le bot.
- **Vertex AI release notes 27-28/04** : pas de nouveau drop spécifique vidéo sur ces 2 jours. Note de migration toujours active : `veo-3.0-generate-001` → `veo-3.1-generate-001` avant **30/06/2026**.
- **Google I/O 2026 = 19-20/05/2026** → T-21 jours. Fenêtre haute probabilité Veo 4.

### Runway, Kling, Pika, Seedance (rappels)
- **Runway** : Seedance 2.0 dispo via Runway API depuis **17/04** (déjà capturé), text/image/video-to-video, durées 4-15s. **Pas de nouveau drop 27-28/04**.
- **Kling 3.0** : leader ELO bench grand public (1243), 4K natif, lip-sync, $6.99/mo entry price. Aucun mouvement 27-28/04.
- **Pika** : silence radio.
- **Seedance 2.0** : déjà disponible sur fal.ai et Runway (plan C activable).
- **Luma Dream Machine** : aucun mouvement.

---

## 📌 Actions recommandées

| Priorité | Action | Délai |
|----------|--------|-------|
| 🔴 STRATÉGIQUE | **Bench HappyHorse-1.0 vs Veo 3.1 vs sora-2** : maintenant que l'API est live et pricing public, lancer le bench prévu (5 prompts représentatifs du bot, comparaison qualité + latence + coût). Endpoints fal SDK Python disponibles, intégration rapide. | **Cette semaine** |
| 🔴 IMPORTANT | **Décision commerciale HappyHorse** : avant prod, valider TOS Alibaba/fal (data residency, copyright, droit à l'image) — particulièrement pour use cases européens (RGPD, AI Act). À cadrer avec legal. | Avant bascule prod |
| 🔴 STRATÉGIQUE | **Architecture multi-fournisseurs** : avec HappyHorse live, le bot peut désormais router parmi 3 backends (Veo 3.1 plan A, sora-2 Azure plan B, HappyHorse plan C). Acter dans la doc d'archi un sélecteur basé sur (a) langue de lip-sync, (b) prix/seconde, (c) taux de dispo. | **Cette semaine** |
| 🟡 MOYEN | **Vertex AI deprecations 30/06/2026** : si bot consomme `veo-3.0-generate-001` ou `veo-3.0-fast-generate-001`, migration vers `veo-3.1-generate-001` / `veo-3.1-fast-generate-001` requise. | Avant fin mai |
| 🟡 MOYEN | **Recheck Foundry whats-new** : page consolidée avril, refresh attendu cette semaine. **Recheck mardi 28/04 fin de journée + jeudi 30/04** sur GA sora-2. | T+0 à T+6 |
| 🟡 MOYEN | **Endpoint Azure sora-2** : confirmer en CI que `/openai/v1/videos?api-version=preview` reste actif. Bug ancien endpoint `/v1/video/generations/jobs` toujours présent côté MS. | Vérif ce sprint |
| 🟢 VEILLE | **Google I/O 2026 (19-20/05)** : T-21 jours. Préparer plan de bench Veo 4 vs Veo 3.1 + sora-2 + HappyHorse dès J+1. | Calendrier |
| 🟢 VEILLE | **Successeur vidéo OpenAI** : tracking clos. Pas de roadmap consumer attendue. | Clos |

---

## 🔍 Rien de significatif aujourd'hui sur :

- **GA sora-2 Azure** : toujours gated preview (9+ jours inchangé).
- **Annonce successeur vidéo OpenAI** : confirmé absent durablement.
- **Veo 4 model card officielle DeepMind** : 13+ jours sans source primaire.
- **Runway / Pika / Luma / Kling** : silence 24h.
- **MAI-Video first-party Microsoft** : toujours absent.
- **Devblogs Foundry** : pas de post 27-28/04 video-related.

---

## 📊 Évolution vs rapports précédents

| Signal | 23/04 | 24/04 | 27/04 | **28/04** |
|--------|-------|-------|-------|-----------|
| sora-2 GA Azure | Gated preview | Gated preview | Gated preview | **Gated preview** (9+ j) |
| Sora app status | T-3 | T-2 | ✅ Shutdown 26/04 | **T+2 post-shutdown, API jusqu'au 24/09** |
| API Sora OpenAI | Live | Live | Live | **Live** (5 mois runway) |
| Successeur vidéo OpenAI | Rumeur Spud | Spud=GPT-5.5 | Vacuum confirmé durable | **Vacuum durable** (clos) |
| Veo 4 | Pas de card | Pas de card 9j | Pas de card 12+ j | **Pas de card 13+ j** |
| **Happy Horse 1.0** | "30/04 via fal" | Inchangé | "late April" attendu | **🚨 LIVE sur fal.ai depuis 26/04 21h PST + Alibaba Cloud Bailian** |
| Bug endpoint Azure Video | Documenté 7j | Workaround officiel | Workaround stable 9+ j | **Workaround stable 10+ j** |
| Doc Foundry whats-new | Inchangé | Inchangé 7j | Inchangé 8j | **Inchangé 9j, refresh attendu** |
| Vertex AI deprecations | n/a | n/a | 30/06/2026 deadline | **Inchangé** |
| GPT-5.5 GA Foundry | OpenAI release | Foundry GA | Stable | **Stable** (hors scope vidéo) |

---

## Sources

### HappyHorse-1.0 launch (événement du jour)
- [PRNewswire — fal Launches HappyHorse-1.0, the #1-Ranked AI Video Model, as Official API Partner](https://www.prnewswire.com/news-releases/fal-launches-happyhorse-1-0--the-1-ranked-ai-video-model-as-official-api-partner-302755003.html)
- [Morningstar — fal Launches HappyHorse-1.0 (2026-04-27)](https://www.morningstar.com/news/pr-newswire/20260427sf45051/fal-launches-happyhorse-10-the-1-ranked-ai-video-model-as-official-api-partner)
- [Yahoo Finance SG — fal Launches HappyHorse-1.0](https://sg.finance.yahoo.com/news/fal-launches-happyhorse-1-0-021800135.html)
- [fal.ai — HappyHorse-1.0 landing page (live)](https://fal.ai/happyhorse-1.0)
- [fal.ai/learn — HappyHorse-1.0 AI Goes Live on fal: April 26, 9 PM PST](https://fal.ai/learn/devs/happyhorse-1-0-what-do-we-know-so-far)
- [fal.ai/learn — How to use HappyHorse-1.0 in 2026](https://fal.ai/learn/tools/how-to-use-happyhorse-1-0)
- [Apiyi blog — HappyHorse API live on Alibaba Cloud Bailian](https://help.apiyi.com/en/happyhorse-api-bailian-launch-apiyi-en.html)
- [CNBC — Alibaba reveals it's behind viral HappyHorse AI](https://www.cnbc.com/2026/04/10/alibaba-happyhorse-ai-video-model-benchmark-reveal.html)

### Sora app shutdown (T+2, contexte)
- [OpenAI Help Center — What to know about the Sora discontinuation](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [OpenAI Deprecations — Videos API + sora-2 family shutdown 2026-09-24](https://developers.openai.com/api/docs/deprecations)
- [OpenAI — Sora 2 Model docs](https://platform.openai.com/docs/models/sora-2)
- [Marist Circle — OpenAI Pulls Sora, but the Questions Around AI Remain (2026-04-27)](https://www.maristcircle.com/citynational-news/2026/4/27/openai-pulls-sora-but-the-questions-around-ai-remain)
- [the-decoder — Two-stage Sora shutdown app April + API September](https://the-decoder.com/openai-sets-two-stage-sora-shutdown-with-app-closing-april-2026-and-api-following-in-september/)

### Sora-2 sur Azure AI Foundry
- [Microsoft Foundry Docs — Sora 2 video generation overview (preview)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Microsoft Foundry Docs — What's New for April 2026](https://learn.microsoft.com/en-us/azure/foundry/whats-new-foundry)
- [Azure Blog — Sora 2 now available in Azure AI Foundry](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [Azure AI catalog — OpenAI Sora-2](https://ai.azure.com/catalog/models/sora-2)
- [Microsoft Q&A — Azure OpenAI Sora retiring + Sora 2 not visible](https://learn.microsoft.com/en-ca/answers/questions/5790204/azure-openai-sora-(model-sora-v2025-05-02)-retirin)
- [Microsoft Q&A — Sora 2 Not Available in Azure AI Foundry Model List](https://learn.microsoft.com/en-us/answers/questions/5774829/sora-2-not-available-in-azure-ai-foundry-model-lis)
- [Microsoft Q&A — Access to Sora 2](https://learn.microsoft.com/en-us/answers/questions/5774773/access-to-sora-2)
- [Devblogs Foundry — What's New in Foundry Fine-Tuning April 2026](https://devblogs.microsoft.com/foundry/whats-new-in-foundry-finetune-april-2026/)
- [TechCommunity — What's new in Foundry Labs April 2026](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/whats-new-in-foundry-labs---april-2026/4509714)

### Veo / DeepMind / Vertex AI
- [Google DeepMind — Veo models page](https://deepmind.google/models/veo/)
- [Google Cloud Blog — Veo 3.1 Lite and a new Veo upscaling capability on Vertex AI](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)
- [Vertex AI — Generative AI release notes (deprecations veo-3.0 → veo-3.1 avant 30/06/2026)](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes)
- [Veo 3.1 — Generative AI on Vertex AI doc](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/models/veo/3-1-generate)
- [techwelo — When Is Veo 4 Coming Out (analyse)](https://techwelo.com/when-is-veo-4-coming-out/)

### Marché vidéo IA général
- [DigitalApplied — AI Video Market After Sora 2026](https://www.digitalapplied.com/blog/ai-video-market-after-sora-runway-kling-veo-2026)
- [Pixflow — Best AI Video Generator 2026](https://pixflow.net/blog/best-ai-video-generator/)
- [BuildMVPFast — Best Text-to-Video AI Generators April 2026](https://www.buildmvpfast.com/articles/best-llms-2026-guide/video-generation-ai)
- [Releasebot — Runway AI Release Notes April 2026](https://releasebot.io/updates/runwayai)

---

*Rapport généré automatiquement le 2026-04-28 (mardi). Sources ≤ 7 jours sauf rappels de contexte explicites. Événement structurant du jour : **HappyHorse-1.0 (Alibaba) live sur fal.ai depuis 26/04 21h PST**, pricing public ($0.14/s 720p, $0.28/s 1080p), 4 endpoints, lip-sync 7 langues — désormais utilisable en plan C concret pour le bot. Côté Sora/Azure : J+9 sans GA, statut figé.*

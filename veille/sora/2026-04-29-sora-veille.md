# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-04-29

**Période couverte :** 2026-04-28 matin → 2026-04-29 matin (24 h depuis dernier rapport).
**Fenêtre filtrage :** sources ≤ 7 jours, doublons par rapport au rapport 28/04 supprimés.
**Tonalité du jour :** **calme plat sur OpenAI/Azure** — T+3 post-shutdown app Sora, aucune annonce successeur, sora-2 Foundry toujours gated preview (J+10). Côté hors-OpenAI : confirmation que Runway intègre déjà sora-2 Pro dans son catalogue, et écho médiatique sur la mort de la deal Disney–OpenAI ($1B jamais signés). Veo 4 toujours absent, T-20j de Google I/O 2026.

---

## 🔴 Nouveautés Sora-2 / OpenAI

### App Sora — T+3 post-shutdown
- App shutdown effectif depuis **26/04/2026**. Aujourd'hui = T+3.
- **API Sora reste live jusqu'au 24/09/2026** (rappel) : `Videos API, sora-2, sora-2-pro, sora-2-2025-10-06, sora-2-2025-12-08, sora-2-pro-2025-10-06`. Page deprecations OpenAI inchangée.
- **OpenAI Status (28/04)** : incident "Sora API elevated error rates" résolu à 16h10 le 28/04. Pas un drop produit, juste un hiccup ops — l'API tourne encore activement, les usages enterprise n'ont pas migré.
- **Aucune communication OpenAI sur 28-29/04** : ni billet `openai.com/news`, ni tweet officiel, ni roadmap publiée.

### Disney–OpenAI : la deal $1 Md officiellement morte (écho médiatique)
- **Information de contexte (rappel 27-28/04)** : confirmé que la deal Disney-Sora annoncée en décembre 2025 (engagement $1 Md + warrants + 200 personnages Disney/Marvel/Pixar/Star Wars) **n'a jamais été signée formellement** et qu'**aucun argent n'a changé de mains**.
- Sam Altman commentaires sur Deadline + Hollywood Reporter (semaine du 27/04) : OpenAI a "scuttled" le partenariat en shuttant Sora pour réorienter capacité compute vers produits enterprise / pré-IPO. "Talks continue" mais aucune feuille de route concrète.
- **Implications pour le bot** : aucune. Mais signal stratégique fort — OpenAI désinvestit la vidéo créative consumer pour de bon. Ne pas attendre un Sora-3 grand public.

### Roadmap vidéo OpenAI — toujours vide
- Pas de successeur Sora-3 attendu. Pivot équipe Sora vers world-models robotique confirmé depuis fin avril.
- **Pas de nouvelle fuite ni rumeur** sur 28-29/04. Tracking officiellement clos côté consumer/créatif.

### API OpenAI — pas de changelog
- `developers.openai.com/api/docs/changelog` : pas de modification `/v1/videos` sur 28-29/04 (incident infra mis à part).
- Doc `platform.openai.com/docs/models/sora-2` toujours en place avec mention "deprecated, shut down 2026-09-24".

---

## 🔵 Azure AI Foundry

### Sora-2 — gated preview inchangée (J+10 sans GA)
- **Aucune annonce de GA** sora-2 sur Foundry sur 28-29/04. **Statut gated preview maintenu, 10 jours d'inertie**.
- `learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation` : doc inchangée. Pricing toujours $0.10/s Standard, $0.30/s Pro Global, $0.50/s Pro High-Res.
- `ai.azure.com/catalog/models/sora-2` : page model card inchangée, gating MCA-E/EA + 1000+CU toujours en place. Régions = Sweden Central + East US 2.
- 5 endpoints documentés (rappel) : Create Video, Get Video Status, Download Video, List Videos, Delete Videos. **Workaround `/openai/v1/videos?api-version=preview` reste la voie officielle**, bug `/v1/video/generations/jobs` toujours non corrigé (J+11).

### Foundry whats-new (April 2026) — refresh attendu non détecté
- `learn.microsoft.com/en-us/azure/foundry/whats-new-foundry` : page consolidée avril 2026 lue ce matin. **Aucune nouvelle entrée vidéo** sur 28-29/04. Liste des "Updated articles" = articles Agent Service / MCP / private link / observability — rien de vidéo-related.
- `devblogs.microsoft.com/foundry/category/whats-new/feed/` : pas de nouveau post sur la vidéo sur 28-29/04.

### Pas de MAI-Video first-party
- Foundry Labs avril 2026 : MAI-Transcribe-1, MAI-Voice-1, MAI-Image-2 (annoncés le 02/04). Toujours **aucun MAI-Video** annoncé. Microsoft ne pousse pas de modèle vidéo propriétaire malgré le vacuum OpenAI.

---

## 🟢 Alternatives / concurrents

### HappyHorse-1.0 (Alibaba) sur fal.ai — T+3 post-go-live
- API live depuis **26/04 21h PST**, partnership fal.ai officiel annoncé le 27/04. Pricing : **$0.14/s 720p, $0.28/s 1080p**.
- 4 endpoints stables : `text-to-video`, `image-to-video`, `reference-to-video`, `video-edit`.
- Pas de nouveau changelog ni feature update sur 28-29/04. Stabilité confirmée — modèle pleinement utilisable comme plan C concret.
- **#1 Elo Artificial Analysis Video Arena** (text-to-video + image-to-video) toujours valable.
- Spec : 15B params, lip-sync 7 langues, audio inclus (mandarin, cantonais, anglais, japonais, coréen, allemand, français).

### Runway intègre sora-2 Pro dans son catalogue (signal du jour)
- Confirmation lue dans les pages Runway 2026 : **Runway propose désormais sora-2 Pro nativement** dans sa plateforme, aux côtés de Kling 3.0/2.6 Pro/2.5 Turbo Pro, Gen-4.5 (leader Elo 1247), WAN2.2 Animate, GPT-Image-1.5.
- **Implication** : si le bot a besoin de sora-2 sans dépendre d'Azure, Runway devient un canal d'accès alternatif (avec markup, mais sans gating MCA-E/EA + 1000+CU).
- À considérer pour le sprint architecture multi-fournisseurs (cf. action 28/04).

### Veo 3.1 / Veo 4 (Google DeepMind)
- **Veo 4 toujours non officiellement annoncé**. Pas de model card sur `deepmind.google/models/veo/`. Tous les "guides Veo 4" continuent d'être des spéculations SEO. **Inchangé depuis 14+ jours**.
- **Veo 3.1 Lite** : preview Vertex AI confirmée (release 03/04/2026, prix ~$0.05/sec). Reste la voie de prod actuelle pour le bot.
- **Vertex AI release notes 28-29/04** : pas de drop spécifique vidéo. Note de migration toujours active : `veo-3.0-generate-001` → `veo-3.1-generate-001` avant **30/06/2026**.
- **Google I/O 2026 = 19-20/05/2026** → **T-20 jours**. Fenêtre haute probabilité Veo 4 (Google a annoncé Veo 1 en mai 2024 et Veo 3 en mai 2025 à I/O — cohérence calendaire).

### Runway Gen-4.5 — leader Video Arena
- Gen-4.5 (release décembre 2025) tient le **#1 Video Arena Elo 1247**. Pas de Gen-5 annoncée. Stable.
- Runway changelog 28-29/04 : aucune annonce produit majeure.

### Kling, Pika, Seedance, Luma (rappels)
- **Kling 3.0** : 4K natif, lip-sync, $6.99/mo entry. Stable.
- **Pika 2.5** : silence radio.
- **Seedance 2.0** : disponible via Runway et fal.ai. Stable.
- **Luma Dream Machine / Ray3** : aucun mouvement.

---

## 📌 Actions recommandées

| Priorité | Action | Délai |
|----------|--------|-------|
| 🔴 STRATÉGIQUE | **Bench HappyHorse-1.0 vs Veo 3.1 vs sora-2** : maintenir l'objectif posé hier (5 prompts représentatifs, qualité + latence + coût). API HappyHorse stable T+3, fenêtre idéale. | **Cette semaine** |
| 🔴 STRATÉGIQUE | **Évaluer Runway comme canal sora-2 alternatif** : si le bot ne dispose pas du gating Azure MCA-E/EA, Runway = accès sora-2 Pro sans paperasse, à comparer pricing vs fal/Azure. | **Cette semaine** |
| 🔴 IMPORTANT | **Décision commerciale HappyHorse** : valider TOS Alibaba/fal (data residency, copyright, droit à l'image) — particulièrement pour use cases européens (RGPD, AI Act). | Avant bascule prod |
| 🟡 MOYEN | **Vertex AI deprecations 30/06/2026** : si bot consomme `veo-3.0-generate-001` ou `veo-3.0-fast-generate-001`, migration vers `veo-3.1-generate-001` / `veo-3.1-fast-generate-001` requise. | Avant fin mai |
| 🟡 MOYEN | **Recheck Foundry whats-new** : page consolidée avril, refresh toujours pas détecté à J+10. Recheck **vendredi 01/05** (cycle hebdo) puis **lundi 04/05**. | T+0 à T+5 |
| 🟡 MOYEN | **Endpoint Azure sora-2** : confirmer en CI que `/openai/v1/videos?api-version=preview` reste actif. Bug ancien endpoint toujours présent côté MS (J+11). | Vérif ce sprint |
| 🟢 VEILLE | **Google I/O 2026 (19-20/05)** : T-20 jours. Préparer plan de bench Veo 4 vs Veo 3.1 + sora-2 + HappyHorse dès J+1. | Calendrier |
| 🟢 VEILLE | **Successeur vidéo OpenAI** : tracking clos. Disney-deal écho médiatique mais aucun impact technique. | Clos |

---

## 🔍 Rien de significatif aujourd'hui sur :

- **GA sora-2 Azure** : toujours gated preview (10 jours inchangé).
- **Annonce successeur vidéo OpenAI** : confirmé absent durablement.
- **Veo 4 model card officielle DeepMind** : 14+ jours sans source primaire.
- **Runway / Pika / Luma / Kling** : silence 24h.
- **MAI-Video first-party Microsoft** : toujours absent.
- **Devblogs Foundry** : pas de post 28-29/04 video-related.
- **Vertex AI release notes** : pas de drop vidéo 28-29/04.

---

## 📊 Évolution vs rapports précédents

| Signal | 24/04 | 27/04 | 28/04 | **29/04** |
|--------|-------|-------|-------|-----------|
| sora-2 GA Azure | Gated preview | Gated preview | Gated preview (9j) | **Gated preview** (10j) |
| Sora app status | T-2 | ✅ Shutdown 26/04 | T+2 | **T+3 post-shutdown, API jusqu'au 24/09** |
| API Sora OpenAI | Live | Live | Live | **Live** (5 mois runway, incident infra mineur 28/04 résolu) |
| Successeur vidéo OpenAI | Spud=GPT-5.5 | Vacuum confirmé durable | Vacuum durable | **Vacuum durable** (clos) |
| Disney-OpenAI deal | n/a | Écho post-shutdown | Écho post-shutdown | **Confirmé scuttled, $0 versé** |
| Veo 4 | Pas de card 9j | Pas de card 12+ j | Pas de card 13+ j | **Pas de card 14+ j**, T-20j I/O |
| HappyHorse 1.0 | Inchangé | "late April" attendu | 🚨 LIVE 26/04 21h PST | **Stable T+3, pas de change** |
| Runway intègre sora-2 Pro | n/a | n/a | n/a | **Confirmé canal alternatif** |
| Bug endpoint Azure Video | Workaround officiel | Workaround stable 9+ j | Workaround stable 10+ j | **Workaround stable 11+ j** |
| Doc Foundry whats-new | Inchangé | Inchangé 8j | Inchangé 9j | **Inchangé 10j**, refresh attendu vendredi |
| Vertex AI deprecations | n/a | 30/06/2026 deadline | Inchangé | **Inchangé** |
| GPT-5.5 Foundry | Foundry GA | Stable | Stable | **Stable** (hors scope vidéo) |

---

## Sources

### Sora app shutdown / OpenAI (T+3)
- [OpenAI Help Center — What to know about the Sora discontinuation](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [OpenAI Deprecations — Videos API + sora-2 family shutdown 2026-09-24](https://developers.openai.com/api/docs/deprecations)
- [OpenAI Changelog](https://developers.openai.com/api/docs/changelog)
- [OpenAI Status — incidents & history](https://status.openai.com/history)
- [OpenAI Developer Community — Is the Sora2 API still working?](https://community.openai.com/t/is-the-sora2-api-still-working/1379946)
- [TechInformed — OpenAI's Sora shutdown adds to signs of a harder AI phase](https://techinformed.com/openais-sora-shutdown-adds-to-signs-of-a-harder-ai-phase/)

### Disney–OpenAI deal (contexte stratégique)
- [Deadline — Sam Altman On Working With Disney After Shuttering Sora](https://deadline.com/2026/04/sam-altman-open-ai-disney-sora-1236772254/)
- [Hollywood Reporter — OpenAI Still in Talks With Disney After Sora Shutdown](https://www.hollywoodreporter.com/business/digital/openai-still-talking-disney-sora-shutdown-1236554471/)
- [Brooklyn College Vanguard — Disney and OpenAI Quietly Terminate $1 Billion Contract](https://vanguard.blog.brooklyn.edu/2026/04/disney-and-openai-quietly-terminate-1-billion-contract-amid-soras-shutdown/)
- [Tech-Insider — Sora Shutdown: Why Disney Killed Its $150M AI Deal](https://tech-insider.org/openai-sora-shutdown-disney-deal-ai-video-2026/)

### Sora-2 sur Azure AI Foundry
- [Microsoft Foundry Docs — Sora 2 video generation overview (preview)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Microsoft Foundry Docs — What's New for April 2026](https://learn.microsoft.com/en-us/azure/foundry/whats-new-foundry)
- [Azure Blog — Sora 2 now available in Azure AI Foundry](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [Azure AI catalog — OpenAI Sora-2](https://ai.azure.com/catalog/models/sora-2)
- [Microsoft Q&A — Sora 2 Preview clarifications on durations](https://learn.microsoft.com/en-us/answers/questions/5629317/sora-2-preview-in-azure-ai-foundry-clarification-o)
- [Microsoft Q&A — Sora 2 Not Available in Azure AI Foundry Model List](https://learn.microsoft.com/en-us/answers/questions/5774829/sora-2-not-available-in-azure-ai-foundry-model-lis)
- [Microsoft Q&A — Access to Sora 2](https://learn.microsoft.com/en-us/answers/questions/5774773/access-to-sora-2)
- [Devblogs Foundry — What's New feed](https://devblogs.microsoft.com/foundry/category/whats-new/feed/)

### HappyHorse-1.0 (rappel contexte)
- [PRNewswire — fal Launches HappyHorse-1.0 as Official API Partner](https://www.prnewswire.com/news-releases/fal-launches-happyhorse-1-0--the-1-ranked-ai-video-model-as-official-api-partner-302755003.html)
- [fal.ai — HappyHorse-1.0 landing page](https://fal.ai/happyhorse-1.0)
- [fal.ai/learn — HappyHorse-1.0 AI Goes Live on fal](https://fal.ai/learn/devs/happyhorse-1-0-what-do-we-know-so-far)
- [fal.ai — Happy Horse Video Edit endpoint](https://fal.ai/models/alibaba/happy-horse/video-edit/api)

### Veo / DeepMind / Vertex AI
- [Google DeepMind — Veo models page](https://deepmind.google/models/veo/)
- [Google Cloud Blog — Veo 3.1 Lite and a new Veo upscaling capability on Vertex AI](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)
- [Vertex AI — Generative AI release notes](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes)
- [Veo 3.1 — Vertex AI doc](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/models/veo/3-1-generate)
- [Google I/O 2026 official site](https://io.google/2026/)

### Runway / catalogue multi-modèles
- [Runway Changelog](https://runwayml.com/changelog)
- [Runway AI Release Notes — April 2026 (Releasebot)](https://releasebot.io/updates/runwayai)
- [aitoolanalysis — Runway Review 2026: Gen-4.5 #1 On Video Arena](https://aitoolanalysis.com/runway-review/)

### Marché vidéo IA général
- [Bloomberg — Kling AI, Runway, Vidu: AI Video Generators Set to Replace Sora](https://www.bloomberg.com/news/articles/2026-04-01/kling-ai-runway-vidu-the-ai-video-generators-set-to-replace-openai-s-sora)
- [BuildMVPFast — Best Text-to-Video AI Generators April 2026](https://www.buildmvpfast.com/articles/best-llms-2026-guide/video-generation-ai)
- [llm-stats — AI Updates Today (April 2026)](https://llm-stats.com/llm-updates)

---

*Rapport généré automatiquement le 2026-04-29 (mercredi). Sources ≤ 7 jours sauf rappels de contexte explicites. Tonalité du jour : **calme plat structurel**. Aucune nouveauté Sora-2 sur Foundry (J+10 gated preview), aucune comm OpenAI post-shutdown (T+3), Veo 4 toujours absent (T-20j de I/O 2026). Signal mineur : confirmation que **Runway propose sora-2 Pro nativement** — canal d'accès alternatif sans gating Azure, à benchmarker. HappyHorse-1.0 stable T+3 sur fal.ai. La fenêtre d'événement majeur prochaine est Google I/O 2026 (19-20 mai, T-20j).*

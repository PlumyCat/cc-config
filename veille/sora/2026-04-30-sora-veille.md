# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-04-30

**Période couverte :** 2026-04-29 matin → 2026-04-30 matin (24 h depuis dernier rapport).
**Fenêtre filtrage :** sources ≤ 7 jours, doublons par rapport au rapport 29/04 supprimés.
**Tonalité du jour :** **calme plat OpenAI/Azure maintenu** — T+4 post-shutdown app Sora, sora-2 Foundry toujours gated preview (J+11), aucune comm OpenAI. **Signal nouveau** : un thread MS Q&A signale un bug catch-22 sur l'API Azure OpenAI Video qui rejette les déploiements sora-2 (gateway valide encore l'ancien nom de modèle déprécié) — à monitorer si le bot s'appuie sur ce path. Côté concurrents : HappyHorse-1.0 confirmé en testing entreprise depuis 27/04, **commercial release prévue mai** sur Alibaba Cloud Bailian + lancement Pixazo API le 29/04. Magic Hour publie son bench T2V 2026 (+35% prompt adherence YoY).

---

## 🔴 Nouveautés Sora-2 / OpenAI

### App Sora — T+4 post-shutdown
- App shutdown effectif depuis **26/04/2026**. Aujourd'hui = T+4.
- **API Sora reste live jusqu'au 24/09/2026** (rappel) : `Videos API, sora-2, sora-2-pro, sora-2-2025-10-06, sora-2-2025-12-08, sora-2-pro-2025-10-06`.
- **Aucune communication OpenAI sur 29-30/04** : ni billet `openai.com/news`, ni tweet officiel, ni roadmap publiée. Page deprecations inchangée.
- **OpenAI Status** : pas de nouvel incident sora après celui du 28/04 (résolu). API stable.

### Roadmap vidéo OpenAI — toujours vide
- Pas de successeur Sora-3 attendu. Pivot équipe Sora vers world-models robotique confirmé.
- **Pas de nouvelle fuite ni rumeur** sur 29-30/04. Tracking officiellement clos côté consumer/créatif.

### API OpenAI — pas de changelog
- `developers.openai.com/api/docs/changelog` : pas de modification `/v1/videos` sur 29-30/04.
- Doc `platform.openai.com/docs/models/sora-2` toujours en place avec mention "deprecated, shut down 2026-09-24".

---

## 🔵 Azure AI Foundry

### Sora-2 — gated preview inchangée (J+11 sans GA)
- **Aucune annonce de GA** sora-2 sur Foundry sur 29-30/04. **Statut gated preview maintenu, 11 jours d'inertie**.
- `learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation` : doc inchangée. Pricing Standard $0.10/s, Pro Global $0.30/s, Pro High-Res $0.50/s.
- `ai.azure.com/catalog/models/sora-2` : page inchangée, gating MCA-E/EA + 1000+CU toujours en place. Régions = Sweden Central + East US 2.
- Workaround `/openai/v1/videos?api-version=preview` reste la voie officielle.

### 🆕 Nouveau signal — Bug catch-22 endpoint sora-2
- Thread MS Q&A nouveau : **"Azure OpenAI Video API rejects all sora-2 deployments — gateway validates for deprecated sora model name, creating a catch-22"**.
- Le gateway Azure OpenAI Video API rejetterait les déploiements `sora-2` car il valide encore l'ancien nom de modèle `sora` (v2025-05-02), pourtant déprécié au 28/02/2026 sans successeur exposé.
- **Implication pour le bot** : si le code utilise encore l'ancien path `/openai/deployments/{deployment}/video/generations/jobs?...`, il peut tomber sur ce catch-22. **Migration vers `/openai/v1/videos?api-version=preview` impérative**.
- Pas de fix officiel MS visible sur 29-30/04. Issue tracker à monitorer.

### Foundry whats-new (April 2026) — refresh attendu non détecté
- `learn.microsoft.com/en-us/azure/foundry/whats-new-foundry` : page consolidée avril 2026 inchangée. **Aucune nouvelle entrée vidéo** sur 29-30/04.
- `devblogs.microsoft.com/foundry/category/whats-new/feed/` : pas de nouveau post vidéo-related.
- Recheck **vendredi 01/05** prévu (cycle hebdo MS).

### Pas de MAI-Video first-party
- Foundry Labs avril 2026 : MAI-Transcribe-1, MAI-Voice-1, MAI-Image-2 (annoncés le 02/04). Toujours **aucun MAI-Video** annoncé. MS ne pousse pas de modèle vidéo propriétaire malgré le vacuum OpenAI.

### Toolboxes Foundry — preview publique (rappel hors scope vidéo)
- Microsoft a sorti **Toolboxes** en public preview sur Foundry (bundle réutilisable de tools, auth centralisée, MCP-compatible single endpoint). Hors scope vidéo mais à noter pour archi multi-fournisseurs.

---

## 🟢 Alternatives / concurrents

### HappyHorse-1.0 (Alibaba) — accélération de la distribution
- **Live sur fal.ai** depuis 26/04 (T+4). Stable, pas de change feature.
- **Nouveau 27/04 (rappel J-3)** : entré en **enterprise-level testing** sur Alibaba Cloud, **commercial release officielle prévue mai**.
- **Nouveau 29/04** : lancement de l'API HappyHorse 1.0 sur **Pixazo API**, second canal de distribution US-friendly. Multi-canalité confirmée : fal.ai + Alibaba Bailian + Pixazo.
- **#1 Elo Artificial Analysis Video Arena** : 1389 Elo points en text-to-video without audio. Toujours leader.
- Pricing fal : **$0.14/s 720p, $0.28/s 1080p**. 4 endpoints stables : `text-to-video`, `image-to-video`, `reference-to-video`, `video-edit`.
- Spec : 15B params, lip-sync 7 langues, audio inclus.

### Veo 3.1 / Veo 4 (Google DeepMind)
- **Veo 4 toujours non officiellement annoncé**. Pas de model card sur `deepmind.google/models/veo/`. **Inchangé depuis 15+ jours**.
- **Veo 3.1 Lite** : preview Vertex AI confirmée (release 03/04/2026, prix ~$0.05/sec). Reste la voie de prod actuelle pour le bot.
- **Vertex AI release notes 29-30/04** : pas de drop spécifique vidéo. Note de migration toujours active : `veo-3.0-generate-001` → `veo-3.1-generate-001` avant **30/06/2026**.
- **Google I/O 2026 = 19-20/05/2026** → **T-19 jours**. Fenêtre haute probabilité Veo 4.

### Runway — catalogue multi-modèles confirmé
- Runway propose nativement **sora-2 Pro, Kling 3.0, Kling 2.6 Pro, Kling 2.5 Turbo Pro, WAN2.2 Animate, GPT-Image-1.5, Seedance 2.0** (depuis 17/04).
- Gen-4.5 (release décembre 2025) tient le **#1 Video Arena Elo 1247**.
- Runway changelog 29-30/04 : aucune annonce produit majeure.

### 🆕 Magic Hour AI — bench T2V 2026 publié 29/04
- Magic Hour a publié son benchmark **"Best Text-to-Video AI 2026"** le 29/04 : **+35% prompt adherence YoY** sur les modèles leaders.
- Pas un signal produit mais un signal marché : la barre de qualité sur l'instruction-following progresse vite. À utiliser comme grille de notation lors du bench du bot.

### 🆕 Grok / xAI — extension Imagine templates
- xAI déploie de nouveaux **Imagine templates** sur le web Grok : `Photo to Video`, `Photo to Style Edit`, `Photo to Edit to Video`. Type "Image Reference" en prep.
- Pertinent pour comparaison capability mais pas un canal API entreprise mature. À rappeler que xAI n'expose pas (encore) d'API vidéo grand public stable.

### Kling, Pika, Seedance, Luma (rappels)
- **Kling 3.0** : 4K natif (rappel 24/04). Stable.
- **Pika 2.5** : silence radio.
- **Seedance 2.0** : disponible via Runway (depuis 17/04) et fal.ai. Stable.
- **Luma Dream Machine / Ray3** : aucun mouvement.

---

## 📌 Actions recommandées

| Priorité | Action | Délai |
|----------|--------|-------|
| 🔴 **NOUVEAU** | **Vérifier que le bot utilise `/openai/v1/videos?api-version=preview`** et non l'ancien endpoint `/openai/deployments/{name}/video/generations/jobs` (catch-22 signalé sur MS Q&A). Audit code immédiat. | **Aujourd'hui** |
| 🔴 STRATÉGIQUE | **Bench HappyHorse-1.0 vs Veo 3.1 vs sora-2** : maintenir l'objectif (5 prompts représentatifs, qualité + latence + coût). API HappyHorse stable T+4, fenêtre idéale. Profiter de la grille Magic Hour 2026 (+35% prompt adherence YoY) comme baseline scoring. | **Cette semaine** |
| 🔴 STRATÉGIQUE | **Évaluer Runway comme canal sora-2 alternatif** : si bot ne dispose pas du gating Azure MCA-E/EA, Runway = accès sora-2 Pro sans paperasse. Comparer pricing vs fal/Azure. | **Cette semaine** |
| 🔴 IMPORTANT | **Décision commerciale HappyHorse** : valider TOS Alibaba/fal/Pixazo (data residency, copyright, droit à l'image) — particulièrement use cases européens (RGPD, AI Act). Multi-canal (fal/Bailian/Pixazo) = choix de souveraineté à arbitrer. | Avant bascule prod |
| 🟡 MOYEN | **Vertex AI deprecations 30/06/2026** : si bot consomme `veo-3.0-generate-001` ou `veo-3.0-fast-generate-001`, migration vers `veo-3.1-generate-001` / `veo-3.1-fast-generate-001` requise. | Avant fin mai |
| 🟡 MOYEN | **Recheck Foundry whats-new** : refresh attendu **vendredi 01/05** (cycle hebdo) puis **lundi 04/05**. | T+1 à T+5 |
| 🟢 VEILLE | **Google I/O 2026 (19-20/05)** : T-19 jours. Préparer plan de bench Veo 4 vs Veo 3.1 + sora-2 + HappyHorse dès J+1. | Calendrier |
| 🟢 VEILLE | **Successeur vidéo OpenAI** : tracking clos. | Clos |

---

## 🔍 Rien de significatif aujourd'hui sur :

- **GA sora-2 Azure** : toujours gated preview (11 jours inchangé).
- **Annonce successeur vidéo OpenAI** : confirmé absent durablement.
- **Veo 4 model card officielle DeepMind** : 15+ jours sans source primaire.
- **Runway / Pika / Luma / Kling** : silence 24h.
- **MAI-Video first-party Microsoft** : toujours absent.
- **Devblogs Foundry** : pas de post 29-30/04 video-related.
- **Vertex AI release notes** : pas de drop vidéo 29-30/04.

---

## 📊 Évolution vs rapports précédents

| Signal | 27/04 | 28/04 | 29/04 | **30/04** |
|--------|-------|-------|-------|-----------|
| sora-2 GA Azure | Gated preview | Gated preview (9j) | Gated preview (10j) | **Gated preview** (11j) |
| Sora app status | ✅ Shutdown 26/04 | T+2 | T+3 | **T+4 post-shutdown** |
| API Sora OpenAI | Live | Live (incident 28/04 résolu) | Live | **Live** (5 mois runway) |
| Successeur vidéo OpenAI | Vacuum confirmé durable | Vacuum durable | Vacuum durable (clos) | **Vacuum durable** (clos) |
| Disney-OpenAI deal | Écho | Écho | Confirmé scuttled, $0 versé | **Pas de news** |
| Veo 4 | Pas de card 12+ j | Pas de card 13+ j | Pas de card 14+ j | **Pas de card 15+ j**, T-19j I/O |
| HappyHorse 1.0 | "late April" attendu | 🚨 LIVE 26/04 21h PST | Stable T+3 | **Multi-canal : fal + Bailian (mai) + Pixazo (29/04)** |
| Runway intègre sora-2 Pro | n/a | n/a | Confirmé canal alternatif | **Stable** |
| Bug endpoint Azure Video | Workaround officiel | Stable 10+ j | Stable 11+ j | **🆕 Catch-22 documenté MS Q&A — audit code requis** |
| Doc Foundry whats-new | Inchangé 8j | Inchangé 9j | Inchangé 10j | **Inchangé 11j**, recheck 01/05 |
| Vertex AI deprecations | 30/06/2026 deadline | Inchangé | Inchangé | **Inchangé** |
| Magic Hour bench | n/a | n/a | n/a | **🆕 Publié 29/04 — +35% prompt adherence YoY** |
| Grok video features | n/a | n/a | n/a | **🆕 Imagine templates Photo→Video** |

---

## Sources

### Sora app shutdown / OpenAI (T+4)
- [OpenAI Help Center — What to know about the Sora discontinuation](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [OpenAI Index — Sora 2 is here](https://openai.com/index/sora-2/)
- [OpenAI Deprecations — Videos API + sora-2 family shutdown 2026-09-24](https://developers.openai.com/api/docs/deprecations)
- [OpenAI Changelog](https://developers.openai.com/api/docs/changelog)
- [OpenAI Status — incidents & history](https://status.openai.com/history)
- [OpenAI Developer Community — Is the Sora2 API still working?](https://community.openai.com/t/is-the-sora2-api-still-working/1379946)
- [the-decoder — OpenAI sets two-stage Sora shutdown](https://the-decoder.com/openai-sets-two-stage-sora-shutdown-with-app-closing-april-2026-and-api-following-in-september/)

### Sora-2 sur Azure AI Foundry
- [Microsoft Foundry Docs — Sora 2 video generation overview (preview)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Microsoft Foundry Docs — What's New for April 2026](https://learn.microsoft.com/en-us/azure/foundry/whats-new-foundry)
- [Azure Blog — Sora 2 now available in Azure AI Foundry](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [Azure AI catalog — OpenAI Sora-2](https://ai.azure.com/catalog/models/sora-2)
- [🆕 Microsoft Q&A — Azure OpenAI Video API rejects all sora-2 deployments (catch-22)](https://learn.microsoft.com/en-us/answers/questions/5860394/azure-openai-video-api-rejects-all-sora-2-deployme)
- [Microsoft Q&A — Sora 2 Preview clarifications on durations](https://learn.microsoft.com/en-us/answers/questions/5629317/sora-2-preview-in-azure-ai-foundry-clarification-o)
- [Microsoft Q&A — Sora 2 Not Available in Foundry Model List](https://learn.microsoft.com/en-us/answers/questions/5774829/sora-2-not-available-in-azure-ai-foundry-model-lis)
- [Microsoft Q&A — Access to Sora 2](https://learn.microsoft.com/en-us/answers/questions/5774773/access-to-sora-2)
- [Microsoft Q&A — Azure OpenAI Sora (v2025-05-02) retiring Feb 28, 2026 — no successor available](https://learn.microsoft.com/en-us/answers/questions/5790204/azure-openai-sora-(model-sora-v2025-05-02)-retirin)
- [Devblogs Foundry — What's New feed](https://devblogs.microsoft.com/foundry/category/whats-new/feed/)
- [TechCommunity — What's new in Foundry Labs - April 2026](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/whats-new-in-foundry-labs---april-2026/4509714)

### HappyHorse-1.0
- [PRNewswire — fal Launches HappyHorse-1.0 as Official API Partner](https://www.prnewswire.com/news-releases/fal-launches-happyhorse-1-0--the-1-ranked-ai-video-model-as-official-api-partner-302755003.html)
- [fal.ai — HappyHorse-1.0 landing page](https://fal.ai/happyhorse-1.0)
- [fal.ai/learn — HappyHorse-1.0 Goes Live on fal](https://fal.ai/learn/devs/happyhorse-1-0-what-do-we-know-so-far)
- [🆕 Apiyi — HappyHorse API live on Alibaba Cloud Bailian (commercial release May 2026)](https://help.apiyi.com/en/happyhorse-api-bailian-launch-apiyi-en.html)
- [🆕 Martechseries — Pixazo API launches HappyHorse 1.0 API](https://martechseries.com/video/pixazo-api-launches-happyhorse-1-0-api-bringing-alibabas-next-gen-ai-video-generation-to-developers-worldwide/)

### Veo / DeepMind / Vertex AI
- [Google DeepMind — Veo models page](https://deepmind.google/models/veo/)
- [Google Cloud Blog — Veo 3.1 Lite and Veo upscaling on Vertex AI](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)
- [Vertex AI — Generative AI release notes](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes)
- [Veo 3.1 — Vertex AI doc](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/models/veo/3-1-generate)
- [Google I/O 2026 official site](https://io.google/2026/)

### Runway / catalogue multi-modèles
- [Runway Changelog](https://runwayml.com/changelog)
- [Runway AI Release Notes — April 2026 (Releasebot)](https://releasebot.io/updates/runwayai)

### Marché vidéo IA général
- [🆕 Magic Hour AI Video Benchmark 2026](https://resource.digen.ai/magic-hour-ai-video-benchmark-2026/)
- [BuildMVPFast — Best Text-to-Video AI Generators April 2026](https://www.buildmvpfast.com/articles/best-llms-2026-guide/video-generation-ai)
- [Soloa — Runway vs Kling vs Pika vs Luma 2026](https://soloa.ai/blog/runway-vs-kling-vs-pika-vs-luma-ai-video-2026)
- [Crypto Integrated — AI News April 29, 2026](https://www.cryptointegrat.com/p/ai-news-april-29-2026)

---

*Rapport généré automatiquement le 2026-04-30 (jeudi). Sources ≤ 7 jours sauf rappels de contexte explicites. Tonalité du jour : **calme plat structurel maintenu côté OpenAI/Azure** (J+11 sora-2 gated preview, T+4 post-shutdown app, aucune comm). Signal actionable : **catch-22 documenté sur l'API Azure OpenAI Video** — audit endpoint requis côté bot. Côté concurrents : HappyHorse-1.0 confirme sa multi-distribution (fal + Bailian + Pixazo) avec commercial release mai. Magic Hour publie son bench 2026 (+35% YoY prompt adherence) — utilisable comme baseline scoring. Veo 4 toujours absent (T-19j de I/O 2026). Pas de bouleversement majeur, juste un signal technique à traiter.*

# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-04-27

**Période couverte :** 2026-04-25 → 2026-04-27 (week-end + lundi, 3 jours depuis dernier rapport 24/04).
**Fenêtre filtrage :** sources ≤ 7 jours, doublons par rapport au rapport 24/04 supprimés.
**Tonalité du jour :** week-end calme post-launch-week. **Événement majeur :** shutdown effectif de l'app Sora le 26/04 (confirmé). Pas d'annonce vidéo OpenAI ni de GA sora-2 sur Azure. Veo 4 toujours absent, Happy Horse 1.0 toujours en pré-API.

---

## 🔴 Nouveautés Sora-2 / OpenAI

### ✅ Shutdown app Sora — EXÉCUTÉ le 26 avril 2026
- **Confirmé** : "The Sora web and app experiences were discontinued on April 26, 2026" — sources alignées (OpenAI Help Center, the-decoder, NBC, Wikipedia, Pixo). T+1 aujourd'hui.
- **API Sora reste live jusqu'au 24/09/2026** (5 mois de runway). Aucun changement de planning sur ce point.
- **Page d'export `sora.chatgpt.com/exports/me`** : confirmée ouverte avant deadline. Si bot a oublié un export résiduel, fenêtre encore courte mais pas catastrophique (data accessible API jusque sept.).

### "Spud" — rumeur RÉSOLUE (rappel + précision)
- **Spud = GPT-5.5** (LLM frontier model, pas vidéo), confirmé Axios 23/04 + sources multiples ce week-end (xpert.digital, MindStudio, trendingtopics).
- **Précision nouvelle (xpert.digital, mindstudio.ai)** : "The Sora team will in future work on so-called *world simulation* research, intended to be used for **robotics applications in the long term**." → **L'équipe Sora est officiellement réaffectée à la recherche world-models robotique**, ce qui **enterre durablement l'hypothèse d'un Sora-3 ou successeur vidéo créatif chez OpenAI**.
- **Implication critique pour le bot** : OpenAI N'A PLUS DE ROADMAP VIDÉO consumer/créatif. Sora-2 sur Azure (avec ses 5 mois d'API) est désormais le **dernier produit vidéo OpenAI**, point. Plan B vidéo (Veo, Seedance, Happy Horse) doit devenir **plan permanent**, pas plan de transition.

### API OpenAI Sora — pas de changement
- Aucun nouveau changelog `/v1/videos` côté OpenAI sur 25-27/04 (vérifié `developers.openai.com/api/docs/changelog`).
- Features ajoutées avant shutdown (rappel) : reusable character refs, 20s clips, 1080p sora-2-pro, video extensions, Batch API — déjà documentés rapports précédents.

### ⚠️ Article TechCrunch « Why OpenAI really shut down Sora » (29/03, contexte)
- Pas neuf, mais utile à recroiser : confirme **coût ~1M USD/jour** + **chute de 1M → <500k MAU** + **enjeu copyright Disney** (deal 1B USD jamais signé). Justifie la décision stratégique. **Pas de retour en arrière à attendre.**

---

## 🔵 Azure AI Foundry

### Sora-2 — toujours gated preview (J+1 post-shutdown app OpenAI)
- **Aucune annonce de GA** sora-2 sur Foundry sur 25-27/04. Statut **gated preview inchangé depuis 8+ jours**.
- Doc officielle Foundry (`learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation`) confirme : **East US 2 + Sweden Central**, accès gated MCA-E/EA + 1000+CU.
- Pricing rappel : Standard $0.10/s, Pro Global $0.30/s, Pro High-Res $0.50/s.
- **Capacités confirmées** : text→video, image→video, video→video, audio synchronisé, prompt understanding studio shots/camera angles. Identique au rapport précédent.

### Page « What's New for April 2026 » Foundry Docs
- URL : `learn.microsoft.com/en-us/azure/foundry/whats-new-foundry`
- **Mention Sora-2 image-to-video** : "The Sora model from OpenAI now supports image-to-video generation, allowing you to provide an image as input to generate a video that incorporates the content of the image. You can also specify the frame of the video in which the image should appear, and it doesn't need to be at the beginning."
- **Régions** : Sweden Central et East US 2 (rappel page docs).
- **Statut** : page d'avril, pas de timestamp précis post-24/04. **Probable refresh de doc consolidée mensuelle, non un nouveau drop**.
- **Bug endpoint `/v1/video/generations/jobs`** : toujours non corrigé, workaround `/openai/v1/videos?api-version=preview` reste la seule voie pour déployer sora-2 (Microsoft Q&A, signal stable depuis 9+ jours).

### Devblogs Foundry — week-end calme
- Pas de nouveau post `devblogs.microsoft.com/foundry/` daté 25-27/04 portant sur la vidéo. Derniers posts pertinents = ceux du 23-24/04 (GPT-5.5 GA, Agent Framework v1.0, Toolboxes, Hosted Agents, Foundry Local GA) — déjà couverts rapport 24/04.
- **Foundry Labs avril 2026** (techcommunity) : MAI-Transcribe-1 (speech recog), MAI-Voice-1 (speech gen), MAI-Image-2 (image, 2× faster). **Aucun MAI-Video annoncé** → Microsoft ne pousse toujours pas de modèle vidéo first-party.
- **Foundry Fine-Tuning April 2026** : 3 updates RFT (Global Training o4-mini, GPT-4.1 graders, RFT best practices). Hors scope vidéo.

---

## 🟢 Alternatives / concurrents

### Veo 3 / Veo 4 (Google DeepMind)
- **Veo 4 toujours NON officiellement annoncé** par DeepMind. "Google has not announced Veo 4 model on official model pages or release notes" (techwelo, confirmé 27/04). **Tous les guides « Veo 4 launch April 2026 » sont des spéculations d'éditeurs SEO** (digen.ai, vo3ai, artlist) — à ignorer comme sources primaires.
- **Veo 3.1 Lite** : public preview Vertex AI confirmée (Google Cloud Blog), modèle le plus cost-efficient de la gamme Veo. **Reste la voie de prod actuelle pour le bot**.
- **Deprecations Vertex AI** (Vertex release notes) : endpoints Imagen/Veo GA legacy → migration recommandée vers nouveaux endpoints Gemini/Veo **avant 30/06/2026**. **Action de hygiène à planifier**.
- **Google I/O 2026 = 19-20/05/2026** → T-22 jours. Fenêtre haute probabilité Veo 4 officiel.

### Happy Horse 1.0 (Alibaba, via fal.ai)
- **Toujours `fal.ai/happyhorse-1.0` en "coming soon"**. API pas encore live au 27/04.
- **Confirmation Alibaba (rappel)** : CNBC 10/04 a confirmé Alibaba comme entreprise derrière Happy Horse. Plus de mystère sur l'attribution.
- **Specs publiées (fal.ai/learn)** :
  - 15B params, 40-layer self-attention Transformer unifié
  - text+image+video+audio dans la même token sequence (single forward pass)
  - 7 langues natives
  - **~38s pour un clip 1080p sur 1× H100** (perf revendiquée)
- **Position leaderboard** (Artificial Analysis Video Arena) : #1 text-to-video (Elo 1355), bat Sora 2 Pro, Seedance 2.0 720p, Kling 3.0.
- **Action** : continuer monitoring quotidien `fal.ai/happyhorse-1.0` jusqu'à API live. Bench prêt à lancer dès accès.

### Autres (rien de neuf majeur 25-27/04)
- **Runway Gen-4** : pas de drop sur fenêtre 7j.
- **Pika 2.5** : silence radio.
- **Kling 3.0** : pas de release majeure.
- **Seedance 2.0** (ByteDance) : live sur fal.ai (statut inchangé), reste plan C activable immédiatement.
- **Luma Dream Machine** : pas d'annonce.

---

## 📌 Actions recommandées

| Priorité | Action | Délai |
|----------|--------|-------|
| 🔴 STRATÉGIQUE | **Acter formellement le pivot OpenAI** : Sora team réaffectée aux world-models robotique → **plus aucune roadmap vidéo créative chez OpenAI**. Cesser de traiter Veo comme "plan B temporaire". **Veo 3.1 (ou Lite) doit devenir le plan A par défaut du bot**, sora-2 Azure devient le plan B. Réviser doc archi en ce sens. | **Cette semaine** |
| 🔴 URGENT | **Vertex AI migration deadline 30/06/2026** : si le bot consomme encore les endpoints `Imagen`/`Veo` GA legacy, planifier migration vers nouveaux endpoints Gemini/Veo recommandés. Sans ça, panne en juillet. | **Avant fin mai** |
| 🟡 MOYEN | **Endpoint Azure sora-2** : s'assurer que `/openai/v1/videos?api-version=preview` est bien en place (vs ancien `/openai/v1/video/generations/jobs`). Bug ancien endpoint toujours non corrigé côté MS. | Vérif ce sprint |
| 🟡 MOYEN | **Happy Horse 1.0** : monitoring quotidien `fal.ai/happyhorse-1.0`. Dès API live, bench 5 prompts représentatifs vs Veo 3.1 + Sora-2. Pas de bascule prod avant pricing publié + TOS clairs. | Veille active |
| 🟡 MOYEN | **Foundry catalog** : prochain refresh `whats-new-foundry` attendu 28/04-04/05 (cycle 7-10j, dernier 17/04). **Recheck ciblé mardi 28/04 + jeudi 30/04** sur GA sora-2. | T+1 à T+7 |
| 🟡 MOYEN | **Audit data Sora résiduelle** : vérifier qu'aucun export legacy via app Sora (shutdown 26/04 — hier) n'est resté pendant. Si oui, basculer sur l'API Sora (live jusqu'au 24/09) pour récupérer. | Cette semaine |
| 🟢 VEILLE | **Google I/O 2026 (19-20/05)** : T-22 j. Fenêtre haute proba **Veo 4** officiel. Préparer plan de bench Veo 4 vs Veo 3.1 + sora-2 dès J+1. | Calendrier |
| 🟢 VEILLE | **Successeur vidéo OpenAI** : tracking **clos**. Pas de roadmap consumer attendue. World-model robotique = horizon 18-24 mois, hors scope bot vidéo. | Clos |
| 🟢 VEILLE | **Deal Disney 1B USD jamais signé** : confirmé (TechCrunch, tech-insider). Aucun retour en arrière sur shutdown. | Clos |

---

## 🔍 Rien de significatif aujourd'hui sur :

- **GA sora-2 Azure** : toujours gated preview (8+ jours inchangé).
- **Annonce Sora-3 ou successeur vidéo OpenAI** : **CONFIRMÉ ABSENT durablement** (équipe Sora pivotée robotique).
- **Veo 4 model card officielle DeepMind** : 12+ jours sans source primaire. Attendre Google I/O.
- **Happy Horse API live** : toujours "coming soon" fal.ai, 19+ jours après leak benchmark.
- **Runway / Pika / Luma / Kling** : silence week-end, aucun drop majeur.
- **Doc MS Learn `whats-new-foundry`** : page consolidée avril, pas de nouveau drop daté post-24/04.
- **Devblogs Foundry** : pas de post 25-27/04 vidéo.
- **MAI-Video first-party Microsoft** : toujours absent du catalog Foundry Labs.

---

## 📊 Évolution vs rapports précédents

| Signal | 22/04 | 23/04 | 24/04 | **27/04** |
|--------|-------|-------|-------|-----------|
| sora-2 GA Azure | Gated preview | Gated preview | Gated preview | **Gated preview** (inchangé 8+ j) |
| Sora app status | T-4 | T-3 | T-2 | **✅ SHUTDOWN exécuté hier 26/04** |
| API Sora OpenAI | Live | Live | Live | **Live, deadline 24/09/2026 (5 mois)** |
| Successeur vidéo OpenAI | Rumeur Spud | Rumeur reprise | Spud=GPT-5.5 (vacuum confirmé) | **Vacuum CONFIRMÉ DURABLEMENT : équipe Sora → world-models robotique** |
| Veo 4 | Pas de card | Pas de card | Pas de card 9j | **Pas de card 12+ j** |
| Happy Horse API | "30/04 via fal" | "late April" | Inchangé | **Inchangé, fin avril dans 3 j** |
| Bug endpoint Azure Video | Documenté | Documenté 7j | Workaround officiel | **Workaround stable, ancien endpoint non corrigé 9+ j** |
| Doc Foundry whats-new | Inchangé | Inchangé | Inchangé 7j | **Inchangé, refresh attendu T+1-7 j** |
| Vertex deprecations | n/a | n/a | n/a | **Migration endpoints Imagen/Veo GA legacy → 30/06/2026 deadline** |
| GPT-5.5 GA Foundry | n/a | OpenAI release | Foundry GA | **Stable, pas d'impact vidéo direct** |

---

## Sources

### Sora app shutdown (exécuté 26/04)
- [OpenAI Help Center — What to know about the Sora discontinuation](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [the-decoder — Two-stage Sora shutdown app April + API September](https://the-decoder.com/openai-sets-two-stage-sora-shutdown-with-app-closing-april-2026-and-api-following-in-september/)
- [NBC News — OpenAI shuttering Sora video-generating service](https://www.nbcnews.com/tech/tech-news/openai-shuttering-sora-video-generating-service-rcna264989)
- [Pixo — Sora's App Is Dead, But the API Still Works Until September](https://pixo.video/blog/sora-api-still-available)
- [Wikipedia — Sora (text-to-video model)](https://en.wikipedia.org/wiki/Sora_(text-to-video_model))
- [TechCrunch — Why OpenAI really shut down Sora (contexte 29/03)](https://techcrunch.com/2026/03/29/why-openai-really-shut-down-sora/)
- [tech-insider — Sora Shutdown: Why Disney Killed Its $150M AI Deal](https://tech-insider.org/openai-sora-shutdown-disney-deal-ai-video-2026/)
- [Futurum Group — Sora discontinuation enterprise impact](https://futurumgroup.com/insights/openai-sora-discontinuation-what-the-end-of-a-platform-means-for-enterprise-ai-strategy/)

### Spud / pivot équipe Sora vers world-models
- [xpert.digital — End of Sora video AI, Spud is coming, Sora team → world simulation robotics](https://xpert.digital/en/the-end-of-the-video-ki-sora/)
- [MindStudio — What Is the OpenAI 'Spud' Model](https://www.mindstudio.ai/blog/what-is-openai-spud-model-next-frontier)
- [Axios — OpenAI releases "Spud" GPT-5.5 model](https://www.axios.com/2026/04/23/openai-releases-spud-gpt-model)

### Sora-2 sur Azure AI Foundry
- [Microsoft Foundry Docs — What's New for April 2026](https://learn.microsoft.com/en-us/azure/foundry/whats-new-foundry)
- [Microsoft Foundry Docs — Sora 2 video generation overview (preview)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Microsoft Foundry Docs — Quickstart: Generate video with Sora](https://learn.microsoft.com/en-us/azure/ai-foundry/openai/video-generation-quickstart?view=foundry-classic)
- [Azure Blog — Sora 2 now available in Azure AI Foundry](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [Azure AI catalog — OpenAI Sora-2](https://ai.azure.com/catalog/models/sora-2)
- [Microsoft Q&A — Azure OpenAI sora v2025-05-02 retiring, sora-2 not visible](https://learn.microsoft.com/en-us/answers/questions/5790204/azure-openai-sora-(model-sora-v2025-05-02)-retirin)
- [Microsoft Q&A — Azure OpenAI Video API gateway catch-22 sora-2](https://learn.microsoft.com/en-us/answers/questions/5860394/azure-openai-video-api-rejects-all-sora-2-deployme)
- [Microsoft Q&A — Sora 2 missing in Model Catalog (East US 2)](https://learn.microsoft.com/en-us/answers/questions/5687513/(issue)-unified-gating-approved-sora-2-missing-in)
- [TechCommunity — What's new in Foundry Labs April 2026 (MAI-Transcribe-1, MAI-Image-2)](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/whats-new-in-foundry-labs---april-2026/4509714)
- [Devblogs Foundry — What's New in Foundry Fine-Tuning April 2026](https://devblogs.microsoft.com/foundry/whats-new-in-foundry-finetune-april-2026/)
- [aibase — Sora 2 launches on Azure pricing $0.10/sec](https://www.aibase.com/news/22055)

### Veo / DeepMind / Vertex AI
- [Google DeepMind — Veo models page](https://deepmind.google/models/veo/)
- [Google Cloud Blog — Build with Veo 3.1 Lite](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-lite/)
- [Google Cloud Blog — Announcing Veo 3, Imagen 4, and Lyria 2 on Vertex AI](https://cloud.google.com/blog/products/ai-machine-learning/announcing-veo-3-imagen-4-and-lyria-2-on-vertex-ai)
- [Vertex AI — Agent Platform release notes (Veo 3.1 Lite preview, deprecations 30/06/2026)](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes)
- [techwelo — When Is Veo 4 Coming Out (analyse statut officiel)](https://techwelo.com/when-is-veo-4-coming-out/)
- [Wikipedia — Veo (text-to-video model)](https://en.wikipedia.org/wiki/Veo_(text-to-video_model))

### Happy Horse 1.0 (Alibaba) / fal.ai
- [fal.ai — Happy Horse 1.0 landing page](https://fal.ai/happyhorse-1.0)
- [fal.ai — HappyHorse-1.0 What Do We Know So Far](https://fal.ai/learn/devs/happyhorse-1-0-what-do-we-know-so-far)
- [CNBC — Alibaba reveals it's behind viral HappyHorse AI](https://www.cnbc.com/2026/04/10/alibaba-happyhorse-ai-video-model-benchmark-reveal.html)
- [24-7pressrelease — Happy Horse 1.0 dominates Video Arena](https://www.24-7pressrelease.com/press-release/533608/happy-horse-10-storms-the-video-arena-mystery-dark-horse-tops-the-global-leaderboard)

### Marché vidéo IA général (contexte)
- [DigitalApplied — AI Video Market After Sora 2026](https://www.digitalapplied.com/blog/ai-video-market-after-sora-runway-kling-veo-2026)
- [Pixflow — Best AI Video Generator 2026](https://pixflow.net/blog/best-ai-video-generator/)
- [llm-stats — AI Updates Today April 2026](https://llm-stats.com/llm-updates)

---

*Rapport généré automatiquement le 2026-04-27 (lundi, post-week-end). Sources ≤ 7 jours sauf rappels de contexte explicites. Événement structurant du jour : shutdown effectif app Sora le 26/04 (T+1) et confirmation que l'équipe Sora est réaffectée à la recherche world-models robotique → vacuum vidéo OpenAI durable. Action stratégique : acter Veo 3.1 comme plan A et sora-2 Azure comme plan B (jusqu'au 24/09 a minima).*

---

## 🔁 Re-check 2e passe (2026-04-27, fin de journée)

Re-balayage automatique en fin de journée — **aucun signal nouveau** par rapport au rapport du matin :

- **OpenAI** : pas de communication post-shutdown app (T+1). Help Center et `openai.com/news` inchangés. Pas de nouveau billet sur la roadmap vidéo ni d'annonce successeur.
- **Azure AI Foundry** : pas de nouveau devblog `devblogs.microsoft.com/foundry/` daté 27/04. `whats-new-foundry` page d'avril toujours consolidée, pas de nouveau drop. **Statut sora-2 : gated preview inchangé** (Sweden Central / East US 2, gating MCA-E/EA + 1000+CU).
- **Veo / Vertex AI** : rappel des releases d'avril déjà capturées (Veo 3.1 Lite GA Vertex AI le 03/04, baisse de prix Veo 3.1 Fast le 07/04, intégration Vids le 04/04). **Pas de nouveau drop ce 27/04**. **Pas de Veo 4.**
- **Happy Horse 1.0** : `fal.ai/happyhorse-1.0` toujours « coming soon » — fenêtre « late April » se rétrécit (J-3).
- **Runway / Pika / Kling / Luma / Seedance** : aucun mouvement sur les 24 dernières heures.

**Conclusion 2e passe** : prochaine fenêtre haute probabilité d'événement = mardi 28/04 matin (cycle MS Foundry blog / ouverture US). **Rapport du matin reste la version de référence.**

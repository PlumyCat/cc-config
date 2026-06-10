# Veille Sora-2 / Microsoft Foundry / Concurrents — 2026-05-28

**Date :** jeudi 28 mai 2026
**Fenêtre couverte :** 27/05 ~08h UTC → 28/05 ~08h UTC (~24h)
**Contexte bot :** Sora-2 sur Microsoft Foundry (ex-Azure AI Foundry) → retirement **2 juin 2026, 19h00 local time tenant (T-5 jours)**. Fallback en cours : Veo 3.1 Lite (Vertex AI).

---

## 🔴 Nouveautés Sora-2 / OpenAI

### Statut Sora-2 — silence radio prolongé, T-5

- **Sora-2 API OpenAI direct** : opérationnelle jusqu'au **24 septembre 2026**. Aucun changement.
- **Sora app/web** : discontinuée depuis le 26 avril 2026 (rappel).
- **Aucune annonce de successeur vidéo OpenAI** sur la fenêtre 27-28 mai. Le silence radio se prolonge (quiet period S-1 toujours en vigueur depuis le dépôt IPO confidentiel du 22 mai).
- **Aucune entrée nouvelle Sora dans le changelog API OpenAI** ([`platform.openai.com/docs/changelog`](https://platform.openai.com/docs/changelog)) sur la fenêtre. Pas de mention Sora-2 ni de successeur.
- **OpenAI News** ([`openai.com/news/`](https://openai.com/news/)) : pas de nouvelle publication majeure 27-28 mai. Dernières en date : provenance/SynthID (20 mai), conjecture géométrie discrète (22 mai), Codex update (26 mai — non vidéo).

### Rappel contexte stratégique OpenAI sur le vidéo

- **Deal Disney/OpenAI** ($1B equity + licensing 200+ personnages Disney/Marvel/Pixar/Star Wars) **terminé** (cf. Variety, avril 2026). OpenAI explicitement *"shifting resources away from video generation"* selon Variety, à mettre en lien avec l'IPO 2026.
- Combiné avec la quiet period S-1 et le shutdown progressif du produit grand public (Sora app, puis API au 24/09/26), **le scénario "OpenAI annonce Sora-3 / successeur vidéo dans les jours qui viennent" est désormais structurellement très improbable**. Aucune raison d'attendre un sauvetage côté OpenAI avant la fenêtre Foundry du 2 juin.
- Sources : [Variety — Why OpenAI and Disney ended their deal (avril 2026)](https://variety.com/2026/digital/news/why-openai-disney-ended-sora-deal-bob-iger-1236698901/), [Variety — OpenAI will shut down Sora video app](https://variety.com/2026/digital/news/openai-shutting-down-sora-video-disney-1236698277/).

### Rappel — Sora Videos API features (toujours en vigueur)

Pour mémoire, les capacités actuelles de l'API Sora-2 utilisée par le bot (jusqu'à shutdown direct le 24/09/26) :
- Custom characters / objects (jusqu'à 2 références par génération)
- Clips 4/8/12/16/20 secondes
- Export 1080p horizontal (1920×1080) et vertical (1080×1920) pour `sora-2-pro`
- Video continuation (extend scenes)
- Batch API pour `POST /v1/videos`
- `POST /v1/videos/edits` (remplaçant `remix`, qui sera deprecated dans 6 mois)

Inchangé fenêtre 27-28 mai.

---

## 🔵 Microsoft Foundry (ex-Azure AI Foundry)

### Retirement Sora-2 v2025-10-06 — toujours bloqué au 2 juin, T-5

- **Position MS inchangée** : aucun signal d'extension publié sur la fenêtre 27-28 mai. La réponse écrite du 13 mai (Karnam Venkata Rajeswari, MS External Staff) reste la position officielle : *"we do not have the ability to extend or override the retirement window for that specific model version beyond the published retirement date shown in the portal."*
- Thread Q&A ([learn.microsoft.com/en-in/answers/questions/5881436](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)) : toujours sans réponse du client depuis le follow-up du 14 mai. Pas de mouvement.
- Doc lifecycle ([learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)) inchangée — *"These dates are not extendable; exceptions are not granted"*.
- ⚠️ **Cohérence dates** : un résultat de recherche tiers ([learn.microsoft.com — answer du 27/05](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)) rapporte aujourd'hui « *Azure OpenAI Foundry currently plans to prematurely end support for Sora 2 on June 6, 2026* ». Le **portail Azure AI Foundry et la doc officielle MS confirment toujours June 2, 2026 (7:00 PM local)** — **seule date faisant foi**. Cette divergence de quelques jours doit être ignorée : se référer au portail tenant.
- ⚠️ **Info à vérifier** : une recherche tierce indique que « *Microsoft Azure tweeted in March that Microsoft Foundry is committed to continued support for Sora 2 for the next 6 months* ». Cette assertion **n'apparaît dans aucune source first-party**, ni dans le portail Foundry, ni dans la doc retirement, ni dans le fil officiel @Azure. **À traiter comme non confirmé** (probablement une mauvaise interprétation de blog post tiers). **Ne pas en faire un argument auprès du métier**.

**Implications bot** : à **T-5 jours**, la fenêtre est critique. Aucun signal new d'extension *in extremis* avant Build 2026. Le bot **doit** être totalement basculé sur Veo 3.1 Lite (Vertex AI) avant le 2 juin 19h00 local. Plan B = utiliser directement l'API Sora-2 OpenAI (jusqu'au 24/09/26) si le pipeline le permet — coûts/quotas à vérifier.

### Pas de modèle vidéo first-party Foundry annoncé

- Rappel **"What's New in Microsoft Foundry Labs – May 2026"** ([techcommunity.microsoft.com](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/whats-new-in-microsoft-foundry-labs-%E2%80%93-may-2026/4520310)) : **Fara 1.5**, **MAI-Image-2-Efficient** (text-to-image only), **SocialReasoning-Bench**, **EO/OS Object Detection**. **Rien sur vidéo**.
- Veo absent du catalogue Foundry.
- **Foundry restera sans capacité vidéo à partir du 2 juin** sauf annonce surprise à Build.

### Build 2026 — T-5, J-5

- **Microsoft Build : 2-3 juin 2026** à Fort Mason Center, San Francisco. Capacité 2 500 attendees in-person (édition réduite, première hors Seattle/Redmond depuis 2016).
- **Keynote Day 1 (2 juin)** : Satya Nadella en ouverture, Scott Guthrie (EVP Cloud + AI), Scott Hanselman, Kyle Daigle (COO GitHub) confirmés. Focus officiel : "agents en production".
- **7 tracks** : Agents & Apps · Azure AI Platform / Foundry · GitHub & developer productivity · Microsoft Fabric · Responsible AI · Windows · Working with Models. **Aucune session vidéo explicite** dans le catalogue publié (inchangé). Foundry au catalogue : **LTG419** + **Lab532**.
- Source : [Lensmor — Build 2026 Attendee Guide](https://www.lensmor.com/event-guides/microsoft-build-2026-attendee-guide), [Thurrott — Session catalog is Now Live](https://www.thurrott.com/microsoft/334704/microsofts-build-2026-session-catalog-is-now-live).
- **Hypothèse maintenue** : si MS prépare une extension Sora-2 ou un remplaçant vidéo first-party, l'annonce tombera au keynote Day 1 (2 juin), jour exact du retirement. À T-5, **toujours aucun teaser vidéo** dans les sessions publiées. **Probabilité d'annonce vidéo faible mais non nulle** (cf. timing exact + reformulation MS "Microsoft Foundry" vs "Azure AI Foundry" qui pourrait signaler un repositionnement vidéo).

---

## 🟢 Alternatives / Concurrents

### Veo 3.1 — pas de news 27-28 mai

- Aucune update Veo 3.1 sur la fenêtre 27-28 mai.
- Rappel : **Fast Relaxed deprecated le 10 mai 2026**.
- Famille Veo 3.1 sur Vertex AI inchangée :

| Tier | Statut | Use case bot |
|------|--------|--------------|
| **Veo 3.1** | Paid preview Gemini API + Vertex AI | Qualité max, audio natif |
| **Veo 3.1 Fast** | Paid preview | Latence réduite |
| **Veo 3.1 Lite** | Public preview Vertex AI (depuis 31/03) | **Choix actuel du bot** — coût < 50% Fast |
| **Veo Upscaling** | Standalone Vertex AI | 1080p/4K standalone |

- Capacités notables : output natif vertical 9:16 pour Shorts, upscaling 1080p et 4K supporté indépendamment du modèle source (Veo, autre IA, ou vidéo caméra).
- Sources : [Veo 3.1 Lite + Upscaling — Google Cloud Blog](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai), [Veo 3.1 — Google Developers Blog](https://developers.googleblog.com/introducing-veo-3-1-and-new-creative-capabilities-in-the-gemini-api/), [Veo 3.1 Ingredients to Video — Google Blog](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-ingredients-to-video/).

### Veo 4 — toujours non confirmé officiellement ⚠️

- Sur la fenêtre 27-28 mai, mêmes articles tiers ("veo3ai.io", "imagine.art", "vexub.com") continuent d'affirmer un release Veo 4 "officiel" en avril 2026. **Aucune confirmation `blog.google` ni `deepmind.google`** — la page modèle officielle ([deepmind.google/models/veo](https://deepmind.google/models/veo/)) reste **Veo 3.1**.
- Le rappel I/O 2026 (19/05) confirme que Google a privilégié **Gemini Omni Flash**, pas Veo 4.
- **Verdict** : ⚠️ Veo 4 reste **non confirmé** par sources first-party. **Ne pas baser de décision sur ces rapports**.

### Concurrents — pas de news majeure 27-28 mai

- **Runway** : `releasebot.io/updates/runwayai` confirme que la plateforme Runway expose en API plusieurs modèles tiers — Kling 3.0, Kling 2.6 Pro, Kling 2.5 Turbo Pro, WAN2.2 Animate, GPT-Image-1.5 et **Sora 2 Pro** (note : si bot bloqué côté Foundry post-2 juin, **Runway pourrait être un point d'accès tiers à Sora-2 Pro** — à investiguer, sous réserve quotas/coûts/CGU).
- **Kling 3.0** (5/02/26) : pas d'update. Native 4K, 60fps, 15s clips, lipsync multilingue.
- **Seedance 2.0** (ByteDance) : disponible via Runway API depuis 17/04. Reste top sur Artificial Analysis.
- **HappyHorse-1.0** (Alibaba ATH) : toujours #1 Artificial Analysis sans audio.
- **Pika, Vidu, Synthesia, HeyGen** : pas de news significative.

Sources classement : [AI/ML API Blog — Best AI Video Generators 2026](https://aimlapi.com/blog/best-ai-video-generators-2026-veo-3-1-kling-sora-2-seedance-more-compared), [Runway AI Release Notes - May 2026 — Releasebot](https://releasebot.io/updates/runwayai).

---

## 📌 Actions recommandées

1. **🔴 PRIORITÉ 1 — Bascule Veo 3.1 Lite à finaliser maintenant.** T-5 jours. Si pas encore lancé, démarrer aujourd'hui les tests E2E sur set de prompts représentatifs. Vérifier quotas Vertex AI et facturation.
2. **🔴 PRIORITÉ 2 — Plan B "API Sora-2 directe OpenAI"** : valider la faisabilité technique (auth, endpoints, quotas) en parallèle de Veo. Disponible jusqu'au **24 septembre 2026**.
3. **🟡 PRIORITÉ 3 — Build 2026 keynote Day 1 (2 juin)** : surveiller en live (a) extension Sora-2, (b) modèle vidéo first-party MS, (c) intégration Veo dans Foundry. À T-5, aucun teaser → probabilité faible mais non nulle.
4. **🟡 PRIORITÉ 4 — Plan C "Runway en passerelle Sora-2 Pro"** : nouveau plan B alternatif identifié aujourd'hui. Runway expose Sora-2 Pro en API. À investiguer côté CGU, quotas, coûts — utile si Veo bug ou si OpenAI direct bloqué.
5. **🟡 PRIORITÉ 5 — Service Health alerts Azure** sur deployment Sora-2 v2025-10-06. Vérifier que les alertes sont actives (filter `Azure OpenAI Service`).
6. **🟢 PRIORITÉ 6 — Multi-fournisseurs en backup** : garder Kling 3.0 prêt (clé API, prompts) au cas où Veo 3.1 Lite subirait panne/quota après le 2 juin.
7. **🟢 PRIORITÉ 7 — Documenter la décision finale** (Veo 3.1 Lite primary post-2 juin) avec rationale, comparatif coûts, plan de migration éventuel si MS annonce un remplaçant Sora-2 à Build.

---

## Sources

### OpenAI / Sora
- [Sora 2 is here | OpenAI](https://openai.com/index/sora-2/)
- [What to know about the Sora discontinuation | OpenAI Help Center](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [Sora 2 Model | OpenAI API](https://developers.openai.com/api/docs/models/sora-2)
- [Video generation with Sora | OpenAI API](https://developers.openai.com/api/docs/guides/video-generation)
- [OpenAI News](https://openai.com/news/)
- [OpenAI API Changelog](https://platform.openai.com/docs/changelog)
- [OpenAI API Deprecations](https://developers.openai.com/api/docs/deprecations)
- [OpenAI Release Notes — May 2026 — Releasebot](https://releasebot.io/updates/openai)
- [Variety — Why OpenAI and Disney ended their deal](https://variety.com/2026/digital/news/why-openai-disney-ended-sora-deal-bob-iger-1236698901/)
- [Variety — OpenAI shutting down Sora video; Disney drops $1B](https://variety.com/2026/digital/news/openai-shutting-down-sora-video-disney-1236698277/)
- [Is the Sora2 API still working? — OpenAI Developer Community](https://community.openai.com/t/is-the-sora2-api-still-working/1379946)

### Microsoft Foundry / Azure
- [Sora 2 in Azure AI Foundry: Create videos with responsible AI](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [Sora 2 video generation overview (preview) — Microsoft Foundry](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Foundry Models lifecycle and support policy](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)
- [Azure AI Foundry Sora 2 retirement date — Microsoft Q&A](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)
- [Azure OpenAI is prematurely cutting off Sora 2 — OpenAI Dev Community](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475)
- [AI Model Catalog | Microsoft Foundry — Sora 2](https://ai.azure.com/catalog/models/sora-2)
- [What's New in Microsoft Foundry Labs – May 2026](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/whats-new-in-microsoft-foundry-labs-%E2%80%93-may-2026/4520310)
- [Microsoft Build 2026 Session Catalog Now Live — Thurrott](https://www.thurrott.com/microsoft/334704/microsofts-build-2026-session-catalog-is-now-live)
- [Microsoft Build 2026 Attendee Guide — Lensmor](https://www.lensmor.com/event-guides/microsoft-build-2026-attendee-guide)
- [Microsoft Build 2026 Preview — ChatForest](https://chatforest.com/reviews/microsoft-build-2026-preview/)

### Veo / Google DeepMind
- [Veo 3.1 Lite and a new Veo upscaling capability on Vertex AI](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)
- [Introducing Veo 3.1 — Google Developers Blog](https://developers.googleblog.com/introducing-veo-3-1-and-new-creative-capabilities-in-the-gemini-api/)
- [Veo 3.1 Ingredients to Video — Google Blog](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-ingredients-to-video/)
- [Veo 3.1 — Google DeepMind](https://deepmind.google/models/veo/)
- [Vertex AI release notes](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes)

### Concurrents / Benchmarks
- [Best AI Video Generators 2026 — AI/ML API](https://aimlapi.com/blog/best-ai-video-generators-2026-veo-3-1-kling-sora-2-seedance-more-compared)
- [Runway AI Release Notes - May 2026 — Releasebot](https://releasebot.io/updates/runwayai)
- [Runway vs Kling vs Pika vs Luma — Soloa](https://soloa.ai/blog/runway-vs-kling-vs-pika-vs-luma-ai-video-2026)

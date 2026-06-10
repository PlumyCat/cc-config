# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-05-27

**Date :** mercredi 27 mai 2026
**Fenêtre couverte :** 26/05 ~08h UTC → 27/05 ~08h UTC (~24h)
**Contexte bot :** Sora-2 sur Microsoft Foundry (ex-Azure AI Foundry) → retirement **2 juin 2026, 19h00 local time tenant (T-6 jours)**. Fallback actuel : Veo 3.1 Lite (Vertex AI).

---

## 🔴 Nouveautés Sora-2 / OpenAI

### Statut Sora-2 — strict statu quo, T-6 avant retirement Foundry

- **Sora-2 API OpenAI direct** : opérationnelle jusqu'au **24 septembre 2026**. Aucun changement.
- **Sora app/web** : discontinuée depuis le 26 avril 2026 (rappel).
- **Aucune annonce de successeur vidéo OpenAI** sur la fenêtre 26-27 mai. Le silence radio se prolonge (quiet period S-1 toujours en vigueur depuis le dépôt IPO confidentiel du 22 mai).

### Activité OpenAI 26-27 mai

- **Aucune annonce vidéo** dans le changelog API OpenAI ([`platform.openai.com/docs/changelog`](https://platform.openai.com/docs/changelog)) sur la fenêtre. Pas de mention Sora-2 ni de successeur.
- **OpenAI News** ([`openai.com/news/`](https://openai.com/news/)) : pas de nouvelle publication majeure sur la fenêtre 26-27 mai. Dernières en date : provenance/SynthID (20 mai), conjecture géométrie discrète (22 mai).
- **Codex** a publié une mise à jour le **26 mai 2026** (goals enabled by default, permission profiles, remote-control, Windows sandbox, package archive pipeline) — pertinent dev mais **non lié à Sora**. Source : [Releasebot OpenAI updates](https://releasebot.io/updates/openai).

### Rappel — Sora Videos API features (octobre 2025, toujours en vigueur)

Pour mémoire, les capacités actuelles de l'API Sora-2 utilisée par le bot (jusqu'à shutdown direct le 24/09/26) :
- Custom characters / objects (jusqu'à 2 références par génération)
- Clips 4/8/12/16/20 secondes
- Export 1080p horizontal (1920×1080) et vertical (1080×1920) pour `sora-2-pro`
- Video continuation (extend scenes)
- Batch API pour `POST /v1/videos`

Source : [OpenAIDevs sur X](https://x.com/OpenAIDevs/status/2032142448970121468), [Sora 2 Model docs](https://developers.openai.com/api/docs/models/sora-2). Ces capacités étaient déjà connues — **rien de nouveau sur la fenêtre 26-27 mai**.

---

## 🔵 Microsoft Foundry (ex-Azure AI Foundry)

### Retirement Sora-2 v2025-10-06 — toujours bloqué au 2 juin, T-6

- **Position MS inchangée** : aucun signal d'extension publié sur la fenêtre 26-27 mai. La réponse écrite du 13 mai (Karnam Venkata Rajeswari, MS External Staff) reste la position officielle : *"we do not have the ability to extend or override the retirement window for that specific model version beyond the published retirement date shown in the portal."*
- Thread Q&A ([learn.microsoft.com/en-in/answers/questions/5881436](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)) : **toujours sans réponse du client** depuis le follow-up du 14 mai. Pas de mouvement.
- Doc lifecycle ([learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)) inchangée — "These dates are not extendable; exceptions are not granted".
- ⚠️ **Note de cohérence sources** : certains tiers (sites de revue, articles de synthèse) rapportent par erreur "**June 6, 2026**" comme date de retirement Foundry. Le **portail Azure AI Foundry et la doc officielle MS confirment June 2, 2026 (7:00 PM local)** — la seule date faisant foi. À ignorer les rapports tiers divergents.

**Implications bot** : à **T-6 jours**, la fenêtre est désormais critique. Aucun signal new d'extension *in extremis* avant Build. Le bot **doit** être totalement basculé sur Veo 3.1 Lite (Vertex AI) avant le 2 juin 19h00 local. Plan B = utiliser directement l'API Sora-2 OpenAI (jusqu'au 24/09/26) si le pipeline le permet — coûts/quotas à vérifier.

### Pas de modèle vidéo first-party Foundry annoncé

- Rappel **"What's New in Microsoft Foundry Labs – May 2026"** ([techcommunity.microsoft.com/blog/azure-ai-foundry-blog/whats-new-in-microsoft-foundry-labs-may-2026/4520310](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/whats-new-in-microsoft-foundry-labs-%E2%80%93-may-2026/4520310)) : **Fara 1.5** (computer-use, 4B/9B/27B sur Qwen 3.5), **MAI-Image-2-Efficient**, **SocialReasoning-Bench**, **EO/OS Object Detection**. **Rien sur vidéo**, confirmation à 24h près.
- **MAI-Image-2** reste text-to-image only.
- Veo absent du catalogue Foundry.
- **Foundry restera donc sans capacité vidéo à partir du 2 juin** sauf annonce surprise à Build.

### Build 2026 — T-6, J-J

- **Microsoft Build : 2-3 juin 2026** à Fort Mason Center, San Francisco. Capacité 2 500 attendees (édition réduite, première hors Seattle).
- **Keynote Day 1** : Satya Nadella en ouverture, Scott Guthrie (EVP Cloud + AI), Scott Hanselman, Kyle Daigle (COO GitHub) confirmés. Focus officiel : "opportunity for developers across our platforms in this era of AI".
- **7 tracks confirmées** : Agents & Apps · Azure AI Platform / Foundry · GitHub & developer productivity · Microsoft Fabric · Responsible AI · Windows · Working with Models.
- **Aucun track ni session vidéo explicite** dans le catalogue publié. Sessions Foundry au catalogue : **LTG419** + **Lab532** (inchangé).
- Source : [Thurrott — Build 2026 Session Catalog is Now Live](https://www.thurrott.com/microsoft/334704/microsofts-build-2026-session-catalog-is-now-live), [ChatForest — Build 2026 Preview](https://chatforest.com/reviews/microsoft-build-2026-preview/), [Lensmor — Build 2026 Attendee Guide](https://www.lensmor.com/event-guides/microsoft-build-2026-attendee-guide).
- **Hypothèse maintenue** : si MS prépare une extension Sora-2 ou un remplaçant vidéo first-party, l'annonce tombera au keynote Day 1 (2 juin), jour exact du retirement. À T-6, **toujours aucun teaser vidéo** dans les sessions publiées. Probabilité d'annonce vidéo faible mais non nulle.

---

## 🟢 Alternatives / Concurrents

### Veo 3.1 — pas de news 26-27 mai

- Aucune update Veo 3.1 sur la fenêtre 26-27 mai.
- Rappel : **Fast Relaxed deprecated le 10 mai 2026** (deprecation déjà notée).
- Famille Veo 3.1 sur Vertex AI inchangée :

| Tier | Statut | Use case bot |
|------|--------|--------------|
| **Veo 3.1** | Paid preview Gemini API + Vertex AI | Qualité max, audio natif |
| **Veo 3.1 Fast** | Paid preview | Latence réduite |
| **Veo 3.1 Lite** | Public preview Vertex AI (depuis 31/03) | **Choix actuel du bot** — coût < 50% Fast |
| **Veo Upscaling** | Private preview (public soon) Vertex AI | 1080p/4K standalone |

Sources : [Veo 3.1 Lite + Upscaling — Google Cloud Blog](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai), [Veo 3.1 — Google Developers Blog](https://developers.googleblog.com/introducing-veo-3-1-and-new-creative-capabilities-in-the-gemini-api/).

### Veo 4 — sources contradictoires, ⚠️ non confirmé officiellement

- Sur la fenêtre 26-27 mai, plusieurs articles tiers ("veo3ai.io", "imagine.art") affirment toujours que **Veo 4 aurait été "officiellement publié en avril 2026"** par DeepMind. **Aucune confirmation côté `blog.google` ni `deepmind.google`** — la page modèle officielle reste "Veo 3.1".
- Le rappel I/O 2026 (19/05) confirme que Google a privilégié **Gemini Omni Flash**, pas Veo 4.
- **Verdict** : ⚠️ Veo 4 reste **non confirmé** par sources first-party. Les revues spécialisées qui le mentionnent semblent extrapoler à partir des teasers DeepMind du 28-30 mars. **Ne pas baser de décision sur ces rapports**.

### Concurrents — pas de news majeure 26-27 mai

- **Kling 3.0** (5/02/26) : pas d'update. Native 4K, 60fps, lipsync multilingue.
- **Seedance 2.0** (ByteDance, 10-12/02/26) : disponible via Runway API depuis 17/04. Reste #1-2 sur Artificial Analysis.
- **HappyHorse-1.0** (Alibaba ATH, avril 2026) : toujours #1 Artificial Analysis sans audio.
- **Runway Gen-4.5** : disponible API, hors top 10 Artificial Analysis.
- **Pika, Vidu, Synthesia, HeyGen** : pas de news significative.

Source classement : [AI/ML API Blog — Best AI Video Generators 2026](https://aimlapi.com/blog/best-ai-video-generators-2026-veo-3-1-kling-sora-2-seedance-more-compared), [AICC — Seedance 2.0 vs top competitors](https://www.ai.cc/blogs/seedance-2-vs-top-ai-video-generators-2026/).

---

## 📌 Actions recommandées

1. **🔴 PRIORITÉ 1 — Bascule Veo 3.1 Lite validée fin de semaine.** T-6 jours. Tester end-to-end un set de prompts représentatifs aujourd'hui ou demain. Vérifier quotas Vertex AI et facturation.
2. **🔴 PRIORITÉ 2 — Plan B "API Sora-2 directe OpenAI"** : valider la faisabilité technique (auth, endpoints, quotas) en parallèle de Veo. Si Veo 3.1 Lite décevant ou bloqué quotas, ce plan B reste disponible jusqu'au **24 septembre 2026**.
3. **🟡 PRIORITÉ 3 — Build 2026 keynote Day 1 (2 juin)** : surveiller en live (a) extension Sora-2, (b) modèle vidéo first-party MS, (c) intégration Veo dans Foundry. À T-6, aucun teaser → probabilité faible mais non nulle.
4. **🟡 PRIORITÉ 4 — Service Health alerts Azure** sur deployment Sora-2 v2025-10-06. Vérifier que les alertes sont actives pour capter toute extension *in extremis* (filter `Azure OpenAI Service`).
5. **🟢 PRIORITÉ 5 — Multi-fournisseurs en backup** : garder Kling 3.0 et Runway Gen-4.5 prêts (clés API, prompts) au cas où Veo 3.1 Lite subirait panne/quota après le 2 juin.
6. **🟢 PRIORITÉ 6 — Documenter la décision finale** (Veo 3.1 Lite primary post-2 juin) avec rationale, comparatif coûts, plan de migration éventuel si MS annonce un remplaçant Sora-2 à Build.

---

## Sources

### OpenAI / Sora
- [Sora 2 is here | OpenAI](https://openai.com/index/sora-2/)
- [What to know about the Sora discontinuation | OpenAI Help Center](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [Sora 2 Model | OpenAI API](https://developers.openai.com/api/docs/models/sora-2)
- [OpenAI News](https://openai.com/news/)
- [OpenAI API Changelog](https://platform.openai.com/docs/changelog)
- [OpenAI Release Notes May 2026 — Releasebot](https://releasebot.io/updates/openai)
- [OpenAIDevs sur X — Sora 2 Video API capabilities](https://x.com/OpenAIDevs/status/2032142448970121468)
- [Sora 2 Prompting Guide — OpenAI Cookbook](https://developers.openai.com/cookbook/examples/sora/sora2_prompting_guide)
- [Sora-2 API shutdown date: termination on September 24 — Apiyi.com](https://help.apiyi.com/en/sora-2-api-shutdown-alternatives-2026-en.html)

### Microsoft Foundry / Azure
- [Sora 2 in Azure AI Foundry: Create videos with responsible AI](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [Sora 2 video generation overview (preview) — Microsoft Foundry](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Foundry Models lifecycle and support policy](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)
- [Azure AI Foundry Sora 2 retirement date — Microsoft Q&A](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)
- [Azure OpenAI is prematurely cutting off Sora 2 — OpenAI Dev Community](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475)
- [AI Model Catalog | Microsoft Foundry — Sora 2](https://ai.azure.com/catalog/models/sora-2)
- [What's New in Microsoft Foundry Labs – May 2026](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/whats-new-in-microsoft-foundry-labs-%E2%80%93-may-2026/4520310)
- [Microsoft Foundry: The New Name for Azure AI Foundry — Schneider IT](https://www.schneider.im/microsoft-foundry-the-new-name-for-azure-ai-foundry/)
- [Microsoft Build 2026 Session Catalog Now Live — Thurrott](https://www.thurrott.com/microsoft/334704/microsofts-build-2026-session-catalog-is-now-live)
- [Microsoft Build 2026 Preview — ChatForest](https://chatforest.com/reviews/microsoft-build-2026-preview/)
- [Microsoft Build 2026 Attendee Guide — Lensmor](https://www.lensmor.com/event-guides/microsoft-build-2026-attendee-guide)

### Veo / Google DeepMind
- [Veo 3.1 Lite and a new Veo upscaling capability on Vertex AI](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)
- [Introducing Veo 3.1 — Google Developers Blog](https://developers.googleblog.com/introducing-veo-3-1-and-new-creative-capabilities-in-the-gemini-api/)
- [Veo updates in Flow — Google Blog](https://blog.google/technology/ai/veo-updates-flow/)
- [Veo 3.1 — Google DeepMind](https://deepmind.google/models/veo/)
- [Vertex AI release notes](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes)

### Concurrents / Benchmarks
- [Best AI Video Generators 2026 — AI/ML API](https://aimlapi.com/blog/best-ai-video-generators-2026-veo-3-1-kling-sora-2-seedance-more-compared)
- [Seedance 2.0 vs. Kling, Runway & Sora — AICC](https://www.ai.cc/blogs/seedance-2-vs-top-ai-video-generators-2026/)
- [Runway AI Release Notes - May 2026 — Releasebot](https://releasebot.io/updates/runwayai)
- [Kling AI, Runway, Vidu: The AI Video Generators Set to Replace Sora — Bloomberg](https://www.bloomberg.com/news/articles/2026-04-01/kling-ai-runway-vidu-the-ai-video-generators-set-to-replace-openai-s-sora)

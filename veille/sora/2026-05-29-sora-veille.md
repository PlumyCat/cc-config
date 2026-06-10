# Veille Sora-2 / Microsoft Foundry / Concurrents — 2026-05-29

**Date :** vendredi 29 mai 2026
**Fenêtre couverte :** 28/05 ~08h UTC → 29/05 ~08h UTC (~24h)
**Contexte bot :** Sora-2 sur Microsoft Foundry (ex-Azure AI Foundry) → retirement **2 juin 2026, 19h00 local time tenant (T-4 jours)**. Fallback en cours : Veo 3.1 Lite (Vertex AI).

---

## 🔴 Nouveautés Sora-2 / OpenAI

### Statut Sora-2 — silence radio prolongé, T-4

- **Sora-2 API OpenAI direct** : opérationnelle jusqu'au **24 septembre 2026**. Inchangé. Pas de nouvel entrée changelog OpenAI sur la fenêtre 28-29 mai concernant Sora.
- **Sora app/web** : discontinuée depuis le 26 avril 2026 (rappel).
- **Aucune annonce de successeur vidéo OpenAI** sur la fenêtre 28-29 mai. La quiet period S-1 reste en vigueur depuis le dépôt IPO confidentiel du 22 mai.
- **Page OpenAI Deprecations** ([developers.openai.com/api/docs/deprecations](https://developers.openai.com/api/docs/deprecations)) : confirme la deprecation Videos API + sora-2 / sora-2-pro / snapshots `sora-2-2025-10-06`, `sora-2-2025-12-08`, `sora-2-pro-2025-10-06` au **24 sept 2026**. Aucun replacement nommé.

### OpenAI 28-29 mai — nouveauté business, pas vidéo

- **Lancement DeployCo** (28 mai) : subsidiaire consulting OpenAI, $4B initial capital, lead TPG, co-investisseurs Goldman Sachs, Bain Capital, McKinsey, Capgemini. Acquisition simultanée de **Tomoro** (consulting AI, 150 forward-deployed engineers).
- **Implication pour la veille vidéo** : confirme la trajectoire OpenAI sur l'**enterprise services / IPO**, et accentue l'hypothèse "pas de Sora-3 imminent". Le S-1 quiet period + la stratégie de monétisation enterprise réduisent encore la probabilité d'une annonce produit vidéo grand-public avant la fenêtre Foundry du 2 juin.
- Source : [AI News Today - May 28, 2026 — buildfastwithai](https://www.buildfastwithai.com/blogs/ai-news-today-may-28-2026).

### Rappel — Sora Videos API features (toujours en vigueur jusqu'au 24/09)

Inchangé fenêtre 28-29 mai : custom characters (≤2 refs), clips 4/8/12/16/20s, export 1080p H/V pour `sora-2-pro` ($0.70/sec), continuation, Batch API, `POST /v1/videos/edits` (remplace `remix` deprecated dans 6 mois).

---

## 🔵 Microsoft Foundry (ex-Azure AI Foundry)

### Retirement Sora-2 v2025-10-06 — toujours bloqué au 2 juin, T-4

- **Position MS inchangée** : aucun signal d'extension publié sur la fenêtre 28-29 mai. La réponse écrite du 13 mai reste la position officielle (*"we do not have the ability to extend or override the retirement window…"*).
- Thread Q&A ([learn.microsoft.com/answers/questions/5881436](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)) : confirme que la **politique d'extension est non négociable** par MS support ; *"any change to a model's retirement date or lifecycle would have to come from the product team and would be reflected in the official Model Retirement Schedule, and there is no supported mechanism for customers or support to request an extension beyond those published dates"*.
- **Confirmation business risk** : la même Q&A confirme aujourd'hui que *"as of now, there are no alternative video generation models hosted in Foundry that developers can migrate to, as Sora 2 is the only option, so retiring it early on June 2 would effectively remove video generation support from Foundry."* → **Foundry sera sans vidéo first-party à partir du 2 juin** (sauf annonce surprise à Build).
- ⚠️ La même Q&A continue à citer le tweet MS de mars (« committed to continued support for Sora 2 for the next 6 months »). **Toujours pas de source first-party identifiée** côté @Azure / blog Azure. À traiter comme **non confirmé** — ne pas en faire un argument auprès du métier.

### Pas de modèle vidéo first-party Foundry annoncé

- Catalogue MAI inchangé : **MAI-Image-2 / MAI-Image-2-Efficient** (text-to-image only, **pas de vidéo**), **MAI-Voice-1**, **MAI-Transcribe-1**. **GPT-image-2** en preview Foundry pour image jusqu'à 4K — image only.
- Aucun MAI-Video annoncé.
- Sources : [TechCrunch — Microsoft takes on AI rivals with three new foundational models](https://techcrunch.com/2026/04/02/microsoft-takes-on-ai-rivals-with-three-new-foundational-models/), [TechCommunity — Introducing MAI-Transcribe-1, MAI-Voice-1, MAI-Image-2](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/introducing-mai-transcribe-1-mai-voice-1-and-mai-image-2-in-microsoft-foundry/4507787).

### Build 2026 — T-4, J-4

- **Microsoft Build 2-3 juin 2026** à Fort Mason Center, San Francisco. Inchangé.
- **Keynote Day 1 (2 juin)** : Satya Nadella en ouverture. Focus officiel "agents en production" + plateforme Foundry. Live keynote sur YouTube ([youtube.com/live/FFMm454fxNA](https://www.youtube.com/live/FFMm454fxNA)).
- **Catalogue sessions** : toujours **7 tracks**, **aucune session vidéo explicite** publiée à 4 jours du keynote. Foundry au catalogue (LTG419, Lab532, etc.).
- **Hypothèse maintenue** : si MS prépare une extension Sora-2 ou un remplaçant vidéo first-party, l'annonce tombera au keynote Day 1 (2 juin), jour exact du retirement. À T-4, **toujours aucun teaser vidéo**. **Probabilité d'annonce vidéo faible mais non nulle**.
- Sources : [Microsoft Build 2026 Preview — ChatForest](https://chatforest.com/reviews/microsoft-build-2026-preview/), [Lensmor — Build 2026 Attendee Guide](https://www.lensmor.com/event-guides/microsoft-build-2026-attendee-guide).

---

## 🟢 Alternatives / Concurrents

### Veo 3.1 — ⚠️ mention "28 mai 2026 Ingredients to Video" à vérifier

- Une recherche tierce remonte aujourd'hui : *"On May 28, 2026, Google announced Veo 3.1 Ingredients to Video with new creative capabilities… native vertical 9:16, upscaling 1080p/4K, richer dialogue, identity consistency."*
- ⚠️ **Probable republication / article récapitulatif** : la feature **Ingredients to Video** + 9:16 natif + upscaling 1080p/4K avait déjà été annoncée mi-mai (cf. blog Google ["Veo 3.1 Ingredients to Video"](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-ingredients-to-video/) et ["Veo 3.1 Lite + Upscaling on Vertex AI"](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)). **La date "28 mai" semble être celle d'un article résumé, pas d'un lancement**. **Pas de nouveauté Veo confirmée sur la fenêtre 28-29 mai**.
- Famille Veo 3.1 sur Vertex AI inchangée : **Veo 3.1 / Fast / Lite / Upscaling**. Veo 3.1 Lite (public preview) = choix actuel du bot.

### Veo 4 — toujours non confirmé officiellement ⚠️

- Aucune confirmation `blog.google` / `deepmind.google` Veo 4 sur la fenêtre.
- La page modèle officielle ([deepmind.google/models/veo](https://deepmind.google/models/veo/)) reste **Veo 3.1**.
- Articles tiers continuant à parier sur "Veo 4 à Google I/O 2026" → I/O a eu lieu 19-20 mai sans annonce Veo 4 (Gemini Omni Flash a pris la lumière). **Verdict : ne pas attendre Veo 4 dans l'immédiat**.

### Concurrents — Runway Gen-4.5 confirmé en API

- **Runway Gen-4.5** : confirmé disponible via **Runway API**, supporte text-to-video + image-to-video, durations **2-10s**. Top Artificial Analysis text-to-video à **1247 Elo points** début 2026.
- **Runway expose toujours Sora-2 Pro en API** (cf. rapport 28/05). Plan C "Runway en passerelle Sora-2 Pro" reste valide post-2 juin.
- **Kling 3.0** (5/02/26) : inchangé. Native 4K, 60fps, 15s clips, lipsync multilingue, storyboard tool.
- **Pika** : Pikaframes (start image + end image → 1-10s transition), Pikaswaps / Pikatwists / Pikaffects.
- **Seedance 2.0** (ByteDance) : via Runway API depuis 17/04, performant sur Artificial Analysis.
- **HappyHorse-1.0** (Alibaba ATH) : toujours en tête Artificial Analysis sans audio.
- Pas de news majeure 28-29 mai.

Sources : [Best AI Video Models 2026 — UlazAI](https://ulazai.com/ai-video-models-guide-2025/), [Runway AI Release Notes - May 2026 — Releasebot](https://releasebot.io/updates/runwayai), [Soloa — Runway vs Kling vs Pika vs Luma 2026](https://soloa.ai/blog/runway-vs-kling-vs-pika-vs-luma-ai-video-2026), [Bloomberg — AI Video Generators set to replace Sora](https://www.bloomberg.com/news/articles/2026-04-01/kling-ai-runway-vidu-the-ai-video-generators-set-to-replace-openai-s-sora).

---

## 📌 Actions recommandées

1. **🔴 PRIORITÉ 1 — Bascule Veo 3.1 Lite à finaliser AVANT lundi 1er juin EOD.** T-4 jours. Dernière fenêtre raisonnable pour tester E2E avant le retirement Sora-2 du 2 juin 19h00 local. Vérifier quotas Vertex AI et monitoring de prod.
2. **🔴 PRIORITÉ 2 — Plan B "API Sora-2 directe OpenAI" en standby technique** : valider clé + endpoint + 1 prompt test. Disponible jusqu'au **24 septembre 2026**. À garder chaud comme dépannage si Veo 3.1 Lite bug en prod après le 2 juin.
3. **🟡 PRIORITÉ 3 — Build 2026 keynote Day 1 (lundi 2 juin)** : **surveiller en live** (a) extension Sora-2 surprise, (b) annonce MAI-Video ou modèle vidéo first-party MS, (c) intégration Veo dans Foundry. Keynote live YouTube `FFMm454fxNA`. À T-4, **aucun teaser vidéo dans le catalogue** → probabilité faible mais non nulle.
4. **🟡 PRIORITÉ 4 — Plan C "Runway en passerelle Sora-2 Pro"** : reste valide. À investiguer côté CGU/quotas/coûts seulement si Veo bug **et** OpenAI direct bloqué.
5. **🟡 PRIORITÉ 5 — Service Health alerts Azure** sur deployment Sora-2 v2025-10-06 : vérifier que les alertes sont actives (filter `Azure OpenAI Service`) avant le weekend.
6. **🟢 PRIORITÉ 6 — Multi-fournisseurs en backup** : garder Kling 3.0 et Runway Gen-4.5 prêts (clé API, prompts) au cas où Veo 3.1 Lite subirait panne/quota après le 2 juin.
7. **🟢 PRIORITÉ 7 — Documenter la décision finale** (Veo 3.1 Lite primary post-2 juin) avec rationale, comparatif coûts, plan de migration si MS annonce un remplaçant Sora-2 à Build.

---

## Sources

### OpenAI / Sora
- [OpenAI News](https://openai.com/news/)
- [OpenAI API Changelog](https://developers.openai.com/api/docs/changelog)
- [OpenAI API Deprecations](https://developers.openai.com/api/docs/deprecations)
- [Sora 2 is here | OpenAI](https://openai.com/index/sora-2/)
- [What to know about the Sora discontinuation | OpenAI Help Center](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [Video generation with Sora | OpenAI API](https://developers.openai.com/api/docs/guides/video-generation)
- [Is the Sora2 API still working? — OpenAI Dev Community](https://community.openai.com/t/is-the-sora2-api-still-working/1379946)
- [Sora-2 API shutdown — Apiyi.com](https://help.apiyi.com/en/sora-2-api-shutdown-alternatives-2026-en.html)
- [OpenAI Release Notes — May 2026 — Releasebot](https://releasebot.io/updates/openai)
- [AI News Today - May 28, 2026 — buildfastwithai](https://www.buildfastwithai.com/blogs/ai-news-today-may-28-2026)

### Microsoft Foundry / Azure
- [Sora 2 in Azure AI Foundry: Create videos with responsible AI](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [Sora 2 video generation overview (preview) — Microsoft Foundry](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Foundry Models lifecycle and support policy](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)
- [Azure AI Foundry Sora 2 retirement date — Microsoft Q&A](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)
- [Azure OpenAI is prematurely cutting off Sora 2 — OpenAI Dev Community](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475)
- [AI Model Catalog | Microsoft Foundry — Sora 2](https://ai.azure.com/catalog/models/sora-2)
- [Foundry Models sold by Azure — Microsoft Learn](https://learn.microsoft.com/en-us/azure/foundry/foundry-models/concepts/models-sold-directly-by-azure)
- [What's New in Microsoft Foundry Labs – May 2026](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/whats-new-in-microsoft-foundry-labs-%E2%80%93-may-2026/4520310)
- [Introducing MAI-Transcribe-1, MAI-Voice-1, MAI-Image-2 in Microsoft Foundry](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/introducing-mai-transcribe-1-mai-voice-1-and-mai-image-2-in-microsoft-foundry/4507787)
- [TechCrunch — Microsoft takes on AI rivals with three new foundational models](https://techcrunch.com/2026/04/02/microsoft-takes-on-ai-rivals-with-three-new-foundational-models/)
- [Microsoft Build 2026 Preview — ChatForest](https://chatforest.com/reviews/microsoft-build-2026-preview/)
- [Microsoft Build 2026 Attendee Guide — Lensmor](https://www.lensmor.com/event-guides/microsoft-build-2026-attendee-guide)
- [Microsoft Build 2026 Opening Keynote — YouTube](https://www.youtube.com/live/FFMm454fxNA)

### Veo / Google DeepMind
- [Veo 3.1 — Google DeepMind](https://deepmind.google/models/veo/)
- [Veo 3.1 Lite + Upscaling on Vertex AI — Google Cloud Blog](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)
- [Veo 3.1 Ingredients to Video — Google Blog](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-ingredients-to-video/)
- [Introducing Veo 3.1 — Google Developers Blog](https://developers.googleblog.com/introducing-veo-3-1-and-new-creative-capabilities-in-the-gemini-api/)
- [Vertex AI release notes](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes)

### Concurrents / Benchmarks
- [Best AI Video Models 2026 — UlazAI](https://ulazai.com/ai-video-models-guide-2025/)
- [Runway AI Release Notes - May 2026 — Releasebot](https://releasebot.io/updates/runwayai)
- [Soloa — Runway vs Kling vs Pika vs Luma 2026](https://soloa.ai/blog/runway-vs-kling-vs-pika-vs-luma-ai-video-2026)
- [Bloomberg — AI Video Generators set to replace Sora](https://www.bloomberg.com/news/articles/2026-04-01/kling-ai-runway-vidu-the-ai-video-generators-set-to-replace-openai-s-sora)

# Veille Sora-2 / Microsoft Foundry / Concurrents — 2026-05-30

**Date :** samedi 30 mai 2026
**Fenêtre couverte :** 29/05 ~08h UTC → 30/05 ~08h UTC (~24h)
**Contexte bot :** Sora-2 sur Microsoft Foundry (ex-Azure AI Foundry) → retirement **2 juin 2026, 19h00 local time tenant (T-3 jours)**. Fallback en cours : Veo 3.1 Lite (Vertex AI).

---

## 🔴 Nouveautés Sora-2 / OpenAI

### Statut Sora-2 — silence radio confirmé, T-3

- **Sora-2 API OpenAI direct** : opérationnelle jusqu'au **24 septembre 2026**. Inchangé. Aucune entrée changelog OpenAI sur la fenêtre 29-30 mai concernant Sora.
- **Page OpenAI Deprecations** : confirme la deprecation Videos API + `sora-2` / `sora-2-pro` + snapshots `sora-2-2025-10-06`, `sora-2-2025-12-08`, `sora-2-pro-2025-10-06` au **24 sept 2026**. **Aucun replacement nommé**.
- **Sora app/web** : discontinuée depuis le 26 avril 2026 (rappel).
- Aucun teaser successeur vidéo OpenAI sur la fenêtre. La **quiet period S-1** reste en vigueur depuis le dépôt IPO confidentiel du 22 mai.

### OpenAI 29 mai — actualités hors-vidéo

- **OpenAI a publié le 29 mai** : *Frontier Governance Framework*, *Rosalind Biodefense* (extension d'accès GPT-Rosalind aux développeurs vetted + partenaires gouvernementaux US), et un **preview "Personal Finance" dans ChatGPT** (Pro, US, web + iOS). **Aucune référence vidéo / Sora.**
- **Confirmation** : OpenAI continue d'investir en **enterprise services / verticalisation** (gouvernement, finance, biodéfense, DeployCo). Ces directions confirment l'hypothèse "pas de Sora-3 / Spud grand-public imminent avant la fenêtre Foundry du 2 juin".
- Source : [OpenAI Newsroom](https://openai.com/news/), [Open AI News May 2026 Startup Edition](https://blog.mean.ceo/open-ai-news-may-2026/).

### "Spud" — successeur Sora ⚠️ pré-training terminé, pas d'annonce produit

- **Confirmé pré-training terminé** (sources tierces sourçant Altman : *"a very powerful model will come out within a few weeks…"*). Le modèle Spud serait le successeur direct de Sora, optimisé pour l'efficacité GPU.
- ⚠️ **Aucune annonce publique OpenAI confirmant Spud comme modèle vidéo grand-public**. Articles tiers (FindSkill, Tom's Guide, The Neuron) sourçant principalement le *Tom's Guide* fin mars + interviews Altman. Pas de date, pas de page produit, pas de mention API.
- **Implication pour la veille** : à supposer que Spud sorte en juin-juillet, il **n'arrivera pas à temps** pour combler le gap Foundry du 2 juin. Possible scénario "API privée Spud" sur OpenAI direct dans Q3, sans intégration Azure immédiate.
- Sources : [Tom's Guide — OpenAI just killed Sora as company readies IPO and new 'Spud' model](https://www.tomsguide.com/ai/openai-just-killed-sora-as-company-readies-ipo-and-new-spud-model), [The Neuron — OpenAI Kills Sora, Preps Spud Model](https://www.theneurondaily.com/p/sora-lasted-6-months-disney-s-1b-deal-lasted-3), [DigitalToday — OpenAI ends Sora video AI service, completes training of next-generation Spud model](https://www.digitaltoday.co.kr/en/view/43075/openai-ends-sora-video-ai-service-completes-training-of-next-generation-spud-model).

### Rappel — Sora Videos API features (toujours en vigueur jusqu'au 24/09)

Inchangé fenêtre 29-30 mai : custom characters (≤2 refs), clips 4/8/12/16/20s, export 1080p H/V pour `sora-2-pro` ($0.70/sec), continuation, Batch API, `POST /v1/videos/edits` (remplace `remix` deprecated dans 6 mois).

---

## 🔵 Microsoft Foundry (ex-Azure AI Foundry)

### Retirement Sora-2 v2025-10-06 — bloqué au 2 juin, T-3

- **Position MS inchangée** : aucun signal d'extension publié sur la fenêtre 29-30 mai. La réponse écrite du 13 mai (*"we do not have the ability to extend or override the retirement window…"*) reste la position officielle.
- **Q&A Microsoft Learn** ([learn.microsoft.com/answers/questions/5881436](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)) : pas de nouveau commentaire ; dernière update modérateur 14/05. Statut quo confirmé.
- **Page Sora-2 video generation overview** ([learn.microsoft.com/.../video-generation](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)) : décrit toujours Sora-2 comme **seul** modèle vidéo first-party Foundry. Aucune mention de modèle de remplacement.
- ⚠️ **Tweet MS de mars** ("committed to continued support for Sora 2 for the next 6 months") **toujours non sourcé first-party** côté @Azure / blog Azure. À traiter comme **non confirmé**.

### MAI-Image-2.5 — nouveau modèle, mais **TEXT-TO-IMAGE only** (pas vidéo) 🆕

- **Annonce Microsoft du 28 mai 2026** : lancement de **MAI-Image-2.5**, ranking #3 Arena text-to-image. Rollout Foundry + MAI Playground **sous 2 semaines** (≈ mi-juin).
- Améliorations : text rendering, cartoon generation, commercial imagery, visual reasoning (scene structure, lighting, scale).
- ⚠️ **Aucun impact vidéo** : confirmé text-to-image only. **Ne résout pas le gap vidéo** créé par le retirement Sora-2 du 2 juin.
- **Lecture stratégique** : MS continue d'investir dans la pile MAI multimédia (Image-2.5, Voice-1, Transcribe-1) mais **ne mentionne toujours pas de MAI-Video**. Asymétrie persistante par rapport à Google (Veo) et OpenAI (Sora/Spud).
- Sources : [Microsoft AI — MAI-Image-2.5 launches at No. 3 on Arena](https://microsoft.ai/news/mai-image-2-5-launches-at-no-3-on-arena-ai/), [WinBuzzer — Microsoft Launches MAI-Image-2.5 With Arena Top-3 Claim](https://winbuzzer.com/2026/05/28/microsoft-launches-mai-image-25-with-arena-top-3-claim-xcxwbn/), [EdTechHub — Microsoft AI launches MAI-Image-2.5](https://www.edtechinnovationhub.com/news/microsoft-ai-launches-mai-image-25-as-image-model-ranks-third-on-arena).

### Catalogue Foundry inchangé sur la vidéo

- **GPT-image-2** en preview Foundry pour image jusqu'à 4K — image only.
- **MAI-Voice-1**, **MAI-Transcribe-1** — audio only.
- **Aucun MAI-Video** annoncé.
- **Sora-2** = seul modèle vidéo first-party → disparaît le 2 juin sur version v2025-10-06.

### Build 2026 — T-3, J-3

- **Microsoft Build 2-3 juin 2026** à Fort Mason Center, San Francisco. Inchangé.
- **Keynote Day 1 (2 juin, 9h-11h PT)** : Satya Nadella + Scott Guthrie (EVP Cloud + AI) + Scott Hanselman + Kyle Daigle (COO GitHub). Focus officiel "agents en production" + Foundry. **Stage time confirmé pour GitHub**.
- **7 tracks confirmés** : Agents & Apps, Azure AI Platform / Azure AI Foundry, GitHub & dev productivity, Microsoft Fabric, Responsible AI, Windows, Working with Models.
- **3 sessions on-device AI confirmées** sur Windows AI Foundry (Foundry Local).
- ⚠️ **Toujours aucune session vidéo explicite** au catalogue à T-3. Si MS prépare un MAI-Video, une extension Sora-2, ou un partenariat Veo, l'annonce reste hypothétique pour Day 1 (jour exact du retirement).
- Sources : [Microsoft Build 2026 Preview — ChatForest](https://chatforest.com/reviews/microsoft-build-2026-preview/), [Lensmor — Build 2026 Attendee Guide](https://www.lensmor.com/event-guides/microsoft-build-2026-attendee-guide), [Thurrott — Microsoft's Build 2026 Session Catalog is Now Live](https://www.thurrott.com/microsoft/334704/microsofts-build-2026-session-catalog-is-now-live).

---

## 🟢 Alternatives / Concurrents

### Veo 3.1 — pas de nouveauté sur la fenêtre 29-30 mai

- Famille Veo 3.1 sur Vertex AI inchangée : **Veo 3.1 / Fast / Lite / Upscaling**.
- **Pas de nouvelle release Vertex AI** Veo 3.1 sur la fenêtre 29-30 mai (release notes Vertex AI sans nouvelle entrée vidéo).
- **Veo 3.1 Lite (public preview)** = choix actuel du bot. **Validé production-ready**.
- Sources : [Vertex AI release notes](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes), [Veo 3.1 Lite + Upscaling on Vertex AI](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai).

### Veo 4 — toujours non annoncé ⚠️

- Page modèle officielle ([deepmind.google/models/veo](https://deepmind.google/models/veo/)) : **Veo 3.1**, pas de Veo 4.
- **Google I/O 2026** (19-20 mai) : annonce de **Gemini Omni Flash** (premier modèle famille Gemini Omni), **pas Veo 4**. Confirmation maintenue : **Veo 4 = spéculation tierce**.
- **Verdict** : ne pas attendre Veo 4 dans l'immédiat. Veo 3.1 reste le baseline Google.

### Concurrents — pas de news majeure 29-30 mai

- **Runway Gen-4.5** : disponible via Runway API, text-to-video + image-to-video, 2-10s. Top Artificial Analysis text-to-video 1247 Elo points. **Runway expose toujours Sora-2 Pro en API** → plan C "passerelle Sora-2 Pro" reste valide post-2 juin.
- **Kling 3.0** : 4K natif, 60fps, 15s clips, lipsync multilingue, storyboard tool. **$0.07/sec**, soit -65% vs Sora et -44% vs Runway.
- **Pika** : Pikaframes, Pikaswaps, Pikatwists, Pikaffects — orientation social-first.
- **Seedance 2.0** (ByteDance) : via Runway API depuis 17/04, performant sur Artificial Analysis. Pas dispo US.
- **HappyHorse-1.0** (Alibaba ATH) : tête Artificial Analysis sans audio.
- Sources : [Best AI Video Models 2026 — UlazAI](https://ulazai.com/ai-video-models-guide-2025/), [Runway AI Release Notes May 2026 — Releasebot](https://releasebot.io/updates/runwayai), [Best Text-to-Video AI Generators May 2026 — BuildMVPFast](https://www.buildmvpfast.com/articles/best-llms-2026-guide/video-generation-ai), [Digital Applied — AI Video Market After Sora](https://www.digitalapplied.com/blog/ai-video-market-after-sora-runway-kling-veo-2026).

---

## 📌 Actions recommandées

1. **🔴 PRIORITÉ 1 — Bascule Veo 3.1 Lite à finaliser AVANT lundi 1er juin EOD.** T-3 jours. Dernière fenêtre raisonnable pour tester E2E avant le retirement Sora-2 du 2 juin 19h00 local. Vérifier quotas Vertex AI, monitoring de prod, alertes erreurs API.
2. **🔴 PRIORITÉ 2 — Plan B "API Sora-2 directe OpenAI" en standby technique** : valider clé + endpoint + 1 prompt test. Disponible jusqu'au **24 septembre 2026**. À garder chaud comme dépannage si Veo 3.1 Lite bug en prod après le 2 juin.
3. **🟡 PRIORITÉ 3 — Build 2026 keynote Day 1 (lundi 2 juin, 9h PT)** : surveiller en live (a) extension Sora-2 surprise, (b) annonce MAI-Video ou modèle vidéo first-party MS, (c) intégration Veo dans Foundry. **À T-3, aucun teaser vidéo dans le catalogue** → probabilité faible mais non nulle.
4. **🟡 PRIORITÉ 4 — Plan C "Runway en passerelle Sora-2 Pro"** : reste valide. À investiguer côté CGU/quotas/coûts seulement si Veo bug **et** OpenAI direct bloqué.
5. **🟡 PRIORITÉ 5 — Service Health alerts Azure** sur deployment Sora-2 v2025-10-06 : vérifier que les alertes sont actives (filter `Azure OpenAI Service`) avant le weekend.
6. **🟢 PRIORITÉ 6 — Multi-fournisseurs en backup** : garder Kling 3.0 et Runway Gen-4.5 prêts (clé API, prompts) au cas où Veo 3.1 Lite subirait panne/quota après le 2 juin.
7. **🟢 PRIORITÉ 7 — Surveiller "Spud" (OpenAI)** : suivre annonces OpenAI sur les 4-6 prochaines semaines. Si Spud sort en API et qu'il remplace Sora-2 Pro avec un meilleur coût/qualité, **réévaluer la stack vidéo** une fois la migration Foundry → Veo stabilisée.
8. **🟢 PRIORITÉ 8 — Documenter la décision finale** (Veo 3.1 Lite primary post-2 juin) avec rationale, comparatif coûts (Veo 3.1 Lite vs Kling 3.0 vs Runway Gen-4.5 vs OpenAI Sora-2 direct), plan de migration si MS annonce un remplaçant à Build.

---

## Sources

### OpenAI / Sora
- [OpenAI News](https://openai.com/news/)
- [OpenAI Newsroom — Recent news](https://openai.com/news/company-announcements/)
- [OpenAI API Changelog](https://platform.openai.com/docs/changelog)
- [OpenAI API Deprecations](https://developers.openai.com/api/docs/deprecations)
- [Sora 2 is here | OpenAI](https://openai.com/index/sora-2/)
- [What to know about the Sora discontinuation | OpenAI Help Center](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [Video generation with Sora | OpenAI API](https://developers.openai.com/api/docs/guides/video-generation)
- [Is the Sora2 API still working? — OpenAI Dev Community](https://community.openai.com/t/is-the-sora2-api-still-working/1379946)
- [Tom's Guide — OpenAI just killed Sora as company readies IPO and new 'Spud' model](https://www.tomsguide.com/ai/openai-just-killed-sora-as-company-readies-ipo-and-new-spud-model)
- [The Neuron — OpenAI Kills Sora, Preps Spud Model](https://www.theneurondaily.com/p/sora-lasted-6-months-disney-s-1b-deal-lasted-3)
- [DigitalToday — OpenAI completes training of next-gen Spud model](https://www.digitaltoday.co.kr/en/view/43075/openai-ends-sora-video-ai-service-completes-training-of-next-generation-spud-model)
- [OpenAI May 2026 Updates roundup — Codersera](https://codersera.com/blog/openai-may-2026-updates-roundup/)
- [Open AI News May 2026 Startup Edition](https://blog.mean.ceo/open-ai-news-may-2026/)
- [OpenAI Release Notes — May 2026 — Releasebot](https://releasebot.io/updates/openai)

### Microsoft Foundry / Azure
- [Sora 2 in Azure AI Foundry: Create videos with responsible AI](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [Sora 2 video generation overview (preview) — Microsoft Foundry](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Foundry Models lifecycle and support policy](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)
- [Azure AI Foundry Sora 2 retirement date — Microsoft Q&A](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)
- [Azure OpenAI is prematurely cutting off Sora 2 — OpenAI Dev Community](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475)
- [AI Model Catalog | Microsoft Foundry — Sora 2](https://ai.azure.com/catalog/models/sora-2)
- [Foundry Models sold by Azure — Microsoft Learn](https://learn.microsoft.com/en-us/azure/foundry/foundry-models/concepts/models-sold-directly-by-azure)
- [Microsoft AI — MAI-Image-2.5 launches at No. 3 on Arena](https://microsoft.ai/news/mai-image-2-5-launches-at-no-3-on-arena-ai/)
- [WinBuzzer — Microsoft Launches MAI-Image-2.5 With Arena Top-3 Claim](https://winbuzzer.com/2026/05/28/microsoft-launches-mai-image-25-with-arena-top-3-claim-xcxwbn/)
- [EdTechHub — Microsoft AI launches MAI-Image-2.5](https://www.edtechinnovationhub.com/news/microsoft-ai-launches-mai-image-25-as-image-model-ranks-third-on-arena)
- [Microsoft Build 2026 Preview — ChatForest](https://chatforest.com/reviews/microsoft-build-2026-preview/)
- [Microsoft Build 2026 Attendee Guide — Lensmor](https://www.lensmor.com/event-guides/microsoft-build-2026-attendee-guide)
- [Thurrott — Microsoft's Build 2026 Session Catalog is Now Live](https://www.thurrott.com/microsoft/334704/microsofts-build-2026-session-catalog-is-now-live)

### Veo / Google DeepMind
- [Veo 3.1 — Google DeepMind](https://deepmind.google/models/veo/)
- [Veo 3.1 Lite + Upscaling on Vertex AI — Google Cloud Blog](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)
- [Veo 3.1 Ingredients to Video — Google Blog](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-ingredients-to-video/)
- [Introducing Veo 3.1 — Google Developers Blog](https://developers.googleblog.com/introducing-veo-3-1-and-new-creative-capabilities-in-the-gemini-api/)
- [Vertex AI release notes](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes)
- [Bringing new Veo 3.1 updates into Flow — Google Blog](https://blog.google/technology/ai/veo-updates-flow/)

### Concurrents / Benchmarks
- [Best AI Video Models 2026 — UlazAI](https://ulazai.com/ai-video-models-guide-2025/)
- [Runway AI Release Notes May 2026 — Releasebot](https://releasebot.io/updates/runwayai)
- [Best Text-to-Video AI Generators May 2026 — BuildMVPFast](https://www.buildmvpfast.com/articles/best-llms-2026-guide/video-generation-ai)
- [Digital Applied — AI Video Market After Sora](https://www.digitalapplied.com/blog/ai-video-market-after-sora-runway-kling-veo-2026)
- [After Sora — Best AI Video Generators 2026 — Digital Applied](https://www.digitalapplied.com/blog/after-sora-best-ai-video-generators-2026-runway-kling-veo)
- [Sora Alternatives 2026 — VideoAny](https://videoany.io/guides/sora-alternatives-2026)

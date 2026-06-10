# Veille Sora-2 / Microsoft Foundry / Concurrents — 2026-05-31

**Date :** dimanche 31 mai 2026
**Fenêtre couverte :** 30/05 ~08h UTC → 31/05 ~08h UTC (~24h)
**Contexte bot :** Sora-2 sur Microsoft Foundry (ex-Azure AI Foundry) → retirement **2 juin 2026, 19h00 local time tenant (T-2 jours)**. Fallback en cours : Veo 3.1 Lite (Vertex AI).

---

## ⚠️ Correction d'erreur du rapport précédent

Le rapport du 30/05 listait **"Spud" comme successeur vidéo de Sora**. **C'est faux**. Vérification croisée aujourd'hui (Axios, Wikipedia GPT-5.5, Geeky-Gadgets, FindSkill, MindStudio) :

- **Spud = nom de code interne de GPT-5.5**, modèle texte/coding.
- **Sorti le 23 avril 2026** sur ChatGPT et Codex (paid subscribers), API access "coming soon".
- **Aucun lien avec la vidéo**. Les articles Tom's Guide / The Neuron / DigitalToday cités hier conflataient deux annonces distinctes (deprecation Sora + arrivée Spud).
- **Implication veille** : pas de successeur vidéo OpenAI identifiable à ce jour. Le gap post-retirement Foundry du 2 juin n'a **aucun candidat OpenAI** côté grand-public/API.
- Sources : [Axios — OpenAI releases "Spud" GPT-5.5 model](https://www.axios.com/2026/04/23/openai-releases-spud-gpt-model), [Wikipedia — GPT-5.5](https://en.wikipedia.org/wiki/GPT-5.5), [Geeky-Gadgets — ChatGPT 6 "Spud"](https://www.geeky-gadgets.com/openai-chatgpt-6-release/).

---

## 🔴 Nouveautés Sora-2 / OpenAI

### Statut Sora-2 — silence radio confirmé, T-2

- **Sora-2 API OpenAI direct** : opérationnelle jusqu'au **24 septembre 2026**. Inchangé.
- **Page OpenAI Deprecations** : confirme deprecation Videos API + `sora-2` / `sora-2-pro` + snapshots `sora-2-2025-10-06`, `sora-2-2025-12-08`, `sora-2-pro-2025-10-06` au **24 sept 2026**. Aucun remplacement nommé.
- **Sora app/web** : discontinuée depuis le 26 avril 2026 (rappel).
- **Aucun teaser successeur vidéo** sur la fenêtre 30-31 mai. La **quiet period IPO** continue.

### OpenAI 30 mai 2026 — actualités hors-vidéo

- **ChatGPT release du 30 mai** :
  - **GPT-5.5 Instant** : réponses plus claires, plus naturelles, mieux rythmées sur l'usage quotidien.
  - **Writing blocks + Code blocks dans le chat** : remplacent Canvas, désormais retiré de GPT-5.5 Instant et GPT-5.5 Thinking.
  - **Codex étend Computer Use sur Windows** : voir, cliquer, taper dans les apps Windows pour tester et raffiner les builds. Continuation à distance (mobile/Mac). Codex Profiles + suivi tokens.
- **Aucune mention vidéo / Sora / Spud-vidéo** dans le release du 30 mai.
- Sources : [ChatGPT Release Notes — OpenAI Help Center](https://help.openai.com/en/articles/6825453-chatgpt-release-notes), [OpenAI Newsroom](https://openai.com/news/), [Releasebot — ChatGPT Updates May 2026](https://releasebot.io/updates/openai/chatgpt).

### SynthID — rappel intégration récente

- OpenAI a confirmé en mai 2026 l'intégration progressive du **watermark pixel-level SynthID** (Google DeepMind) sur ses produits de génération. Pas de nouvelle annonce sur la fenêtre 30-31 mai.
- Source : [Wikipedia — Sora text-to-video model](https://en.wikipedia.org/wiki/Sora_(text-to-video_model)).

### Rappel — Sora Videos API features (toujours en vigueur jusqu'au 24/09)

Inchangé : custom characters (≤2 refs), clips 4/8/12/16/20s, export 1080p H/V pour `sora-2-pro` ($0.70/sec), continuation, Batch API, `POST /v1/videos/edits` (remplace `remix` deprecated dans 6 mois).

---

## 🔵 Microsoft Foundry (ex-Azure AI Foundry)

### Retirement Sora-2 v2025-10-06 — bloqué au 2 juin, T-2

- **Position MS inchangée** sur la fenêtre 30-31 mai. Aucune communication d'extension publiée.
- **Q&A Microsoft Learn** ([learn.microsoft.com/answers/questions/5881436](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)) : statut quo, dernière update modérateur 14/05. La réponse de référence : *"retirement dates are not extendable, any change would have to come from the product team and be reflected in the official Model Retirement Schedule"*.
- **Doc Foundry confirme** : *"Once a model reaches Retired, all inference requests return 410 Gone and the model is no longer usable."* → impact prod immédiat le 2 juin 19h00 local.
- **Conflit de communication** documenté : "Azure OpenAI Foundry currently plans to end support for Sora 2 on June 6, 2026, even though OpenAI's timeline indicates support should continue until September 24, 2026" — écart **June 2 (Azure portal) vs Sept 24 (OpenAI direct)** inchangé.
- **Page Sora-2 video generation overview** : décrit toujours Sora-2 comme **seul** modèle vidéo first-party Foundry. Aucun remplaçant mentionné.
- Sources : [Foundry Models lifecycle and support policy](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements), [Azure OpenAI is prematurely cutting off Sora 2 — OpenAI Dev Community](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475), [AI Model Catalog | Microsoft Foundry — Sora 2](https://ai.azure.com/catalog/models/sora-2).

### MAI-Image-2.5 — rappel, **TEXT-TO-IMAGE only**

- Annoncé le 28 mai 2026, rollout Foundry + MAI Playground mi-juin.
- **Aucun impact vidéo**. Le gap Sora-2 reste sans solution Microsoft first-party.

### Build 2026 — T-2, J-2 (lundi 2 juin)

- **Microsoft Build 2-3 juin 2026**, Fort Mason Center, San Francisco + livestream.
- **Keynote Day 1** : confirmé **9h30 PT / 12h30 ET le 2 juin** (un léger décalage vs précédent rapport qui mentionnait 9h-11h PT — la source officielle confirme 9h30 PT). Satya Nadella + Scott Guthrie (EVP Cloud + AI).
- **7 tracks** : Agents & Apps, Azure AI Platform / Foundry, GitHub & dev productivity, Microsoft Fabric, Responsible AI, Windows, Working with Models.
- **Annonces attendues côté Foundry** :
  - **Foundry GA** ("expected to go generally available with a slew of new capabilities") — fort signal stratégique.
  - Multi-model routing, fine-tuning, evaluation, deployment dans une seule plateforme.
  - **Modèles MS homegrown** pour booster GitHub Copilot (modèle coding spécialisé).
  - Windows Copilot Runtime / on-device APIs / NPU.
- ⚠️ **Toujours aucune session vidéo explicite** dans le catalogue Build à T-2. Aucune annonce vidéo first-party MS officiellement teasée. Probabilité d'une annonce de remplacement Sora-2 le Day 1 = **faible mais non nulle** (le keynote tombe pile sur le jour du retirement).
- Sources : [Microsoft Build 2026 Preview — ChatForest](https://chatforest.com/reviews/microsoft-build-2026-preview/), [How to watch Microsoft Build 2026 — Yahoo](https://tech.yahoo.com/general/article/how-to-watch-microsoft-build-2026-including-copilot-ai-and-windows-updates-153315191.html), [Microsoft Build 2026: AI Agents, Copilot, Azure AI Foundry — Windows News](https://windowsnews.ai/article/microsoft-build-2026-ai-agents-copilot-azure-ai-foundry-and-windows-local-ai.420861).

---

## 🟢 Alternatives / Concurrents

### Veo 3.1 / Veo 4 — pas de news majeure 30-31 mai

- **Veo 3.1 Lite (Vertex AI)** : choix actuel du bot. Statut production-ready inchangé.
- **Veo 4** : toujours non annoncé. Confirmation : ni à Google I/O 2026 (19-20 mai, annonce de **Gemini Omni Flash** à la place), ni depuis. Spéculation tierce uniquement.
- **Veo 3.1** reste le baseline Google officiel : 1080p, audio natif, clips ~8s.
- Sources : [Veo 3.1 — Google DeepMind](https://deepmind.google/models/veo/), [Vertex AI release notes](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes), [Veo 4 Release Watch — PixVerse AI](https://pixverse.ai/en/blog/veo-4-release).

### Runway / Kling / Pika — pas de news majeure 30-31 mai

- **Runway Gen-4.5** : top Artificial Analysis text-to-video à 1247 Elo. Expose toujours **Sora-2 Pro en API** → plan C "passerelle Sora-2 Pro" via Runway reste valide post-2 juin.
- **Kling 3.0** : 4K natif, 60fps, clips jusqu'à 5 minutes (note : précédentes notes mentionnaient 15s, la source d'aujourd'hui indique "videos up to 5 minutes long — far exceeding any competitor" — à vérifier sur compte payant). $0.07/sec.
- **Pika 2.5** : Pikaframes (transitions image-to-image), social-first.
- Sources : [Runway AI Release Notes — Releasebot](https://releasebot.io/updates/runwayai), [Best AI Video Models 2026 — UlazAI](https://ulazai.com/ai-video-models-guide-2025/), [Runway vs Kling vs Pika vs Luma — Soloa](https://soloa.ai/blog/runway-vs-kling-vs-pika-vs-luma-ai-video-2026).

---

## 📌 Actions recommandées

1. **🔴 PRIORITÉ 1 — Bascule Veo 3.1 Lite finalisée ce week-end ou demain lundi EOD au plus tard.** T-2 jours. Vérification finale : quotas Vertex AI, monitoring prod, alertes erreurs API, prompts de référence rejoués.
2. **🔴 PRIORITÉ 2 — Plan B "API Sora-2 directe OpenAI" en standby technique** : clé + endpoint + 1 prompt test validés. Disponible jusqu'au **24 septembre 2026**.
3. **🔴 PRIORITÉ 3 — Build 2026 keynote Day 1 (lundi 2 juin, 9h30 PT / 18h30 Paris)** : surveiller LIVE pour : (a) extension surprise Sora-2 sur Foundry, (b) annonce MAI-Video ou modèle vidéo first-party MS, (c) intégration Veo/Runway/Kling dans Foundry, (d) message GA de Foundry mentionnant un slot vidéo. Catalogue session sans signal vidéo à T-2, mais le timing (jour exact du retirement) fait monter l'hypothèse d'une annonce de dernière minute.
4. **🟡 PRIORITÉ 4 — Service Health Azure alerts** : confirmer aujourd'hui que les alertes sont actives sur le deployment Sora-2 v2025-10-06 (filter "Azure OpenAI Service") pour capter le retirement en temps réel.
5. **🟡 PRIORITÉ 5 — Plan C "Runway en passerelle Sora-2 Pro"** : reste valide. À investiguer côté CGU/quotas/coûts seulement si Veo bug **et** OpenAI direct bloqué.
6. **🟢 PRIORITÉ 6 — Multi-fournisseurs backup** : Kling 3.0 et Runway Gen-4.5 prêts (clé API, prompts) au cas où Veo 3.1 Lite subit panne/quota après le 2 juin.
7. **🟢 PRIORITÉ 7 — Corriger le tracking "Spud"** : retirer l'hypothèse "Spud = Sora successor". Reclasser comme GPT-5.5 (texte, sorti 23/04). Pas de successeur vidéo OpenAI identifié à ce jour.
8. **🟢 PRIORITÉ 8 — Documenter la décision finale** (Veo 3.1 Lite primary post-2 juin) : rationale + comparatif coûts (Veo 3.1 Lite vs Kling 3.0 vs Runway Gen-4.5 vs OpenAI Sora-2 direct) + plan de migration si MS annonce un remplaçant à Build.

---

## Sources

### OpenAI / Sora
- [OpenAI News](https://openai.com/news/)
- [OpenAI Newsroom — Product Releases](https://openai.com/news/product-releases/)
- [OpenAI API Changelog](https://platform.openai.com/docs/changelog)
- [OpenAI API Deprecations](https://developers.openai.com/api/docs/deprecations)
- [ChatGPT Release Notes — OpenAI Help Center](https://help.openai.com/en/articles/6825453-chatgpt-release-notes)
- [Sora 2 is here — OpenAI](https://openai.com/index/sora-2/)
- [Sora 2 System Card — OpenAI](https://openai.com/index/sora-2-system-card/)
- [Sora discontinuation — OpenAI Help Center](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [Video generation with Sora — OpenAI API](https://developers.openai.com/api/docs/guides/video-generation)
- [Sora release notes — OpenAI Help Center](https://help.openai.com/en/articles/12593142-sora-release-notes)
- [Is the Sora2 API still working? — OpenAI Dev Community](https://community.openai.com/t/is-the-sora2-api-still-working/1379946)
- [Sora (text-to-video model) — Wikipedia](https://en.wikipedia.org/wiki/Sora_(text-to-video_model))
- [OpenAI Release Notes May 2026 — Releasebot](https://releasebot.io/updates/openai)
- [ChatGPT Updates by OpenAI — May 2026 — Releasebot](https://releasebot.io/updates/openai/chatgpt)
- [Axios — OpenAI releases "Spud" GPT-5.5 model](https://www.axios.com/2026/04/23/openai-releases-spud-gpt-model)
- [GPT-5.5 — Wikipedia](https://en.wikipedia.org/wiki/GPT-5.5)
- [Geeky-Gadgets — OpenAI's Powerful New ChatGPT 6 Model Code Named "Spud"](https://www.geeky-gadgets.com/openai-chatgpt-6-release/)
- [MindStudio — What Is the OpenAI 'Spud' Model?](https://www.mindstudio.ai/blog/what-is-openai-spud-model-next-frontier)
- [MindStudio — OpenAI Is Shutting Down Sora](https://www.mindstudio.ai/blog/openai-shutting-down-sora-what-happened)
- [FindSkill — GPT-6 Release Date: Spud=GPT-5.5](https://findskill.ai/blog/gpt-6-release-date/)

### Microsoft Foundry / Azure
- [Sora 2 in Azure AI Foundry — Microsoft Azure Blog](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [Sora 2 video generation overview — Microsoft Foundry](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Foundry Models lifecycle and support policy](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)
- [Model retirement schedule — Microsoft Foundry](https://learn.microsoft.com/en-us/azure/ai-foundry/concepts/model-lifecycle-retirement?view=foundry-classic)
- [Azure AI Foundry Sora 2 retirement date — Microsoft Q&A](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)
- [Azure OpenAI is prematurely cutting off Sora 2 — OpenAI Dev Community](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475)
- [AI Model Catalog | Microsoft Foundry — Sora 2](https://ai.azure.com/catalog/models/sora-2)
- [What's new in Microsoft Foundry | April 2026](https://devblogs.microsoft.com/foundry/whats-new-in-microsoft-foundry-apr-2026/)
- [What's New in Microsoft Foundry Labs — May 2026](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/whats-new-in-microsoft-foundry-labs-%E2%80%93-may-2026/4520310)
- [Foundry Models sold by Azure — Microsoft Learn](https://learn.microsoft.com/en-us/azure/foundry/foundry-models/concepts/models-sold-directly-by-azure)
- [What's new in Azure OpenAI in Microsoft Foundry Models (classic)](https://learn.microsoft.com/en-us/azure/foundry-classic/openai/whats-new)
- [Microsoft AI — MAI-Image-2.5 launches at No. 3 on Arena](https://microsoft.ai/news/mai-image-2-5-launches-at-no-3-on-arena-ai/)
- [Microsoft Build 2026 Preview — ChatForest](https://chatforest.com/reviews/microsoft-build-2026-preview/)
- [How to watch Microsoft Build 2026 — Yahoo Tech](https://tech.yahoo.com/general/article/how-to-watch-microsoft-build-2026-including-copilot-ai-and-windows-updates-153315191.html)
- [Microsoft Build 2026: AI Agents, Copilot, Azure AI Foundry, and Windows Local AI — Windows News](https://windowsnews.ai/article/microsoft-build-2026-ai-agents-copilot-azure-ai-foundry-and-windows-local-ai.420861)
- [Microsoft Build 2026 preview — Tom's Guide](https://www.tomsguide.com/computing/microsoft-build-2026-preview)

### Veo / Google DeepMind
- [Veo 3.1 — Google DeepMind](https://deepmind.google/models/veo/)
- [Veo (text-to-video model) — Wikipedia](https://en.wikipedia.org/wiki/Veo_(text-to-video_model))
- [Vertex AI release notes](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes)
- [Veo 4 — What We Know — VO3AI](https://www.vo3ai.com/veo4)
- [VEO 4 Release Date 2026 — Vexub](https://vexub.com/blog/veo-4-release-what-we-know)

### Concurrents / Benchmarks
- [Best AI Video Models 2026 — UlazAI](https://ulazai.com/ai-video-models-guide-2025/)
- [Runway AI Release Notes May 2026 — Releasebot](https://releasebot.io/updates/runwayai)
- [Best Text-to-Video AI Generators May 2026 — BuildMVPFast](https://www.buildmvpfast.com/articles/best-llms-2026-guide/video-generation-ai)
- [Runway vs Kling vs Pika vs Luma — Soloa](https://soloa.ai/blog/runway-vs-kling-vs-pika-vs-luma-ai-video-2026)
- [AI Video Market After Sora — Digital Applied](https://www.digitalapplied.com/blog/ai-video-market-after-sora-runway-kling-veo-2026)
- [Runway vs Pika 2026 — Neuronad](https://neuronad.com/runway-vs-pika/)

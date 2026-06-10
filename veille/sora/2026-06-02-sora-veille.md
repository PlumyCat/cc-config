# Veille Sora-2 / Microsoft Foundry / Concurrents — 2026-06-02

**Date :** mardi 2 juin 2026 — **D-DAY**
**Fenêtre couverte :** 01/06 ~08h UTC → 02/06 ~07h UTC (~23h, **avant** keynote Build 18h30 Paris)
**Contexte bot :** Sora-2 Microsoft Foundry → retirement **aujourd'hui 19h00 local tenant**. Fallback Veo 3.1 Lite (Vertex AI) en place. Build 2026 keynote dans ~10h.

---

## 🔴 Nouveautés Sora-2 / OpenAI

### Sora-2 API OpenAI direct — statu quo, T-0 Foundry

- **API OpenAI directe `sora-2` / `sora-2-pro`** : opérationnelle. Retirement programmé **24 septembre 2026** (inchangé depuis mars).
- **Aucune communication OpenAI sur la fenêtre 01/06-02/06 concernant Sora**, ni successeur vidéo, ni réaction au retirement Foundry du jour. Silence radio sur la vidéo.
- **OpenAI Newsroom 01/06** : *"Strengthening societal resilience with Rosalind Biodefense"* — lancement de **GPT-Rosalind** pour gouvernement US/alliés (biodefense, santé publique, préparation pandémique). **Aucun lien vidéo**.
- **Autres news récentes OpenAI** (27-29 mai) : Gartner Leader enterprise coding agents, Frontier Governance Framework (third-party evals). Toujours rien sur Sora.
- **Quiet period IPO confirmée** (fin 2026) — plafonne les annonces produit majeures. Cohérent avec le silence vidéo.
- Sources : [OpenAI News](https://openai.com/news/), [Rosalind Biodefense — OpenAI](https://openai.com/news/), [OpenAI Release Notes May 2026 — Releasebot](https://releasebot.io/updates/openai), [Sora API still works until September — Pixo](https://pixo.video/blog/sora-api-still-available), [Sora-2 API shutdown alternatives — Apiyi](https://help.apiyi.com/en/sora-2-api-shutdown-alternatives-2026-en.html).

### Rappel — Sora discontinuation timeline

- Sora app/web : OFF depuis 26 avril 2026.
- API Sora-2 / Sora-2 Pro / snapshots : OFF le **24 septembre 2026** (410 Gone).
- Pas de successeur vidéo OpenAI annoncé. La trajectoire reste : OpenAI sort de la vidéo, focus compute → ChatGPT / Codex / GPT-Rosalind.

---

## 🔵 Microsoft Foundry — **D-Day Sora-2** + **Build 2026 ouverture**

### Sora-2 retirement Foundry — confirmé, **aujourd'hui 19h00 local tenant**

- **Position MS inchangée à T-0**. Aucune communication d'extension publiée 01/06-02/06.
- **Mécanisme confirmé** : *"Once a model reaches Retired, all inference requests return 410 Gone and the model is no longer usable"* (Foundry Models lifecycle policy). Endpoints `sora-2`, `sora-2-pro`, snapshots → **410 Gone après 19h00**.
- **Conflit Azure portal (2 juin) vs OpenAI direct (24 septembre)** non résolu, et sera entériné dans quelques heures par les faits.
- **Q&A Microsoft Learn** : aucune nouvelle réponse modérateur depuis le 14/05. Règle inchangée : *"retirement dates are not extendable"*.
- **AI Model Catalog Foundry** : Sora-2 toujours listé comme **seul** modèle vidéo first-party MS Foundry à T-0. **Aucun remplaçant publié**.
- Sources : [Foundry Models lifecycle and support policy](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements), [Sora 2 retirement Q&A](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too), [Azure OpenAI prematurely cutting off Sora 2 — OpenAI Community](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475), [AI Model Catalog | Microsoft Foundry — Sora 2](https://ai.azure.com/catalog/models/sora-2), [Sora 2 video generation overview (preview) — Microsoft Learn](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation).

### Microsoft Build 2026 — **AUJOURD'HUI, keynote 18h30 Paris / 9h30 PT**

- **Confirmé** : keynote Satya Nadella ouvre dans ~10h. Conférence 2-3 juin au Fort Mason Center, San Francisco. Livestream gratuit sur build.microsoft.com + YouTube. Couverture live : [TechRadar Build 2026 live blog](https://www.techradar.com/pro/live/microsoft-build-2026-live-all-the-updates-as-they-happen).
- **Annonces MAI Build 2026 confirmées par leaks consolidés** (Windows Forum, TestingCatalog, ChatForest preview) :
  - **MAI-Image 2.5** + variante **MAI-Image 2.5e** (rapide) — text-to-image + édition (upload d'images supporté).
  - **MAI-Voice 2** — TTS multilingue (16 langues : DE, EN-AU, EN-US, ES, FR, HI, ID, IT, JA, KO, NL, PT, TR, VI, ZH + autres), gamme émotionnelle élargie.
  - **MAI-Transcribe 1.5** — STT, légère progression sur les 25 langues déjà couvertes par 1.0.
  - **🚨 AUCUN MAI-Video confirmé** dans la lineup. **Signal négatif fort** pour notre cas d'usage : MS sort plus de TTS / STT / image mais **rien de vidéo first-party annoncé** au jour J du retirement Sora-2.
- **Project Polaris** (annoncé : reasoning engine in-house pour GitHub Copilot, MoE, remplace GPT-4 Turbo en août 2026, tourne sur Maia AI accelerators). Couverture confirmée par AI Weekly + ChatForest recap + Windows News. **Confirme la trajectoire MS** : désengagement progressif vs OpenAI sur les workloads stratégiques. **Pour la vidéo, MS reste orphelin first-party** à T-0.
- **Microsoft Agent Framework 1.0 GA** confirmé : Windows devient runtime natif pour agents autonomes. Windows Agent Framework + Windows Agent Store annoncés.
- **Copilot Studio (annoncé 26/05 avant Build)** : computer-using agents (CUAs), agent-to-agent communication, real-time voice → **GA**.
- **Foundry multi-modal expansion confirmé** : *"native multi-modal support for text, image, video, and audio inputs in a single unified pipeline"* + visual RAG designer + ajout Cohere, Mistral, Stability AI au catalogue. Catalogue Foundry passé de ~1600 → 3000+ modèles. ⚠️ **Mention "video inputs" ≠ génération vidéo first-party** — c'est la prise en charge d'inputs vidéo dans des pipelines RAG / agents, pas un remplaçant Sora-2.
- Sources : [Microsoft Build 2026 starts today — NewsBytes](https://www.newsbytesapp.com/news/science/microsoft-build-2026-starts-today-what-to-expect/story), [Microsoft Build 2026 keynote preview — Notebookcheck](https://www.notebookcheck.net/Microsoft-Build-2026-What-to-expect-from-the-June-2-keynote.1311546.0.html), [How to watch Build 2026 — Engadget](https://www.engadget.com/2183873/how-to-watch-microsoft-build-2026/), [Build 2026: MAI-Image 2.5, MAI-Voice 2, MAI-Transcribe 1.5 — Windows Forum](https://windowsforum.com/threads/microsoft-build-2026-mai-image-2-5-mai-voice-2-and-mai-transcribe-1-5.420924/), [MAI voice and image models for Build 2026 — TestingCatalog](https://www.testingcatalog.com/microsoft-readies-new-mai-voice-and-image-models-for-build-2026/), [Microsoft targets Claude Code with Project Polaris — AI Weekly](https://aiweekly.co/alerts/microsoft-targets-claude-code-with-project-polaris), [Microsoft Build 2026 Recap — ChatForest](https://chatforest.com/builders-log/microsoft-build-2026-recap-windows-agent-platform-project-polaris-copilot-workspace/), [Build 2026 platform shift — Windows Forum](https://windowsforum.com/threads/build-2026-microsofts-platform-shift-to-ai-agents-copilot-azure-ai-foundry.420960/), [Microsoft Foundry Blog — What's new](https://devblogs.microsoft.com/foundry/category/whats-new/).

### Foundry — pas de news vidéo de dernière minute

- **Microsoft Foundry Blog "What's new"** : dernière publication 30/05 = *"What's new in Microsoft Foundry | May 2026"* — trace-based evaluation, Grok 4.3, DeepSeek V4, GPT-5 RFT GA gated, 3 Microsoft Research on-device agent models, Managed VNET GA, project-level cost attribution, Content Understanding GA, Foundry Local 1.1/1.2 (live audio + vision). **Aucune mention d'un remplaçant vidéo Sora-2** dans le récap mensuel.
- Source : [What's new in Microsoft Foundry | May 2026](https://devblogs.microsoft.com/foundry/whats-new-in-microsoft-foundry-may-2026/).

---

## 🟢 Alternatives / Concurrents

### Veo 3.1 / Veo 4 — pas de news

- **Veo 3.1 Lite (Vertex AI)** : choix actuel du bot, production-ready. Statut inchangé.
- **Veo 4** : **toujours pas de confirmation officielle Google** au 02/06. Aucune page Vertex AI / Gemini API. Les articles "Veo 4 released mid-2026" restent **spéculatifs**. Statu quo.
- Sources : [Veo 3.1 Lite + upscaling — Google Cloud Blog](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai), [Vertex AI release notes](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes), [VEO 4 Release Date 2026 — Vexub](https://vexub.com/blog/veo-4-release-what-we-know).

### Runway / Kling / Pika — pas de news majeure 01/06-02/06

- **Runway** : Gen-4.5 stable depuis décembre 2025. Pas de release notes nouvelles sur la fenêtre.
- **Kling 3.0** : stable depuis février 2026. 4K/60fps, multi-shot, audio sync.
- **Pika** : Pika 2.5, pas de mouvement notable.
- **Runway Gen-4.5 expose Sora-2 Pro en API** : plan C "passerelle Sora-2 Pro via Runway" reste valide après 19h ce soir si besoin.
- Sources : [Runway changelog](https://runwayml.com/changelog), [Best AI Video Models 2026 — UlazAI](https://ulazai.com/ai-video-models-guide-2025/).

---

## 📌 Actions recommandées

1. **🔴 PRIORITÉ 1 — Veo 3.1 Lite primary EN PROD aujourd'hui avant 19h** : si pas encore basculé 100%, faites-le maintenant. T-0. Vérifier : quotas Vertex AI, monitoring prod actif, alertes erreurs API, prompts de référence rejoués sur les 24 dernières heures.
2. **🔴 PRIORITÉ 2 — Service Health Azure** : confirmer que les alertes sont **actives** sur deployment Sora-2 v2025-10-06 avant 19h00. Préparer la capture d'écran de la première erreur 410 pour archive / éventuel ticket support.
3. **🔴 PRIORITÉ 3 — Build 2026 keynote LIVE 18h30 Paris** : monitorer **en direct** pour :
   - (a) annonce vidéo first-party MS surprise (très peu probable mais timing parfait avec retirement Sora-2),
   - (b) extension Sora-2 de dernière minute (très peu probable),
   - (c) confirmation officielle Project Polaris (forte probabilité),
   - (d) Foundry multi-modal + nouveaux modèles tiers (probable).
   Prendre des notes en direct. Préparer un debrief court pour demain matin.
4. **🟡 PRIORITÉ 4 — Plan B "API Sora-2 directe OpenAI"** : clé + endpoint + 1 prompt test à valider une dernière fois **avant 19h**. Disponible jusqu'au **24 septembre 2026** si besoin de revenir sur Sora-2 hors Foundry.
5. **🟡 PRIORITÉ 5 — Communication utilisateurs bot** : envoyer mardi matin (ou dès maintenant) le message court "bascule vidéo Sora→Veo aujourd'hui à 19h, qualité comparable, prompts inchangés". Ajouter mention "monitoring annonces Build 2026 ce soir, ajustement possible cette semaine".
6. **🟢 PRIORITÉ 6 — Surveillance Build Day 2 (3 juin)** : sessions Azure AI Platform / Foundry à scanner pour annonce vidéo retardataire ou modèle tiers (Stability AI ? Cohere video ?).
7. **🟢 PRIORITÉ 7 — Tracking Project Polaris** : si confirmé Day 1, écrire une note de veille séparée. Signal stratégique long terme = MS construit ses modèles in-house sur Maia. Hypothèse "Polaris-Video" à 6-12 mois reste théorique mais à surveiller.

---

## Sources

### OpenAI / Sora
- [OpenAI News](https://openai.com/news/)
- [OpenAI Newsroom — Company announcements](https://openai.com/news/company-announcements/)
- [OpenAI API Deprecations](https://developers.openai.com/api/docs/deprecations)
- [Sora discontinuation — OpenAI Help Center](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [Sora's App Is Dead, But the API Still Works Until September — Pixo](https://pixo.video/blog/sora-api-still-available)
- [Sora-2 API shutdown date announced — Apiyi](https://help.apiyi.com/en/sora-2-api-shutdown-alternatives-2026-en.html)
- [OpenAI Release Notes May 2026 — Releasebot](https://releasebot.io/updates/openai)
- [LLM News Today June 2026 — llm-stats.com](https://llm-stats.com/ai-news)
- [Why OpenAI Shut Down Sora 2: Costs, Risk, Monetization — AI News Today](https://ai-news-today.github.io/chatgpt/en/articles/openai-sora2-shutdown-2026/)

### Microsoft Foundry / Azure / Build 2026
- [Foundry Models lifecycle and support policy](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)
- [Model retirement schedule — Microsoft Foundry](https://learn.microsoft.com/en-us/azure/ai-foundry/concepts/model-lifecycle-retirement?view=foundry-classic)
- [Azure AI Foundry Sora 2 retirement date — Microsoft Q&A](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)
- [Azure OpenAI is prematurely cutting off Sora 2 — OpenAI Dev Community](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475)
- [AI Model Catalog | Microsoft Foundry — Sora 2](https://ai.azure.com/catalog/models/sora-2)
- [Sora 2 video generation overview (preview) — Microsoft Learn](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [What's new in Microsoft Foundry | May 2026](https://devblogs.microsoft.com/foundry/whats-new-in-microsoft-foundry-may-2026/)
- [Microsoft Foundry Blog — What's New category](https://devblogs.microsoft.com/foundry/category/whats-new/)
- [Microsoft Build 2026 live — TechRadar](https://www.techradar.com/pro/live/microsoft-build-2026-live-all-the-updates-as-they-happen)
- [Microsoft Build 2026 starts today — NewsBytes](https://www.newsbytesapp.com/news/science/microsoft-build-2026-starts-today-what-to-expect/story)
- [Microsoft Build 2026 keynote preview — Notebookcheck](https://www.notebookcheck.net/Microsoft-Build-2026-What-to-expect-from-the-June-2-keynote.1311546.0.html)
- [How to watch Microsoft Build 2026 — Engadget](https://www.engadget.com/2183873/how-to-watch-microsoft-build-2026/)
- [How To Watch Microsoft Build 2026 — Dataconomy](https://dataconomy.com/2026/06/01/how-to-watch-microsoft-build-2026/)
- [Build 2026: MAI-Image 2.5, MAI-Voice 2, MAI-Transcribe 1.5 — Windows Forum](https://windowsforum.com/threads/microsoft-build-2026-mai-image-2-5-mai-voice-2-and-mai-transcribe-1-5.420924/)
- [MAI voice and image models for Build 2026 — TestingCatalog](https://www.testingcatalog.com/microsoft-readies-new-mai-voice-and-image-models-for-build-2026/)
- [Microsoft Build 2026 Recap (ChatForest preview)](https://chatforest.com/builders-log/microsoft-build-2026-recap-windows-agent-platform-project-polaris-copilot-workspace/)
- [Microsoft targets Claude Code with Project Polaris — AI Weekly](https://aiweekly.co/alerts/microsoft-targets-claude-code-with-project-polaris)
- [Microsoft Build 2026 Homegrown AI Models — Windows News](https://windowsnews.ai/article/microsoft-build-2026-homegrown-ai-models-to-power-github-copilot.420887)
- [Microsoft Build 2026 Agenda: Copilot Agents Dominate — Windows News](https://windowsnews.ai/article/microsoft-build-2026-agenda-copilot-agents-dominate-windows-12-nowhere-in-sight.421140)
- [Build 2026 platform shift to Agents / Foundry — Windows Forum](https://windowsforum.com/threads/build-2026-microsofts-platform-shift-to-ai-agents-copilot-azure-ai-foundry.420960/)
- [Sora 2 in Azure AI Foundry: responsible AI — Microsoft Azure Blog](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)

### Veo / Google DeepMind
- [Veo 3.1 — Google DeepMind](https://deepmind.google/models/veo/)
- [Veo 3.1 Lite + upscaling — Google Cloud Blog](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)
- [Vertex AI release notes — Generative AI](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes)
- [VEO 4 Release Date 2026 — Vexub](https://vexub.com/blog/veo-4-release-what-we-know)

### Concurrents / Benchmarks
- [Best AI Video Models 2026 — UlazAI](https://ulazai.com/ai-video-models-guide-2025/)
- [Runway AI Release Notes May 2026 — Releasebot](https://releasebot.io/updates/runwayai)
- [Best AI Video Generator in 2026 — Pixflow](https://pixflow.net/blog/best-ai-video-generator/)

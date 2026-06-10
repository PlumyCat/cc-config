# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-05-20

**Date :** mercredi 20 mai 2026
**Fenêtre couverte :** 18/05 (00h00 UTC) → 20/05 (08h00 UTC)
**Contexte bot :** Sora-2 sur Azure AI Foundry → retirement confirmé **2 juin 2026 (T-13)**. Fallback actuel : Veo 3.1 Lite (Vertex AI).

---

## 🔴 Nouveautés Sora-2 / OpenAI

**Pas de news OpenAI sur la fenêtre 18→20/05.** Statut inchangé depuis le dernier rapport :

- **Sora web/app** : discontinués le 26 avril 2026 (déjà acté).
- **API Sora 2 (OpenAI direct)** : retirement annoncé pour le **24 septembre 2026** (notification du 24/03/2026 — toujours d'actualité).
- **Pas de successeur vidéo OpenAI annoncé** sur les 48h. Aucun mouvement détecté côté OpenAI News, Release Notes Sora ou changelog API.
- Communauté dev OpenAI : aucun nouveau thread significatif sur l'API Sora-2 depuis le 18/05.

> La fenêtre rumeur "successeur vidéo OpenAI Q2 2026" reste vide. Pas d'annonce attendue de leur côté avant **Microsoft Build (2-3 juin)** ou plus tard.

---

## 🔵 Azure AI Foundry

**Statut inchangé — aucune annonce officielle Microsoft sur 48h.**

- **Sora-2 retirement sur Foundry : 2 juin 2026** (version `sora-2 v2025-10-06`) — confirmé par la documentation Foundry. Discordance toujours active avec la timeline OpenAI (24/09/2026).
- **Aucun successeur vidéo first-party Foundry annoncé** sur les 48h. La situation reste identique à celle décrite hier : Foundry s'apprête à perdre sa capacité vidéo le 02/06 sans modèle de remplacement annoncé publiquement.
- **Clarification importante sur MAI-Image-2** (correction du rapport précédent) : la documentation officielle Foundry (`labs.ai.azure.com/projects/mai-image-2/`, model card Foundry, blog techcommunity) qualifie MAI-Image-2 comme **modèle text-to-image**, PAS un modèle vidéo. Plusieurs sources tierces avaient employé le terme "video-generating" par erreur (probablement en référence au benchmark Arena.ai). **MAI-Image-2 n'est donc PAS un candidat pour remplacer Sora-2 dans le bot.**
- **MAI-Image-2-Efficient** annoncé en avril 2026 : reste image only, $5/M tokens input + $19.50/M tokens output. Aucune capacité vidéo.
- **Microsoft Build 2026** confirmé **2-3 juin 2026** = exactement la fenêtre de retirement Sora-2 sur Foundry. Forte probabilité d'une annonce vidéo first-party MS au keynote. Microsoft avait elle-même indiqué en avril "more exciting announcements lined up for Microsoft Build 2026".

---

## 🟢 Alternatives / Concurrents

### Google — Gemini Omni Flash : **ANNONCE MAJEURE** au keynote I/O (19/05)

**Évènement critique du jour.** Google a officialisé hier (19 mai 2026, ~10h PT) au keynote Google I/O 2026 le lancement de **Gemini Omni**, son nouveau modèle multimodal vidéo, en remplacement de la ligne Veo standalone. Sources convergentes (TechCrunch, VentureBeat, Decrypt, BusinessToday, Cybernews, TechTimes, Yahoo Tech).

**Faits confirmés :**

- **Nom du produit** : Gemini Omni. Premier modèle de la famille = **Gemini Omni Flash** (rolled out 19/05).
- **Capacités** : any-to-any (texte, image, audio, vidéo → vidéo). Le modèle "raisonne" à travers les modalités au lieu de simplement les concaténer. Édition vidéo conversationnelle.
- **Durée de sortie** : 10 secondes (Gemini Omni Flash).
- **Disponibilité consommateur (live le 19/05)** :
  - Gemini app : abonnés Google AI Plus ($20/mo), Pro ($30/mo), Ultra ($100/mo).
  - Flow (outil créatif).
  - **Gratuit pour YouTube Shorts et YouTube Create App** (signal distribution massive).
- **Disponibilité développeur** : ⚠️ **Gemini API + Vertex AI = "coming weeks"**. **API NON dispo au 20/05.** Pricing officiel non publié.
- **Pricing projeté** (non officiel, sources tierces ancrées sur Veo 3.1 Lite) : $1.50–2.50 / 1M tokens input + $0.20–0.60 / seconde de vidéo générée. **À traiter comme indicatif, non engageant.**
- **Stratégie Google** : sortir le générateur vidéo de la marque Veo standalone et le consolider sous Gemini. Sous le capot, Omni combine Veo, Imagen et Genie en un modèle unique.
- **"Riskiest feature held back"** (TechTimes) : Google a retenu la fonctionnalité la plus risquée (probablement génération de personnages photoréalistes nommés) au lancement — détail non précisé publiquement.

### Google — Veo 4 : **PAS d'annonce officielle au keynote**

- Veo 4 n'a **pas été annoncé** comme produit standalone à I/O 2026. La stratégie a pivoté : la ligne Veo est absorbée dans Gemini Omni.
- Plusieurs blogs (Nerdbot, Evolink, Polymarket) annoncent "Veo 4 is here" — **⚠️ non confirmé par Google/DeepMind officiel**. Probable confusion avec l'annonce Omni.
- **Veo 3.1 Lite reste l'option production-ready dispo sur Vertex AI API au 20/05.**

### Runway — stack agrégée (status mise à jour)

- **Runway Gen-4.5 dispo via Runway API** (text-to-video + image-to-video, durées 2-10s).
- Runway joue la carte agrégateur : disponibles sur leur platform/API → Kling 3.0, Kling 2.6 Pro, Kling 2.5 Turbo Pro, WAN2.2 Animate, GPT-Image-1.5, **Sora 2 Pro**, Seedance 2.0, Gemini 3 Pro Image (ajouté le 30/04).
- **Lecture stratégique** : Runway est devenu un guichet unique multi-modèles → fallback opérationnel pour le bot si on accepte une dépendance Runway. Le fait que **Sora 2 Pro reste accessible via Runway** après le retirement Foundry/OpenAI direct est à étudier (probablement contrat enterprise spécifique entre OpenAI et Runway).

### Kling / Pika

- Pas de news majeure sur 48h. Kling 3.0 et Pika API restent disponibles via fal.ai et Runway. Pika reste limité côté features avancées (Pikaffects/Scene Ingredients non exposés en API).

---

## 📌 Actions recommandées

1. **🎯 ACTION CRITIQUE — Surveillance Vertex AI / Gemini Omni Flash API (J→J+21)** :
   - L'API Gemini Omni Flash arrivant "in the coming weeks" tombe pile dans la fenêtre du retirement Sora-2 Foundry (02/06).
   - **Mettre en place une surveillance quotidienne** de `ai.google.dev/gemini-api/docs/pricing` et du Vertex AI release notes pour la sortie de l'API Omni.
   - **Dès l'API dispo** : tester Omni Flash en parallèle de Veo 3.1 Lite sur le bot. Comparer (a) qualité 10s output, (b) latence, (c) pricing réel, (d) terms of service pour usage commercial.

2. **🔴 ACTION URGENTE — Microsoft Build 2026 (2-3 juin)** :
   - Build = exactement le jour du retirement Sora-2 sur Foundry (02/06). **Coïncidence trop énorme pour être fortuite** — annonce vidéo first-party MS hautement probable.
   - **Activer un suivi temps réel du keynote Build le 02/06** (livestream + blog officiel devblogs.microsoft.com/foundry + techcommunity).
   - Scénarios à anticiper :
     - **Scénario A** : MS annonce un modèle vidéo first-party Foundry (MAI-Video-1 ?) → tester immédiatement, candidat pour rester chez MS.
     - **Scénario B** : MS annonce un partenariat (Runway ? autre ?) → étudier l'option.
     - **Scénario C** : MS prolonge Sora-2 Foundry au-delà du 02/06 → soulagement temporaire, garde Veo 3.1 Lite en plan B.
     - **Scénario D** : aucune annonce vidéo → bot reste sur Veo 3.1 Lite/Omni, switch cloud effectif vers GCP.

3. **🟡 ACTION — Mettre à jour la doc interne sur MAI-Image-2** :
   - **Corriger** toute mention "MAI-Image-2 = modèle vidéo" dans les notes/backlog. C'est un modèle **text-to-image**, pas vidéo.
   - Retirer MAI-Image-2 de la liste des candidats successeurs Sora-2.

4. **🟢 ACTION — Évaluer Runway comme fallback multi-modèles** :
   - Runway propose Sora 2 Pro + Kling 3.0 + Seedance 2.0 + Gen-4.5 via une seule API.
   - **Lire les terms of service Runway** pour usage commercial automatisé (bot).
   - Comparer pricing Runway vs Vertex AI direct sur Veo 3.1 Lite et Omni Flash (quand dispo).

5. **📊 Communication d'incident "Sora-2 retirement"** :
   - **T-13 jours** avant le 02/06. Le template d'annonce utilisateurs/clients (suggéré dans rapport du 18/05) doit être finalisé cette semaine.
   - Mention à inclure : choix du moteur de remplacement n'étant pas encore figé (dépend de l'annonce Build), communication post-Build prévue.

---

## Sources

### Sora-2 / OpenAI (vérifiées 20/05 ~08h UTC, pas de changement vs 18/05)
- [Sora 2 is here | OpenAI](https://openai.com/index/sora-2/)
- [What to know about the Sora discontinuation | OpenAI Help](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [Sora-2 API shutdown date announced (24 sept) — Apiyi.com](https://help.apiyi.com/en/sora-2-api-shutdown-alternatives-2026-en.html)
- [Why OpenAI Shut Down Sora 2 — ai-news-today](https://ai-news-today.github.io/chatgpt/en/articles/openai-sora2-shutdown-2026/)
- [Deprecations | OpenAI API](https://developers.openai.com/api/docs/deprecations)

### Azure AI Foundry — Sora-2 retirement & MAI clarification
- [Azure AI Foundry Sora 2 retirement date — MS Q&A #5881436](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)
- [Sora 2 video generation overview (preview) — MS Learn](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Foundry Models lifecycle and support policy](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)
- [Model retirement schedule (Foundry)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirement-schedule)
- [Introducing MAI-Transcribe-1, MAI-Voice-1, and MAI-Image-2 — TechCommunity](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/introducing-mai-transcribe-1-mai-voice-1-and-mai-image-2-in-microsoft-foundry/4507787)
- [MAI-Image-2 — Azure AI Foundry Labs](https://labs.ai.azure.com/projects/mai-image-2/)
- [Introducing MAI-Image-2-Efficient — TechCommunity](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/introducing-mai-image-2-efficient-faster-more-efficient-image-generation/4510918)
- [What's new in Microsoft Foundry | April 2026](https://devblogs.microsoft.com/foundry/whats-new-in-microsoft-foundry-apr-2026/)

### Google I/O 2026 — Gemini Omni (NOUVEAUTÉ MAJEURE 19/05)
- [Google's Gemini Omni turns images, audio, and text into video — TechCrunch (19/05)](https://techcrunch.com/2026/05/19/googles-gemini-omni-turns-images-audio-and-text-into-video-and-thats-just-the-start/)
- [Google unveils Gemini Omni 'any-to-any' AI model: what enterprises should know — VentureBeat](https://venturebeat.com/ai/google-unveils-gemini-omni-any-to-any-ai-model-what-enterprises-should-know)
- [Google Unveils Gemini Omni — Decrypt (19/05)](https://decrypt.co/368393/google-unveils-gemini-omni-next-gen-ai-video-builder-simulate-world)
- [Google Launches Gemini Omni Video Model, but Holds Back Its Riskiest Feature — TechTimes (19/05)](https://www.techtimes.com/articles/316859/20260519/google-launches-gemini-omni-video-model-holds-back-its-riskiest-feature.htm)
- [Google I/O 2026: Google unveils Gemini Omni AI video editing model — BusinessToday (19/05)](https://www.businesstoday.in/technology/artificial-intelligence/story/google-io-2026-google-unveils-gemini-omni-ai-video-editing-model-532350-2026-05-19)
- [Google pushes "agentic AI" at I/O 2026 with Gemini Omni, Antigravity — Cybernews](https://cybernews.com/ai-news/google-io-2026-gemini-omni-antigravity-agentic-ai/)
- [Gemini Omni Replaces Veo video model — Blockchain News](https://blockchain.news/ainews/gemini-omni-replaces-veo-video-model)
- [Gemini Omni: One Model for Text, Image, Audio, and Video — DataCamp](https://www.datacamp.com/blog/gemini-omni)
- [Google Unveils Gemini Omni — Yahoo Tech](https://tech.yahoo.com/ai/gemini/articles/google-unveils-gemini-omni-next-192650474.html)

### Gemini Omni Flash — pricing / API
- [Gemini Omni API Pricing: What It'll Cost (May 2026) — TECHSY](https://techsy.io/en/blog/gemini-omni-api-pricing)
- [Google Gemini Omni Flash: What Developers Need to Know — byteiota](https://byteiota.com/google-gemini-omni-flash-what-developers-need-to-know/)
- [Google Launches Gemini Omni Flash Model with Synchronized Audio — Technobezz](https://www.technobezz.com/news/google-launches-gemini-omni-flash-model-that-generates-video-with-synchronized-audio)
- [Gemini Developer API pricing | Google AI for Developers](https://ai.google.dev/gemini-api/docs/pricing)

### Veo 4 — claims non confirmés
- [VEO 4 Release Date 2026 — Vexub](https://vexub.com/blog/veo-4-release-what-we-know)
- [Veo 4 Updates — Imagine.art](https://www.imagine.art/blogs/google-veo-4-updates)
- [When Is Veo 4 Coming Out — Techwelo](https://techwelo.com/when-is-veo-4-coming-out/)

### Runway / Concurrents (mise à jour 20/05)
- [Runway AI Release Notes May 2026 — Releasebot](https://releasebot.io/updates/runwayai)
- [Best AI Video Generator 2026 — Pixflow](https://pixflow.net/blog/best-ai-video-generator/)
- [Complete Guide to AI Video Generation APIs in 2026 — WaveSpeed](https://wavespeed.ai/blog/posts/complete-guide-ai-video-apis-2026/)
- [Best Text-to-Video API in 2026 — WaveSpeedAI](https://wavespeed.ai/blog/posts/best-text-to-video-api-2026/)

### Microsoft Build 2026 (T-13)
- [What's new in Microsoft Foundry | April 2026 (annonce Build à venir)](https://devblogs.microsoft.com/foundry/whats-new-in-microsoft-foundry-apr-2026/)
- [Microsoft Foundry Deepens Multimedia Stack — HyperFRAME](https://hyperframeresearch.com/2026/04/09/microsoft-foundry-deepens-multimedia-stack-in-house-mai-models-aim-to-lower-the-cost-of-intelligence/)

---

*Rapport quotidien automatique 2026-05-20 ~08h UTC. **Conclusion du jour : événement majeur côté Google — Gemini Omni Flash lancé hier au keynote I/O, consommateur live, API Vertex "coming weeks". Omni absorbe la ligne Veo. Côté OpenAI/Microsoft : aucune news, statut migration inchangé, retirement Sora-2 Foundry confirmé 02/06 (T-13). Coïncidence stratégique forte : Microsoft Build 2026 = 2-3 juin = jour du retirement Sora-2 → annonce vidéo MS first-party hautement probable. Correction de doc : MAI-Image-2 = text-to-image, PAS vidéo. Action critique : surveiller release API Omni sur Vertex AI dans les 21 prochains jours et le keynote Build le 02/06.***

# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-05-21

**Date :** jeudi 21 mai 2026
**Fenêtre couverte :** 20/05 08h05 UTC → 21/05 ~07h UTC (~23h)
**Contexte bot :** Sora-2 sur Azure AI Foundry → retirement 2 juin 2026 (**T-12 jours**). Fallback actuel : Veo 3.1 Lite (Vertex AI).

---

## 🔴 Nouveautés Sora-2 / OpenAI

### Clarification majeure — "Spud" = GPT-5.5, PAS un successeur vidéo de Sora-2

Le rapport du 20/05 08h évoquait deux hypothèses contradictoires autour du codename "Spud". Les recherches d'aujourd'hui **lèvent l'ambiguïté** :

- **"Spud" est le codename de GPT-5.5**, annoncé par OpenAI le **23 avril 2026** et déployé sur ChatGPT Plus/Pro/Business/Enterprise le même jour. Source primaire : Axios (23/04/26), Wikipedia GPT-5.5, OpenAI API docs (`developers.openai.com/api/docs/models/gpt-5.5`).
- GPT-5.5 est **omnimodal en entrée** (texte, image, audio, vidéo) mais **sort principalement du texte** — pas de génération vidéo native. La capacité "vidéo" évoquée est de la **compréhension/analyse** (résumé d'une vidéo, Q&A sur transcript), pas de la **génération**.
- Les sources tierces (MindStudio, Digital Today, FindSkill, Xpert.digital) qui présentaient Spud comme "successeur vidéo de Sora-2" étaient **incorrectes** ou faisaient une extrapolation abusive.
- **GPT-5.5 Instant** a été déployé en free-tier le **5 mai 2026** comme modèle par défaut ChatGPT, remplaçant GPT-5.3 Instant.

### Position officielle OpenAI sur la génération vidéo

- **Pas de successeur Sora-2 annoncé.** OpenAI a explicitement déclaré abandonner la génération vidéo consumer pour se recentrer sur l'IA enterprise/agentic.
- Citation des sources tierces (PrimeAICenter, AICC) : *"Sora's video generation capabilities have not been replaced in OpenAI's current product lineup."*
- Sora-2 API reste théoriquement opérationnel **jusqu'au 24 septembre 2026** côté OpenAI direct (en dehors d'Azure). Sora app discontinuée depuis le **26 avril 2026**.

### Activité OpenAI du 20/05 (signal faible)

- Publication d'une note recherche "Advancing content provenance for a safer, more transparent AI ecosystem" (20/05). Sujet : provenance/watermarking. Pas d'impact direct sur le bot vidéo, mais pertinent pour la stratégie de traçabilité long terme.

### DALL·E déprécié

- **dall-e-2** et **dall-e-3** ont été supprimés de l'API OpenAI le **12 mai 2026** (release note OpenAI changelog). Réalignement avec GPT-5.5 et gpt-image-1.5. **Pas un sujet vidéo**, mais signal de nettoyage agressif du catalogue OpenAI media.

### Implications bot

1. **Confirmation définitive** : pas de filière "Spud vidéo" à attendre côté OpenAI. La stratégie de switch vers Veo 3 / Veo 3.1 Lite est **la bonne décision long terme**.
2. **Retirement Sora-2 Foundry à T-12** : la migration définitive doit être bouclée d'ici le 31 mai (J-2 safety margin).
3. Pas d'incitation à attendre un éventuel modèle OpenAI vidéo dans les 6 prochains mois.

---

## 🔵 Azure AI Foundry

### Statut Sora-2 inchangé — confirmation publique de la divergence de dates

- La controverse communautaire reste très active sur Microsoft Q&A : *"Azure AI Foundry Sora 2 retirement date feels too early and conflicts with Azure communication — can support be extended to Sept 24?"* (page learn.microsoft.com/en-in/answers/questions/5881436).
- Réponse officielle MS confirmée : **les dates de retirement ne sont pas extensibles**. Source : `learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements` — *"Any change to a model's retirement date or lifecycle would have to come from the product team and would be reflected in the official Model Retirement Schedule and via the Models API."*
- **Aucun modèle vidéo alternatif hosté dans Foundry** : Sora-2 est l'unique option. Si MS ne publie pas de successeur d'ici le 2 juin, **Foundry n'aura plus de capacité vidéo first-party** (jusqu'à nouvel ordre).
- Un fil OpenAI Developer Community (`community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475`) renforce la pression de la communauté mais aucune escalade officielle.

### Doc Foundry — état des release notes

- Page "What's new in Azure OpenAI in Microsoft Foundry Models" (`learn.microsoft.com/en-us/azure/ai-services/openai/whats-new`) : pas de nouvelle annonce vidéo sur la fenêtre 20-21 mai.
- Dernières features mentionnées : Spillover (GA), gpt-realtime-1.5 et gpt-audio-1.5 (2026-02-23). Rien sur vidéo.

### Blog "Sora 2 in Azure AI Foundry" — toujours en ligne

- `azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/` reste accessible, **non mis à jour** pour refléter le retirement. Cohérent avec la stratégie habituelle MS de ne pas effacer les annonces historiques, mais source de confusion pour les nouveaux entrants.

### Build 2026 — T-12, T-11

- Conférence Microsoft Build se tient les **2-3 juin 2026** à San Francisco. **Le Day 1 coïncide exactement avec le retirement Sora-2 Foundry**.
- Keynote Satya Nadella + GitHub + Microsoft Foundry leadership annoncé. Tracks Day 2 : "AI Production", "Agentic Systems", "Cost & Efficiency".
- Session catalog public (`build.microsoft.com/sessions`). **Recommandation** : scanner spécifiquement les sessions "Foundry video", "MAI-Video", "generative media", "Sora" pour identifier toute annonce vidéo first-party prévue au keynote du 2 juin.

### Suite MAI Microsoft — pas de vidéo first-party

- Confirmation : la suite MAI (annoncée le 02/04/26) couvre **MAI-Image-2** (image only, pas vidéo), **MAI-Image-2-Efficient** (image efficiente), **MAI-Voice-1** (TTS), **MAI-Transcribe-1** (STT). **Pas de MAI-Video** annoncé.
- Les mentions "video-generating" autour de MAI-Image-2 dans certaines sources tierces sont **incorrectes** — la doc officielle Microsoft Foundry confirme image only.

---

## 🟢 Alternatives / Concurrents

### Veo 3.1 / Veo 3.1 Lite — pricing Vertex AI confirmé

Pricing observable (Vertex AI / Gemini API) :

| Modèle | Prix observé | Durée max | Note |
|--------|--------------|-----------|------|
| **Veo 3.1 Lite** | ~$0,05 / sec | 8 sec/gen | < 50% du coût Veo 3.1 Fast, même latence |
| **Veo 3.1 Fast** | ~$0,10 / sec (sans audio) | 8 sec/gen | Variante rapide |
| **Veo 3** (legacy) | $0,50 / sec (vidéo) / $0,75 / sec (vidéo+audio) | 8 sec/gen | À éviter — coût/sec ~10× supérieur à 3.1 Lite |

- Rate limit système : **30 000 RPM par modèle par région**.
- Pour clips > 8s, chaînage de générations nécessaire (× le coût).
- **Implication bot** : si le bot a basculé sur Veo 3.1 Lite, le coût/sec est ~10× inférieur à un Sora-2 standard (estimation). **Maintenir ce fallback est économiquement avantageux** indépendamment du sort de Sora-2 Foundry.

### Gemini Omni Flash — toujours en preview consumer, API "coming weeks"

- Statut inchangé depuis I/O 2026 (19/05) : **GA consumer** (Gemini app, Flow, YouTube Shorts/Create) ; **API developer "coming weeks"** (estimation 2-8 semaines).
- Caractéristiques : clips 10s avec audio synchronisé, édition par chat, SynthID watermark. Pas d'édition audio interne (verrou délibéré).
- **Non disponible API à ce jour** → pas un candidat opérationnel immédiat pour le bot. Garder en monitoring.

### Runway, Pika, Kling, Hailuo — état du marché concurrent

- **Runway Gen-4.5** : disponible via Runway API, durées 2-10s, text-to-video et image-to-video. Note : Runway a chuté de #1 (déc 2025) à #9 (avril 2026) en benchmark — pas de régression du modèle mais saturation par Kling 3.0, Seedance 2.0, HappyHorse.
- **Kling 3.0 Turbo** : multi-shot 3-15s avec subject consistency cross-camera. Référence pour clips narratifs > 8s.
- **Pika (Pikaffects, Pikaswaps, Pikadditions, Pikaformance)** : focus social media (Reels/TikTok/Shorts) + lip-sync rapide.
- **Hailuo / MiniMax** : value pick — qualité entre Pika et Runway, pricing inférieur. Pour high-volume où retry rate compte.
- **Aucune annonce majeure sur ces 24-48h** — marché stable côté indépendants pendant la frénésie Google I/O / OpenAI.

### Bing Video Creator — point de repère grand public

- Sora-2 est distribué **gratuitement via Bing Video Creator** (mobile + web) côté Microsoft Bing/Edge. Pas un canal API mais signale que MS valorise Sora-2 en surface produit consumer même en parallèle du retirement Foundry. **Possible signal** : MS pourrait maintenir Sora-2 en distribution non-API alors que Foundry coupe la voie développeur.

---

## 📌 Actions recommandées

### 🔴 Critique — décisions à boucler en 12 jours

1. **Boucler la migration Sora-2 → Veo 3.1 Lite définitivement** : T-12 avant le retirement Foundry. Date safety : **31 mai 2026** (J-2). Inclut tests de régression, monitoring coût, ajustements prompt engineering.
2. **Lever le scénario "OpenAI sort un successeur vidéo dans la fenêtre"** : la clarification "Spud = GPT-5.5 (LLM)" enterre cette hypothèse. **Pas de roadmap OpenAI vidéo à 6 mois.**

### 🟡 À monitorer activement

3. **Scanner le session catalog Build 2026** : `build.microsoft.com/sessions` est en ligne. Rechercher mots-clés : "video", "Sora", "Foundry video", "MAI-Video", "generative media", "Mustafa Suleyman" (CEO MS AI). Une session vidéo first-party serait un signal fort pour le keynote du 2 juin.
4. **Surveiller `learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirement-schedule`** : si la date passe du 02/06 au 24/09, c'est un signal de capitulation MS face à la pression communautaire.
5. **Veiller l'API Gemini Omni Flash** : passage "coming weeks" → GA dans la fenêtre 1-2 mois. Pourrait être un fallback de meilleure qualité que Veo 3.1 Lite (10s clips audio sync). Préparer un POC.

### 🟢 Bonus / opportunistes

6. **Évaluer Gemini 3.5 Flash comme controller du bot** (déjà recommandé hier) : 4× vitesse de Gemini 3.1 Pro pour orchestration/parsing.
7. **Documenter le decision log** : ajouter une note explicite dans le bot README sur "pourquoi Veo 3.1 Lite et pas Sora-2 Foundry" avec lien vers ce rapport. Utile pour onboarding futur ou si quelqu'un demande "pourquoi pas Sora-2 vu que MS l'a sur Foundry".

---

## Sources

### Clarification "Spud" = GPT-5.5
- [OpenAI releases "Spud" GPT-5.5 model — Axios](https://www.axios.com/2026/04/23/openai-releases-spud-gpt-model)
- [GPT-5.5 — Wikipedia](https://en.wikipedia.org/wiki/GPT-5.5)
- [GPT-5.5 Model — OpenAI API docs](https://developers.openai.com/api/docs/models/gpt-5.5)
- [GPT-5.5 Review (Spud) 2026 — PrimeAICenter](https://primeaicenter.com/gpt-5-5-review/)
- [GPT-5.5: OpenAI's Unified Multimodal Model — TeamDay](https://www.teamday.ai/blog/gpt-5-5-launch)
- [GPT 5.5 Pro: Spud Model — AI Profit Boardroom](https://aiprofitboardroom.com/blog/gpt-5-5-pro/)
- [Everything You Need to Know About GPT-5.5 — Vellum](https://www.vellum.ai/blog/everything-you-need-to-know-about-gpt-5-5)

### Sora-2 Azure Foundry — retirement & migration
- [Azure AI Foundry Sora 2 retirement date feels too early — Microsoft Q&A](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)
- [Model retirement schedule — Microsoft Learn](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirement-schedule)
- [Foundry Models lifecycle and support policy — Microsoft Learn](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)
- [Azure OpenAI is prematurely cutting off support for Sora 2 too early — OpenAI Dev Community](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475)
- [Sora 2 video generation overview (preview) — Microsoft Learn](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Sora 2 in Azure AI Foundry blog (toujours en ligne) — Azure Blog](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [Sora-2 access application form — Azure AI Foundry](https://ai.azure.com/catalog/models/sora-2)

### Sora discontinuation OpenAI
- [What to know about the Sora discontinuation — OpenAI Help Center](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [Changelog — OpenAI API](https://platform.openai.com/docs/changelog)
- [Sora (text-to-video model) — Wikipedia](https://en.wikipedia.org/wiki/Sora_(text-to-video_model))
- [OpenAI Sora Discontinuation: Enterprise AI Strategy — Futurum](https://futurumgroup.com/insights/openai-sora-discontinuation-what-the-end-of-a-platform-means-for-enterprise-ai-strategy/)

### Veo 3.1 / Vertex AI pricing
- [Veo 3.1 — Google DeepMind](https://deepmind.google/models/veo/)
- [Build with Veo 3.1 Lite — Google blog](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-lite/)
- [Introducing Veo 3.1 and new creative capabilities in the Gemini API — Google Developers](https://developers.googleblog.com/introducing-veo-3-1-and-new-creative-capabilities-in-the-gemini-api/)
- [Google Veo Pricing Calculator (May 2026) — Costgoat](https://costgoat.com/pricing/google-veo)
- [Agent Platform Pricing — Google Cloud](https://cloud.google.com/vertex-ai/generative-ai/pricing)

### Gemini Omni Flash — statut API
- [Gemini Omni Flash Shipped — WaveSpeed](https://wavespeed.ai/blog/posts/gemini-omni-flash-shipped-what-actually-launched/)
- [Introducing Gemini Omni — Google blog](https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-omni/)
- [Google launches Gemini Omni Flash — TheNextWeb](https://thenextweb.com/news/google-gemini-omni-flash-video-model-io-2026)
- [Google Gemini Omni — TechCrunch](https://techcrunch.com/2026/05/19/googles-gemini-omni-turns-images-audio-and-text-into-video-and-thats-just-the-start/)

### Microsoft Build 2026 + MAI suite
- [What's new in Microsoft Foundry — April 2026](https://devblogs.microsoft.com/foundry/whats-new-in-microsoft-foundry-apr-2026/)
- [Today we're announcing 3 new world class MAI models — Microsoft AI](https://microsoft.ai/news/today-were-announcing-3-new-world-class-mai-models-available-in-foundry/)
- [Introducing MAI-Transcribe-1, MAI-Voice-1, MAI-Image-2 — TechCommunity](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/introducing-mai-transcribe-1-mai-voice-1-and-mai-image-2-in-microsoft-foundry/4507787)
- [Microsoft takes on AI rivals with three new foundational models — TechCrunch](https://techcrunch.com/2026/04/02/microsoft-takes-on-ai-rivals-with-three-new-foundational-models/)
- [Microsoft Build 2026 — Lensmor attendee guide](https://www.lensmor.com/event-guides/microsoft-build-2026-attendee-guide)

### Concurrents (Runway, Pika, Kling, Hailuo)
- [Best AI Video Generator in 2026 — Pixflow](https://pixflow.net/blog/best-ai-video-generator/)
- [Runway AI Release Notes May 2026 — Releasebot](https://releasebot.io/updates/runwayai)
- [6 Best AI Video Generators in 2026 — ChatCut](https://chatcut.io/blog/best-ai-video-generator-2026)
- [AI Video Generator Pricing Comparison 2026](https://www.vo3ai.com/ai-video-generator-pricing-comparison)

### Bing Video Creator (Sora gratuite consumer)
- [Microsoft just made Sora AI video generation free via Bing Video Creator — Windows Central](https://www.windowscentral.com/microsoft/microsoft-bing-video-creator-sora-ai-generator-free-announcement)
- [OpenAI's Sora available FREE through Microsoft Bing Video Creator — VentureBeat](https://venturebeat.com/ai/openais-sora-is-now-available-for-free-to-all-users-through-microsoft-bing-video-creator-on-mobile)

---

*Rapport quotidien 2026-05-21. Prochain rapport : 2026-05-22.*

# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-05-18

**Période couverte :** 2026-05-17 09:00 UTC → 2026-05-18 09:00 UTC (~24h depuis le dernier rapport).
**Fenêtre filtrage :** sources ≤ 7 jours, doublons par rapport au rapport `2026-05-17-sora-veille.md` retirés.
**Tonalité du jour :** **🟠 J-1 avant Google I/O — veille tactique.** Aucune annonce officielle nouvelle côté OpenAI ou Microsoft sur 24h. Confirmation horaire I/O (mardi 19/05, 10h PT / 19h CET). Signal nouveau : article TechTimes 17/05 positionne Gemini-prochain "**derrière Claude Mythos et GPT-5.5**" — gestion d'attente downside Google. Article TechCrunch 15/05 sur la pivot Runway vers les world models (signal stratégique concurrent). Compteurs critiques inchangés : **retirement Sora-2 Foundry J-19 (06/06)**, legacy J-15 (02/06), **Google I/O T-1 (mardi)**, MS Build T-15 (02-03/06).

---

## 🔴 Nouveautés Sora-2 / OpenAI

**Pas de nouveauté officielle OpenAI sur 24h.** Aucun mouvement sur la page Deprecations, le Changelog, ni les Release Notes.

- App Sora : **T+22 post-shutdown** (26/04/2026), inchangé.
- API Sora (sora-2 + sora-2-pro) : **live jusqu'au 24/09/2026 (J-129 runway)**, inchangé.
- **OpenAI Deprecations page** : statut Sora 2 family + Videos API → shutdown 24/09/2026, "no recommended replacement" (inchangé au 18/05 09:00 UTC).
- **🔁 Clarification importante "Spud" vs rapports précédents** : la vérification croisée d'aujourd'hui confirme que **Spud = codename de GPT-5.5**, **modèle texte/multimodal/agentic released le 23/04/2026** (Axios, Wikipedia, OpenAI blog). Ce **n'est PAS** un successeur vidéo de Sora 2. Les démos type "interactive 3D worlds via Three.js" relèvent du génératif 3D agentic, pas du text-to-video haute fidélité. La fenêtre rumeur "successeur vidéo OpenAI Q2 2026" reste **non confirmée et non actionnable**.
  - **Impact bot vidéo** : aucun — Spud n'apporte pas de remplacement vidéo. La trajectoire reste : *Sora-2 API actif jusqu'au 24/09, puis trou sans successeur OpenAI officiel.*
- Pas de news vidéo majeure OpenAI dans la fenêtre 24h ni la semaine.

## 🔵 Azure AI Foundry

**Aucune nouveauté significative côté Azure / Foundry sur 24h. Statut critique inchangé.**

- 🚨 **Retirement Sora-2 Foundry = 06/06/2026 (J-19)** — INCHANGÉ. Aucun signal d'extension MS.
- **Legacy `sora-2-2025-10-06` retirement = 02/06/2026 (J-15)** — INCHANGÉ.
- **Policy MS "non-extensible" réaffirmée** dans MS Q&A active sur la fenêtre : *"Model retirement timelines are not extendable per customer since they are managed centrally for platform reliability, security, and consistency. A support request can clarify timelines or migration behavior, but it cannot be used to obtain an extension or a custom exception to the retirement date."* — confirmation explicite que **la voie support n'est PAS un recours**.
- **Gated preview Foundry** : J+29 sans GA, pricing inchangé ($0.10/s standard, $0.30/s Pro Global, $0.50/s Pro High-Res).
- **Catch-22 endpoint** workaround `POST {endpoint}/openai/v1/videos?api-version=preview` toujours nécessaire.
- **Microsoft 365 Copilot — Sora 2 Create** : pas de news nouvelle 24h. Tension Copilot Create vs Foundry retirement non résolue.
- **MAI-Video / first-party MS** : pas de nouveau signal sur 24h. MAI-Image-2 reste **vidéo** sur Foundry (model card depuis avril, confirmé par recherche Foundry "what's new"). À noter : **discrépance de nomenclature** — "MAI-Image-2" est décrit comme *"a video-generating model"* selon plusieurs sources, ce qui suggère que MS a déjà un modèle vidéo first-party utilisable en preview/limited. À investiguer en priorité (le nom trompeur "Image-2" pour de la vidéo a probablement masqué ce signal jusqu'ici).
- **MS Build 2026 (T-15, 02-03/06 SF)** : session catalog toujours pas de mention vidéo explicite. Fenêtre toujours étroite : Build (02-03/06) tombe **APRÈS retirement legacy 02/06** et **AVANT retirement overall 06/06** = **3 jours pour migrer si annonce vidéo first-party à Build**.

## 🟢 Alternatives / concurrents

**🔥 Pré-I/O T-1 — confirmation finale du timing :**

- **Google I/O 2026 — horaire confirmé** :
  - **Keynote principal : mardi 19/05/2026, 10h PT / 13h ET / 19h CET**, Shoreline Amphitheatre (Mountain View), streaming live YouTube + io.google.
  - **Developer keynote : 13h PT** (suite).
  - **Note importante** : Android-specific news a été annoncée en avance lors du **The Android Show (12/05)** — le keynote I/O sera donc **focus AI / Gemini / produits / dev tools**, ce qui **augmente la probabilité d'une annonce vidéo majeure** (Veo 4 / Omni) compte tenu du temps de scène à remplir avec du contenu non-Android.
- **🆕 Signal nouveau — gestion d'attentes par TechTimes (17/05)** : article *"Google I/O 2026 Keynote Opens Tuesday as New Gemini Lands Behind Mythos and GPT-5.5"* positionne le prochain Gemini comme **"meaningfully short of Anthropic's Claude Mythos"** (frontier model annoncé le 07/04 qui a redéfini le benchmark industriel) et globalement au niveau de GPT-5.5. **Implication** : si TechTimes a raison sur le tier global Gemini, **l'argument vidéo (Veo 4 / Omni) devient encore plus stratégique pour Google** — c'est probablement le différenciateur majeur que Google va pousser au keynote (Anthropic n'a pas de modèle vidéo, OpenAI a tué Sora).
  - À retenir : **probabilité Veo 4 / Omni annoncé au keynote = très haute** (cohérent avec contournement narratif).
- **Préview I/O — confirmations cross-sources** :
  - Android Central, Tom's Guide, Yahoo Tech, Android Authority listent **Veo, Imagen, Omni** parmi les annonces générative attendues au keynote (cohérent inter-sources).
  - **Genie 3, Gemma 4, Gemini Robotics ER-1.6** également listés (cf. TechTimes) — signal que Google va couvrir tout le spectre (texte, image, vidéo, robotique, world models). Compétition directe avec la pivot Runway "world models" (cf. ci-dessous).
- **🆕 Runway pivote vers les world models (TechCrunch 15/05)** :
  - Article *"Runway started by helping filmmakers — now it wants to beat Google at AI"* (TechCrunch, 15/05/2026).
  - **Chiffres clés** : Runway valorisé à **$5.3B**, **$40M ARR Q2 2026** (+$40M ajouté ce trimestre).
  - **Pivot stratégique** : le "next form of AI intelligence won't be built from text, but from video and world models that learn how the world works". 1er world model lancé **décembre 2025**, 2e prévu **cette année**.
  - **⚠️ Implication concurrentielle** : Runway sort du pur text-to-video pour viser les world models, terrain où Google se positionne aussi (Genie 3). Pour le bot vidéo, Runway reste **fallback opérationnel via API** (Kling, Sora 2 Pro, Seedance entre autres disponibles intégrés Runway) — pas de risque immédiat de déprécation, mais surveiller si la roadmap vidéo "classique" est sous-investie post-pivot.
- **Veo 3.1 Lite (Vertex AI)** : production-ready, pricing **~$0.05/s** confirmé (vs ~$0.10/s Sora-2 Foundry standard = **50% moins cher**). Pas de changement sur 24h. **Reste l'option migration prioritaire avant 06/06**.
- **Veo 4 articles "Is Here"** : toujours **non confirmé** par DeepMind/Google officiel (deepmind.google/models/veo/ liste Veo 3.1 comme latest au 18/05). Confirmation attendue **demain au keynote**.
- **Gemini Omni** : confirmation attendue **demain au keynote**. UI strings prod déjà repérées dans Gemini app (cf. rapports précédents). Sources additionnelles 24h : 9to5google publie *"Gemini 'Omni' video model shows up with some early demos"* (consolide démos circulant). Confirmation attendue.
- **Pricing AI vidéo — repère 2026** :
  - Veo 3.1 Lite : **$0.05/s** Vertex AI
  - Veo 3.1 Fast (sans audio) : $0.10/s (Vertex AI / fal / Replicate)
  - Veo 2 : $0.50/s
  - Sora-2 Foundry standard : $0.10/s (équivalent Veo 3.1 Fast)
  - **Conclusion pricing** : Veo 3.1 Lite reste l'option la moins chère du marché à fidélité comparable.
- **Seedance 2.0** : statut inchangé (US bloqué hors partenaires API), state-of-the-art narrative-driven.
- **Pas de news majeure sur Kling, Pika, Vidu, LTX, Higgsfield, Grok Imagine sur 24h**.

---

## 📌 Actions recommandées

1. **🚨 CRITIQUE — Migration Veo 3.1 Lite (Vertex AI) avant J-19 (06/06) inchangée.** La policy MS "non-extensible" est explicitement confirmée à nouveau dans les sources 24h. Aucun espoir d'extension Foundry. **Veo 3.1 Lite à $0.05/s reste la meilleure option migration immédiate** (50% moins cher que Sora-2 Foundry standard, production-ready).

2. **⏰ T-1 — Plan d'écoute Google I/O 2026 demain (19/05) :**
   - **Keynote principal : 10h PT / 19h CET mardi**.
   - **Trigger 1 — Veo 4 annoncé officiellement** : si dispo Vertex AI day-1, comparer pricing/quality vs Veo 3.1 Lite. Upgrade si pricing acceptable.
   - **Trigger 2 — Gemini Omni officialisé** : vérifier disponibilité Vertex AI / API. Si oui, **évaluation prioritaire** (audio natif + édition chat = différenciateur fort).
   - **Trigger 3 — TechTimes a raison sur "Gemini behind Mythos/GPT-5.5"** : aucun impact sur le bot vidéo (modèle texte). Mais surveiller si Google compense par un push vidéo agressif.
   - **Trigger 4 — Ni Veo 4 ni Omni annoncés/dispo dev day-1** : tenir Veo 3.1 Lite et **activer Seedance 2.0** (via Runway API) en second fallback si bot non-US.

3. **🔍 NOUVEAU — Investiguer MAI-Image-2 comme option vidéo first-party MS :**
   - Plusieurs sources décrivent MAI-Image-2 comme "**a video-generating model**" disponible sur Foundry.
   - **Action concrète** : vérifier model card officielle Foundry et tester si MAI-Image-2 répond au cahier des charges du bot vidéo (durée, résolution, audio, pricing, terms of service, region availability).
   - Si oui, **MAI-Image-2 = candidat sérieux pour rester chez MS** post-Sora-2 retirement, ce qui simplifierait la gouvernance (pas de switch cloud).

4. **🛡️ Surveillance — pivot Runway vers world models** :
   - Pas d'action immédiate. Runway reste un fallback opérationnel via API.
   - Surveiller annonces Runway prochaines semaines pour vérifier que la roadmap vidéo "classique" (Gen-4, Aleph) n'est pas dépriorisée.

5. **📊 Préparer la communication d'incident "Sora-2 retirement"** : créer dès cette semaine un template d'annonce utilisateurs/clients pour publication semaine du 02/06 (J-15). Inclure : changement de moteur vidéo, qualité comparable, transition transparente.

6. **🧹 Hygiène veille — clarification "Spud"** : Spud = GPT-5.5 (texte/multimodal/agentic), pas un successeur vidéo Sora. Retirer toute mention "Spud video successor" des notes internes. La fenêtre rumeur "successeur vidéo OpenAI Q2 2026" reste vide.

---

## Sources

### Sora-2 / OpenAI (vérifiées 18/05 09:00 UTC)
- [Sora 2 is here | OpenAI](https://openai.com/index/sora-2/)
- [Sora — Release Notes (OpenAI Help)](https://help.openai.com/en/articles/12593142-sora-release-notes)
- [What to know about the Sora discontinuation | OpenAI Help](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [Deprecations | OpenAI API](https://developers.openai.com/api/docs/deprecations)
- [Changelog | OpenAI API](https://developers.openai.com/api/docs/changelog)
- [Is the Sora2 API still working? — OpenAI Dev Community](https://community.openai.com/t/is-the-sora2-api-still-working/1379946)
- [OpenAI News](https://openai.com/news/)

### GPT-5.5 "Spud" clarification (released 23/04/2026, NON-vidéo)
- [Introducing GPT-5.5 | OpenAI](https://openai.com/index/introducing-gpt-5-5/)
- [OpenAI releases "Spud" GPT-5.5 model — Axios (23/04/2026)](https://www.axios.com/2026/04/23/openai-releases-spud-gpt-model)
- [GPT-5.5 — Wikipedia](https://en.wikipedia.org/wiki/GPT-5.5)
- [Leaked ChatGPT 5.5 Pro Tests Reveal OpenAI's "Spud" Building Interactive 3D Worlds — Geeky Gadgets](https://www.geeky-gadgets.com/openai-gpt-5-5-pro-leak/)

### Azure AI Foundry — Sora-2 retirement & docs (vérifiées 18/05 09:00 UTC)
- [Azure AI Foundry Sora 2 retirement date — MS Q&A #5881436](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)
- [Can We extend the current Azure OpenAI Model Deployment — MS Q&A #5857280](https://learn.microsoft.com/en-in/answers/questions/5857280/can-we-extend-the-current-azure-openai-model-deplo)
- [Foundry Models lifecycle and support policy](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)
- [Model retirement schedule (Foundry)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirement-schedule)
- [AI Model Catalog — sora-2](https://ai.azure.com/catalog/models/sora-2)
- [Azure OpenAI prematurely cutting off Sora 2 — OpenAI Dev Community #1380475](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475)
- [Sora 2 in Azure AI Foundry — Microsoft Azure Blog](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)

### Microsoft Foundry — MAI models / video (à investiguer)
- [Today we're announcing 3 new world class MAI models, available in Foundry — Microsoft AI](https://microsoft.ai/news/today-were-announcing-3-new-world-class-mai-models-available-in-foundry/)
- [Microsoft takes on AI rivals with three new foundational models — TechCrunch (02/04/2026)](https://techcrunch.com/2026/04/02/microsoft-takes-on-ai-rivals-with-three-new-foundational-models/)
- [What's new in Microsoft Foundry | Dec 2025 & Jan 2026](https://devblogs.microsoft.com/foundry/whats-new-in-microsoft-foundry-dec-2025-jan-2026/)

### Microsoft 365 Copilot — Sora 2 Create
- [Available today: OpenAI's Sora 2 in Microsoft 365 Copilot — TechCommunity](https://techcommunity.microsoft.com/blog/microsoft365copilotblog/available-today-openais-sora-2-in-microsoft-365-copilot/4469721)
- [Generative AI Video Comes to Microsoft 365 Copilot Create — TechCommunity](https://techcommunity.microsoft.com/blog/healthcareandlifesciencesblog/generative-ai-video-comes-to-microsoft-365-copilot-create/4480689)
- [AI video goes corporate — Windows Central](https://www.windowscentral.com/software-apps/ai-video-goes-corporate-microsoft-365-copilot-adds-openais-viral-sora-2)

### Microsoft Build 2026 (T-15)
- [Microsoft Build 2026 official](https://build.microsoft.com/en-US/home)
- [Microsoft Build 2026 — Tech PC Vipers](https://techpcvipers.com/microsoft-build-2026/)

### Google I/O 2026 (T-1) — keynote preview
- [Google I/O 2026 — io.google](https://io.google/2026/)
- [Google I/O 2026 Keynote Opens Tuesday as New Gemini Lands Behind Mythos and GPT-5.5 — TechTimes (17/05)](https://www.techtimes.com/articles/316755/20260517/google-i-o-2026-keynote-opens-tuesday-new-gemini-lands-behind-mythos-gpt-55.htm)
- [Google I/O 2026: AI Takes Center Stage With New Gemini and Video Generator — TrendingTopics](https://www.trendingtopics.eu/google-i-o-2026-ai-takes-center-stage-with-new-gemini-and-video-generator/)
- [Google I/O 2026: Date, time, potential announcements — Tom's Guide](https://www.tomsguide.com/phones/google-pixel-phones/google-i-o-2026-date-time-potential-announcements-and-everything-else-you-need-to-know)
- [What to Expect from Google I/O 2026 — Android Authority](https://www.androidauthority.com/what-to-expect-from-google-io-2026-3664979/)
- [Google I/O 2026 Live Blog — Android Central](https://www.androidcentral.com/phones/live/google-i-o-2026-live-blog-android-17-android-xr-glasses-and-all-the-gemini-ai-news)

### Gemini Omni leak (signal majeur, T-1 I/O)
- [Gemini 'Omni' video model shows up with some early demos — 9to5Google (11/05)](https://9to5google.com/2026/05/11/gemini-omni-video-model-shows-up-with-some-early-demos/)
- [Early look: Gemini Omni generates realistic AI video in new leak — Android Authority](https://www.androidauthority.com/google-gemini-omni-video-model-leak-3665801/)
- [Google's Gemini Omni video model surfaces ahead of I/O debut — Testing Catalog](https://www.testingcatalog.com/googles-gemini-omni-video-model-surfaces-ahead-of-i-o-debut/)
- [Gemini Omni Video Model at Google IO 2026 — iWeaver AI](https://www.iweaver.ai/blog/gemini-omni-video-model/)

### Veo 4 — "Is Here" claims (⚠️ NON confirmé par DeepMind/Google officiel au 18/05)
- [Veo 4 Is Here — Nerdbot](https://nerdbot.com/2026/05/12/veo-4-is-here-and-its-already-changing-what-ai-video-means/)
- [Veo 4 Release Date 2026 — Evolink](https://evolink.ai/blog/veo-4-release-date-2026)
- [Polymarket: VEO 4 released by June 2026](https://polymarket.com/event/veo-4-released-by)

### Veo / Google DeepMind / Vertex AI — sources officielles
- [Veo — Google DeepMind official](https://deepmind.google/models/veo/)
- [Veo 3.1 Lite and new upscaling capability on Vertex AI — Google Cloud Blog](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)
- [Build with Veo 3.1 Lite — Google Blog](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-lite/)
- [Vertex AI Pricing](https://cloud.google.com/vertex-ai/generative-ai/pricing)
- [Veo 3.1 Lite Pricing Guide 2026 — Veo3ai.io](https://www.veo3ai.io/blog/veo-3-1-lite-pricing-guide-2026)
- [Google Veo Pricing Calculator — CostGoat (May 2026)](https://costgoat.com/pricing/google-veo)

### Concurrents — autres modèles vidéo (24h)
- [Runway started by helping filmmakers — now it wants to beat Google at AI — TechCrunch (15/05)](https://techcrunch.com/2026/05/15/runway-started-by-helping-filmmakers-now-it-wants-to-beat-google-at-ai/)
- [Runway is trying to turn AI video into a world model business — Startup Fortune](https://startupfortune.com/runway-is-trying-to-turn-ai-video-into-a-world-model-business/)
- [Runway AI Release Notes May 2026 — Releasebot](https://releasebot.io/updates/runwayai)
- [Best AI Video Generators May 2026 — Pixflow](https://pixflow.net/blog/best-ai-video-generator/)
- [Seedance 2.0 Review — PixVerse](https://pixverse.ai/en/blog/seedance-2-0-review-prompts-and-use-cases)

---

*Rapport quotidien généré automatiquement le 2026-05-18 ~09:00 UTC. **Conclusion du jour : Pas de news officielle OpenAI/MS sur 24h — statut migration inchangé, Veo 3.1 Lite reste l'action critique avant J-19 (06/06). Signal Google I/O T-1 demain : TechTimes positionne Gemini "derrière Mythos et GPT-5.5" → pression sur Google pour livrer le différenciateur vidéo (Veo 4 / Omni) au keynote. Clarification importante : "Spud" = GPT-5.5 (texte/agentic released 23/04), pas un successeur vidéo Sora — la fenêtre "successeur vidéo OpenAI Q2" reste vide. Nouveauté actionnable : MAI-Image-2 décrit comme "video-generating model" sur Foundry — à investiguer comme option first-party MS pour rester chez Microsoft post-retirement.***

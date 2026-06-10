# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-05-20 (08h delta)

**Date :** mercredi 20 mai 2026
**Fenêtre couverte :** 20/05 07h30 → 20/05 08h05 UTC (delta vs rapport `2026-05-20-sora-veille.md` du même jour 07:23 UTC)
**Contexte bot :** Sora-2 sur Azure AI Foundry → retirement 2 juin 2026 (T-13). Fallback actuel : Veo 3.1 Lite (Vertex AI).

> Ce rapport est un **complément** du rapport principal du jour. Pour le contexte complet (Gemini Omni Flash, retirement Sora-2 Foundry 02/06, Build 2-3 juin, MAI-Image-2 = image only, Runway, etc.), se référer au rapport principal.

---

## 🔴 Nouveautés Sora-2 / OpenAI

**Aucune nouveauté officielle OpenAI sur la fenêtre.**

- **⚠️ Rumeur/clarification — codename "Spud"** : plusieurs articles tiers (digitaltoday.co.kr, xpert.digital, findskill.ai, theneurondaily.com, mindstudio.ai, glbgpt.com) circulent ce matin sur **"Spud"**, présenté soit comme :
  - **Hypothèse A** : le codename interne OpenAI de ce qui est finalement devenu **Sora 2** (rétrospective).
  - **Hypothèse B** : le **modèle vidéo successeur post-Sora-2**, dont le pré-entraînement serait "terminé" selon Sam Altman cité par ces sources, attendu "within a few weeks".
- Sources contradictoires sur les deux hypothèses, aucune confirmation OpenAI directe (pas de page openai.com/index sur Spud, pas de mention dans les release notes officielles Sora ou la page deprecations OpenAI API).
- **⚠️ Non confirmé** — à traiter comme rumeur tant qu'OpenAI ne publie pas de communication officielle.
- **Implication bot** : si l'hypothèse B se vérifie, OpenAI pourrait avoir un successeur dispo dans la fenêtre 6-10 semaines, ce qui changerait l'arbitrage stratégique post-02/06. À monitorer activement, mais **ne pas baser de décision opérationnelle là-dessus aujourd'hui**.

---

## 🔵 Azure AI Foundry

**Statut inchangé. Aucune annonce MS sur la fenêtre.**

- Confirmation indirecte du programme Build 2-3 juin via plusieurs sources (windowsnews.ai, wokeey.com, lensmor.com, thurrott.com) :
  - Day 1 (02/06) keynote Satya Nadella + Scott Guthrie : "next-generation Copilot capabilities, GitHub platform developments, and new APIs across Windows and Azure AI Foundry".
  - Day 2 (03/06) tracks "AI Production", "Agentic Systems", "Cost & Efficiency".
  - **Session catalog Build 2026 publié** (build.microsoft.com/sessions). À explorer pour repérer des sessions vidéo first-party (mot-clé "video generation", "MAI-Video", "Foundry video").
- Pas d'annonce vidéo first-party Foundry détectée dans la fenêtre.

---

## 🟢 Alternatives / Concurrents

### Google — Gemini 3.5 Flash : **GA confirmé** (info pas dans le rapport du matin)

- Annoncé hier au keynote I/O 2026 (19/05), **Gemini 3.5 Flash est généralement disponible** depuis hier soir/ce matin sur :
  - Gemini API (Google AI Studio)
  - Vertex AI / Gemini Enterprise Agent Platform
  - Android Studio
  - Google Antigravity
  - Gemini app + AI Mode dans Search (consommateur).
- Performance : **bat Gemini 3.1 Pro sur coding/agentic benchmarks à 4× la vitesse**. Scores : Terminal-Bench 2.1 (76.2%), GDPval-AA (1656 Elo), MCP Atlas (83.6%), CharXiv Reasoning (84.2% multimodal).
- **Non vidéo** : c'est un modèle texte/multimodal en input, mais output texte. Pas un candidat direct pour remplacer Sora-2 dans le bot.
- **Pertinence indirecte pour le bot** :
  - Si le bot a des composants d'orchestration / prompt routing / parsing, 3.5 Flash peut remplacer 3.1 Pro côté brain pour 4× moins cher/plus rapide.
  - **Préparer un prompt** Gemini Omni Flash (vidéo) en utilisant 3.5 Flash comme "controller" pourrait être pertinent.

### Google — Gemini 3.5 Pro : annoncé pour "next month"

- Google a indiqué (blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-5/) qu'un **Gemini 3.5 Pro** est en cours d'usage interne et sortira "next month" (≈ juin 2026).
- Pas de date précise. Probable annonce dans la fenêtre **fin juin / début juillet**, post-Build.

### Gemini Omni Flash — pas de changement

- API Vertex AI / Gemini API toujours "coming weeks". AI Studio preview "within roughly a month".
- Sources insistent que **deux variantes** ship at launch : **Omni Flash** (10s clips, rapide) et **Omni Pro** (durée plus longue, fidélité plus haute). Pricing projeté Omni Flash : ~$0.10/s standard, $0.30/s high quality. **Non officiel.**

### Sora-2 dispo dans Foundry — message contradictoire détecté

- Un résultat de recherche pointe vers `azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/` ("Sora 2 in Azure AI Foundry: Create videos with responsible AI"). Ce blog présente Sora-2 comme "now in public preview" et mentionne le formulaire d'access application (`ai.azure.com/catalog/models/sora-2`).
- **Cette page ne semble pas avoir été mise à jour** pour refléter le retirement programmé 02/06. **Possiblement obsolète** — à vérifier si Microsoft retire l'annonce dans les jours à venir, ou si elle reste online (signal d'un revirement éventuel).
- **Pas d'action immédiate** — la doc officielle de retirement (`learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirement-schedule`) reste la référence.

---

## 📌 Actions recommandées (deltas seulement)

1. **🟡 ACTION — Monitorer "Spud" / OpenAI successor** :
   - Ajouter `"OpenAI Spud"` et `"OpenAI video model 2026"` aux mots-clés de la veille quotidienne.
   - Surveiller specifically le compte X de Sam Altman et le blog openai.com pour une confirmation officielle dans les 6-10 semaines.

2. **🟢 ACTION — Évaluer Gemini 3.5 Flash pour orchestration bot** :
   - Si le bot utilise actuellement Gemini 3.1 Pro (ou équivalent) pour le routing/parsing, **tester un swap vers 3.5 Flash** sur un échantillon : gain attendu ~4× vitesse + coût réduit.
   - Ne pas confondre avec Gemini Omni Flash (vidéo) — 3.5 Flash est texte/multimodal in, texte out.

3. **🔵 ACTION — Scanner le session catalog Build 2026** :
   - `build.microsoft.com/sessions` désormais en ligne. Rechercher sessions contenant : "video", "Sora", "Foundry video", "MAI-Video", "generative media".
   - Si une session vidéo first-party est identifiée → forte probabilité d'annonce Foundry vidéo au keynote 02/06. Affiner le scénario A.

4. **🟢 ACTION — Vérifier le statut du blog "Sora 2 in Foundry"** :
   - Lien : `azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/`.
   - Vérifier dans les prochaines 48h si MS retire/met à jour cette page ou si elle reste en ligne. Sa persistance malgré le retirement programmé pourrait être un signal faible d'un revirement.

---

## Sources

### "Spud" / OpenAI next-gen video (⚠️ non confirmé officiellement)
- [OpenAI ends Sora video AI service, completes training of next-generation Spud model — Digital Today](https://www.digitaltoday.co.kr/en/view/43075/openai-ends-sora-video-ai-service-completes-training-of-next-generation-spud-model)
- [The end of OpenAI's Sora video AI – "Spud" is coming — Xpert.digital](https://xpert.digital/en/the-end-of-the-video-ki-sora/)
- [OpenAI Spud: They Killed Sora for This — FindSkill.ai](https://findskill.ai/blog/openai-spud-next-ai-model/)
- [OpenAI Kills Sora, Preps Spud Model — The Neuron Daily](https://www.theneurondaily.com/p/sora-lasted-6-months-disney-s-1b-deal-lasted-3)
- [Sora Discontinued: Why OpenAI is Killing Sora AI in 2026 — GLBGPT](https://www.glbgpt.com/hub/sora-discontinued/)
- [Why OpenAI Killed Sora and What It Means for AI Video Generation — MindStudio](https://www.mindstudio.ai/blog/why-openai-killed-sora-ai-video-generation-future)

### Gemini 3.5 Flash GA (I/O 2026)
- [Gemini 3.5: frontier intelligence with action — Google blog](https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-5/)
- [Google Introduces Gemini 3.5 Flash at I/O 2026 — MarkTechPost](https://www.marktechpost.com/2026/05/20/google-introduces-gemini-3-5-flash-at-i-o-2026-a-faster-and-cheaper-model-for-ai-agents-and-coding/)
- [Google I/O 2026: Google Rolls Out Gemini 3.5 Flash — Winbuzzer](https://winbuzzer.com/2026/05/19/google-rolls-out-gemini-35-flash-its-strongest-age-xcxwbn/)
- [Gemini 3.5 Flash is here — Android Authority](https://www.androidauthority.com/google-gemini-3-5-flash-3668559/)
- [Google launches Gemini 3.5 Flash, Spark, Omni and more — Yahoo Tech](https://tech.yahoo.com/ai/gemini/article/google-launches-gemini-35-flash-spark-omni-and-more-ai-updates-at-google-io-2026-172856601.html)
- [Google introduces Gemini Omni, Gemini 3.5 Flash, AI-powered Search upgrades — The Tech Portal](https://thetechportal.com/2026/05/20/google-introduces-gemini-omni-gemini-3-5-flash-ai-powered-search-upgrades-and-more-at-i-o-2026/)

### Gemini Omni Flash — statut API (inchangé)
- [Is Gemini Omni API Available? Model ID and Pricing Status — Evolink](https://evolink.ai/blog/gemini-omni-api-status)
- [Building With Gemini Omni: A Developer's Guide — Programming Insider](https://programminginsider.com/building-with-gemini-omni-a-developers-guide-to-googles-upcoming-video-api/)
- [Google Omni: Gemini Omni Video Model Updates — Blockchain Council](https://www.blockchain-council.org/ai/google-omni-gemini-omni-video-model/)

### Microsoft Build 2026 — session catalog & keynote
- [Microsoft Build 2026 in San Francisco — Windows News](https://windowsnews.ai/article/microsoft-build-2026-in-san-francisco-ai-agents-trust-and-developer-platform-shift.418934)
- [Microsoft's Build 2026 Session Catalog is Now Live — Thurrott](https://www.thurrott.com/microsoft/334704/microsofts-build-2026-session-catalog-is-now-live)
- [Microsoft Build 2026 Moves to San Francisco — Wokeey](https://www.wokeey.com/events/microsoft-build/)
- [Microsoft Build 2026: Sessions & Speakers — Lensmor](https://www.lensmor.com/event-guides/microsoft-build-2026-attendee-guide)
- [Microsoft Build 2026: What to Expect — TechPCVipers](https://techpcvipers.com/microsoft-build-2026/)

### Sora-2 Foundry — page possiblement obsolète
- [Sora 2 in Azure AI Foundry: Create videos with responsible AI — Azure Blog](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [Sora-2 access application form — Azure AI Foundry](https://ai.azure.com/catalog/models/sora-2)

---

*Rapport delta 2026-05-20 ~08h05 UTC. Voir rapport principal `2026-05-20-sora-veille.md` (07:23 UTC) pour le contexte complet.*

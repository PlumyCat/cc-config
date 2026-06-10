# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-05-17

**Période couverte :** 2026-05-12 09:02 UTC → 2026-05-17 09:00 UTC (~5 jours depuis le dernier rapport).
**Fenêtre filtrage :** sources ≤ 7 jours, doublons par rapport au rapport `2026-05-12-sora-veille.md` retirés.
**Tonalité du jour :** **🟠 J-2 avant Google I/O — pression montante.** Le leak Gemini Omni se confirme et passe largement mainstream (Android Authority, Digit, Testing Catalog, Aixploria). Articles "Veo 4 Is Here" en circulation (nerdbot 12/05, Programming Insider) MAIS toujours **non confirmés** par DeepMind/Google officiel. Aucune action MS sur le retirement Sora-2 Foundry. Compteurs critiques : **retirement Sora-2 Foundry J-20**, legacy J-16, **Google I/O T-2**, MS Build T-16.

---

## 🔴 Nouveautés Sora-2 / OpenAI

**Pas de nouveauté officielle OpenAI sur un successeur Sora-2 / API vidéo sur la fenêtre 5 jours.**

- App Sora : **T+21 post-shutdown** (26/04/2026), inchangé.
- API Sora (sora-2 + sora-2-pro) : **live jusqu'au 24/09/2026 (J-130 runway)**, inchangé. Liste complète des aliases dans la déprécation : `sora-2`, `sora-2-pro`, `sora-2-2025-10-06`, `sora-2-2025-12-08`, `sora-2-pro-2025-10-06` + Videos API.
- **OpenAI Deprecations page** : statut Sora 2 family + Videos API → **shutdown 24/09/2026, "no recommended replacement"** (inchangé au 17/05 09:00 UTC).
- **Autres déprécations 12/05 — non-vidéo mais signal "ménage API"** : DALL·E 2 + DALL·E 3 supprimés de l'API le 12/05/2026 (remplacés par gpt-image-2, gpt-image-1, gpt-image-1-mini). Realtime API Beta également supprimée le 12/05.
- **Rumeur "Spud" — mainstream tier 2 confirmé** : geeky-gadgets.com publie un article titré explicitement *"OpenAI's Powerful New ChatGPT 6 Model Code Named 'Spud'"* — élargissement notable au-delà des sources spécialisées. Xpert.digital également couvre *"The end of OpenAI's Sora video AI – 'Spud' is coming"*. Cohérence inter-sources renforcée :
  - Spud = API-only, focus **"Physical World Understanding"** (industriel/robotique), pas grand public.
  - Branding possible **ChatGPT 6 ou GPT-5.5**.
  - Timeline annoncée "avril-mai 2026" par certaines sources — fenêtre qui se ferme sans annonce officielle (J+22 sur la borne basse, J-14 sur la borne haute).
  - ⚠️ Aucune confirmation officielle OpenAI sur 5 jours. Rester en mode "rumeur élargie, non actionnable prod".
  - **Impact bot vidéo** : inchangé — pas avant Q4 2026 sur Azure si intégration MS confirmée.

## 🔵 Azure AI Foundry

**Aucune nouveauté significative côté Azure / Foundry sur 5 jours. Statut critique inchangé.**

- 🚨 **Retirement Sora-2 Foundry = 06/06/2026 (J-20)** — INCHANGÉ. Aucune communication MS sur extension ni successeur first-party vidéo.
- **Legacy `sora-2-2025-10-06` retirement = 02/06/2026 (J-16)** — INCHANGÉ.
- **Policy officielle MS confirmée à nouveau** : *"Retirement dates are not extendable. Any change would come from the product team via official Model Retirement Schedule and Models API. No supported mechanism for customers or support to request extension."* (cf. Foundry Models lifecycle policy). **Plus aucun espoir de delay côté Microsoft.**
- **Gated preview Foundry** : J+28 sans GA, pricing inchangé ($0.10/s standard, $0.30/s Pro Global, $0.50/s Pro High-Res).
- **Catch-22 endpoint** : workaround `POST {endpoint}/openai/v1/videos?api-version=preview` toujours nécessaire.
- **Microsoft 365 Copilot — Sora 2 dans Copilot Create** (annonce TechCommunity / Neowin / Windows Central, propagation continue sur la semaine) : confirmation que **Sora 2 reste intégré dans Copilot Create via Frontier program**. **⚠️ Tension importante** : MS promeut Sora 2 dans Copilot tout en retirant Sora 2 de Foundry au 06/06. Soit (a) Copilot bénéficiera d'une extension non documentée, soit (b) Copilot bascule vers MAI-Video / Spud / autre **avant** 06/06. Aucun signal MS pour clarifier — incohérence stratégique apparente.
- MAI-Video first-party : pas de signal nouveau sur 5 jours. MAI-Image-2 reste image-only sur la model card officielle.
- **Thread OpenAI Dev Community #1380475** (Azure cutting Sora-2 too early) : pas de réponse MS officielle sur 5 jours.
- **MS Q&A #5881436** : statut inchangé, pas d'extension confirmée.
- **Microsoft Build 2026** (T-16, 02-03/06 SF) :
  - Session catalog toujours pas de mention vidéo explicite.
  - Fenêtre toujours étroite : Build (02-03/06) tombe **APRÈS retirement legacy 02/06** et **AVANT retirement overall 06/06** = **3 jours pour migrer si annonce vidéo first-party à Build**.

## 🟢 Alternatives / concurrents

**🔥 Signal majeur du jour — Gemini Omni passe mainstream :**

- **Gemini Omni — leak confirmé large diffusion T-2 I/O** :
  - **Android Authority** publie *"Early look: Gemini Omni generates realistic AI video in new leak"*.
  - **Digit.in**, **AIxploria**, **Testing Catalog**, **WaveSpeed**, **PixVerse**, **NorthPennNow** couvrent le leak.
  - Premières spotted : "Powered by Omni" dans onglet vidéo Gemini (02/05) ; un Reddit user a obtenu **early access** au modèle Gemini Omni.
  - **Architecture** : modèle multimodal unifié (texte + image + vidéo + édition conversationnelle) — coexiste avec "Toucan" (codename du tool vidéo actuel sous Veo 3.1).
  - **Capacités démos** : audio sync natif, édition par chat (retirer watermarks, swap d'objets, réécrire scènes par instructions), génération picture+audio en une passe.
  - **Limitations connues** : ~10s/clip max, modèle lourd (testeurs Google AI Pro brûlent 86% de leur quota quotidien sur 2 prompts), fidélité brute *inférieure* à Seedance 2 mais éditing très supérieur.
  - **Probabilité officialisation I/O 19-20/05** : ✅ très haute (UI prod références confirmées, demos circulant).
  - **⚠️ Impact bot** : si Omni est l'évolution de Veo et arrive sur Vertex AI, **réévaluation immédiate du choix Veo 3.1 Lite** post-I/O.
- **Veo 4 — articles "Is Here" mais PAS de confirmation Google officielle** :
  - **nerdbot.com (12/05)** : *"Veo 4 Is Here — and It's Already Changing What 'AI Video' Means"*.
  - **programminginsider.com** : *"Veo 4 Is Here — and It Just Took the #1 Spot in the AI Video Arena"* (référence Arena leaderboard).
  - Specs annoncées (non vérifiées) : **4K cinematic, ~2 min/clip sans stitching**, audio natif synchro, character continuity, 40% plus rapide que Veo 3, 30s clip rendu rapide.
  - ⚠️ **Vérification croisée DeepMind/Google officiel sur 17/05 = ÉCHEC** :
    - `deepmind.google/models/veo/` : Veo 3.1 toujours présenté comme latest.
    - `blog.google` (recherche "Veo 4") : aucun article officiel "Veo 4" trouvé.
    - `cloud.google.com/blog` : pas d'annonce Veo 4 sur Vertex AI.
  - Conclusion : **Veo 4 = ⚠️ non confirmé** par sources officielles à J-2 d'I/O. Articles type "Veo 4 Is Here" probablement contenus SEO spéculatifs ou prises de devant. **Probabilité annonce officielle à I/O = très haute** (cohérent avec timing historique Google et avec leak Omni).
- **Polymarket "VEO 4 released by June 2026"** : non revérifié sur 24h, à reconfirmer post-I/O.
- **Veo 3.1 Lite (Vertex AI)** : production-ready actuelle pour le bot, pricing ~$0.05/s (vs ~$0.10/s Sora-2 Foundry standard). Pas de changement sur 5 jours.
- **Krea 2** : lancement le 12/05/2026 (cf. récap pixflow / AVB) — signal mineur, à évaluer si besoin alternative supplémentaire mais positionnement consumer pas évident pour bot prod.
- **Seedance 2.0 (ByteDance)** :
  - Sur **Runway API mid-avril** mais **bloqué aux US** (pushback Hollywood sur IP training data).
  - Couvre 100+ pays mais pas US. Disponible aux US **uniquement via partenaires API (Runway, fal)**.
  - ⚠️ **Implication pour bot français** : si Bot est hébergé hors US, Seedance 2.0 directement accessible. Si bot a des users US ou hébergement US, transit obligatoire via Runway/fal.
  - Reste **state-of-the-art** sur narrative-driven (multi-shot natif, audio synchro single-pass).
- **Hailuo MiniMax 2.3** + **Higgsfield** : upgrades majeurs 29/04 sur motion realism et cinematic camera control. Hailuo = "value pick 2026" — pricing inférieur aux Western models, qualité entre Pika et Runway.
- **Runway Characters** : real-time avatars conversationnels lancés (API + web demo) — pas directement vidéo générative mais montre direction Runway.
- **Kling / Pika / Vidu / LTX / Grok Imagine** : pas de news majeure 5 jours.

---

## 📌 Actions recommandées

1. **🚨 CRITIQUE — STATUS QUO : exécuter la migration Veo 3.1 Lite (Vertex AI) AVANT J-20 (06/06).** Ne PAS attendre I/O (J-2) ni Build (J-16) :
   - Pas de signal d'extension côté MS — policy "non-extensible" officiellement réaffirmée.
   - Veo 3.1 Lite est production-ready, pricing ~50% inférieur à Sora-2 Foundry standard.
   - Le bot peut être basculé maintenant, et upgradé post-I/O si annonce Veo 4 / Omni significative.

2. **⏰ T-2 — Préparer un plan d'écoute pour Google I/O 19-20/05 (lundi matin PT)** :
   - **Trigger 1** : Veo 4 annoncé officiellement → comparer pricing/availability/quality vs Veo 3.1 Lite. Upgrade si disponible sur Vertex AI immédiatement et pricing acceptable.
   - **Trigger 2** : Gemini Omni officialisé → vérifier disponibilité Vertex AI / API. Si oui, **évaluation prioritaire** (audio natif + édition chat = différenciateur fort pour bot vidéo).
   - **Trigger 3** : ni Veo 4 ni Omni annoncés ou disponibles dev day-1 → tenir Veo 3.1 Lite et activer **Seedance 2.0 (via Runway API)** en second fallback si bot non-US ou si transit Runway acceptable.

3. **🔍 Surveillance — tension Copilot Create vs Foundry retirement** :
   - MS communique Sora 2 dans Copilot Create alors que Foundry retire Sora 2 le 06/06. Surveiller (a) annonces extension Foundry pré-Build, (b) annonce bascule Copilot Create vers autre backend.
   - Si extension Foundry annoncée pour aligner avec Copilot → revoir la décision migration.

4. **📊 Bas-niveau — surveiller rumeur Spud** : passage à geeky-gadgets + xpert.digital indique élargissement continu mainstream. Pas d'action prod immédiate. À activer **si OpenAI annonce officiellement** un successeur dans la fenêtre avril-mai (borne haute J-14).

5. **🛡️ Préparer la communication d'incident "Sora-2 retirement"** : créer dès maintenant un template d'annonce utilisateurs/clients (changement de moteur vidéo, qualité comparable, transition transparente) pour publication semaine du 02/06.

---

## Sources

### Sora-2 / OpenAI (vérifiées 17/05 09:00 UTC)
- [Sora 2 is here | OpenAI](https://openai.com/index/sora-2/)
- [Sora — Release Notes (OpenAI Help)](https://help.openai.com/en/articles/12593142-sora-release-notes)
- [What to know about the Sora discontinuation | OpenAI Help](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [Deprecations | OpenAI API](https://developers.openai.com/api/docs/deprecations)
- [Changelog | OpenAI API](https://developers.openai.com/api/docs/changelog)
- [Video generation with Sora | OpenAI API](https://developers.openai.com/api/docs/guides/video-generation)
- [Sora-2 API shutdown date announced — Apiyi blog](https://help.apiyi.com/en/sora-2-api-shutdown-alternatives-2026-en.html)
- [OpenAI Release Notes May 2026 — Releasebot](https://releasebot.io/updates/openai)

### Rumeur Spud (⚠️ non confirmé OpenAI, élargissement mainstream tier 2)
- [OpenAI's Powerful New ChatGPT 6 Model Code Named 'Spud' — Geeky Gadgets](https://www.geeky-gadgets.com/openai-chatgpt-6-release/)
- [The end of OpenAI's Sora video AI – 'Spud' is coming — Xpert.digital](https://xpert.digital/en/the-end-of-the-video-ki-sora/)
- [OpenAI Spud model — Aihola](https://aihola.com/article/openai-spud-model-sora-shutdown)

### Azure AI Foundry — Sora-2 retirement & docs (vérifiées 17/05 09:00 UTC)
- [Azure AI Foundry Sora 2 retirement date — MS Q&A #5881436](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)
- [Foundry Models lifecycle and support policy](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)
- [Model retirement schedule (Foundry)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirement-schedule)
- [AI Model Catalog — sora-2](https://ai.azure.com/catalog/models/sora-2)
- [Azure OpenAI prematurely cutting off Sora 2 — OpenAI Dev Community #1380475](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475)
- [Sora 2 in Azure AI Foundry — Microsoft Azure Blog](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)

### Microsoft 365 Copilot — Sora 2 Create (tension Foundry retirement)
- [Available today: OpenAI's Sora 2 in Microsoft 365 Copilot — TechCommunity](https://techcommunity.microsoft.com/blog/microsoft365copilotblog/available-today-openais-sora-2-in-microsoft-365-copilot/4469721)
- [Sora 2 Now in Microsoft 365 Copilot — 2toLead](https://www.2tolead.com/insights/sora-2-now-in-microsoft-365-copilot)
- [Microsoft 365 Copilot adds Sora 2 — Neowin](https://www.neowin.net/news/microsoft-365-copilot-adds-sora-2-for-ai-video-creation-plus-more-new-features/)
- [AI video goes corporate — Windows Central](https://www.windowscentral.com/software-apps/ai-video-goes-corporate-microsoft-365-copilot-adds-openais-viral-sora-2)
- [MC1188596 — Microsoft 365 Copilot: Sora 2 — Cloudscout](https://app.cloudscout.one/evergreen-item/mc1188596/)

### Microsoft Build 2026 (T-16)
- [Microsoft Build 2026 official](https://build.microsoft.com/en-US/home)
- [Microsoft Build 2026 — Tech PC Vipers](https://techpcvipers.com/microsoft-build-2026/)

### Gemini Omni leak (🔥 signal majeur, T-2 I/O)
- [Early look: Gemini Omni generates realistic AI video in new leak — Android Authority](https://www.androidauthority.com/google-gemini-omni-video-model-leak-3665801/)
- [Google Accidentally Leaks 'Gemini Omni' Days Before I/O — AIxploria](https://www.aixploria.com/en/ai-radar/google-gemini-omni-leak-video-model-io-2026/)
- [Gemini Omni leak reveals Google's next AI video tool — Digit.in](https://www.digit.in/news/general/gemini-omni-leak-reveals-googles-next-ai-video-tool-ahead-of-io-2026.html)
- [Google's Gemini Omni video model surfaces ahead of I/O debut — Testing Catalog](https://www.testingcatalog.com/googles-gemini-omni-video-model-surfaces-ahead-of-i-o-debut/)
- [Google's Mysterious 'Omni' Video Model — WaveSpeed](https://wavespeed.ai/blog/posts/google-omni-video-model-leak-i-o-2026/)
- [Gemini Omni Demos Just Leaked — WaveSpeed](https://wavespeed.ai/blog/posts/gemini-omni-demos-leaked-what-we-learned/)
- [Google's Gemini Omni Just Leaked — NorthPennNow](https://northpennnow.com/news/2026/may/14/googles-gemini-omni-just-leaked-heres-what-the-new-video-model-actually-does/)
- [Gemini Omni Video Model at Google IO 2026 — iWeaver AI](https://www.iweaver.ai/blog/gemini-omni-video-model/)

### Veo 4 — "Is Here" claims (⚠️ NON confirmé par DeepMind/Google officiel au 17/05)
- [Veo 4 Is Here — and It's Already Changing What 'AI Video' Means — Nerdbot](https://nerdbot.com/2026/05/12/veo-4-is-here-and-its-already-changing-what-ai-video-means/)
- [Veo 4 Is Here — Took #1 Spot in AI Video Arena — Programming Insider](https://programminginsider.com/veo-4-is-here-and-it-just-took-the-1-spot-in-the-ai-video-arena/)
- [Veo 4 Release Date 2026 — Evolink](https://evolink.ai/blog/veo-4-release-date-2026)
- [Polymarket: VEO 4 released by June 2026](https://polymarket.com/event/veo-4-released-by)

### Veo / Google DeepMind / I/O 2026 (T-2) — sources officielles
- [Google I/O 2026 — io.google](https://io.google/2026/)
- [Veo — Google DeepMind official](https://deepmind.google/models/veo/)
- [News — Google DeepMind blog](https://deepmind.google/blog/)
- [Bringing new Veo 3.1 updates into Flow — Google Blog](https://blog.google/technology/ai/veo-updates-flow/)
- [Veo 3.1 Lite and new upscaling capability on Vertex AI — Google Cloud Blog](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)
- [Vertex AI Pricing](https://cloud.google.com/vertex-ai/generative-ai/pricing)

### Concurrents — autres modèles vidéo (5 jours)
- [Seedance 2.0 Review — PixVerse](https://pixverse.ai/en/blog/seedance-2-0-review-prompts-and-use-cases)
- [Best AI Video Generators May 2026 — Pixflow](https://pixflow.net/blog/best-ai-video-generator/)
- [Best AI Video Generators 2026 — AVB](https://aivideobootcamp.com/blog/ai-video-generators-ranked-2026/)
- [Runway AI Release Notes May 2026 — Releasebot](https://releasebot.io/updates/runwayai)
- [Veo 3.1 Lite Pricing Guide 2026 — Veo3ai.io](https://www.veo3ai.io/blog/veo-3-1-lite-pricing-guide-2026)
- [Google Veo Pricing Calculator — CostGoat (May 2026)](https://costgoat.com/pricing/google-veo)

---

*Rapport quotidien généré automatiquement le 2026-05-17 ~09:00 UTC. **Conclusion du jour : 5 jours sans signal MS d'extension Foundry — la migration Veo 3.1 Lite reste l'action critique avant 06/06 (J-20). Le leak Gemini Omni passe mainstream et conforte l'hypothèse d'une annonce vidéo majeure Google à I/O lundi 19/05 (T-2). Articles "Veo 4 Is Here" en circulation mais NON confirmés par DeepMind officiel — traiter comme signal SEO/spéculatif jusqu'à preuve contraire. Tension MS Copilot Create (Sora 2 actif) vs Foundry retirement (06/06) à surveiller — soit extension non communiquée, soit bascule backend pré-06/06.***

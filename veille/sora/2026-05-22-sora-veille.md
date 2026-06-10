# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-05-22

**Date :** vendredi 22 mai 2026
**Fenêtre couverte :** 21/05 08h04 UTC → 22/05 ~08h UTC (~24h)
**Contexte bot :** Sora-2 sur Azure AI Foundry → retirement **2 juin 2026 (T-11 jours)**. Fallback actuel : Veo 3.1 Lite (Vertex AI).

---

## 🔴 Nouveautés Sora-2 / OpenAI

### Statut Sora-2 — inchangé, fenêtre de migration qui se referme

- **Sora-2 API OpenAI direct** : toujours opérationnelle jusqu'au **24 septembre 2026** (4 mois restants).
- **Sora app/web** : discontinuée depuis le 26 avril 2026 (rappel).
- **Aucune annonce de successeur vidéo OpenAI** ce 21-22 mai. La position "OpenAI a quitté le marché vidéo consumer" tient.

### Activité OpenAI 21-22 mai (signal faible)

- **OpenAI prépare son S-1 confidentiel SEC** (filing dès le **22 mai**, IPO ciblée septembre 2026). Goldman Sachs + Morgan Stanley. Valorisation $852B / ARR $25B. Cf. The Motley Fool, 22/05/26.
- **Codex** : release 21/05 (Goal mode → GA hors expérimental, Appshots macOS). Hors scope vidéo.
- **Personal finance experience dans ChatGPT** (Pro US) : dashboard money + connexion comptes. Hors scope.
- **Aucune note vidéo dans le changelog OpenAI** sur la fenêtre 20-22 mai.

### Clarification GPT-5.5 (suivi du rapport d'hier)

Des sources tierces (TeamDay, Vellum, Framia) continuent d'affirmer que **GPT-5.5 génère nativement de la vidéo en sortie**. Vérification croisée :

- La doc officielle OpenAI (`developers.openai.com/api/docs/models/gpt-5.5`) reste **silencieuse sur la génération vidéo en sortie**.
- L'API ne référence pas d'endpoint vidéo pour GPT-5.5 ; les pipelines documentés couplent GPT-5.5 (planner) avec `gpt-image-2` ou Seedance 2.0 (executor) pour la vidéo.
- ⚠️ **Verdict maintenu** : GPT-5.5 = omnimodal en entrée (text, image, audio, vidéo) mais **pas de génération vidéo native confirmée par OpenAI**. Les sources tierces extrapolent.

### Implications bot

1. **Rien de nouveau côté OpenAI** : la fenêtre de "et si OpenAI annonçait un successeur Sora-2 avant le 2 juin" se referme à T-11.
2. **OpenAI focus IPO** : peu probable qu'un launch vidéo majeur soit fait en mode discret pendant la fenêtre S-1.

---

## 🔵 Azure AI Foundry

### 🆕 "What's New in Microsoft Foundry Labs – May 2026" — publié 21/05 (18h53 UTC)

Microsoft a publié hier soir son digest mensuel Foundry Labs. **4 nouveautés ce mois**, **aucune en vidéo** :

| Nouveauté | Modalité | Usage |
|-----------|----------|-------|
| **SocialReasoning-Bench** | Benchmark agents | Mesure Outcome Optimality + Due Diligence (Calendar Coordination, Marketplace Negotiation) |
| **MagenticBrain** | Orchestration (Qwen 3 8B fine-tune) | Planning + delegation, end-to-end dans MagenticLite harness |
| **MAI-Image-2-Efficient** | Image (text-to-image) | +22% vitesse, 4× efficience GPU vs MAI-Image-2. Production workload |
| **EO/OS Object Detection** | Geospatial (imagerie aérienne) | Endpoint managé first-party Foundry |

**Signal très important pour le bot** : Microsoft Foundry Labs a publié son digest **11 jours avant le retirement Sora-2** et **n'a annoncé aucun modèle vidéo first-party**. Confirmation maximale que **Foundry n'aura plus de capacité vidéo de juin à au moins juillet 2026**.

### Retirement Sora-2 — pas d'extension, controverse non résolue

- Le thread Microsoft Q&A (`learn.microsoft.com/en-in/answers/questions/5881436`) reste actif. Position MS officielle confirmée : **les dates de retirement ne sont pas extensibles**. Source : `learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements`.
- Précision du conflit de dates (réitérée) : portal Azure indique **2 juin 2026 19h00 local time** pour `Sora-2 v2025-10-06` ; OpenAI direct = 24 septembre 2026. La différence vient de l'enforcement version-spécifique côté Foundry vs. fenêtres globales côté OpenAI.
- **Aucun signal d'extension publié sur les dernières 24-48h.**
- Le fil OpenAI Dev Community ([`community.openai.com/t/.../1380475`](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475)) reste sans escalade officielle.

### Doc Foundry — état des release notes

- `learn.microsoft.com/en-us/azure/ai-services/openai/whats-new` : pas de nouvelle annonce vidéo sur 21-22 mai.
- Page Sora-2 (`learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation`) inchangée. Sora-2 reste l'unique modèle vidéo Foundry référencé.

### Build 2026 — T-11, T-10

- Conférence Microsoft Build : **2-3 juin 2026** à San Francisco. Day 1 = jour du retirement Sora-2 Foundry.
- Sessions Foundry confirmées : **LTG419** ("Turn ideas into AI applications with Microsoft Foundry Labs") + **Lab532** ("From data to context: Agent-ready knowledge with Foundry IQ"). **Aucune session vidéo explicite** au catalogue à ce jour.
- Tracks Day 2 : "AI Production", "Agentic Systems", "Cost & Efficiency". **Pas de track vidéo.**

---

## 🟢 Alternatives / Concurrents

### 🆕 Veo 3.1 "Ingredients to Video" — update majeure (20 mai 2026)

Google a poussé hier une update significative de Veo 3.1, **directement actionnable pour le bot**. Source : [blog.google/innovation-and-ai/technology/ai/veo-3-1-ingredients-to-video](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-ingredients-to-video/) + [Vertex AI blog](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai).

**Nouveautés Veo 3.1 (paliers Gemini API + Vertex AI) :**

| Capacité | Détail | Impact bot |
|----------|--------|-----------|
| **Vertical natif 9:16** | Output portrait sans crop/resize | YouTube Shorts, TikTok, Reels directement |
| **Upscaling 1080p / 4K** | Nouvelle capacité d'upscaling Veo | Postprocessing intégré |
| **Audio sur "Ingredients to Video"** | Audio synchronisé + dialogue | Auparavant : muet sur Ingredients |
| **Audio sur "Frames to Video"** | Idem | Idem |
| **Audio sur "Extend"** | Audio continu sur clips chaînés | Critique pour clips > 8s |

**Implications bot** :
- Si le bot utilise déjà Veo 3.1 Lite (fallback actuel), **valider que les nouvelles capacités audio sur Extend** sont disponibles via Vertex AI (et pas seulement via Gemini app/Flow).
- L'upscaling 4K natif retire le besoin d'un pipeline ESRGAN/Topaz custom.
- Le 9:16 natif retire le besoin d'un re-rendering ou crop côté bot.

### Veo 4 — pas d'annonce ce week-end

- Teasers DeepMind du 28-30 mars 2026 toujours sans suite officielle. **Pas d'annonce Veo 4 à Google I/O (19/05)** — Google a privilégié Gemini Omni Flash.
- Sources tierces (vo3ai, vexub) maintiennent "Veo 4 attendu courant 2026" mais sans calendrier officiel.

### Gemini Omni Flash — statut API inchangé

- **Consumer GA** : Gemini app, Flow, YouTube Shorts/Create. Tarification AI Plus $7.99/mo → AI Ultra $200/mo.
- **Developer API** : "coming weeks" (estimation Q3 2026). Pas de modèle ID publié à ce jour.
- Pas un candidat opérationnel pour le bot **avant juillet/août 2026 au minimum**.

### Runway, Kling, Pika — état du marché

- **Runway Gen-4.5** : pas de nouvelle update sur 21-22 mai. Note : **Kling 3.0 est désormais accessible *dans* Runway** (cf. releasebot Runway mai 2026) — Runway joue le rôle d'aggrégateur.
- **Kling 3.0** : pas de news majeure 24-48h.
- **Luma Ray3 / Dream Machine** : pas de news 24-48h.
- **Pika** : pas de news 24-48h.

Marché concurrent stable sur les dernières 24h. La dynamique est entre Google (Veo 3.1 update + Omni Flash) et OpenAI (qui se retire).

---

## 📌 Actions recommandées

### 🔴 Critique — décisions à boucler en 11 jours

1. **Migration Sora-2 → Veo 3.1 Lite** : confirmer que la migration est bouclée d'ici **31 mai 2026** (J-2 safety). T-11 aujourd'hui. Aucune raison d'attendre — aucune extension ne viendra.
2. **Tester les nouveautés Veo 3.1 du 20/05 sur Vertex AI** :
   - Vérifier disponibilité de l'audio sur **Extend** via Vertex AI (clé pour clips > 8s).
   - Vérifier disponibilité du **9:16 natif** sur Vertex AI Veo 3.1 Lite (pas seulement Veo 3.1 standard).
   - Vérifier disponibilité de **l'upscaling 1080p/4K** côté API (vs UI Flow uniquement).

### 🟡 À monitorer activement

3. **Build 2026 keynote du 2 juin** : exact même jour que le retirement Foundry. Surveiller spécifiquement le keynote Satya Nadella + Mustafa Suleyman pour toute annonce de "MAI-Video-1" ou intégration vidéo tierce dans Foundry. Probabilité faible (le digest Foundry Labs du 21/05 n'en parle pas) mais signal fort si annoncé.
4. **OpenAI S-1 fenêtre** : la période S-1 (mai-septembre 2026) tend à supprimer les annonces risquées. Très peu probable qu'OpenAI annonce un nouveau modèle vidéo dans cette fenêtre.
5. **Doc Microsoft retirement schedule** : suivre `learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirement-schedule` au cas où la pression communautaire forcerait un revirement (très peu probable à T-11).

### 🟢 Bonus / opportunistes

6. **Mettre à jour le decision log du bot** : ajouter une note "Veo 3.1 mise à jour 20/05 — vérifier disponibilité audio sur Extend / 9:16 natif / upscaling 4K via Vertex AI". Le bot peut potentiellement supprimer du code postprocessing.
7. **Préparer un POC Gemini Omni Flash** dès que l'API GA arrive (Q3 2026 estimé). Garder une issue ouverte pour ne pas rater le passage.

---

## Sources

### Microsoft Foundry Labs digest May 2026
- [What's New in Microsoft Foundry Labs – May 2026 — TechCommunity (publié 21/05 18h53 UTC)](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/whats-new-in-microsoft-foundry-labs-%E2%80%93-may-2026/4520310)
- [What's new in Foundry Labs – April 2026 — TechCommunity](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/whats-new-in-foundry-labs---april-2026/4509714)

### Sora-2 Azure Foundry — retirement
- [Azure AI Foundry Sora 2 retirement date feels too early — Microsoft Q&A](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)
- [Model retirement schedule — Microsoft Learn](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)
- [Sora 2 video generation overview (preview) — Microsoft Learn](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Azure OpenAI is prematurely cutting off support for Sora 2 too early — OpenAI Dev Community](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475)
- [Sora 2 access application form — Azure AI Foundry](https://ai.azure.com/catalog/models/sora-2)

### Sora discontinuation OpenAI
- [What to know about the Sora discontinuation — OpenAI Help Center](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [Changelog — OpenAI API](https://platform.openai.com/docs/changelog)
- [Sora (text-to-video model) — Wikipedia](https://en.wikipedia.org/wiki/Sora_(text-to-video_model))

### OpenAI activité 21-22 mai (IPO, Codex, Finance)
- [OpenAI Is Going Public But Is It for the Wrong Reasons? — Motley Fool (22/05/26)](https://www.fool.com/investing/2026/05/22/openai-is-going-public-but-is-it-for-the-wrong-rea/)
- [AI News Today — May 22, 2026 — BuildFastWithAI](https://www.buildfastwithai.com/blogs/ai-news-today-may-22-2026)
- [OpenAI Release Notes — May 2026 — Releasebot](https://releasebot.io/updates/openai)

### Veo 3.1 update 20/05 — Ingredients to Video
- [Veo 3.1 Ingredients to Video — Google Blog (20/05/26)](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-ingredients-to-video/)
- [Bringing new Veo 3.1 updates into Flow — Google Blog](https://blog.google/technology/ai/veo-updates-flow/)
- [Veo 3.1 Lite and a new Veo upscaling capability on Vertex AI — Google Cloud Blog](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)
- [Veo 3.1 — Google DeepMind](https://deepmind.google/models/veo/)
- [Veo 3.1: Google's Latest AI Video Update — veo3ai.io](https://www.veo3ai.io/blog/veo-3-1-new-features-update-2026)

### Veo 4 — pas d'annonce officielle
- [Veo (text-to-video model) — Wikipedia](https://en.wikipedia.org/wiki/Veo_(text-to-video_model))
- [Veo 4 — What We Know — vo3ai.com](https://www.vo3ai.com/veo4)

### Gemini Omni Flash — statut API
- [What Is Omni Flash? Capabilities, Access & Builder Guide — WaveSpeed](https://wavespeed.ai/blog/posts/what-is-omni-flash/)
- [Google Gemini Omni Flash: What Developers Need to Know — byteiota](https://byteiota.com/google-gemini-omni-flash-what-developers-need-to-know/)
- [Is Gemini Omni API Available? — evolink.ai](https://evolink.ai/blog/gemini-omni-api-status)

### Microsoft Build 2026
- [Microsoft Build 2026 sessions every startup should attend — Microsoft Startups Blog](https://www.microsoft.com/en-us/startups/blog/microsoft-build-2026-sessions-every-startup-should-attend/)
- [Microsoft Build 2026: Sessions & Speakers — Lensmor](https://www.lensmor.com/event-guides/microsoft-build-2026-attendee-guide)

### Concurrents — Runway, Kling
- [Runway AI Release Notes — May 2026 — Releasebot](https://releasebot.io/updates/runwayai)
- [Kling 3.0 vs Runway Gen-4 Turbo — Cliprise](https://www.cliprise.app/learn/comparisons/models/kling-3-0-vs-runway-gen4-turbo-comparison)

### GPT-5.5 vidéo (vérification clarification d'hier)
- [GPT-5.5 Model — OpenAI API docs](https://developers.openai.com/api/docs/models/gpt-5.5)
- [GPT-5.5: OpenAI's Unified Multimodal Model — TeamDay](https://www.teamday.ai/blog/gpt-5-5-launch) ⚠️ extrapolation tierce
- [Everything You Need to Know About GPT-5.5 — Vellum](https://www.vellum.ai/blog/everything-you-need-to-know-about-gpt-5-5) ⚠️ extrapolation tierce

---

*Rapport quotidien 2026-05-22. Prochain rapport : 2026-05-23.*

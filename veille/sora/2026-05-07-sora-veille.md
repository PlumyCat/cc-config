# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-05-07

**Période couverte :** 2026-05-06 → 2026-05-07 (24h depuis dernier rapport).
**Fenêtre filtrage :** sources ≤ 7 jours, doublons par rapport au rapport 06/05 supprimés.
**Tonalité du jour :** **journée calme côté vidéo, mais signal alarmant détecté** — apparition d'un Q&A Microsoft signalant une **date de retirement sora-2 Foundry au 02/06/2026** (en conflit avec le shutdown OpenAI 24/09/2026). À confirmer mais **potentiellement critique pour le bot**. Sora-2 Foundry **toujours gated preview (J+18)**, page whats-new Foundry **toujours "April 2026"** au 07/05 (J+7 du mois, J+3 d'anomalie consécutive — confirmé par fetch direct). Côté OpenAI : **Workspace agents quittent la gratuité** aujourd'hui (06/05 → credit-based pricing), hors-scope vidéo mais signal de monétisation accélérée. Côté Veo 4 : **T-12 jours** de Google I/O 2026 (19-20/05), toujours aucune model card. **Microsoft Build 2026** — startup guide publié 05/05 (Windows News), focus "AI production systems, agentic workflows, model-cost control" — **aucune mention vidéo explicite**. HappyHorse-1.0 stable. **Pas de signal d'accélération sur la stratégie vidéo du bot — à part le drapeau retirement 02/06 à élucider d'urgence.**

---

## 🔴 Nouveautés Sora-2 / OpenAI

### App Sora — T+11 post-shutdown
- App shutdown effectif depuis **26/04/2026**. Aujourd'hui = **T+11**.
- **API Sora reste live jusqu'au 24/09/2026** (rappel **140 jours runway**) : `Videos API, sora-2, sora-2-pro, sora-2-2025-10-06, sora-2-2025-12-08, sora-2-pro-2025-10-06`.
- **Aucune nouvelle communication OpenAI sur successeur vidéo** entre 06/05 et 07/05. Le pivot équipe Sora vers world-models/robotique reste durable.
- **Pas de drop changelog `/v1/videos`** sur la fenêtre 24h. Doc Sora API stable : reusable character refs, 20s max, sora-2-pro 1080p $0.70/s, `/v1/videos/edits` qui remplace `/remix`.
- **OpenAI Deprecations page** : sora-2 family + Videos API → shutdown 24/09/2026, **no recommended replacement** (statut inchangé, reconfirmé 07/05).

### ⚠️ "Spud" — attribution contradictoire (non confirmé)
- Une source secondaire (ai.cc/blogs) attribue **"Spud" comme codename du successeur vidéo OpenAI** : *"OpenAI is shutting down Sora, its first public AI video generation model, in favor of a new model called Spud"*.
- **Conflit direct** avec le rapport 06/05 qui citait Pasquale Pillitteri attribuant **"Spud" comme codename GPT-5.5** (modèle texte/agents, hors vidéo).
- ⚠️ **non confirmé** — aucune source primaire OpenAI ne mentionne "Spud" comme successeur vidéo. Probablement confusion d'attribution dans le blog ai.cc. À traiter comme rumeur jusqu'à confirmation.
- **Implication bot** : ne pas se baser sur "Spud" comme jalon de roadmap vidéo OpenAI.

### 🆕 Workspace agents — fin de la gratuité aujourd'hui (06/05/2026)
- **Workspace agents** (annoncés 22/04 en research preview ChatGPT Business/Enterprise/Edu/Teachers) sont **passés à credit-based pricing à partir du 06/05/2026** (selon TechCrunch / OpenAI doc).
- **Hors scope vidéo** mais signal : OpenAI accélère la monétisation enterprise sur les agents (post pivot non-vidéo). Confirme la trajectoire "agents > vidéo".
- **Pas d'impact bot vidéo direct.**

### Pas de news sur la deprecation API vidéo
- Statut deprecations Videos API + sora-2 family inchangé : **shutdown 24/09/2026, no recommended replacement**.
- **Pas d'extension annoncée**. Notification développeurs datée 24/03/2026, T-140 jours du shutdown.

---

## 🔵 Azure AI Foundry

### 🆕 ⚠️ ALERTE — Drapeau "retirement Sora-2 Foundry au 02/06/2026" (Microsoft Q&A)
- **Apparition dans les résultats** d'un Microsoft Q&A intitulé : "Azure AI Foundry Sora 2 retirement date feels too early and conflicts with Azure communication — can support be extended to Sept 24?".
- **URL** : `learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too`
- **Substance** : un client signale une **date de retirement Sora 2 sur Foundry au 02/06/2026** (versus 24/09/2026 côté OpenAI). **Demande extension support jusqu'au 24/09/2026**.
- ⚠️ **Source non primaire** (Q&A utilisateur, pas une annonce officielle MS), **mais signal qui mérite vérification immédiate** car implique un risque de coupure du bot vidéo **dès le 02/06/2026** si confirmé (T-26 jours).
- **Implication bot** : **vérifier d'urgence** dans le portail Azure AI Foundry / la doc Sora-2 si une date de retirement 02/06 apparaît effectivement dans les notifications de l'instance bot. Si oui, **plan de contingence Veo 3.1 ou HappyHorse à activer immédiatement**.

### Sora-2 — gated preview inchangée (J+18 sans GA)
- **Aucune annonce de GA** sora-2 sur Foundry entre 06/05 et 07/05. **Statut gated preview maintenu, 18 jours d'inertie continue**.
- `learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation` : doc inchangée, marquée "preview in Global Standard regions (East US 2 and Sweden Central)".
- `ai.azure.com/catalog/models/sora-2` : page inchangée, gating MCA-E/EA + 1000+CU toujours en place.
- **Pricing inchangé** : Standard $0.10/s, Pro Global $0.30/s, Pro High-Res $0.50/s.
- Aucun mouvement post-renégociation Microsoft-OpenAI : la renégo continue à n'avoir **aucun impact** sur la sortie de gated preview pour sora-2.

### Catch-22 endpoint — toujours pas de fix officiel MS
- Issue MS Q&A "Azure OpenAI Video API rejects all sora-2 deployments — gateway validates for deprecated sora model name" : **pas de fix officiel MS visible** au 07/05.
- **Workaround officiel maintenu** : `POST {endpoint}/openai/v1/videos?api-version=preview` (et non l'ancien `/openai/deployments/{name}/video/generations/jobs`).
- Bug LiteLLM (#16568) toujours référencé : Sora 2 Model Authentication Error sur Azure. À monitorer pour le wrapper bot.
- **Bug retirement collatéral** : Q&A "Azure OpenAI Sora (model sora v2025-05-02) retiring Feb 28, 2026 — no successor available (Sora 2 not visible) + video content download endpoint returns 404" toujours actif.

### What's new Foundry — page TOUJOURS "April 2026" au 07/05 (J+7 du mois, J+3 anomalie)
- **Confirmé par fetch direct** sur `learn.microsoft.com/en-us/azure/foundry/whats-new-foundry` : la page est **toujours intitulée "Microsoft Foundry docs: What's new for April 2026"** au 07/05 (`<title>` HTML et meta description confirment "April 2026").
- **J+3 d'anomalie consécutive** sans bascule mai. Inhabituel — pourrait indiquer un retard documentaire MS plus large ou une absence de "newsworthy items" pour début mai.
- `devblogs.microsoft.com/foundry/category/whats-new/feed/` : feed actif mais pas de post vidéo-related entre 06/05 et 07/05.

### Microsoft Build 2026 — startup guide publié 05/05, "no-fluff", AI production systems
- **🆕 Microsoft Build 2026 Startup Playbook publié 05/05/2026** (Windows News) : focus annoncé sur **"AI production systems, agentic workflows, and model-cost control"** pour l'event 02-03/06/2026 (T-26 jours).
- Sessions et workshops orientés **monitoring de model drift, A/B tests à scale, feedback loops** sur la plateforme Azure AI.
- **Aucune mention vidéo explicite** dans le startup guide ni dans les sessions Foundry confirmées (MCP, Foundry Agent Service, Foundry IQ, Foundry Labs).
- **Implication bot** : Build 2026 reste une fenêtre potentielle d'annonce vidéo MS, **mais l'orientation officielle "agents et model-cost control" suggère un Build moins centré vidéo qu'espéré**. Probabilité GA sora-2 / annonce MAI-Video à Build = **modérée** (pas haute).

### Foundry agents — rappel deadline migration 22/05 (J-15)
- Hosted agent migration deadline **22/05/2026** (J-15 aujourd'hui) : ancien backend supporté uniquement jusqu'à cette date.
- Si le bot vidéo s'appuie sur l'ancien backend Foundry agents, action requise avant cette date.
- **Pas de news additionnelle 06/05-07/05** sur Agent 365 ou Agent Framework.

### Pas de MAI-Video first-party
- Aucun mouvement MAI-Video : MAI-Image-2 (image gen) reste le top first-party MS, pas d'extension vidéo annoncée. **11 jours après la fin d'exclusivité OpenAI, Microsoft n'a toujours pas accéléré un first-party vidéo.**
- Trio MAI-Transcribe-1 / MAI-Voice-1 / MAI-Image-2 reste le périmètre multimédia first-party de Foundry — la vidéo reste un blanc dans la roadmap MAI publique.

---

## 🟢 Alternatives / concurrents

### Veo 3.1 / Veo 4 (Google DeepMind)
- **Veo 4 toujours non officiellement annoncé**. Pas de model card sur `deepmind.google/models/veo/`. **Inchangé depuis 22+ jours**.
- **Google I/O 2026 = 19-20/05/2026** → **T-12 jours**. Fenêtre haute probabilité Veo 4 (Polymarket : ~69% odds avant juin 2026, historique Google = Veo 1 à I/O 2024, Veo 3 à I/O 2025).
- **Veo 3.1 Lite** : production-ready actuelle pour le bot, prix ~$0.05/sec, public preview Vertex AI. Toujours présent sur la doc Vertex AI.
- **Veo upscaling capability** (1080p / 4K) : toujours en private preview, "coming soon to public preview" sur Vertex AI. **Pas de bascule public preview détectée 06/05-07/05.**
- **Vertex AI release notes 06/05-07/05** : pas de drop spécifique vidéo. Note de migration toujours active : `veo-3.0-generate-001` → `veo-3.1-generate-001` avant **30/06/2026**.
- **Anticipations Veo 4 consolidées** (recoupements Tom's Guide, evolink.ai, artlist, mirrorreview, vidau.ai, weshop.ai) : 20-30s native, native storyboarding, 4K natif TPU-rendered, lightweight ID-embedding (3-5 ref images), camera commands (dolly, whip pan, rack focus), per-source audio layers. **Tout reste informed expectation, pas fact** — à confirmer J=I/O 2026.

### HappyHorse-1.0 — stable, fin promo PixVerse aujourd'hui
- **🆕 Fin de la promotion gratuite HappyHorse 1.0 sur PixVerse aujourd'hui 07/05/2026** (PixVerse blog) : la promo lancement éligibles "complimentary" expire ce jour.
- **Pricing officiel Alibaba Cloud Bailian** maintenu : ¥0.9/s 720p, ¥1.6/s 1080p (HappyHorse-1.0-T2V).
- **Multi-canalité opérationnelle** : fal.ai (live depuis 26/04) + Alibaba Cloud Bailian (commercial mai en cours) + Pixazo API (29/04) + APIYI (10% off via partenariat officiel).
- **Toujours #1 Elo Artificial Analysis Video Arena** (1379 Elo points T2V sans audio).
- **Sur le ranking video+audio**, HappyHorse reste #2 derrière Seedance 2.0 (gap audio natif).
- 4 endpoints stables : `text-to-video`, `image-to-video`, `reference-to-video`, `video-edit`.
- 15B params, lip-sync 7 langues, audio inclus.
- **Pas de news majeure 06/05-07/05** : stable.

### Wan 2.6 / Wan 2.7 (Alibaba Tongyi Lab)
- Wan Video 2.6 = **#3 leaderboard text-to-video Mai 2026** avec Arena score 577 (derrière Grok Imagine Video 724 et Veo 3.1 618).
- Wan 2.7 = image/video model d'Alibaba Tongyi Lab released avril 2026, focus "thinking modes" et long-text rendering.
- Spéculation communautaire HappyHorse = Wan 2.7 alias, **réfutée** : architectures différentes (HappyHorse = 40-layer single-stream Transformer 8-step denoising, Wan 2.7 = thinking modes).
- **Pas de news 06/05-07/05** : statu quo.

### Grok Imagine Video (xAI) — entrée confirmée
- **#1 leaderboard text-to-video Arena 724** confirmé. xAI dans la conversation vidéo enterprise.
- **Aurora Engine** : génération ~17s par clip, 4x plus rapide que concurrents (claim xAI marketing).
- Capacités : text-to-video 6-15s, audio synchronisé natif (musique, SFX, dialogue), image-to-video.
- **API live** : `x.ai/news/grok-imagine-api`, plus partenariats fal.ai et PixVerse.
- **À benchmarker** sérieusement comme alternative sora-2 / Veo 3.1 pour le bot.

### Runway / Kling / Pika / Seedance / Luma
- **Runway** : Gen-4.5 toujours #1 Artificial Analysis Text-to-Video Elo (1247). Plateforme intégrée Kling 3.0 / Kling 2.6 Pro / Kling 2.5 Turbo Pro / WAN2.2 Animate / GPT-Image-1.5 / **Sora 2 Pro** (intégration confirmée). Pas d'annonce produit majeure 06/05-07/05.
- **Kling 3.0** : 4K natif stable depuis 05/02/2026, storyboard tool, native lip-sync audio. Pas d'annonce.
- **Pika 2.5** (versionné 2.5, pas 4) : stable, "fun et expérimental". Pas de news 24h.
- **Seedance 2.0** : disponible via Runway et fal.ai. **#1 sur ranking video+audio** Arena. Stable.
- **Luma Dream Machine / Ray3** : aucun mouvement.

### Marché global — top leaderboard mai 2026 (rappel)
- **Grok Imagine Video (xAI)** : #1 Arena 724.
- **Veo 3.1** : #2 (618).
- **Wan Video 2.6** : #3 (577).
- **Position sora-2** : non-leaderboard explicite côté llm-stats Arena.
- **Implication** : le marché vidéo se densifie, sora-2 n'est plus dominant sur les benchmarks publics.

---

## 📌 Actions recommandées

| Priorité | Action | Délai |
|----------|--------|-------|
| 🚨 URGENT NOUVEAU | **Vérifier dans le portail Foundry / notifications du tenant bot si une date de retirement Sora-2 au 02/06/2026 apparaît**. Si oui, **activer plan de contingence migration Veo 3.1 ou HappyHorse** sans attendre. Si non confirmé, monitorer le Q&A MS pour clarification officielle. | **Aujourd'hui** |
| 🔴 IMPORTANT | **Si bot vidéo s'appuie sur Foundry agents legacy** : auditer dépendance avant **22/05/2026** (J-15, deadline migration hosted agents). Ancien backend ne sera plus supporté. | Avant 22/05 |
| 🔴 IMPORTANT | **Audit endpoint bot** (rappel) : confirmer usage `/openai/v1/videos?api-version=preview` (pas l'ancien path). Toujours pas de fix MS officiel pour le catch-22 au 07/05, workaround toujours requis. | Aujourd'hui |
| 🔴 STRATÉGIQUE | **Préparer plan de bench Veo 4** : Google I/O 2026 J-12. Lister 5 prompts de référence à passer dès J+1 si Veo 4 est annoncé le 19 ou 20/05. | Avant 19/05 |
| 🔴 STRATÉGIQUE | **Préparer point veille Microsoft Build 02-03/06** : signal d'orientation "agents/cost-control" — probabilité GA sora-2 réduite. **Rester prêt** pour annonce surprise vidéo MS, mais ne pas en dépendre. | Avant 02/06 |
| 🟡 MOYEN | **Bench Grok Imagine Video** (#1 leaderboard Arena, Aurora Engine ~17s) : alternative sérieuse à intégrer dans le panel de comparaison sora-2 / Veo 3.1 / HappyHorse. API live xAI + fal.ai. | Cette semaine |
| 🟡 MOYEN | **Vertex AI deprecations 30/06/2026** : si bot consomme `veo-3.0-generate-001` ou `veo-3.0-fast-generate-001`, migration vers `veo-3.1-generate-001` / `veo-3.1-fast-generate-001` requise. | Avant fin mai |
| 🟡 MOYEN | **Recheck Foundry whats-new** : page "April 2026" pas encore basculée en mai au 07/05 (J+7 du mois, J+3 d'anomalie consécutive). Recheck quotidien — anomalie inhabituelle. | Continu |
| 🟢 VEILLE | **Successeur vidéo OpenAI** : monitorer le terme "Spud" (attribution contradictoire — texte vs vidéo, à traiter comme rumeur). Aucune source primaire OpenAI vidéo. | Veille passive |
| 🟢 VEILLE | **MAI-Video first-party MS** : monitorer si la fin d'exclusivité accélère un first-party Microsoft. **Aucun signal au 07/05 (J+11 post-renégo).** | Veille passive |

---

## 🔍 Rien de significatif aujourd'hui sur :

- **GA sora-2 Azure** : toujours gated preview (18 jours inchangé).
- **Annonce successeur vidéo OpenAI** : confirmé absent sur sources primaires.
- **Veo 4 model card officielle DeepMind** : 22+ jours sans source primaire.
- **Runway / Pika / Luma / Kling / Seedance** : silence sur la fenêtre 24h.
- **MAI-Video first-party Microsoft** : toujours absent (J+11 post-renégo).
- **Devblogs Foundry** : pas de post 06/05-07/05 video-related.
- **Vertex AI release notes** : pas de drop vidéo 06/05-07/05.
- **OpenAI changelog `/v1/videos`** : pas de drop sur la fenêtre 24h.
- **Foundry whats-new page** : toujours "April 2026" au 07/05 (anomalie continue J+7 du mois, J+3 d'anomalie consécutive).
- **HappyHorse-1.0** : pas de news 24h, stable (fin promo PixVerse aujourd'hui).
- **OpenAI sur AWS Bedrock** : pas de mouvement vidéo.

---

## 📊 Évolution vs rapports précédents

| Signal | 05/05 | 06/05 | **07/05** |
|--------|-------|-------|-----------|
| sora-2 GA Azure | Gated preview (16j) | Gated preview (17j) | **Gated preview (18j)** |
| Sora app status | T+9 | T+10 | **T+11 post-shutdown** |
| API Sora OpenAI | Live (142j runway) | Live (141j runway) | **Live (140j runway)** |
| Successeur vidéo OpenAI | Vacuum confirmé (rien sur 24h) | Vacuum + GPT-5.5 trajectory non-vidéo | **Vacuum + ⚠️ rumeur "Spud" attribution contradictoire (non confirmé)** |
| MS-OpenAI exclusivité | ENDED J+9 | ENDED J+10 | **ENDED J+11** |
| OpenAI sur AWS Bedrock | Inchangé (pas de vidéo) | Inchangé (pas de vidéo) | **Inchangé (pas de vidéo)** |
| Veo 4 | Pas de card 20+ j, T-14j I/O | Pas de card 21+ j, T-13j I/O | **Pas de card 22+ j, T-12j I/O** |
| HappyHorse 1.0 | Stable (pas de news 24h) | Stable | **Stable (fin promo PixVerse 07/05)** |
| Catch-22 endpoint Azure Video | Toujours pas de fix MS officiel | Toujours pas de fix MS officiel | **Toujours pas de fix MS officiel** |
| Doc Foundry whats-new | Toujours "April 2026" au 05/05 (J+5) | Toujours "April 2026" au 06/05 (J+6, J+2 anomalie) | **Toujours "April 2026" au 07/05 (J+7, J+3 anomalie consécutive — fetch direct confirmé)** |
| Catalogue Foundry | Stable (rien de neuf vidéo) | GPT-5.5 Instant comme `GPT-chat-latest` (hors vidéo) | **Stable (rien de neuf vidéo)** |
| Foundry agents | AF 1.2.2, hosted migration deadline 22/05 | Stable (rappel J-16) | **Stable (rappel J-15)** |
| OpenAI hors vidéo | Advanced Account Security, JV $10B PE | GPT-5.5 Instant default ChatGPT 05/05 | **🆕 Workspace agents passent à credit-based pricing 06/05** |
| MS Build 2026 | n/a | Confirmé 02-03/06 (T-27j) | **🆕 Startup guide publié 05/05 — "AI production systems, agentic workflows, model-cost control", PAS de mention vidéo (T-26j)** |
| Top leaderboard T2V | n/a | Grok Imagine Video #1 (724) | **Stable (Grok #1, Veo 3.1 #2, Wan 2.6 #3)** |
| 🆕 Drapeau retirement sora-2 Foundry 02/06 | n/a | n/a | **🆕 ⚠️ Q&A MS signalant retirement 02/06/2026 — non confirmé en source primaire, à vérifier d'urgence dans portail tenant** |

---

## Sources

### Sora app shutdown / OpenAI (T+11)
- [OpenAI Help Center — What to know about the Sora discontinuation](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [OpenAI Index — Sora 2 is here](https://openai.com/index/sora-2/)
- [OpenAI Deprecations — Videos API + sora-2 family shutdown 2026-09-24](https://developers.openai.com/api/docs/deprecations)
- [OpenAI Changelog](https://developers.openai.com/api/docs/changelog)
- [OpenAI News — Latest updates](https://openai.com/news/)
- [OpenAI Release Notes — May 2026 Latest Updates (Releasebot)](https://releasebot.io/updates/openai)
- [Apiyi — Sora-2 API shutdown date announced (Sep 24) + alternatives](https://help.apiyi.com/en/sora-2-api-shutdown-alternatives-2026-en.html)

### OpenAI hors vidéo (07/05/2026 — Workspace agents pricing)
- [OpenAI — Introducing workspace agents in ChatGPT](https://openai.com/index/introducing-workspace-agents-in-chatgpt/)
- [VentureBeat — OpenAI Workspace Agents successor to custom GPTs](https://venturebeat.com/orchestration/openai-unveils-workspace-agents-a-successor-to-custom-gpts-for-enterprises-that-can-plug-directly-into-slack-salesforce-and-more)
- [9to5Mac — OpenAI updates ChatGPT with Codex-powered workspace agents (22/04/2026)](https://9to5mac.com/2026/04/22/openai-updates-chatgpt-with-codex-powered-workspace-agents-for-teams/)

### Sora-2 sur Azure AI Foundry
- [Microsoft Foundry Docs — Sora 2 video generation overview (preview)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [⚠️ Microsoft Q&A — Azure AI Foundry Sora 2 retirement date feels too early (02/06 vs 24/09)](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)
- [Microsoft Foundry Docs — What's New for April 2026 (titre HTML toujours "April 2026" au 07/05)](https://learn.microsoft.com/en-us/azure/foundry/whats-new-foundry)
- [Azure Blog — Sora 2 in Azure AI Foundry: Create videos with responsible AI](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [Azure AI catalog — OpenAI Sora-2](https://ai.azure.com/catalog/models/sora-2)
- [Microsoft Q&A — Azure OpenAI Video API rejects all sora-2 deployments (catch-22)](https://learn.microsoft.com/en-us/answers/questions/5860394/azure-openai-video-api-rejects-all-sora-2-deployme)
- [Microsoft Q&A — Sora 2 Not Available in Azure AI Foundry Model List](https://learn.microsoft.com/en-us/answers/questions/5774829/sora-2-not-available-in-azure-ai-foundry-model-lis)
- [Microsoft Q&A — Access to Sora 2](https://learn.microsoft.com/en-us/answers/questions/5774773/access-to-sora-2)
- [Microsoft Q&A — Azure OpenAI Sora (sora v2025-05-02) retiring Feb 28 2026, no successor visible](https://learn.microsoft.com/en-us/answers/questions/5790204/azure-openai-sora-(model-sora-v2025-05-02)-retirin)
- [LiteLLM Issue #16568 — Azure OpenAI Sora 2 Authentication Error](https://github.com/BerriAI/litellm/issues/16568)

### Microsoft Build 2026 et Foundry plateforme
- [Windows News — Microsoft Build 2026: Startup Playbook for AI Production Systems and Agentic Workflows (05/05/2026)](https://windowsnews.ai/article/microsoft-build-2026-the-startup-playbook-for-ai-production-systems-and-agentic-workflows.416585)
- [Microsoft Build 2026 — Official site (02-03/06, San Francisco)](https://build.microsoft.com/en-US/home)
- [Microsoft Foundry Blog — Devblogs](https://devblogs.microsoft.com/foundry/)
- [Microsoft Learn — Migrate hosted agents to refreshed public preview (deadline 22/05)](https://learn.microsoft.com/en-us/azure/foundry/agents/how-to/migrate-hosted-agent-preview)

### Veo / DeepMind / Vertex AI / Google I/O 2026
- [Google DeepMind — Veo models page](https://deepmind.google/models/veo/)
- [Vertex AI — Generative AI release notes](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes)
- [Veo 3.1 — Vertex AI doc](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/models/veo/3-1-generate)
- [Google Cloud Blog — Veo 3.1 Lite and Veo upscaling](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)
- [evolink.ai — Veo 4 Release Date 2026](https://evolink.ai/blog/veo-4-release-date-2026)
- [Google I/O 2026 official site](https://io.google/2026/)
- [Mirror Review — Veo 4 Release Date, Features & Leaks](https://blog.mirrorreview.com/veo-4-release-date/)
- [Imagine.art — Veo 4 Updates](https://www.imagine.art/blogs/google-veo-4-updates)

### HappyHorse-1.0 / Wan / Seedance (stable)
- [PixVerse — HappyHorse 1.0 Review (promo gratuite jusqu'au 07/05)](https://pixverse.ai/en/blog/happyhorse-1-0-ai-guide-and-use-cases)
- [WaveSpeed — What Is HappyHorse-1.0?](https://wavespeed.ai/blog/posts/what-is-happyhorse-1-0-ai-video-model/)
- [WaveSpeed — Why Is HappyHorse-1.0 Suddenly #1 on Video Leaderboard?](https://wavespeed.ai/blog/posts/why-happyhorse-top-ai-video-leaderboard-2026/)
- [Apiyi — HappyHorse model decryption](https://help.apiyi.com/en/happyhorse-model-mystery-ai-video-lmarena-analysis-en.html)
- [fal.ai — HappyHorse-1.0 landing page](https://fal.ai/happyhorse-1.0)
- [PRNewswire — fal Launches HappyHorse-1.0 as Official API Partner](https://www.prnewswire.com/news-releases/fal-launches-happyhorse-1-0--the-1-ranked-ai-video-model-as-official-api-partner-302755003.html)

### Grok Imagine Video (xAI)
- [Grok Imagine API | xAI](https://x.ai/news/grok-imagine-api)
- [xAI Docs — Video Generation](https://docs.x.ai/developers/model-capabilities/video/generation)
- [fal.ai — Grok Imagine Video Text-to-Video](https://fal.ai/models/xai/grok-imagine-video/text-to-video)

### Marché global et concurrents
- [Llm-stats — Best AI Video Generator (May 2026) leaderboard](https://llm-stats.com/leaderboards/best-ai-for-video-generation)
- [Llm-stats — AI Updates Today (May 2026)](https://llm-stats.com/llm-updates)
- [Pixflow — Best AI Video Generator 2026](https://pixflow.net/blog/best-ai-video-generator/)
- [Runway Changelog](https://runwayml.com/changelog)
- [Releasebot — OpenAI Release Notes May 2026](https://releasebot.io/updates/openai)

### Spud — attribution contradictoire (non confirmé)
- [⚠️ ai.cc — OpenAI Sora Shutdown 2026 (Spud comme successeur vidéo, non confirmé)](https://www.ai.cc/blogs/openai-sora-shutdown-best-ai-video-generation-api-alternatives-2026-migration-guide/)
- [Pasquale Pillitteri — GPT-5.5 Spud (attribution Spud comme codename GPT-5.5 texte/agents)](https://pasqualepillitteri.it/en/news/621/gpt-5-5-spud-openai-next-model)

---

*Rapport généré automatiquement le 2026-05-07 (jeudi). Sources ≤ 7 jours sauf rappels de contexte explicites. Tonalité du jour : **journée calme côté vidéo, mais signal alarmant détecté** — Q&A MS signalant retirement sora-2 Foundry au 02/06/2026 (vs 24/09 OpenAI). À vérifier d'urgence dans portail tenant. Sora-2 toujours gated preview Foundry (J+18), Foundry whats-new page toujours "April 2026" au J+7 du mois (J+3 anomalie consécutive — fetch confirmé). Pas d'annonce vidéo OpenAI ni MS. Build 2026 startup guide publié orienté "agents/cost-control" — fenêtre vidéo MS moins probable que prévu. Veo 4 toujours absent à T-12 jours de Google I/O 2026, HappyHorse-1.0 stable (fin promo PixVerse aujourd'hui), Grok Imagine #1 leaderboard Arena T2V. Côté OpenAI hors vidéo : Workspace agents passent à credit-based pricing aujourd'hui — confirme pivot non-vidéo et accélération monétisation enterprise. Rumeur "Spud" comme successeur vidéo : ⚠️ non confirmé, attribution contradictoire (probablement codename GPT-5.5 selon Pillitteri). **Action critique nouvelle** : vérifier dans portail Foundry du tenant bot si une notification de retirement sora-2 au 02/06 apparaît — si oui, plan de contingence Veo 3.1/HappyHorse à activer immédiatement.*

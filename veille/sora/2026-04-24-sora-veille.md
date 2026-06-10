# Veille Sora / Azure AI Foundry — 2026-04-24

> **T-2 jours avant la fermeture de l'app Sora (26 avril 2026).**
> Jour majeur côté OpenAI/MS : **GPT-5.5 lancé par OpenAI le 23/04** et **déjà GA dans Microsoft Foundry le 24/04** (billet Azure Blog publié il y a ~9 h). Le codename « Spud » qui circulait les jours passés et qu'on spéculait comme successeur vidéo de Sora était en fait le codename de **GPT-5.5**, pas un modèle vidéo — **aucune capacité vidéo dans GPT-5.5**, focus agentic coding / knowledge work / science. Côté vidéo, **rien ne bouge** : pas d'annonce OpenAI, `whats-new-foundry` toujours figé au 17/04 (7 j), sora-2 toujours gated preview, Veo 4 toujours pas de model card DeepMind, Happy Horse toujours « coming soon » sur fal.ai.

---

## 🔴 Nouveautés Sora-2 / OpenAI

### 🆕 GPT-5.5 lancé 23/04/2026 — **aucune capacité vidéo**

- OpenAI publie [**Introducing GPT‑5.5**](https://openai.com/index/introducing-gpt-5-5/) le 23/04. Modèle frontier axé **agentic coding + knowledge work + computer use + recherche scientifique**. Zéro mention vidéo, zéro Sora, zéro genmedia.
- Benchmarks phares : Terminal-Bench 2.0 82,7 % (SOTA), Expert-SWE 73,1 %, GDPval 84,9 %, OSWorld-Verified 78,7 %, FrontierMath Tier 4 35,4 %, ARC-AGI-2 85,0 %. Surclasse Claude Opus 4.7 et Gemini 3.1 Pro sur la plupart des axes.
- Disponibilité : ChatGPT (Plus, Pro, Business, Enterprise) et Codex **aujourd'hui**. API promise « very soon » à **5 USD/M input, 30 USD/M output** (gpt-5.5), **30/180 USD/M** (gpt-5.5-pro), contexte 1M tokens.
- Safeguards renforcées côté cybersec (classé « High » dans Preparedness Framework), pas côté genmedia.

### 🧩 Résolution rumeur « Spud » : c'était GPT-5.5, pas un modèle vidéo

- Depuis le 21/04, la presse tech (MindStudio, eWeek, TJ Robertson, Pasquale Pillitteri) attribuait le codename « Spud » à un successeur vidéo Sora. **Faux** : Spud était le codename interne de GPT-5.5 (confirmé par le pattern de lancement du 23/04 et la couverture TechCrunch / The Tech Portal).
- **Conséquence** : la narrative « OpenAI prépare un successeur vidéo » qu'on suivait depuis 4 rapports **tombe à l'eau**. **Aucun successeur vidéo annoncé**, aucun teaser, aucun system card. **Vacuum vidéo confirmé côté OpenAI**.
- ⚠️ Plusieurs blogs marketing continuent à décrire Spud comme modèle vidéo / image — **ignorer**, ces contenus datent d'avant le 23/04 et n'ont pas été corrigés.

### Rappel deadlines (inchangées)

- **26/04/2026 — T-2 JOURS** : shutdown app Sora (web + mobile). Export : `sora.chatgpt.com/exports/me`
- **24/09/2026** : discontinuation API Sora (OpenAI direct)
- **sora-2 / sora-2-pro** : endpoints live sur Azure, tarifs 0,10 / 0,30 USD/s

**Sources :**
- [OpenAI — Introducing GPT-5.5 (23/04/2026)](https://openai.com/index/introducing-gpt-5-5/)
- [TechCrunch — OpenAI releases GPT-5.5, bringing company one step closer to an AI 'super app' (23/04)](https://techcrunch.com/2026/04/23/openai-chatgpt-gpt-5-5-ai-model-superapp/)
- [The Tech Portal — OpenAI releases GPT-5.5 with major improvement in coding and autonomous task performance (24/04)](https://thetechportal.com/2026/04/24/openai-releases-gpt-5-5-with-major-improvement-in-coding-and-autonomous-task-performance)
- [OpenAI Help Center — What to know about the Sora discontinuation (inchangé)](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)

---

## 🔵 Azure AI Foundry

### 🆕 GPT-5.5 GA dans Microsoft Foundry — 24/04/2026

- Azure Blog publie [**OpenAI's GPT-5.5 in Microsoft Foundry: Frontier intelligence on an enterprise ready platform**](https://azure.microsoft.com/en-us/blog/openais-gpt-5-5-in-microsoft-foundry-frontier-intelligence-on-an-enterprise-ready-platform/) — timing quasi-simultané avec OpenAI (lancement 23/04 → GA Foundry 24/04, lag ~24 h). Parité de release **bien meilleure qu'au lancement de sora-2** (où l'écart avait été >1 semaine).
- Positionnement MS : « precision, reliability, persistence » → agents de prod enterprise. Rien sur la vidéo.
- Régions / pricing : rollout par phases standard. À surveiller pour comparer au pricing OpenAI direct.

### 🆕 Deux posts Foundry Blog le 23/04 — toujours orientés agents, zéro vidéo

[`devblogs.microsoft.com/foundry/`](https://devblogs.microsoft.com/foundry/) publie **2 posts le 23/04/2026** :

1. [**From Local to Production: The Complete Developer Journey for Building, Composing, and Deploying AI Agents**](https://devblogs.microsoft.com/foundry/from-local-to-production-the-complete-developer-journey-for-building-composing-and-deploying-ai-agents/) — annonce **Microsoft Agent Framework v1.0 GA**, **Foundry Toolkit for VS Code GA**, Foundry Memory (preview), Toolbox (preview), Hosted Agents faster/more-secure (preview), Observability Foundry Control Plane GA.
2. [**Introducing the new hosted agents in Foundry Agent Service**](https://devblogs.microsoft.com/foundry/introducing-the-new-hosted-agents-in-foundry-agent-service-secure-scalable-compute-built-for-agents/) — hosted agents GA en public preview : sandboxes per-session, filesystem persistence, identity intégrée, scale-to-zero.

→ **Lecture** : 5e jour consécutif où MS pousse uniquement l'infra agents + dev tooling. **Zéro mention vidéo / Sora / genmedia** dans ces posts. La doctrine MAI (image + voix + transcription, PAS de vidéo native) ne bouge pas.

### 🆕 What's New in Microsoft Foundry Fine-Tuning — April 2026

- Post publié par Foundry Blog (fenêtre avril 2026) : Global Training pour o4-mini avec coûts token réduits sur 12+ régions, nouveaux GPT-4.1 model graders pour RFT.
- **Aucune nouveauté fine-tuning vidéo**.

### Doc Foundry — `whats-new-foundry` toujours figé au 17/04 (7e jour)

- `learn.microsoft.com/azure/foundry/whats-new-foundry` : `Last updated on 04/17/2026`. **Inchangé 7 j**.
- Les nouveaux articles listés pour avril sont **tous orientés agents** : Task Adherence, Agentic Workflows, LangGraph/LangChain, Prompt Optimizer, FLUX models, Fireworks models, Foundry MCP Server, Memory/Agent.
- **Aucune nouvelle doc Sora-2, aucun article vidéo**.

### État sora-2 sur Foundry — inchangé

- `sora-2` / `sora-2-pro` : **preview, access gated** (Enterprise MCA-E / EA / 1000+ CU).
- Régions : **Sweden Central** et **East US 2** uniquement.
- Ancien `sora v2025-05-02` : deprecated 28/02/2026, ne peut plus être déployé.
- **Bug endpoint `/openai/v1/video/generations/jobs`** (HTTP 400 sur sora-2) : toujours le cas, **endpoint officiel = `/openai/v1/videos?api-version=preview`** (types `seconds: string`, `size: string`, status `completed`/`failed`). MS n'a pas corrigé l'ancien endpoint, la migration reste la solution de contournement documentée.
- Toujours **aucun migration path automatisé** `sora v2025-05-02` → `sora-2`.

**Sources :**
- [Microsoft Azure Blog — OpenAI's GPT-5.5 in Microsoft Foundry (24/04)](https://azure.microsoft.com/en-us/blog/openais-gpt-5-5-in-microsoft-foundry-frontier-intelligence-on-an-enterprise-ready-platform/)
- [Microsoft Foundry Blog — From Local to Production: Dev Journey (23/04)](https://devblogs.microsoft.com/foundry/from-local-to-production-the-complete-developer-journey-for-building-composing-and-deploying-ai-agents/)
- [Microsoft Foundry Blog — Introducing new hosted agents in Foundry Agent Service (23/04)](https://devblogs.microsoft.com/foundry/introducing-the-new-hosted-agents-in-foundry-agent-service-secure-scalable-compute-built-for-agents/)
- [Microsoft Foundry Blog — What's New in Foundry Fine-Tuning April 2026](https://devblogs.microsoft.com/foundry/whats-new-in-foundry-finetune-april-2026/)
- [Microsoft Learn — What's new in Microsoft Foundry (updated 17/04, unchanged 7j)](https://learn.microsoft.com/en-us/azure/foundry/whats-new-foundry)
- [Microsoft Learn — Sora 2 video generation overview (preview, unchanged)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [MS Q&A — Azure Video API rejects sora-2 deployments (catch-22)](https://learn.microsoft.com/en-us/answers/questions/5860394/azure-openai-video-api-rejects-all-sora-2-deployme)

---

## 🟢 Alternatives / concurrents

### Happy Horse 1.0 — statut inchangé, fenêtre « late April 2026 »

- [`fal.ai/happyhorse-1.0`](https://fal.ai/happyhorse-1.0) : toujours « Coming soon to fal ». Landing page à jour, texte officiel confirme « expected late April 2026 » et « exclusive official API providers at launch ».
- Toujours #1 Artificial Analysis Video Arena T2V no-audio (Elo 1333) et I2V no-audio (Elo 1392). #2 en catégorie audio.
- Toujours **15 B params**, Transformer 40-layer self-attention unifié audio+vidéo, claim **38 s pour 1080p sur un H100**.
- Toujours **pas de weights**, pas de licence, pas d'API live. Claim open-source non matérialisé.
- Source révélée : **Alibaba / Future Life Lab / Taotian Group** (dirigé par Zhang Di, ex-VP Kuaishou, ex-lead Kling AI). Claim non indépendamment vérifié.

→ **Plan d'action** : check quotidien continue. Dès que l'API passe live, bench 3-5 prompts vs Veo 3.1, pas de bascule prod avant pricing + TOS publics.

### Veo 4 — toujours pas de model card officielle DeepMind (9e jour sans confirmation)

- [`deepmind.google/models/veo/`](https://deepmind.google/models/veo/) : toujours **aucun model card Veo 4**.
- Pages tierces continuent à revendiquer « Veo 4 released April 2026 » : **spéculation / SEO**, pas de reprise sur `deepmind.google` ni `blog.google`.
- Prédictions analystes : release à **Google I/O 2026 (19-20 mai)** — cohérent pattern Veo (mai 2024, déc 2024, mai 2025). T-25 j.
- Posture inchangée : **rester Veo 3.1 en prod**, ne pas baser un SLA sur Veo 4.
- Rappel Veo 3.1 : disponible sur Gemini API / Vertex AI, free tier pour comptes Google perso (10 générations/mois via Google Vids), nouveau **Veo upscaling 4K** sur Vertex AI.

### Marché concurrent — cartographie stable

- **Runway Gen-4.5** : #1 Artificial Analysis T2V (Elo 1247). Pas d'update.
- **Kling 3.0** : 4K natif, storyboard per-shot, 6,99 USD/mois entry. Toujours leader price/feature sur l'entrée de gamme commerciale.
- **Pika 2.5** : inchangé (visual sharpness, Pikaswaps/Pikatwists/Pikaffects).
- **Seedance 2.0 (ByteDance)** : live sur fal.ai ce jour-ci (bandeau `fal.ai` : « Seedance 2.0 by ByteDance is now live on fal! »), alternative immédiatement utilisable.
- **Veo 3.1 / 3.1 Fast / 3.1 Lite** : Gemini API, Vertex AI, 10 gen/mois gratuites via Google Vids.

→ **Pour le bot sur Azure** : **Veo 3.1 reste le plan B sain**. Aucune raison de reconsidérer aujourd'hui.

**Sources :**
- [fal.ai — Happy Horse 1.0 landing (« coming soon », unchanged)](https://fal.ai/happyhorse-1.0)
- [fal.ai — HappyHorse-1.0: What Do We Know So Far](https://fal.ai/learn/devs/happyhorse-1-0-what-do-we-know-so-far)
- [Google DeepMind — Veo (aucun model card Veo 4 officiel)](https://deepmind.google/models/veo/)
- [Google Cloud Blog — Veo 3.1 Lite et Veo upscaling sur Vertex AI](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)
- [DigitalApplied — AI Video Market After Sora: Runway, Kling, Veo](https://www.digitalapplied.com/blog/ai-video-market-after-sora-runway-kling-veo-2026)

---

## 📌 Actions recommandées

| Priorité | Action | Délai |
|----------|--------|-------|
| 🔴 URGENT | **T-2 avant shutdown app Sora (26/04)** : dernier sweep qu'aucun workflow (export, monitoring, lien humain-in-the-loop) n'utilise encore l'app Sora. **Exporter toute data restante via `sora.chatgpt.com/exports/me` avant dimanche**. API Sora OpenAI direct reste live jusqu'au 24/09. | **48 h** |
| 🔴 URGENT | **Endpoint Azure OpenAI Video** : si le bot hit encore `/openai/v1/video/generations/jobs`, migrer vers `/openai/v1/videos?api-version=preview` (types `seconds: string`, `size: string`, status `completed`/`failed`). Sans ça, pas de deploy sora-2 possible. | **Cette semaine** |
| 🟡 MOYEN | **GPT-5.5 sur Foundry** : pas d'impact vidéo direct, **mais** disponibilité immédiate J+1 après OpenAI → si le bot a un étage LLM pour le prompt engineering vidéo / l'orchestration d'appels sora-2, évaluer migration `gpt-5.4 → gpt-5.5` (pricing 5/30 USD/M, contexte 1M). GPT-5.5 est annoncé **plus token-efficient** que GPT-5.4 à tâche équivalente. | Éval coût/latence sous 2 semaines |
| 🟡 MOYEN | **Happy Horse 1.0** : surveiller `fal.ai/happyhorse-1.0` quotidiennement jusqu'au 30/04. Dès que l'API passe « live », bench 3-5 prompts représentatifs vs Veo 3.1. Pas de bascule prod avant pricing + TOS publics. | Fin avril |
| 🟡 MOYEN | **Plan B Veo 4 → rester sur Veo 3.1** en prod. Attendre **Google I/O 2026 (19-20/05)** pour annonce Veo 4 officielle DeepMind. Monter **Veo 3.1 Lite** comme option coût-optimisée dans la matrice de bench. | Hold + bench |
| 🟡 MOYEN | **Foundry catalog** : re-check ciblé `whats-new-foundry` le 25-27/04 (cycle refresh 7-10 j, dernier refresh 17/04, prochain attendu 24-27/04). **Potentiel refresh déclenché ce w-e post-shutdown app Sora**. | T+1-3 j |
| 🟢 VEILLE | **Rumeur « Spud » = GPT-5.5** : résolue, **retirer du tracking**. Vacuum vidéo OpenAI **confirmé**, pas de successeur Sora annoncé. | Clos |
| 🟢 VEILLE | **Seedance 2.0** (ByteDance) : désormais live sur fal.ai — **alternative mûre, déployable immédiatement** si besoin urgent d'un plan C distinct de Veo. À ajouter au bench avec Veo 3.1 et (futur) Happy Horse. | Veille active |
| 🟢 VEILLE | **Google I/O 2026 (19-20/05)** : T-25 j. Fenêtre haute probabilité pour **Veo 4** officiel. | Ajouter au calendrier |

---

## 🔍 Rien de significatif aujourd'hui sur :

- Annonce d'un **successeur vidéo OpenAI** : **AUCUNE**. Rumeur Spud résolue (= GPT-5.5, pas vidéo). Vacuum confirmé.
- **GA sora-2 sur Azure** : toujours gated preview, inchangé 7 j.
- **Chemin de migration `sora v2025-05-02` → `sora-2`** automatisé : toujours aucun (inchangé 10 j).
- **Veo 4 model card officielle** : toujours absente, 9 j de veille sans source DeepMind.
- **Happy Horse API live** : toujours « coming soon ».
- **Runway / Pika / Luma / Kling** : pas de release majeure dans les 72 h.
- **Nouvelle doc MS Learn sur sora-2** : inchangée, `whats-new-foundry` figé 17/04.

---

## 📊 Évolution vs rapports précédents

| Signal | 21/04 | 22/04 | 23/04 | 24/04 |
|--------|-------|-------|-------|-------|
| sora-2 GA Azure | Gated preview | Gated preview | Gated preview | **Gated preview** (inchangé 7 j) |
| Successeur Sora OpenAI | Rumeur Spud | Rumeur reprise médias | Inchangé | **Rumeur RÉSOLUE : Spud = GPT-5.5, pas vidéo. Vacuum confirmé.** |
| OpenAI launch week | gpt-image-2 | DeployCo + Codex enterprise | Workspace Agents + Privacy Filter | **GPT-5.5 + GPT-5.5 Pro** |
| Azure Blog / Foundry Blog | Toolkit VS Code GA | MAI Efficient | Toolboxes + Hosted Agents + Dev Journey | **GPT-5.5 GA Foundry + Agent Framework v1.0 GA + 2 posts devblogs** |
| Veo 4 | Pas de card | Pas de card | Pas de card | **Pas de card, 9 j de veille** |
| Happy Horse API | « 30/04 via fal.ai » | « late April 2026 » | Inchangé | **Inchangé, landing toujours « coming soon »** |
| Bug endpoint Azure Video | Documenté | Documenté 7 j | Non résolu 8+ j | **Workaround `/openai/v1/videos` officiel, ancien endpoint non corrigé** |
| Doc Foundry whats-new | Inchangé | Inchangé 5 j | Inchangé 6 j | **Inchangé 7 j** |
| Sora app shutdown | T-5 | T-4 | T-3 | **T-2** |

---

*Rapport généré automatiquement le 2026-04-24. Sources ≤ 7 jours (sauf rappels de contexte explicites). GPT-5.5 confirmé par OpenAI (blog 23/04) et Azure Blog (24/04). 2 posts Foundry Blog 23/04 confirmés via `devblogs.microsoft.com/foundry/`. Happy Horse 1.0 statut inchangé (landing fal.ai). Rumeur « Spud » résolue (= GPT-5.5, pas vidéo) — retirée du tracking.*

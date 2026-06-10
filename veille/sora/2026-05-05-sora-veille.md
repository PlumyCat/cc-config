# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-05-05

**Période couverte :** 2026-05-04 → 2026-05-05 (24h depuis dernier rapport).
**Fenêtre filtrage :** sources ≤ 7 jours, doublons par rapport au rapport 04/05 supprimés.
**Tonalité du jour :** **journée calme côté vidéo** — aucune nouveauté Sora-2 ni Foundry vidéo en 24h. Statu quo strict : Sora-2 Foundry **toujours gated preview (J+16)**, page whats-new Foundry **toujours "April 2026"** au 05/05. Côté OpenAI : annonces de la journée non-vidéo (Advanced Account Security, $10B JV avec PE firms). Côté Veo 4 : **T-14 jours** de Google I/O 2026 (19-20/05), toujours aucune model card. HappyHorse-1.0 stable (commercial launch mai en cours). **Pas de signal d'accélération sur la stratégie vidéo du bot — statut quo intégral.**

---

## 🔴 Nouveautés Sora-2 / OpenAI

### App Sora — T+9 post-shutdown
- App shutdown effectif depuis **26/04/2026**. Aujourd'hui = **T+9**.
- **API Sora reste live jusqu'au 24/09/2026** (rappel 142 jours runway) : `Videos API, sora-2, sora-2-pro, sora-2-2025-10-06, sora-2-2025-12-08, sora-2-pro-2025-10-06`.
- **Aucune nouvelle communication OpenAI sur successeur vidéo** entre 04/05 et 05/05. Pivot équipe Sora vers world-models robotique confirmé durablement.
- **Pas de drop changelog `/v1/videos`** sur la fenêtre 24h (la doc Sora API mentionne déjà reusable character refs, 20s max, sora-2-pro 1080p $0.70/s, `/v1/videos/edits` qui remplace `/remix` — état stable).

### 🆕 OpenAI — annonces du 04/05/2026 (hors scope vidéo)
- **Advanced Account Security pour ChatGPT** annoncé le 04/05 : phishing-resistant sign-in, recovery controls renforcés, sessions plus courtes, login alerts, exclusion automatique du training. Obligatoire à partir du 01/06/2026 pour les membres "Trusted Access for Cyber" accédant aux modèles cyber les plus permissifs. **Hors scope vidéo, pas d'impact bot.**
- **OpenAI finalise une JV de $10B avec TPG, Brookfield, Advent et Bain Capital** (Bloomberg, 04/05) pour aider les entreprises à déployer leur software AI. **Hors scope vidéo, signal de business expansion.**

### OpenAI deprecations — page inchangée
- Statut deprecations Videos API + sora-2 family inchangé : **shutdown 24/09/2026, no recommended replacement**.

---

## 🔵 Azure AI Foundry

### Sora-2 — gated preview inchangée (J+16 sans GA)
- **Aucune annonce de GA** sora-2 sur Foundry entre 04/05 et 05/05. **Statut gated preview maintenu, 16 jours d'inertie continue**.
- `learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation` : doc inchangée.
- `ai.azure.com/catalog/models/sora-2` : page inchangée, gating MCA-E/EA + 1000+CU toujours en place. Régions = Sweden Central + East US 2.
- **Pricing inchangé** : Standard $0.10/s, Pro Global $0.30/s, Pro High-Res $0.50/s.
- Aucun mouvement post-renégociation Microsoft-OpenAI : la renégo continue à n'avoir **aucun impact** sur la sortie de gated preview pour sora-2.

### Catch-22 endpoint — toujours pas de fix officiel MS
- Issue MS Q&A "Azure OpenAI Video API rejects all sora-2 deployments — gateway validates for deprecated sora model name" : **pas de fix officiel MS visible** au 05/05.
- **Workaround officiel maintenu** : `POST {endpoint}/openai/v1/videos?api-version=preview` (et non l'ancien `/openai/deployments/{name}/video/generations/jobs`).
- Bug LiteLLM (#16568) toujours référencé : Sora 2 Model Authentication Error sur Azure. À monitorer pour le wrapper bot.

### What's new Foundry — page TOUJOURS "April 2026" au 05/05
- `learn.microsoft.com/en-us/azure/foundry/whats-new-foundry` : page **toujours intitulée "April 2026"** au 05/05. **Pas de bascule mai détectée à J+5 du mois.** Anomalie persistante.
- `devblogs.microsoft.com/foundry/category/whats-new/feed/` : pas de post vidéo-related entre 04/05 et 05/05.

### 🆕 Foundry — Agent 365 mai 2026 (hors vidéo, signal indirect)
- **Agent 365 What's New blog post mai 2026 publié** : Microsoft Defender pour Foundry et Copilot Studio agents (assess security posture, identifier permissions excessives, attack path analysis), nouveaux modèles DeepSeek V4 Flash + Pro confirmés, Agent Framework 1.2.2 (Azure AI Content Understanding support, hosted Durable Workflow enhancements, breaking orchestration output standardization).
- **API Migration timeline** : nouveau Agent 365 Graph API rolled out en mai 2026 ; ancien agent registry Graph API begins retirement 15/06/2026.
- **Hosted agent migration deadline** : ancien backend supporté **uniquement jusqu'au 22/05/2026**. Si le bot vidéo s'appuie sur l'ancien backend Foundry agents, action requise avant cette date.
- Pas vidéo mais signal continu d'enrichissement Foundry hors-vidéo.

### Pas de MAI-Video first-party
- Aucun mouvement MAI-Video : MAI-Image-2 (image gen) reste le top first-party MS, pas d'extension vidéo annoncée. **9 jours après la fin d'exclusivité OpenAI, Microsoft n'a toujours pas accéléré un first-party vidéo.**

---

## 🟢 Alternatives / concurrents

### Veo 3.1 / Veo 4 (Google DeepMind)
- **Veo 4 toujours non officiellement annoncé**. Pas de model card sur `deepmind.google/models/veo/`. **Inchangé depuis 20+ jours**.
- **Google I/O 2026 = 19-20/05/2026** → **T-14 jours**. Fenêtre haute probabilité Veo 4 (Polymarket : ~69% odds avant juin 2026, historique Google = Veo 1 à I/O 2024, Veo 3 à I/O 2025).
- 🆕 **"Code the Countdown" lancé 01/05** par Google : engagement programme pour le keynote I/O 2026. Pas d'indice vidéo spécifique mais signal de communication intense pré-keynote.
- **Veo 3.1 Lite** : production-ready actuelle pour le bot, prix ~$0.05/sec, public preview Vertex AI.
- **Vertex AI release notes 04/05-05/05** : pas de drop spécifique vidéo. Note de migration toujours active : `veo-3.0-generate-001` → `veo-3.1-generate-001` avant **30/06/2026**.

### HappyHorse-1.0 — stable, commercial launch en cours
- **Pricing officiel Alibaba Cloud Bailian** maintenu : ¥0.9/s 720p, ¥1.6/s 1080p (HappyHorse-1.0-T2V).
- **Multi-canalité opérationnelle** : fal.ai (live depuis 26/04) + Alibaba Cloud Bailian (testing 27/04, commercial mai en cours, phase 2 Integration en cours) + Pixazo API (29/04).
- **APIYI** continue de proposer une remise de 10% via partenariat Alibaba Cloud officiel.
- Toujours **#1 Elo Artificial Analysis Video Arena** (1389 Elo points T2V sans audio).
- 4 endpoints stables : `text-to-video`, `image-to-video`, `reference-to-video`, `video-edit`.
- 15B params, lip-sync 7 langues, audio inclus.
- **Pas de news majeure 04/05-05/05** : stable.

### Runway / Kling / Pika / Seedance / Luma
- **Runway** : Gen-4.5 toujours #1 Video Arena Elo (1247 Elo). Pas d'annonce produit majeure 04/05-05/05.
- **Kling 3.0** : 4K natif stable depuis 05/02/2026. Pas d'annonce.
- **Pika 2.5** : silence radio. Pikaframes (start+end image transition) reste la dernière nouveauté notable.
- **Seedance 2.0** : disponible via Runway et fal.ai. Stable.
- **Luma Dream Machine / Ray3** : aucun mouvement.

### Marché global — accélération distribution OpenAI (rappel)
- L'accord OpenAI-AWS ($50B Amazon, 2GW Trainium) confirmé reconfigurant le marché LLM, **mais ne touche toujours pas la vidéo**. Pour le bot vidéo, le statu quo cloud est confirmé une journée de plus : Sora-2 reste exclusif Azure publique, Veo reste GCP, HappyHorse reste Alibaba+fal.

---

## 📌 Actions recommandées

| Priorité | Action | Délai |
|----------|--------|-------|
| 🔴 **NOUVEAU** | **Si bot vidéo s'appuie sur Foundry agents legacy** : auditer dépendance avant **22/05/2026** (deadline migration hosted agents). Ancien backend ne sera plus supporté. | Avant 22/05 |
| 🔴 IMPORTANT | **Audit endpoint bot** (rappel) : confirmer usage `/openai/v1/videos?api-version=preview` (pas l'ancien path). Toujours pas de fix MS officiel pour le catch-22 au 05/05, workaround toujours requis. | Aujourd'hui |
| 🔴 STRATÉGIQUE | **Préparer plan de bench Veo 4** : Google I/O 2026 J-14. Lister 5 prompts de référence à passer dès J+1 si Veo 4 est annoncé le 19 ou 20/05. | Avant 19/05 |
| 🔴 STRATÉGIQUE | **Bench HappyHorse-1.0 vs Veo 3.1 vs sora-2** : maintenir l'objectif (5 prompts représentatifs, qualité + latence + coût). Pricing Bailian officiel disponible pour calcul TCO réel. | Cette semaine |
| 🟡 MOYEN | **Vertex AI deprecations 30/06/2026** : si bot consomme `veo-3.0-generate-001` ou `veo-3.0-fast-generate-001`, migration vers `veo-3.1-generate-001` / `veo-3.1-fast-generate-001` requise. | Avant fin mai |
| 🟡 MOYEN | **Recheck Foundry whats-new** : page "April 2026" pas encore basculée en mai au 05/05 (J+5 du mois). Recheck quotidien. | Continu |
| 🟢 VEILLE | **Successeur vidéo OpenAI sur Bedrock** : monitorer si AWS finit par exposer sora-2 (improbable court terme, OpenAI pivot world-models). | Veille passive |
| 🟢 VEILLE | **MAI-Video first-party MS** : monitorer si la fin d'exclusivité accélère un first-party Microsoft. **Aucun signal au 05/05 (J+9 post-renégo).** | Veille passive |

---

## 🔍 Rien de significatif aujourd'hui sur :

- **GA sora-2 Azure** : toujours gated preview (16 jours inchangé).
- **Annonce successeur vidéo OpenAI** : confirmé absent.
- **Veo 4 model card officielle DeepMind** : 20+ jours sans source primaire.
- **Runway / Pika / Luma / Kling / Seedance** : silence sur la fenêtre 24h.
- **MAI-Video first-party Microsoft** : toujours absent (J+9 post-renégo, fenêtre opportunité ratée).
- **Devblogs Foundry** : pas de post 04/05-05/05 video-related.
- **Vertex AI release notes** : pas de drop vidéo 04/05-05/05.
- **OpenAI changelog `/v1/videos`** : pas de drop sur la fenêtre 24h.
- **Foundry whats-new page** : toujours "April 2026" au 05/05 (anomalie continue J+5).

---

## 📊 Évolution vs rapports précédents

| Signal | 30/04 | 04/05 | **05/05** |
|--------|-------|-------|-----------|
| sora-2 GA Azure | Gated preview (11j) | Gated preview (15j) | **Gated preview (16j)** |
| Sora app status | T+4 | T+8 | **T+9 post-shutdown** |
| API Sora OpenAI | Live | Live (143j runway) | **Live (142j runway)** |
| Successeur vidéo OpenAI | Vacuum durable (clos) | Vacuum confirmé même sur AWS | **Vacuum confirmé (rien sur 24h)** |
| MS-OpenAI exclusivité | n/a | ENDED 27/04 (rétroactif) | **ENDED J+9** |
| OpenAI sur AWS Bedrock | n/a | GPT-5.5/5.4/Codex/Agents 28/04 (PAS de vidéo) | **Inchangé (pas de vidéo)** |
| Veo 4 | Pas de card 15+ j | Pas de card 19+ j, T-15j I/O | **Pas de card 20+ j, T-14j I/O** |
| HappyHorse 1.0 | Multi-canal | Pricing Bailian officiel publié | **Stable (pas de news 24h)** |
| Catch-22 endpoint Azure Video | Documenté MS Q&A | Toujours pas de fix MS officiel | **Toujours pas de fix MS officiel** |
| Doc Foundry whats-new | Inchangé 11j | Toujours "April 2026" au 04/05 | **Toujours "April 2026" au 05/05 (J+5 du mois)** |
| Catalogue Foundry | Stable | DeepSeek V4 Flash + Pro 01/05 | **Stable (rien de neuf vidéo)** |
| Foundry agents | Stable | Memory preview, Agent Framework 1.0 GA, Boundary preview | **🆕 Agent Framework 1.2.2, hosted agent migration deadline 22/05** |
| 🆕 OpenAI hors vidéo | n/a | n/a | **🆕 Advanced Account Security, JV $10B PE firms (04/05)** |

---

## Sources

### Sora app shutdown / OpenAI (T+9)
- [OpenAI Help Center — What to know about the Sora discontinuation](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [OpenAI Index — Sora 2 is here](https://openai.com/index/sora-2/)
- [OpenAI Deprecations — Videos API + sora-2 family shutdown 2026-09-24](https://developers.openai.com/api/docs/deprecations)
- [OpenAI Changelog](https://developers.openai.com/api/docs/changelog)
- [OpenAI Developer Community — Is the Sora2 API still working?](https://community.openai.com/t/is-the-sora2-api-still-working/1379946)
- [OpenAI News — Latest updates](https://openai.com/news/)
- [OpenAI Release Notes — May 2026 Latest Updates (Releasebot)](https://releasebot.io/updates/openai)

### OpenAI hors vidéo (04/05/2026)
- [Bloomberg — OpenAI Finalizes $10B Venture With Private Equity Firms to Deploy AI](https://www.bloomberg.com/news/articles/2026-05-04/openai-finalizes-10-billion-joint-venture-with-pe-firms-to-deploy-ai)
- [AWS News Blog — AWS Weekly Roundup May 4, 2026](https://aws.amazon.com/blogs/aws/aws-weekly-roundup-whats-next-with-aws-2026-amazon-quick-openai-partnership-and-more-may-4-2026/)

### Sora-2 sur Azure AI Foundry
- [Microsoft Foundry Docs — Sora 2 video generation overview (preview)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Microsoft Foundry Docs — What's New for April 2026](https://learn.microsoft.com/en-us/azure/foundry/whats-new-foundry)
- [Azure Blog — Sora 2 in Azure AI Foundry: Create videos with responsible AI](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [Azure AI catalog — OpenAI Sora-2](https://ai.azure.com/catalog/models/sora-2)
- [Microsoft Q&A — Azure OpenAI Video API rejects all sora-2 deployments (catch-22)](https://learn.microsoft.com/en-us/answers/questions/5860394/azure-openai-video-api-rejects-all-sora-2-deployme)
- [Microsoft Q&A — Sora 2 Not Available in Azure AI Foundry Model List](https://learn.microsoft.com/en-us/answers/questions/5774829/sora-2-not-available-in-azure-ai-foundry-model-lis)
- [Microsoft Q&A — Access to Sora 2](https://learn.microsoft.com/en-us/answers/questions/5774773/access-to-sora-2)
- [Microsoft Q&A — Sora 2 Preview clarifications on durations](https://learn.microsoft.com/en-us/answers/questions/5629317/sora-2-preview-in-azure-ai-foundry-clarification-o)
- [LiteLLM Issue #16568 — Azure OpenAI Sora 2 Authentication Error](https://github.com/BerriAI/litellm/issues/16568)

### Foundry catalogue & plateforme — agents et models (mai 2026)
- [Microsoft Community Hub — What's New in Agent 365: May 2026](https://techcommunity.microsoft.com/blog/agent-365-blog/what%E2%80%99s-new-in-agent-365-may-2026/4516340)
- [Topedia — Retirement of agentRegistry API + new licensing for Agent 365 Graph API](https://blog-en.topedia.com/2026/05/retirement-of-the-agentregistry-api-and-new-licensing-requirements-for-the-agent-365-graph-api/)
- [Microsoft Foundry Blog — Devblogs](https://devblogs.microsoft.com/foundry/)
- [Microsoft Learn — Migrate hosted agents to refreshed public preview](https://learn.microsoft.com/en-us/azure/foundry/agents/how-to/migrate-hosted-agent-preview)
- [Hubsite365 — Azure May 2026: 7 Game-Changing Updates](https://www.hubsite365.com/en-ww/crm-pages/azure-update-1st-may-2026.htm)

### HappyHorse-1.0 (stable)
- [Apiyi — HappyHorse pricing vs Seedance 2.0](https://help.apiyi.com/en/happyhorse-pricing-vs-seedance-2-comparison-en.html)
- [Apiyi — HappyHorse API live on Alibaba Cloud Bailian (10% off)](https://help.apiyi.com/en/happyhorse-api-bailian-launch-apiyi-en.html)
- [PRNewswire — fal Launches HappyHorse-1.0 as Official API Partner](https://www.prnewswire.com/news-releases/fal-launches-happyhorse-1-0--the-1-ranked-ai-video-model-as-official-api-partner-302755003.html)
- [fal.ai — HappyHorse-1.0 landing page](https://fal.ai/happyhorse-1.0)

### Veo / DeepMind / Vertex AI / Google I/O 2026
- [Google DeepMind — Veo models page](https://deepmind.google/models/veo/)
- [Vertex AI — Generative AI release notes](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes)
- [Veo 3.1 — Vertex AI doc](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/models/veo/3-1-generate)
- [Google Cloud Blog — Veo 3.1 Lite and Veo upscaling](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)
- [evolink.ai — Veo 4 Release Date 2026](https://evolink.ai/blog/veo-4-release-date-2026)
- [9to5Google — Code the Countdown for Google I/O 2026 keynote](https://9to5google.com/2026/05/01/google-i-o-2026-countdown/)
- [Google I/O 2026 official site](https://io.google/2026/)
- [Tom's Guide — Google I/O 2026: Date, time, potential announcements](https://www.tomsguide.com/phones/google-pixel-phones/google-i-o-2026-date-time-potential-announcements-and-everything-else-you-need-to-know)

### Marché global et concurrents
- [Releasebot — OpenAI Release Notes May 2026](https://releasebot.io/updates/openai)
- [Llm-stats — AI Updates Today (May 2026)](https://llm-stats.com/llm-updates)
- [Llm-stats — LLM News Today (May 2026)](https://llm-stats.com/ai-news)

---

*Rapport généré automatiquement le 2026-05-05 (mardi). Sources ≤ 7 jours sauf rappels de contexte explicites. Tonalité du jour : **journée calme côté vidéo**, statu quo strict 24h. Sora-2 toujours gated preview Foundry (J+16), Foundry whats-new page toujours "April 2026" au J+5 du mois (anomalie). Pas d'annonce vidéo OpenAI ni MS. Côté concurrents : Veo 4 toujours absent à T-14 jours de Google I/O 2026, HappyHorse-1.0 stable. Côté OpenAI hors vidéo : Advanced Account Security ChatGPT et JV $10B avec PE firms (04/05) — sans impact sur le bot vidéo. **Pas d'action critique nouvelle**, sauf vigilance migration Foundry hosted agents avant 22/05/2026 si dépendance legacy.*

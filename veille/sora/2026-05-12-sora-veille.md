# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-05-12

**Période couverte :** 2026-05-11 08:01 UTC → 2026-05-12 07:30 UTC (~23h depuis le re-run d'hier).
**Fenêtre filtrage :** sources ≤ 7 jours, doublons par rapport aux rapports `2026-05-11-sora-veille.md` (07:13) et `2026-05-11-sora-veille-08h.md` supprimés.
**Tonalité du jour :** **🟡 Veille standard — aucun signal critique nouveau, MAIS rumeur "Spud" qui s'élargit aux médias mainstream (Tom's Guide, The Neuron) — toujours non confirmée par OpenAI.** Compteurs critiques avancent d'un cran : retirement Sora-2 Foundry maintenant **J-25**, retirement legacy **J-21**, Google I/O **T-7**, MS Build **T-21**.

---

## 🔴 Nouveautés Sora-2 / OpenAI

**Pas de nouveauté officielle OpenAI sur Sora-2 / API vidéo ces dernières 24h.**

- App Sora : **T+16 post-shutdown** (26/04/2026), inchangé.
- API Sora (sora-2 + sora-2-pro) : **live jusqu'au 24/09/2026 (135 jours runway)**, inchangé.
- **OpenAI Deprecations page** : sora-2 family + Videos API → shutdown 24/09/2026, **"no recommended replacement"** (statut inchangé au 12/05 07:30 UTC).
- **🆕 Signal "Spud" qui s'élargit (⚠️ non confirmé par OpenAI)** : la rumeur du modèle vidéo successeur "Spud" passe d'écho de bas niveau (MindStudio, FindSkill) à mention par **Tom's Guide** ("OpenAI just killed Sora as company readies IPO and new 'Spud' model") et **The Neuron Daily** ("OpenAI Kills Sora, Preps Spud Model"). Cohérence inter-sources :
  - Spud = **API-only**, pas d'app type "TikTok".
  - Focus **"Physical World Understanding"** (applications industrielles / robotique) plutôt que créatif grand public.
  - Pré-training terminé ~24/03/2026 (selon *The Information* relayé par TipRanks).
  - Lancement estimé **~juillet 2026** (~50 jours après le retirement Foundry 06/06).
  - ⚠️ Le nom "Spud" pourrait être un codename interne — le produit final pourrait s'appeler autrement.
  - **Impact bot vidéo** : si Spud sort en juillet et est API-only OpenAI, il **n'arrivera pas via Azure Foundry avant Q4 2026 minimum** (intégration MS + responsible AI typiquement 2-3 mois). Ne pas l'inscrire dans le plan de migration immédiat.
- Focus produit OpenAI 7 derniers jours : voice (GPT-Realtime-2 / Translate / Whisper publiés 07/05), GPT-5.5 Instant (05/05). **Aucune** annonce vidéo.

## 🔵 Azure AI Foundry

**Pas de nouveauté significative côté Azure / Foundry sur la fenêtre 23h.**

- 🚨 **Retirement Sora-2 Foundry = 06/06/2026 (J-25)** — INCHANGÉ. Aucune communication MS sur extension ni successeur first-party côté vidéo.
- **Legacy `sora-2-2025-10-06` retirement = 02/06/2026 (J-21)** — INCHANGÉ.
- **Gated preview Foundry** : J+23 sans GA, pricing inchangé ($0.10/s standard, $0.30/s Pro Global, $0.50/s Pro High-Res).
- **Catch-22 endpoint** : workaround `POST {endpoint}/openai/v1/videos?api-version=preview` toujours nécessaire.
- **🆕 Doc Foundry classic — `whats-new` vérifiée 12/05 07:30 UTC** : `meta-updated_at: 2026-05-08T06:08:00Z` (inchangé depuis hier). Section **May 2026** contient uniquement GPT Realtime Translate + GPT Realtime Whisper. **Toujours rien sur vidéo, Sora, ou successeur first-party.** Anomalie portail Foundry (nouveau) reste à confirmer.
- MAI-Video first-party : pas de signal nouveau 24h. MAI-Image-2 toujours image-only sur la model card officielle.
- **Microsoft Build 2026** (T-21 jours, 02-03/06 SF) :
  - Session catalog publié (cf. Thurrott 12/05). **Focus annoncé : AI production systems, agentic workflows, model-cost control** — **aucune mention vidéo explicite** dans les 3 piliers communiqués pour startups (microsoft.com/startups blog du 05/05).
  - Fenêtre toujours étroite : Build (02-03/06) tombe **APRÈS retirement legacy 02/06** et **AVANT retirement overall 06/06** : si annonce vidéo first-party, elle ne laisse que **3 jours pour migrer**.
- Thread OpenAI Developer Community #1380475 (Azure cutting Sora-2 too early) : pas de réponse MS officielle 24h.
- MS Q&A #5881436 : statut inchangé, pas d'extension confirmée.

## 🟢 Alternatives / concurrents

- **Google I/O 2026** : **T-7 jours** (keynote 19/05 10:00 PT à Shoreline Amphitheatre, Mountain View).
  - **Veo 4** : toujours non officiellement annoncé (J+27 d'attente). Anticipation industrielle croissante — articles spéculatifs récents (Tom's Guide, Concept-Phones, Imagine.art, SocialNews.xyz du 08/05 "Veo 4 Is Almost Here") convergent vers une annonce probable à I/O, MAIS **rien d'officiel** côté Google/DeepMind. Status: ⚠️ probable mais non confirmé.
  - **Rumored features Veo 4** : 15-30s native single-shot, 4K natif, génération multi-scène depuis storyboard, frame-to-frame consistency.
  - Polymarket "VEO 4 released by June 2026" : ~69% (proche du seuil pré-I/O — non vérifié 24h, à reconfirmer dans la journée).
  - Aucune nouvelle model card sur `deepmind.google/models/veo/` au 12/05.
- **Veo 3.1 Lite** : production-ready actuelle pour le bot, paid preview Gemini API / AI Studio / Vertex AI. Pricing -50% vs Veo 3.1 Fast (annoncé début avril, mais re-confirmé dans les search results d'aujourd'hui — pas de changement de prix sur 24h).
- **"Veo 3.2"** (leak SuperMaker AI 18/01, codename "Snowbunny", engine Artemis, 30s/4K) : ⚠️ toujours non confirmé par DeepMind, aucun report mainstream sur 24h. Probabilité de fusion avec une éventuelle annonce I/O sous nom "Veo 4".
- **"Omni" Google** : leak UI Gemini *"Powered by Omni"* persistant ⚠️ non confirmé. Aucune nouvelle preuve sur 24h.
- **ByteDance Seedance 2.0** : intégration CapCut confirmée (référence "The Batch" / DeepLearning.AI), positionné comme **state-of-the-art** dans le récit "OpenAI Retreats". Pas de nouvelle release 24h, mais signal de marché à garder en tête : Seedance gagne en mind-share alors qu'OpenAI sort de la course vidéo. **À évaluer comme alternative bot si Veo 4 ne sort pas à I/O.**
- **Runway / Pika / Kling / Grok Imagine / Hailuo / Vidu / LTX** : pas de news majeure 24h selon les agrégateurs (cyberlink, atlascloud, pixo, videoany — tous datent des mêmes guides "alternatives Sora" déjà connus).

---

## 📌 Actions recommandées

1. **Critique (inchangé)** — Confirmer la migration **Veo 3.1 Lite (Vertex AI)** comme fallback prod **avant 06/06/2026 (J-25)**. Ne PAS attendre Build 2026 (02-03/06) ni I/O (19-20/05) : le risque résiduel d'absence d'annonce video first-party MS est trop élevé, et la fenêtre Build → retirement est de 3 jours seulement.
2. **Surveillance majeure cette semaine — Google I/O 19-20/05 (T-7)** :
   - Si **Veo 4 annoncé** → réévaluer le choix Veo 3.1 Lite vs Veo 4 (pricing/availability/quality). Probable montée en gamme worthwhile.
   - Si **Veo 4 PAS annoncé** → tenir Veo 3.1 Lite (production-ready) **et évaluer Seedance 2.0 comme second fallback** vu son momentum mind-share.
3. **Suivre — anomalie portail Foundry (nouveau)** : J+8 consécutif sans bascule "May 2026". Si J+9 demain, signal d'embargo pré-Build plausible — surveiller PRs sur `MicrosoftDocs/azure-ai-docs` repo.
4. **Bas niveau — surveiller la rumeur Spud** : passage à *Tom's Guide* + *The Neuron* indique élargissement crédible. **Pas une action prod immédiate** (timeline ~juillet, integration Azure pas avant Q4), mais à monitorer pour planning H2 2026. **Si "Spud" est confirmé officiellement par OpenAI → action n°5 ci-dessous active.**
5. **Conditionnel — annonce officielle "Spud" / vidéo OpenAI** : déclencher demande proactive support Azure ("Roadmap d'intégration ?") + checker si MS communique sur model retirement schedule pour ajustement Foundry post-06/06.

---

## Sources

### Sora-2 / OpenAI (vérifiées 12/05 07:30 UTC)
- [Sora 2 is here | OpenAI](https://openai.com/index/sora-2/)
- [Sora — Release Notes (OpenAI Help)](https://help.openai.com/en/articles/12593142-sora-release-notes)
- [What to know about the Sora discontinuation | OpenAI Help](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [Deprecations | OpenAI API](https://developers.openai.com/api/docs/deprecations)
- [Changelog | OpenAI API](https://developers.openai.com/api/docs/changelog)
- [Releasebot — OpenAI updates May 2026](https://releasebot.io/updates/openai)

### Rumeur Spud (⚠️ non confirmé OpenAI, signal qui s'élargit)
- [OpenAI just killed Sora as company readies IPO and new 'Spud' model — Tom's Guide](https://www.tomsguide.com/ai/openai-just-killed-sora-as-company-readies-ipo-and-new-spud-model)
- [OpenAI Kills Sora, Preps Spud Model — The Neuron Daily](https://www.theneurondaily.com/p/sora-lasted-6-months-disney-s-1b-deal-lasted-3)
- [OpenAI's New 'Spud' AI Model Poised to Reshape Economy — Ovexro](https://blog.ovexro.com/openai-readies-spud-ai-signals-economic-shift)
- [OpenAI Spud: They Killed Sora for This — FindSkill](https://findskill.ai/blog/openai-spud-next-ai-model/)
- [OpenAI finished initial development of next major AI model — TipRanks / The Information](https://www.tipranks.com/news/the-fly/openai-finished-initial-development-of-next-major-ai-model-the-information-says-thefly-news)
- [ByteDance Adds Seedance 2.0 / OpenAI Retreats — The Batch (DeepLearning.AI)](https://www.deeplearning.ai/the-batch/bytedance-adds-state-of-the-art-seedance-2-0-video-to-capcut-while-openai-retreats)

### Azure AI Foundry — Sora-2 retirement & docs (vérifiées 12/05 07:30 UTC)
- [Azure AI Foundry Sora 2 retirement date — MS Q&A #5881436](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)
- [Foundry Models lifecycle and support policy](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)
- [Model retirement schedule (Foundry)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirement-schedule)
- [AI Model Catalog — sora-2](https://ai.azure.com/catalog/models/sora-2)
- [Azure OpenAI prematurely cutting off Sora 2 — OpenAI Dev Community #1380475](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475)
- [What's new in Azure OpenAI Foundry classic (mai 2026 section)](https://learn.microsoft.com/en-us/azure/foundry-classic/openai/whats-new)
- [Sora 2 in Azure AI Foundry — Microsoft Azure Blog](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)

### Microsoft Build 2026 (T-21 — focus AI mais pas vidéo annoncé)
- [Microsoft Build 2026 official](https://build.microsoft.com/en-US/home)
- [Microsoft's Build 2026 Session Catalog Is Live — Thurrott](https://www.thurrott.com/microsoft/334704/microsofts-build-2026-session-catalog-is-now-live)
- [Build 2026 sessions every startup should attend — MS Startups Blog (05/05)](https://www.microsoft.com/en-us/startups/blog/microsoft-build-2026-sessions-every-startup-should-attend/)
- [Microsoft Build 2026: Startup Playbook — Windows News](https://windowsnews.ai/article/microsoft-build-2026-the-startup-playbook-for-ai-production-systems-and-agentic-workflows.416585)

### Veo / Google DeepMind / I/O 2026 (T-7)
- [Google I/O 2026 — io.google](https://io.google/2026/)
- [Google I/O 2026 preview — Tom's Guide](https://www.tomsguide.com/phones/google-pixel-phones/google-i-o-2026-date-time-potential-announcements-and-everything-else-you-need-to-know)
- [Google I/O 2026: Gemini 4, Android 17, Developer Guide — Abhishek Gautam](https://www.abhs.in/blog/google-io-2026-preview-gemini-4-android-17-developer-guide)
- [Veo 4 Release Date 2026 — Evolink](https://evolink.ai/blog/veo-4-release-date-2026)
- [Veo 4: When Will It Release — Concept Phones](https://www.concept-phones.com/google/googles-veo-4-when-will-it-release-and-what-we-can-expect/)
- [Google's Veo 4 Is Almost Here — Social News XYZ (08/05)](https://www.socialnews.xyz/2026/05/08/googles-veo-4-is-almost-here-and-it-looks-powerful/)
- [Veo — Google DeepMind official](https://deepmind.google/models/veo/)
- [Build with Veo 3.1 Lite — Google blog](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-lite/)

---

*Rapport quotidien généré automatiquement le 2026-05-12 ~07:30 UTC. **Conclusion du jour : 23h sans signal critique nouveau côté MS/Foundry ; rumeur Spud qui s'élargit côté OpenAI (à monitorer pour H2 2026, pas pour migration immédiate) ; Google I/O 19-20/05 (T-7) reste l'événement déclencheur potentiel.** Action critique inchangée : la migration Veo 3.1 Lite doit être actée cette semaine — la fenêtre Build → retirement (02/06 → 06/06) de 3 jours rend tout pari Microsoft trop risqué. Si I/O annonce Veo 4 lundi 19/05, réévaluer Veo 3.1 Lite vs Veo 4.*

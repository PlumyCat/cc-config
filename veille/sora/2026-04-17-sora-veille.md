# Veille Sora / Azure AI Foundry — 2026-04-17

> **T-9 jours avant la fermeture de l'app Sora (26 avril 2026).**
> Aucune annonce majeure Microsoft sur une migration Sora côté Azure Foundry depuis hier.

---

## 🔴 Nouveautés Sora-2 / OpenAI

### Nouveau : données économiques de la fermeture Sora

Plusieurs médias ont publié (entre le 14 et le 16 avril) des chiffres inédits justifiant la fermeture :

- **~2,1 M USD** de revenu cumulé côté Sora depuis le lancement
- **~15 M USD / jour** de coûts d'inférence
- Soit un ratio cost/revenue qui rend le maintien du service intenable

→ Confirme le récit de l'arrêt pour raisons économiques et compute déjà évoqué hier (Disney, réorientation enterprise), mais avec des ordres de grandeur désormais chiffrés.

### GPT Image 2 — déploiement silencieux chez ChatGPT

Des testeurs rapportent un rollout progressif et non annoncé de **GPT Image 2** à un sous-ensemble d'utilisateurs ChatGPT depuis la mi-avril. Le compute libéré par l'arrêt de Sora serait en partie redirigé vers ce modèle.

⚠️ **Pas encore de signal côté vidéo :** aucune annonce publique sur un successeur Sora grand public côté OpenAI. Le projet **"Spud"** reste non confirmé officiellement (voir rapport du 16 avril), positionné robotique/world-model.

### Sora 2 Pro via API — rappel tarifs

Rappel utile car non détaillé dans les précédents rapports :

- **Sora 2** : 0,10 USD/s (API OpenAI direct)
- **Sora 2 Pro** : à partir de **0,30 USD/s** (release le 23 mars 2026)
- Les deux endpoints (`sora-2`, `sora-2-pro`) restent exposés dans l'OpenAPI spec jusqu'au **24 septembre 2026** (discontinuation API)
- Depuis le **10 janvier 2026**, la génération image/vidéo n'est plus accessible aux utilisateurs Free (Plus/Pro uniquement côté consumer)

**Sources :**
- [OpenAI — What to know about the Sora discontinuation](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [Mejba — AI Industry April 2026: Opus Degraded, OpenAI Pro, More](https://www.mejba.me/blog/ai-industry-shakeup-april-2026)
- [TechRadar — Google pushing AI video as OpenAI pulls Sora back](https://www.techradar.com/ai-platforms-assistants/google-is-pushing-ai-video-into-ordinary-life-just-as-openai-pulls-sora-back)
- [OpenAI Developers — Sora 2 Pro model page](https://developers.openai.com/api/docs/models/sora-2-pro)
- [AIFreeAPI — Sora 2 API Pricing & Quotas 2026](https://www.aifreeapi.com/en/posts/sora-2-api-pricing-quotas)

---

## 🔵 Azure AI Foundry

### Pas de nouveauté significative aujourd'hui sur Sora

- Aucun article Microsoft récent (≤ 7 jours) ne mentionne Sora, une migration, ou un chemin de bascule pour les tenants sans accès Sora 2 dans le catalog.
- La dernière publication **"What's new in Foundry Labs — April 2026"** (8 avril) et le **What's new in Microsoft Foundry | March 2026** (9 avril) n'évoquent **aucun modèle vidéo** — focus entier sur MAI-Transcribe-1, MAI-Voice-1, MAI-Image-2, Phi-4-Reasoning-Vision, Harrier-oss-v1, GigaTIME.
- Le feed RSS `devblogs.microsoft.com/foundry/whats-new` n'a pas de post plus récent que le 9 avril.

### MAI-Image-2 (rappel, annoncé le 2 avril)

Non couvert dans les rapports précédents — à noter pour la roadmap Foundry :

- MAI-Image-2 en public preview, disponible **exclusivement sur Foundry**
- Positionné #3 Arena.ai sur la catégorie image families
- **Vidéo évoquée sur la roadmap, pas dans la preview actuelle** → pas de remplaçant Sora côté Microsoft en ce moment
- Tarif : 5 USD / 1M tokens input, 33 USD / 1M tokens output image
- Une variante **MAI-Image-2-Efficient** annoncée ensuite (gains ~4x efficience) — toujours image-only

→ **Implication bot vidéo :** le stack Foundry "1st-party" Microsoft ne propose aujourd'hui **aucune alternative vidéo native** à Sora 2. Le seul chemin Foundry pour la vidéo reste Sora 2 en preview gated (access application Enterprise / MCA-E / EA / 1000+CU).

**Sources :**
- [Microsoft — What's new in Foundry Labs — April 2026](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/whats-new-in-foundry-labs---april-2026/4509714)
- [Microsoft Foundry Blog — What's new in Microsoft Foundry (feed)](https://devblogs.microsoft.com/foundry/category/whats-new/feed/)
- [Microsoft — Introducing MAI-Transcribe-1, MAI-Voice-1, MAI-Image-2](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/introducing-mai-transcribe-1-mai-voice-1-and-mai-image-2-in-microsoft-foundry/4507787)
- [Microsoft — Introducing MAI-Image-2-Efficient](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/introducing-mai-image-2-efficient-faster-more-efficient-image-generation/4510918)
- [Microsoft Learn — Deploy MAI models in Foundry](https://learn.microsoft.com/en-us/azure/foundry/foundry-models/how-to/use-foundry-models-mai)
- [Microsoft — Sora 2 now available in Azure AI Foundry (oct. 2025)](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [Microsoft Learn — Sora 2 video generation overview (preview)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)

---

## 🟢 Alternatives / concurrents

### Veo 3.1 — gratuit pour tous les comptes Google (2 avril) + baisse de prix Veo 3.1 Fast (7 avril)

Annonce officielle non détaillée dans le rapport du 16 avril :

- **Veo 3.1 gratuit** sur tous les comptes Google personnels via Google Vids (10 clips/mois) et Google Flow (50 crédits IA/jour ≈ 12 vidéos/jour)
- **Baisse de prix Veo 3.1 Fast** effective depuis le 7 avril — incentive explicite pour capter le marché post-Sora
- **Veo 3.1 Lite** (model card publiée, Vertex AI) : meilleur ratio coût/qualité, text-to-video + image-to-video, 16:9 et 9:16, 720p/1080p
- Cohérence de scène : **jusqu'à 60s** en conditions optimales (vs 30–45s pour Veo 3.0)

→ **Signal pour le bot :** la pression tarifaire et la cohérence temporelle étendue renforcent Veo 3/3.1 comme meilleur plan B opérationnel pour la migration actuelle.

### Kling 3.0 — #1 ELO dans l'arène vidéo

- Score ELO **1243** → en tête du classement AI Video Arena en avril
- Jusqu'à **5 min de génération**, 4K output, $6,99/mo commercial
- Usage global hebdomadaire : **2,6 M WAU (+4 % WoW)** — migration des utilisateurs Sora visible

### Grok Imagine (xAI) — #1 Multi Image-to-Video Arena

xAI revendique la première place sur le sous-classement **Multi Image-to-Video Arena**. Nouvel entrant à surveiller pour les cas d'usage multi-références (équivalent du Reference Image Guidance de Veo 3.1).

### Runway Gen-4.5

Reste la référence "contrôle caméra + cohérence des personnages" selon les comparatifs d'avril. Cas d'usage : commercials / pub haut de gamme, pas compétitif sur le tarif social content.

**Sources :**
- [Google DeepMind — Veo 3.1 Lite model card](https://deepmind.google/models/model-cards/veo-3-1-lite/)
- [Google Blog — Build with Veo 3.1 Lite, most cost-effective video model](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-lite/)
- [MindWiredAI — Google Veo 3.1 is Now Free](https://mindwiredai.com/2026/04/09/free-google-veo-3-1-guide/)
- [Bloomberg — Kling AI, Runway, Vidu set to replace Sora](https://www.bloomberg.com/news/articles/2026-04-01/kling-ai-runway-vidu-the-ai-video-generators-set-to-replace-openai-s-sora)
- [BuildMVPFast — Best Text-to-Video AI Generators April 2026](https://www.buildmvpfast.com/articles/best-llms-2026-guide/video-generation-ai)
- [Humai — Best AI Video Editors 2026 (Runway, Pika, Kling, Veo, Sora)](https://www.humai.blog/best-ai-video-editors-2026-testing-runway-pika-kling-2-0-veo-3-sora-2/)

---

## 📌 Actions recommandées

| Priorité | Action | Délai |
|----------|--------|-------|
| 🔴 URGENT | **T-9 avant shutdown Sora app (26/04)** : vérifier qu'aucun workflow du bot n'a encore de dépendance résiduelle à l'app Sora (vs API). L'API OpenAI reste live jusqu'au 24/09/2026 | Cette semaine |
| 🔴 URGENT | Si le bot a été temporairement switché sur **Veo 3**, considérer la bascule **Veo 3.1 / Veo 3.1 Fast** : coût réduit depuis le 07/04 + cohérence 60s. Bon moment pour benchmarker sur vos prompts de prod | Cette semaine |
| 🟡 MOYEN | Côté Foundry, toujours **aucune alternative Microsoft native à Sora** (MAI-Image-2 reste image-only, roadmap vidéo non datée). Ne pas attendre un remplaçant MS — dimensionner la strat vidéo hors Foundry | Décision à prendre |
| 🟡 MOYEN | Re-vérifier le Model Catalog Foundry pour votre tenant — `sora-2` toujours gated, access application requise (Enterprise MCA-E/EA ou 1000+CU). Si critique, ouvrir un ticket support MS cette semaine | Cette semaine |
| 🟢 VEILLE | Ajouter **Grok Imagine (xAI)** à la liste des alternatives à benchmarker — #1 Multi Image-to-Video Arena, nouvel entrant sérieux | Ce mois-ci |
| 🟢 VEILLE | Surveiller **GPT Image 2** (rollout silencieux chez ChatGPT) — pourrait signaler une réorientation image-first d'OpenAI avant un éventuel retour sur la vidéo | En continu |

---

## 🔍 Rien de significatif aujourd'hui sur :

- Annonce Microsoft de migration Sora v2025-05-02 → Sora 2 : toujours **aucun chemin automatique**, situation inchangée depuis le 16/04.
- Roadmap officielle "Spud" côté OpenAI : **toujours non confirmée**.
- Runway / Pika : pas de release majeure dans les 48h.

---

*Rapport généré automatiquement le 2026-04-17. Sources datant de ≤ 7 jours sauf rappels de contexte explicitement marqués. Aucune info sensible/leak utilisée sans marquage "⚠️ non confirmé".*

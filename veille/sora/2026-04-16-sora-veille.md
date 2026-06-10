# Veille Sora / Azure AI Foundry — 2026-04-16

---

## 🔴 Nouveautés Sora-2 / OpenAI

### ⚠️ CRITIQUE — Sora app ferme dans 10 jours (26 avril 2026)

OpenAI a annoncé le 24 mars 2026 la **discontinuation complète de Sora** en deux étapes :

| Élément | Date d'arrêt |
|---------|-------------|
| Application Sora (web + mobile) | **26 avril 2026** ← dans 10 jours |
| API Sora (tous endpoints) | **24 septembre 2026** |

OpenAI recommande d'exporter les contenus avant le 26 avril.

**Raisons officielles (source TechCrunch / WSJ) :**
- Coût de calcul prohibitif par rapport à l'adoption réelle (~500 000 utilisateurs actifs)
- Réorientation stratégique vers les modèles LLM, coding et enterprise
- Concurrence de Google Veo 3 et Kling jugée trop intense sur le segment vidéo consumer
- Incident majeur : Disney avait engagé 1 milliard USD dans un partenariat Sora, apprenant l'arrêt moins d'une heure avant l'annonce publique

### État actuel de Sora 1 vs Sora 2

- **Sora 1** (`sora v2025-05-02`) : retiré aux US depuis le 13 mars 2026. Sur Azure OpenAI, ce modèle a atteint sa date de retraite le **28 février 2026**.
- **Sora 2** : officiellement lancé le 30 septembre 2025, disponible aux US et Canada (consumer). Accessible par défaut pour les utilisateurs US depuis le 13 mars 2026.

### Successeur : "Spud" (⚠️ non confirmé officiellement)

OpenAI développe un successeur interne sous le nom de code **"Spud"**, repositionné comme modèle de *world modeling* pour la robotique et l'AGI — **pas un outil de génération vidéo grand public**. Fenêtre de sortie évoquée : juillet 2026 (certaines sources avancent mi-avril 2026, non confirmé). Aucune annonce API officielle à ce jour.

**Sources :**
- [OpenAI — What to know about the Sora discontinuation](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [The Decoder — Two-stage Sora shutdown](https://the-decoder.com/openai-sets-two-stage-sora-shutdown-with-app-closing-april-2026-and-api-following-in-september/)
- [TechCrunch — Why OpenAI really shut down Sora](https://techcrunch.com/2026/03/29/why-openai-really-shut-down-sora/)
- [OpenAI — Sora 2 is here](https://openai.com/index/sora-2/)
- [OpenAI — Sora Release Notes](https://help.openai.com/en/articles/12593142-sora-release-notes)
- [The Neuron — OpenAI Kills Sora, Preps Spud](https://www.theneurondaily.com/p/sora-lasted-6-months-disney-s-1b-deal-lasted-3)

---

## 🔵 Azure AI Foundry

### Situation au 16 avril 2026

**Problème confirmé :** Le modèle Azure OpenAI Sora (`sora v2025-05-02`) a atteint sa retraite planifiée le **28 février 2026**. Il n'y a **pas de chemin de migration automatique** vers Sora 2 pour tous les tenants.

Réponse officielle de Microsoft (Anshika Varshney, Microsoft Staff) :
> *"Sora 2 (`sora-2`) availability is tenant- and region-controlled, and it's expected that some subscriptions will not yet see a successor model in the Model Catalog."*

**Issues connues post-retraite :**
- Les endpoints de téléchargement vidéo retournent HTTP 404
- La création de jobs et le polling peuvent toujours fonctionner mais la récupération des contenus échoue
- L'entrée `sora-2` n'est **pas visible dans le catalog public** pour de nombreux tenants

### Sora 2 dans Azure AI Foundry — ce qui existe

Sora 2 a été annoncé pour Azure AI Foundry en **octobre 2025** (preview), avec :
- Génération texte → vidéo, image → vidéo, vidéo → vidéo
- Audio synchronisé (langues majeures)
- Remixage de vidéos existantes (ajustements ciblés)
- Restrictions fortes : pas de contenu IP, pas de personnages réels, uniquement contenu +18 ans interdit

Disponibilité **phased rollout** uniquement, par tenant et région — pas de GA annoncé en 2026 à ce jour.

### Azure What's New — aucune entrée Sora en 2026

La page officielle [What's New Azure OpenAI (Foundry)](https://learn.microsoft.com/en-us/azure/foundry-classic/openai/whats-new) (mise à jour le 14 avril 2026) ne mentionne aucune mise à jour liée à Sora ou à la vidéo en 2026. Les annonces 2026 concernent uniquement GPT-Realtime-1.5 et GPT-Audio-1.5 (février 2026).

**Sources :**
- [Azure Blog — Sora 2 now available in Azure AI Foundry](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [Microsoft Learn — Sora 2 video generation overview (preview)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Microsoft Q&A — Sora v2025-05-02 retiring, no successor visible](https://learn.microsoft.com/en-us/answers/questions/5790204/azure-openai-sora-(model-sora-v2025-05-02)-retirin)
- [Microsoft Q&A — Sora 2 Not Available in Azure AI Foundry](https://learn.microsoft.com/en-us/answers/questions/5774829/sora-2-not-available-in-azure-ai-foundry-model-lis)
- [Azure What's New — OpenAI in Foundry](https://learn.microsoft.com/en-us/azure/foundry-classic/openai/whats-new)
- [TechCommunity — Sora 2 now available in Azure AI Foundry](https://techcommunity.microsoft.com/blog/partnernews/sora-2-now-available-in-azure-ai-foundry/4461788)

---

## 🟢 Alternatives / Concurrents

### Google Veo 3.1 (annoncé octobre 2025)

Veo 3.1, le successeur de Veo 3, est disponible en **paid preview** via Gemini API, Google AI Studio et Vertex AI. Veo 3 reste l'API principale pour les développeurs.

**Nouvelles fonctionnalités Veo 3.1 :**
- **Reference Image Guidance** : jusqu'à 3 images de référence pour la cohérence des personnages
- **Scene Extension** : prolongement de vidéos existantes avec continuité visuelle (minutes de contenu)
- **First and Last Frame Control** : génération de transition entre deux images avec audio

**Veo 3.1 Lite** (< 50% du coût de Veo 3.1 Fast) disponible pour les applications à fort volume.

**Tarification Veo 3 :** ~$0.75/s de vidéo output (Gemini API) ; $0.35–0.50/s via Vertex AI.  
**Disponibilité :** Gemini API + Vertex AI (us-central1 et régions additionnelles).

Pas de nouveauté Veo majeure dans les 48 dernières heures.

**Sources :**
- [Google Developers Blog — Introducing Veo 3.1](https://developers.googleblog.com/introducing-veo-3-1-and-new-creative-capabilities-in-the-gemini-api/)
- [Google Cloud Docs — Veo 3.1 on Vertex AI](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/models/veo/3-1-generate)
- [Google Developers Blog — Veo 3 in Gemini API](https://developers.googleblog.com/veo-3-now-available-gemini-api/)

---

## 📌 Actions recommandées

| Priorité | Action | Délai |
|----------|--------|-------|
| 🔴 URGENT | **Vérifier que le bot n'utilise plus Azure OpenAI Sora** (`sora v2025-05-02`) — ce modèle est mort depuis le 28/02/2026, les endpoints vidéo retournent 404 | Immédiat |
| 🔴 URGENT | Si le bot utilise encore l'API Sora OpenAI directe, elle fonctionne jusqu'au 24/09/2026, mais **migrer vers Veo 3 ou Veo 3.1 est recommandé maintenant** | Avant sept 2026 |
| 🟡 MOYEN | Tester l'accès à **Sora 2 dans Azure AI Foundry** pour votre tenant (aller dans Model Catalog → chercher `sora-2`). Si absent, contacter le support Microsoft pour demander l'activation | Cette semaine |
| 🟢 VEILLE | Surveiller les annonces sur **"Spud"** (successeur Sora côté OpenAI) — repositionné world model/robotique, probablement pas un remplacement direct pour la génération vidéo consumer | Juillet 2026 |
| 🟢 VEILLE | **Veo 3.1 est la référence vidéo actuelle** avec les features les plus avancées (reference images, scene extension). Confirmer que la migration Veo 3 du bot est stable | Cette semaine |

---

*Rapport généré automatiquement le 2026-04-16. Sources datant de moins de 7 jours sauf mentions contraires.*

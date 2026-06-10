# Veille Sora / Azure AI Foundry — 2026-04-14

---

## 🔴 Nouveautés Sora-2 / OpenAI

### ⚠️ ALERTE CRITIQUE : Sora v1 en fin de vie imminente

**Sora (v1) — Fermeture app : 26 avril 2026 (dans 12 jours !)**
**Sora API (v1) — Shutdown : 24 septembre 2026**

OpenAI a annoncé la discontinuation de Sora en deux étapes :
- L'interface web/app Sora ferme le **26 avril 2026**
- L'API Sora v1 sera coupée le **24 septembre 2026**

OpenAI ne remplace pas Sora par un produit grand public équivalent — les ressources sont redirigées vers les outils de coding, les produits entreprise et une "super app" unifiée. **Sora reste actif comme projet de recherche sur les world models.**

→ Source : [The Decoder — Sora Shutdown Timeline](https://the-decoder.com/openai-sets-two-stage-sora-shutdown-with-app-closing-april-2026-and-api-following-in-september/)

### Sora 2 — Disponible (mais via Azure AI Foundry uniquement)

Sora 2 est disponible en **preview publique via Azure AI Foundry**. Il n'existe pas d'accès Sora 2 via l'API OpenAI directe actuellement (la roadmap OpenAI public indique la deprecation de Sora, pas un successeur standalone).

Pas de nouveauté OpenAI majeure annoncée dans les 48 dernières heures sur Sora 2 spécifiquement.

---

## 🔵 Azure AI Foundry

### ✅ Sora 2 disponible en preview — Détails techniques confirmés

**Annoncé le 15 octobre 2025 — Documentation mise à jour le 21 mars 2026**

Sora 2 est déployable via Azure AI Foundry avec les capacités suivantes :

| Fonctionnalité | Statut |
|---|---|
| Text → Video | ✅ Supporté |
| Image → Video | ✅ Supporté |
| Video → Video (remix) | ✅ Supporté |
| Audio generation (output) | ✅ Supporté |
| Remix (édition ciblée) | ✅ Supporté |
| IP / Photorealistic content | ❌ Bloqué (RAI) |

**API** : Utilise le **v1 API Azure OpenAI**, aligné sur le schéma natif Sora 2 d'OpenAI.

**Facturation** : À la seconde ([détails pricing](https://azure.microsoft.com/pricing/details/cognitive-services/openai-service/))

**Déploiement** : Le modèle s'appelle `sora` (Sora 2) dans le catalogue Azure AI Foundry.

**Authentification recommandée** : Microsoft Entra ID (keyless), ou clé API classique.

**Catalogue modèle** : Sora 2 est disponible aux côtés de GPT-image-1, GPT-image-1-mini, Black Forest Labs Flux 1.1, et Kontext Pro.

→ Source : [Microsoft Learn — Sora 2 video generation overview (preview)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
→ Source : [TechCommunity — Sora 2 now available in Azure AI Foundry](https://techcommunity.microsoft.com/blog/partnernews/sora-2-now-available-in-azure-ai-foundry/4461788)
→ Source : [Azure Blog — Sora 2 in Azure AI Foundry](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)

---

## 🟢 Alternatives / Concurrents

### Google Veo 3.1 (octobre 2025) & Veo 3.1 Lite (mars 2026)

**Veo 3.1** — Sorti le 15 octobre 2025 via Gemini API, Google AI Studio, Vertex AI, et Flow.
Principales améliorations vs Veo 3 :
- Audio natif enrichi (conversations naturelles + effets sonores synchronisés)
- **Reference Images** : jusqu'à 3 images pour guider le style/personnage
- **Scene Extension** : prolonger des vidéos existantes
- **First & Last Frame** : générer une transition entre deux images avec audio
- Meilleure cohérence temporelle des personnages

**Veo 3.1 Lite** — Annoncé le 31 mars 2026. Modèle le plus économique de Google pour la génération vidéo. Disponible en paid preview via Gemini API et Google AI Studio. Tarification estimée : $0.05/s (720p), $0.08/s (1080p).

→ Source : [Google Developers Blog — Introducing Veo 3.1](https://developers.googleblog.com/introducing-veo-3-1-and-new-creative-capabilities-in-the-gemini-api/)
→ Source : [Google Blog — Veo 3.1 Lite](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-lite/)

---

## 📌 Actions recommandées

> **URGENT — À faire avant le 26 avril 2026 (12 jours)**

1. **Télécharger tout le contenu Sora (v1)** : L'interface web/app Sora ferme dans 12 jours. Exporter les vidéos générées si pertinent.

2. **Migrer le bot vers Sora 2 sur Azure AI Foundry** :
   - Sora 2 est disponible en preview, avec l'API v1 Azure OpenAI
   - Le modèle à déployer s'appelle `sora` dans le catalogue Foundry
   - L'API est compatible avec le schéma natif Sora 2
   - **Cette migration est prioritaire** car l'API Sora v1 s'arrête le 24 septembre 2026
   - Tester les nouvelles capacités : audio auto-généré, remix de vidéos

3. **Évaluer Veo 3.1 Lite comme fallback** : Tarification plus agressive ($0.05-0.08/s), audio natif, disponible sur Vertex AI. Pourrait compléter ou remplacer selon les cas d'usage.

4. **Surveiller le pricing Sora 2 sur Azure** : Le pricing à la seconde est en place mais les détails précis nécessitent une consultation de la page Azure pricing directement.

---

## Sources

- [Microsoft Learn — Sora 2 video generation overview (preview)](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation) *(mis à jour 21 mars 2026)*
- [TechCommunity — Sora 2 now available in Azure AI Foundry](https://techcommunity.microsoft.com/blog/partnernews/sora-2-now-available-in-azure-ai-foundry/4461788)
- [Azure Blog — Sora 2 in Azure AI Foundry](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [OpenAI Help — Sora Discontinuation](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [The Decoder — OpenAI two-stage Sora shutdown](https://the-decoder.com/openai-sets-two-stage-sora-shutdown-with-app-closing-april-2026-and-api-following-in-september/)
- [Google Developers Blog — Veo 3.1](https://developers.googleblog.com/introducing-veo-3-1-and-new-creative-capabilities-in-the-gemini-api/)
- [Google Blog — Veo 3.1 Lite](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-lite/)
- [AI Model Catalog — Sora 2](https://ai.azure.com/catalog/models/sora-2)

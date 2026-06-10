# Veille Sora-2 / Microsoft Foundry / Concurrents — 2026-06-03

**Date :** mercredi 3 juin 2026 — **J+1 retirement Foundry / J+1 Build keynote**
**Fenêtre couverte :** 02/06 ~07h UTC → 03/06 ~matin (~24h, **après** retirement Sora-2 19h local + keynote Build du 02/06)
**Contexte bot :** Sora-2 Microsoft Foundry **désormais retiré** (410 Gone depuis 19h00 local tenant le 02/06). Fallback **Veo 3.1 Lite (Vertex AI)** en place et opérationnel.

---

## 🔴 Nouveautés Sora-2 / OpenAI

### Sora-2 — retirement Foundry effectif, API directe OpenAI inchangée

- **API OpenAI directe `sora-2` / `sora-2-pro`** : toujours opérationnelle. Retirement programmé **24 septembre 2026** (inchangé). C'est la voie de repli "Sora" qui reste techniquement disponible jusqu'en septembre.
- **Sora app/web** : OFF depuis le 26 avril 2026 (rappel).
- Sources : [Sora 2 Model — OpenAI API docs](https://developers.openai.com/api/docs/models/sora-2), [What to know about the Sora discontinuation — OpenAI](https://openai.com/sora/), [Sora-2 API shutdown 24 septembre — Apiyi](https://help.apiyi.com/en/sora-2-api-shutdown-alternatives-2026-en.html).

### 🆕 Successeur OpenAI « Spud » — à surveiller de près ⚠️ (sources majoritairement secondaires)

- Plusieurs articles consolident l'existence d'un modèle next-gen OpenAI nommé **« Spud »**, présenté comme la suite de la division Sora. **Bill Peebles** (head Sora) : l'équipe se recentre sur *« des systèmes qui comprennent profondément le monde en apprenant à simuler des environnements arbitraires en haute fidélité »*. **Sam Altman** aurait évoqué *« un modèle très puissant d'ici quelques semaines »*.
- **Point clé pour notre cas d'usage** : le récit dominant oriente Spud vers la **simulation du monde physique / robotique**, *pas* vers une app vidéo grand public. Donc **probablement pas un remplaçant "drop-in" pour la génération vidéo** du bot. Signaux contradictoires selon les sources (certaines le qualifient de « remplaçant direct de Sora », d'autres décrivent un pivot hors vidéo consumer).
- ⚠️ **Non confirmé par communication officielle OpenAI** : repris par blogs/médias secondaires (The Neuron, Quasa, Xpert.digital, DigitalToday). À traiter comme rumeur structurée tant qu'OpenAI ne publie pas.
- Sources : [OpenAI Kills Sora, Preps Spud Model — The Neuron](https://www.theneurondaily.com/p/sora-lasted-6-months-disney-s-1b-deal-lasted-3), [OpenAI all-in on AGI, mystery Spud — Quasa](https://quasa.io/media/openai-is-going-all-in-on-agi-safety-demoted-sora-killed-and-a-mystery-spud-model), [The end of Sora — "Spud" is coming — Xpert.digital](https://xpert.digital/en/the-end-of-the-video-ki-sora/), [OpenAI completes Spud training — DigitalToday](https://www.digitaltoday.co.kr/en/view/43075/openai-ends-sora-video-ai-service-completes-training-of-next-generation-spud-model).

---

## 🔵 Microsoft Foundry — **post-Build 2026 : aucun modèle vidéo first-party**

### Retirement Sora-2 effectif — Foundry sans génération vidéo first-party

- **Sora-2 retiré du tenant le 02/06 à 19h00 local**, conformément à la lifecycle policy (`410 Gone` sur `sora-2`, `sora-2-pro`, snapshots). Aucune extension MS publiée.
- Conflit de dates portail Azure (02/06) vs OpenAI direct (24/09) **entériné par les faits** : sur Foundry, c'est terminé.
- Sources : [Foundry Models lifecycle and support policy](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements), [Sora 2 retirement Q&A](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too).

### Build 2026 — récap Foundry officiel : **🚨 toujours rien en vidéo**

- **Source primaire confirmée** : [What's new in Microsoft Foundry | Build Edition](https://devblogs.microsoft.com/foundry/whats-new-in-microsoft-foundry-build-2026/) (publié 02/06 17:00 UTC). Les **4 nouveaux modèles MAI first-party** en preview couvrent explicitement **« les quatre modalités génératives centrales : texte, image, transcription, voix »** :
  - **MAI-Thinking-1** (LLM raisonnement) · **MAI-Image-2.5** (image + édition image-to-image) · **MAI-Transcribe-2** (STT, diarisation) · **MAI-Voice-2** (TTS multilingue, clonage voix).
  - **🚨 AUCUN modèle vidéo (« MAI-Video ») annoncé.** Confirmé par source primaire MS : MS s'engage sur texte/image/STT/TTS mais **abandonne de facto la vidéo first-party** au moment même du retirement Sora-2.
- **Reste du Build côté Foundry** (agents, pas vidéo) : Hosted agents (GA prévue ~début juillet 2026), Toolboxes (preview), Voice Live (GA prompt agents), Memory procédurale (preview), Foundry IQ + **Web IQ** (web grounding <200 ms — *inclut résultats "video" en sortie de recherche, mais ce n'est PAS de la génération vidéo*), Fireworks AI on Foundry (GA), Frontier Tuning.
- Autres annonces Build (contexte) : 7 modèles MAI au total, **Project Solara** (plateforme agent-first Android, badges/hubs), Surface RTX Spark Dev Box, GitHub Copilot desktop app, Microsoft IQ.
- Sources : [Foundry Build Edition recap (primaire)](https://devblogs.microsoft.com/foundry/whats-new-in-microsoft-foundry-build-2026/), [Biggest Build 2026 announcements — Tom's Guide](https://www.tomsguide.com/news/live/microsoft-build-2026), [MAI-Thinking-1 first in-house reasoning model — TechTimes](https://www.techtimes.com/articles/317631/20260602/microsoft-build-2026-mai-thinking-1-first-house-reasoning-model-trained-without-openai-data.htm), [Everything announced at Build 2026 — The Neuron](https://www.theneuron.ai/explainer-articles/everything-microsoft-announced-at-microsoft-build-2026-explained/).

**Conclusion Foundry :** après le retirement Sora-2 et le keynote Build, **Foundry n'offre plus aucune option de génération vidéo first-party native**. Pas de remplaçant annoncé, pas de roadmap vidéo communiquée.

---

## 🟢 Alternatives / Concurrents

### Veo 3.1 / Veo 4 — pas de news (statu quo)

- **Veo 3.1 Lite (Vertex AI / Gemini API)** : choix actuel du bot, production-ready, ~50 % moins cher que la version Fast. Statut inchangé.
- **Veo 4** : **toujours pas de confirmation officielle Google** au 03/06. Google I/O 2026 (mai) n'a pas livré Veo 4 ; les articles "Veo 4" restent **spéculatifs**.
- Sources : [Veo 3.1 in Gemini API](https://ai.google.dev/gemini-api/docs/video), [Veo 3.1 Lite — Google blog](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-lite/), [Veo 4 — what we know (spéculatif)](https://vexub.com/blog/veo-4-release-what-we-know).

### Runway / Kling / Pika — pas de news majeure 02/06-03/06

- Pas de release notes notable sur la fenêtre. **Runway Gen-4.5 expose toujours Sora-2 Pro en API** → plan de repli "passerelle Sora-2 Pro via Runway" valide jusqu'au 24/09 si besoin.

---

## 📌 Actions recommandées

1. **✅ PRIORITÉ 1 — Confirmer Veo 3.1 Lite à 100 % en prod.** Le retirement Foundry est effectif depuis hier 19h : vérifier qu'aucun appel résiduel ne tape encore l'endpoint `sora-2` Foundry (sinon → erreurs `410`). Contrôler quotas Vertex AI, monitoring et alertes erreurs API.
2. **🔭 Surveiller « Spud » (OpenAI).** Si Altman tient l'échéance "quelques semaines", un nouveau modèle OpenAI arrive en juin. Mais orientation probable = simulation monde physique/robotique, **pas** vidéo consumer. **Ne pas planifier de migration dessus** tant qu'OpenAI ne publie pas une page officielle + API vidéo.
3. **🟦 Acter que Foundry n'a plus de vidéo first-party.** Pour rester sur l'écosystème Azure, la seule passerelle "Sora" restante est l'**API OpenAI directe** (jusqu'au 24/09) ou une intégration tierce — pas Foundry. Pérenniser plutôt la stack Veo/Vertex.
4. **🔁 Garder le plan C** : Sora-2 Pro via Runway Gen-4.5 (API) reste un repli ponctuel jusqu'au 24/09.

---

## Sources (consolidées)

- [Foundry — What's new | Build Edition (primaire)](https://devblogs.microsoft.com/foundry/whats-new-in-microsoft-foundry-build-2026/)
- [Foundry Models lifecycle / retirement policy](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)
- [Sora 2 retirement Q&A — Microsoft Learn](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)
- [Sora 2 Model — OpenAI API docs](https://developers.openai.com/api/docs/models/sora-2)
- [Sora discontinuation — OpenAI](https://openai.com/sora/)
- [OpenAI Kills Sora, Preps Spud — The Neuron](https://www.theneurondaily.com/p/sora-lasted-6-months-disney-s-1b-deal-lasted-3) ⚠️
- [Biggest Build 2026 announcements — Tom's Guide](https://www.tomsguide.com/news/live/microsoft-build-2026)
- [MAI-Thinking-1 — TechTimes](https://www.techtimes.com/articles/317631/20260602/microsoft-build-2026-mai-thinking-1-first-house-reasoning-model-trained-without-openai-data.htm)
- [Everything announced at Build 2026 — The Neuron](https://www.theneuron.ai/explainer-articles/everything-microsoft-announced-at-microsoft-build-2026-explained/)
- [Veo 3.1 — Gemini API](https://ai.google.dev/gemini-api/docs/video)
- [Veo 3.1 Lite — Google blog](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-lite/)

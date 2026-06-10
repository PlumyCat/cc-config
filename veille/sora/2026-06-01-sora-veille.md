# Veille Sora-2 / Microsoft Foundry / Concurrents — 2026-06-01

**Date :** lundi 1er juin 2026
**Fenêtre couverte :** 31/05 ~08h UTC → 01/06 ~14h UTC (~30h)
**Contexte bot :** Sora-2 sur Microsoft Foundry → retirement **demain 2 juin 2026, 19h00 local tenant (T-1)**. Fallback Veo 3.1 Lite (Vertex AI) en cours de finalisation.

---

## 🔴 Nouveautés Sora-2 / OpenAI

### Statut Sora-2 — pas de changement, T-1

- **Sora-2 API OpenAI direct** : opérationnelle, retirement programmé **24 septembre 2026**. Inchangé. Tous endpoints (`sora-2`, `sora-2-pro`, snapshots) retournent encore 200 OK ce matin.
- **Aucune communication OpenAI sur la fenêtre 31/05-01/06** concernant Sora, un successeur vidéo, ou une réaction au retirement Foundry de demain.
- **OpenAI Newsroom dernières mises à jour** (15-29 mai) : finance/ChatGPT, content provenance (SynthID), Codex/Dell enterprise, Codex sur Windows. **Aucune mention vidéo**.
- **Quiet period IPO** confirmée — OpenAI prépare un listing public fin 2026 (regulatory filing récent), ce qui plafonne les annonces produit majeures.
- Sources : [OpenAI News](https://openai.com/news/), [OpenAI Newsroom — Company announcements](https://openai.com/news/company-announcements/), [OpenAI Eyes Late 2026 Public Listing — OpenPR](https://www.openpr.com/news/4532681/openai-eyes-a-late-2026-public-listing-after-a-regulatory-filing), [Sora API still works until September — Pixo](https://pixo.video/blog/sora-api-still-available).

### Rappel — Sora discontinuation timeline

- Sora app/web : OFF depuis le 26 avril 2026.
- API Sora-2 / Sora-2 Pro / snapshots : OFF le **24 septembre 2026** (410 Gone).
- Pas de successeur vidéo OpenAI annoncé. Hypothèse "Spud = Sora successor" reste **fausse** (Spud = GPT-5.5 texte, voir rapport 31/05).

---

## 🔵 Microsoft Foundry — T-1 avant retirement

### Sora-2 retirement Foundry — confirmé, **pas d'extension**, T-1

- **Position MS inchangée**. Aucune communication officielle de prolongation publiée sur la fenêtre 31/05-01/06.
- **Q&A Microsoft Learn** : statut quo. Dernière update modérateur 14/05, aucune réponse nouvelle depuis. La règle reste : *"retirement dates are not extendable, any change would have to come from the product team and be reflected in the official Model Retirement Schedule"*.
- **AI Model Catalog Foundry** : Sora-2 toujours listé comme **seul** modèle vidéo first-party MS Foundry. Aucun remplaçant publié.
- **Échéance ferme** : 2 juin 2026, 19h00 local tenant time. Après, requêtes inference → **HTTP 410 Gone**.
- **Conflit Azure portal (June 2) vs OpenAI direct (Sept 24)** toujours non résolu — sera tranché demain par les faits.
- Sources : [Foundry Models lifecycle and support policy](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements), [Sora 2 retirement Q&A](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too), [Azure OpenAI prematurely cutting off Sora 2 — OpenAI Community](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475), [AI Model Catalog | Microsoft Foundry — Sora 2](https://ai.azure.com/catalog/models/sora-2).

### Microsoft Build 2026 — **demain**, T-1

- **Keynote Day 1** confirmé : mardi 2 juin, **9h30 PT / 18h30 Paris**. Satya Nadella + Scott Guthrie (EVP Cloud + AI) + Scott Hanselman (VP) + Kyle Daigle (COO GitHub). Livestream gratuit sur build.microsoft.com + YouTube.
- **Session catalog en ligne** : 7 tracks confirmés (Agents & Apps, Azure AI Platform / Foundry, GitHub & dev productivity, Fabric, Responsible AI, Windows, Working with Models).
- **Annonces MAI Build 2026 confirmées par leaks** : **MAI-Image-2.5**, **MAI-Voice-2**, **MAI-Transcribe-1.5**. **AUCUN MAI-Video** dans la lineup confirmée. Signal négatif fort pour notre cas d'usage.
- **⚠️ Toujours aucune session vidéo explicite** dans le catalogue Build à T-1. Probabilité d'une annonce vidéo first-party Day 1 = **faible**, mais le timing (jour exact du retirement Sora-2) entretient une hypothèse outsider.
- Sources : [Microsoft Build 2026 Session Catalog — Thurrott](https://www.thurrott.com/microsoft/334704/microsofts-build-2026-session-catalog-is-now-live), [Microsoft Build 2026 keynote preview — Notebookcheck](https://www.notebookcheck.net/Microsoft-Build-2026-What-to-expect-from-the-June-2-keynote.1311546.0.html), [Build 2026 attendee guide — Lensmor](https://www.lensmor.com/event-guides/microsoft-build-2026-attendee-guide), [Build 2026: MAI-Image 2.5, MAI-Voice 2, MAI-Transcribe 1.5 — Windows Forum](https://windowsforum.com/threads/microsoft-build-2026-mai-image-2-5-mai-voice-2-and-mai-transcribe-1-5.420924/).

### Project Polaris — **nouveau signal stratégique**, ⚠️ non confirmé officiellement

- **Source unique** : article de "recap" Build 2026 publié par ChatForest **avant l'événement** (probable preview/leak). À traiter comme **non confirmé** jusqu'au keynote Day 1.
- **Contenu du leak** : Microsoft annoncerait **Project Polaris**, modèle coding MoE first-party, remplaçant GPT-4 Turbo comme reasoning engine par défaut de GitHub Copilot **à partir d'août 2026**. Migration auto + fallback GPT-4 3 mois. Tourne sur accélérateurs Maia in-house.
- **Impact veille** : si confirmé, c'est un **signal fort de désengagement MS vs OpenAI** sur les workloads stratégiques (Copilot = produit phare). Renforce **l'hypothèse théorique** d'un futur "Project Polaris Vidéo" à terme, mais **aucun signal explicite vidéo** dans cette annonce.
- **À surveiller demain** : si Polaris est confirmé pour le coding, c'est un précédent qui clarifie la trajectoire MS — réduire la dépendance OpenAI. Pour vidéo, on resterait en revanche orphelin first-party à court terme.
- Source : [Microsoft Build 2026 Recap (preview leak) — ChatForest](https://chatforest.com/builders-log/microsoft-build-2026-recap-windows-agent-platform-project-polaris-copilot-workspace/) ⚠️ non confirmé.

---

## 🟢 Alternatives / Concurrents

### Veo 3.1 / Veo 4 — pas de news

- **Veo 3.1 Lite (Vertex AI)** : choix actuel du bot. Statut production-ready inchangé.
- **Veo 3.1 + upscaling** : capability upscaling 1080p → 4K sur Vertex AI rappelée (release historique, pas une news). Utile si besoin d'enrichir la chaîne de prod côté Veo.
- **Veo 4** : **toujours pas de confirmation officielle Google**. Articles spéculatifs continuent (Vexub, Imagine.art, Concept Phones) mais zéro page Vertex AI / Gemini API officielle. Statu quo.
- Sources : [Veo 3.1 Lite + upscaling — Google Cloud Blog](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai), [Vertex AI release notes](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes), [VEO 4 Release Date 2026 — Vexub](https://vexub.com/blog/veo-4-release-what-we-know).

### Runway / Kling / Pika — pas de news majeure 31/05-01/06

- Pas de release notes Runway / Kling / Pika sur la fenêtre. Statut inchangé vs hier.
- **Runway Gen-4.5 expose Sora-2 Pro en API** : plan C "passerelle Sora-2 Pro via Runway" reste valide après le 2 juin si besoin.

---

## 📌 Actions recommandées

1. **🔴 PRIORITÉ 1 — Bascule Veo 3.1 Lite FINALISÉE aujourd'hui EOD.** T-1. Dernière fenêtre. Checklist : quotas Vertex AI validés, monitoring prod actif, alertes erreurs API, prompts de référence rejoués, fallback secondaire (OpenAI direct) configuré et testé.
2. **🔴 PRIORITÉ 2 — Service Health Azure alerts** : confirmer que les alertes sont **actives** sur le deployment Sora-2 v2025-10-06 avant 19h00 demain. Filter "Azure OpenAI Service" + email/SMS.
3. **🔴 PRIORITÉ 3 — Build 2026 keynote LIVE demain 18h30 Paris** : monitorer en direct pour : (a) annonce vidéo first-party MS (peu probable, mais timing étrange), (b) extension Sora-2 surprise (très peu probable mais à surveiller), (c) confirmation Project Polaris (forte probabilité, signal stratégique long terme), (d) Foundry GA + nouvelles capacités multi-modèles. Préparer un capture-note.
4. **🟡 PRIORITÉ 4 — Plan B "API Sora-2 directe OpenAI" en standby technique** : clé + endpoint + 1 prompt test → valider une dernière fois avant 19h demain. Disponible jusqu'au **24 septembre 2026**.
5. **🟡 PRIORITÉ 5 — Communication interne / utilisateurs bot** : préparer un message court "bascule vidéo Sora→Veo le 2 juin, qualité comparable, prompts inchangés" à publier mardi matin.
6. **🟢 PRIORITÉ 6 — Multi-fournisseurs backup** : Kling 3.0 et Runway Gen-4.5 prêts (clés API, prompts de référence) au cas où Veo 3.1 Lite subit panne/quota après le 2 juin.
7. **🟢 PRIORITÉ 7 — Documenter la décision finale** : Veo 3.1 Lite primary post-2 juin. Rationale + comparatif coûts + plan de migration si MS annonce un remplaçant à Build (Day 1 ou Day 2).
8. **🟢 PRIORITÉ 8 — Tracking Project Polaris** : créer une note de veille séparée. Si confirmé demain → signal stratégique long terme, à intégrer dans la roadmap de fournisseur vidéo (anticipation d'un Polaris-Video à 6-12 mois ?).

---

## Sources

### OpenAI / Sora
- [OpenAI News](https://openai.com/news/)
- [OpenAI Newsroom — Company announcements](https://openai.com/news/company-announcements/)
- [OpenAI API Deprecations](https://developers.openai.com/api/docs/deprecations)
- [ChatGPT Release Notes — OpenAI Help Center](https://help.openai.com/en/articles/6825453-chatgpt-release-notes)
- [Sora discontinuation — OpenAI Help Center](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [Sora's App Is Dead, But the API Still Works Until September — Pixo](https://pixo.video/blog/sora-api-still-available)
- [Is the Sora2 API still working? — OpenAI Dev Community](https://community.openai.com/t/is-the-sora2-api-still-working/1379946)
- [OpenAI Eyes a Late 2026 Public Listing — OpenPR](https://www.openpr.com/news/4532681/openai-eyes-a-late-2026-public-listing-after-a-regulatory-filing)
- [Sora 2 Release Date & 7 Best 2026 Alternatives — Digen](https://resource.digen.ai/sora-2-openai-shutdown-guide-2026/)
- [OpenAI Shuts Down Sora App: What the Future Holds — AIPure](https://aipure.ai/articles/openai-shuts-down-sora-app-what-the-future-holds-for-ai-video-generation-in-2026)

### Microsoft Foundry / Azure / Build 2026
- [Foundry Models lifecycle and support policy](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)
- [Model retirement schedule — Microsoft Foundry](https://learn.microsoft.com/en-us/azure/ai-foundry/concepts/model-lifecycle-retirement?view=foundry-classic)
- [Azure AI Foundry Sora 2 retirement date — Microsoft Q&A](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)
- [Azure OpenAI is prematurely cutting off Sora 2 — OpenAI Dev Community](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475)
- [AI Model Catalog | Microsoft Foundry — Sora 2](https://ai.azure.com/catalog/models/sora-2)
- [What's new in Microsoft Foundry | May 2026](https://devblogs.microsoft.com/foundry/whats-new-in-microsoft-foundry-may-2026/)
- [Microsoft Build 2026 Session Catalog — Thurrott](https://www.thurrott.com/microsoft/334704/microsofts-build-2026-session-catalog-is-now-live)
- [Microsoft Build 2026 keynote preview — Notebookcheck](https://www.notebookcheck.net/Microsoft-Build-2026-What-to-expect-from-the-June-2-keynote.1311546.0.html)
- [Build 2026 attendee guide — Lensmor](https://www.lensmor.com/event-guides/microsoft-build-2026-attendee-guide)
- [Build 2026: MAI-Image 2.5, MAI-Voice 2, MAI-Transcribe 1.5 — Windows Forum](https://windowsforum.com/threads/microsoft-build-2026-mai-image-2-5-mai-voice-2-and-mai-transcribe-1-5.420924/)
- [Microsoft Build 2026 Preview — Tom's Guide](https://www.tomsguide.com/computing/microsoft-build-2026-preview)
- [Microsoft Build 2026 Recap (preview leak) — ChatForest](https://chatforest.com/builders-log/microsoft-build-2026-recap-windows-agent-platform-project-polaris-copilot-workspace/) ⚠️ non confirmé
- [Microsoft readies new MAI voice and image models for Build 2026 — TestingCatalog](https://www.testingcatalog.com/microsoft-readies-new-mai-voice-and-image-models-for-build-2026/)

### Veo / Google DeepMind
- [Veo 3.1 — Google DeepMind](https://deepmind.google/models/veo/)
- [Veo 3.1 Lite + upscaling — Google Cloud Blog](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)
- [Vertex AI release notes](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/release-notes)
- [VEO 4 Release Date 2026 — Vexub](https://vexub.com/blog/veo-4-release-what-we-know)
- [Veo 4 Updates — Imagine.art](https://www.imagine.art/blogs/google-veo-4-updates)

### Concurrents / Benchmarks
- [Best AI Video Models 2026 — UlazAI](https://ulazai.com/ai-video-models-guide-2025/)
- [Runway AI Release Notes May 2026 — Releasebot](https://releasebot.io/updates/runwayai)

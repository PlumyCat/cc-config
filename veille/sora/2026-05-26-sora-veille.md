# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-05-26

**Date :** mardi 26 mai 2026
**Fenêtre couverte :** 25/05 ~07h UTC → 26/05 ~08h UTC (~24h)
**Contexte bot :** Sora-2 sur Azure AI Foundry → retirement **2 juin 2026 (T-7 jours)**. Fallback actuel : Veo 3.1 Lite (Vertex AI).

---

## 🔴 Nouveautés Sora-2 / OpenAI

### Statut Sora-2 — strict statu quo, T-7 avant retirement Foundry

- **Sora-2 API OpenAI direct** : opérationnelle jusqu'au **24 septembre 2026**. Aucun changement.
- **Sora app/web** : discontinuée depuis le 26 avril 2026 (rappel).
- **Aucune annonce de successeur vidéo OpenAI** sur la fenêtre 25-26 mai. Le silence radio se prolonge.

### Activité OpenAI 25-26 mai

- **Aucune annonce vidéo** dans le changelog API OpenAI ([`platform.openai.com/docs/changelog`](https://platform.openai.com/docs/changelog)) sur la fenêtre. Pas de mention Sora-2 ni de successeur.
- **OpenAI News** ([`openai.com/news/`](https://openai.com/news/)) : la dernière annonce publique recensée reste celle du 22 mai sur la conjecture de géométrie discrète résolue par un modèle interne, puis 20 mai (provenance/SynthID avec Google). Rien sur vidéo.
- **Quiet period S-1** : l'IPO confidentielle déposée le 22 mai continue de plomber la communication produit. Pas attendre d'annonce majeure avant fin mai / début juin.

### Pas de nouveauté significative côté narratif marché

Pas de nouveau "rebondissement" sur le récit "Sora est mort" — les analyses publiées les jours précédents (cyberlink, ai.cc, glbgpt, kaopiz, digen.ai) restent le corpus de référence. Aucun nouvel article majeur sur la fenêtre 25-26 mai.

---

## 🔵 Azure AI Foundry

### Retirement Sora-2 v2025-10-06 — toujours bloqué au 2 juin, T-7

- **Aucune extension annoncée** sur la fenêtre 25-26 mai. La position MS est désormais **officiellement écrite** par un modérateur Microsoft External Staff dans le thread Q&A ([`learn.microsoft.com/en-in/answers/questions/5881436`](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)) :
  > *"After checking internally, the retirement timeline currently shown in Azure AI Foundry for the deployed Sora 2 model version remains the effective and enforced lifecycle date for that deployment. At this time, we do not have the ability to extend or override the retirement window for that specific model version beyond the published retirement date shown in the portal."* — Karnam Venkata Rajeswari (Moderator, MS External Staff), 13 mai 2026.

  Le dernier follow-up du modérateur (14 mai, "checking in") n'a reçu aucune réponse depuis le client. **Pas de mise à jour du thread sur les 48h glissantes** — la position MS reste figée sur "non-extendable".

- Doc lifecycle ([learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)) confirme : "**These dates are not extendable; exceptions are not granted**". Page mise à jour le **24 avril 2026** — pas de modif récente.
- Le fil [community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475) toujours sans escalade.
- **Aucun signal d'extension publié sur les dernières 24h.**

**Implications bot** : la fenêtre de migration **se referme à T-7**. Avec la position MS désormais formellement énoncée par écrit ("we do not have the ability to extend"), espérer une extension *in extremis* via Build serait au mieux optimiste. Le bot **doit** être basculé sur Veo 3.1 (Vertex AI) avant le 2 juin 19h00 local time du tenant Azure.

### Pas de modèle vidéo first-party Foundry annoncé

- Rappel : le digest **"What's New in Microsoft Foundry Labs – May 2026"** ([techcommunity.microsoft.com/blog/azure-ai-foundry-blog/whats-new-in-microsoft-foundry-labs-may-2026/4520310](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/whats-new-in-microsoft-foundry-labs-%E2%80%93-may-2026/4520310)) reste centré sur SocialReasoning-Bench, MagenticBrain, MAI-Image-2-Efficient, EO/OS Object Detection — **rien sur vidéo**.
- **MAI-Image-2** (Microsoft) toujours text-to-image only.
- Veo de Google **toujours absent du catalogue Foundry**.
- **Foundry restera donc sans capacité vidéo à partir du 2 juin** jusqu'à nouvelle annonce.

### Doc Foundry — état des release notes

- `learn.microsoft.com/en-us/azure/ai-services/openai/whats-new` : pas de nouvelle annonce vidéo sur 25-26 mai.
- Page Sora-2 ([learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)) inchangée.
- Page catalogue Foundry Sora-2 ([ai.azure.com/catalog/models/sora-2](https://ai.azure.com/catalog/models/sora-2)) : modèle toujours marqué en preview, gated access pour MCA-E/EA et 1000+CU.

### Build 2026 — T-7 jours, J-J

- **Microsoft Build : 2-3 juin 2026** à Fort Mason Center, San Francisco. **Day 1 = jour exact du retirement Sora-2 Foundry**.
- Sessions Foundry au catalogue : **LTG419** + **Lab532** (rappel). **Aucune session vidéo explicite ajoutée** entre 25 et 26 mai.
- Tracks Day 2 inchangés : "AI Production", "Agentic Systems", "Cost & Efficiency". Pas de track vidéo dédié.
- **Microsoft Build 2026 AI Startup Cohort** confirmé : focus Agents / Governance / Observability / Data — **pas vidéo**. Source : [windowsnews.ai/article/microsoft-build-2026-ai-startup-cohort](https://windowsnews.ai/article/microsoft-build-2026-ai-startup-cohort-agents-governance-observability-data.419425).
- **Hypothèse forte (inchangée)** : si MS avait prévu une extension Sora-2 ou un remplaçant vidéo first-party, l'annonce tomberait au keynote Day 1 (2 juin). La concomitance avec le retirement n'est probablement pas un hasard. Mais à T-7, **aucun teaser vidéo n'a fuité** dans les sessions Build publiques.

---

## 🟢 Alternatives / Concurrents

### Veo 3.1 — stabilisation, pas de nouveauté 25-26 mai

- Aucune nouvelle update Veo 3.1 entre le 25 et le 26 mai.
- Les ajouts du 20 mai (Vertical 9:16 natif, Upscaling 1080p/4K, audio sur "Ingredients to Video"/"Frames to Video"/"Extend") restent en cours de déploiement progressif sur Vertex AI.

**Statut famille Veo 3.1 sur Vertex AI (rappel)** :

| Tier | Statut | Use case bot |
|------|--------|--------------|
| **Veo 3.1** | Paid preview Gemini API + Vertex AI | Qualité max, audio natif |
| **Veo 3.1 Fast** | Paid preview | Latence réduite, qualité ~équiv |
| **Veo 3.1 Lite** | Public preview Vertex AI (depuis 31/03) | **Choix actuel du bot** — coût < 50% Fast |
| **Veo Upscaling** | Private preview (public soon) sur Vertex AI | 1080p / 4K standalone, post-pipeline |

Sources : [cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai), [developers.googleblog.com/introducing-veo-3-1-and-new-creative-capabilities-in-the-gemini-api/](https://developers.googleblog.com/introducing-veo-3-1-and-new-creative-capabilities-in-the-gemini-api/).

### Veo 4 — toujours pas d'annonce officielle

- Pas d'annonce Veo 4 entre le 25 et le 26 mai. ⚠️ Speculation : les analystes maintiennent "courant 2026" mais sans calendrier officiel.
- Rappel I/O 2026 (19/05) : Google a privilégié **Gemini Omni Flash** (premier modèle famille Omni), pas Veo 4.
- Teasers DeepMind du 28-30 mars 2026 **toujours sans suite officielle**.

### Autres alternatives — pas de news majeure 25-26 mai

- **Kling 3.0** (sorti 5/02/26) : pas d'update. Native 4K, storyboard, lipsync — reste pertinent pour le multi-fournisseurs.
- **Runway Gen-4.5** : disponible API. Reste recommandé pour workflows multi-shot pro.
- **Top leaderboard Artificial Analysis** (rappel mai 26) : **Seedance 2.0** (ByteDance) et **HappyHorse-1.0** (Alibaba ATH) occupent le top 2 ; cluster **Kling 3.0 / Veo 3.1** suit. Runway Gen-4.5 hors top 10. Source : [bloomberg.com — Kling AI, Runway, Vidu](https://www.bloomberg.com/news/articles/2026-04-01/kling-ai-runway-vidu-the-ai-video-generators-set-to-replace-openai-s-sora).
- **Pika, Vidu, Synthesia, HeyGen** : pas de news significative.

---

## 📌 Actions recommandées

1. **🔴 PRIORITÉ 1 — Verrouiller la bascule Veo 3.1 sur le bot avant le 2 juin** (T-7 jours). Confirmation : MS a écrit noir sur blanc le 13/05 qu'il n'y aurait pas d'extension. Tester end-to-end aujourd'hui ou demain avec un set de prompts représentatifs.
2. **🔴 PRIORITÉ 2 — Activer Service Health alerts Azure** sur la deployment Sora-2 v2025-10-06 (si pas déjà fait) pour capter toute extension *in extremis* à Build. Doc : [learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements). Set up filter `Azure OpenAI Service` (pas de service "Microsoft Foundry" séparé).
3. **🟡 PRIORITÉ 3 — Watch Build 2026 keynote Day 1 (2 juin)**. Surveiller (a) extension Sora-2, (b) modèle vidéo first-party MS, (c) intégration Veo Foundry. À T-7, aucun teaser vidéo n'a leaké → probabilité d'annonce vidéo plutôt faible mais non nulle.
4. **🟡 PRIORITÉ 4 — Watcher la transition Veo Upscaling en public preview** sur Vertex AI. Quand ça passe public, possibilité de supprimer le post-pipeline upscaling custom du bot.
5. **🟢 PRIORITÉ 5 — Préparer un plan de contingence multi-fournisseurs**. Si Veo 3.1 Lite subit panne/quota, avoir Kling 3.0 ou Runway prêts en backup (clés API, prompts adaptés).
6. **🟢 PRIORITÉ 6 — Documenter en interne la décision finale** (Veo 3.1 Lite comme primary post-2 juin) avec rationale, coûts comparés et plan de migration éventuel si MS annonce un remplaçant Sora-2 à Build.

---

## Sources

### OpenAI / Sora
- [Sora 2 is here | OpenAI](https://openai.com/index/sora-2/)
- [What to know about the Sora discontinuation | OpenAI Help Center](https://help.openai.com/en/articles/20001152-what-to-know-about-the-sora-discontinuation)
- [Sora 2 System Card | OpenAI](https://openai.com/index/sora-2-system-card/)
- [OpenAI News](https://openai.com/news/)
- [OpenAI API Changelog](https://platform.openai.com/docs/changelog)
- [Is the Sora2 API still working? — OpenAI Developer Community](https://community.openai.com/t/is-the-sora2-api-still-working/1379946)
- [Sora-2 API shutdown date announced: termination on September 24 — Apiyi.com](https://help.apiyi.com/en/sora-2-api-shutdown-alternatives-2026-en.html)

### Azure AI Foundry
- [Sora 2 in Azure AI Foundry: Create videos with responsible AI](https://azure.microsoft.com/en-us/blog/sora-2-now-available-in-azure-ai-foundry/)
- [Sora 2 video generation overview (preview) — Microsoft Foundry](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)
- [Foundry Models lifecycle and support policy](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements)
- [Azure AI Foundry Sora 2 retirement date — Microsoft Q&A](https://learn.microsoft.com/en-in/answers/questions/5881436/azure-ai-foundry-sora-2-retirement-date-feels-too)
- [Azure OpenAI is prematurely cutting off support for Sora 2 too early — OpenAI Dev Community](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475)
- [AI Model Catalog | Microsoft Foundry — Sora 2](https://ai.azure.com/catalog/models/sora-2)
- [What's New in Microsoft Foundry Labs – May 2026](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/whats-new-in-microsoft-foundry-labs-%E2%80%93-may-2026/4520310)
- [Microsoft takes on AI rivals with three new foundational models — TechCrunch](https://techcrunch.com/2026/04/02/microsoft-takes-on-ai-rivals-with-three-new-foundational-models/)
- [Introducing MAI-Image-2-Efficient — Microsoft Community Hub](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/introducing-mai-image-2-efficient-faster-more-efficient-image-generation/4510918)
- [Microsoft Build 2026 AI Startup Cohort](https://windowsnews.ai/article/microsoft-build-2026-ai-startup-cohort-agents-governance-observability-data.419425)
- [Microsoft Build 2026 Moves to San Francisco — Wokeey](https://www.wokeey.com/events/microsoft-build/)

### Veo 3.1 / Google DeepMind
- [Veo 3.1 Lite and a new Veo upscaling capability on Vertex AI](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)
- [Introducing Veo 3.1 and new creative capabilities in the Gemini API](https://developers.googleblog.com/introducing-veo-3-1-and-new-creative-capabilities-in-the-gemini-api/)
- [Veo 3.1 — Google DeepMind](https://deepmind.google/models/veo/)
- [Vertex AI release notes](https://docs.cloud.google.com/vertex-ai/docs/release-notes)

### Concurrents
- [Kling AI, Runway, Vidu: The AI Video Generators Set to Replace Sora — Bloomberg](https://www.bloomberg.com/news/articles/2026-04-01/kling-ai-runway-vidu-the-ai-video-generators-set-to-replace-openai-s-sora)
- [Best AI Video Models 2026: Runway vs Kling vs Luma vs Sora vs Veo — UlazAI](https://ulazai.com/ai-video-models-guide-2025/)
- [Runway AI Release Notes - May 2026 — Releasebot](https://releasebot.io/updates/runwayai)

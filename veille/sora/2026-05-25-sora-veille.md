# Veille Sora-2 / Azure AI Foundry / Concurrents — 2026-05-25

**Date :** lundi 25 mai 2026
**Fenêtre couverte :** 22/05 08h11 UTC → 25/05 ~07h UTC (~72h, week-end inclus)
**Contexte bot :** Sora-2 sur Azure AI Foundry → retirement **2 juin 2026 (T-8 jours)**. Fallback actuel : Veo 3.1 Lite (Vertex AI).

---

## 🔴 Nouveautés Sora-2 / OpenAI

### Statut Sora-2 — strict statu quo, T-8 avant retirement Foundry

- **Sora-2 API OpenAI direct** : opérationnelle jusqu'au **24 septembre 2026**. Aucun changement.
- **Sora app/web** : discontinuée depuis le 26 avril 2026 (rappel).
- **Aucune annonce de successeur vidéo OpenAI** sur la fenêtre 22-25 mai. Le silence radio se prolonge.

### Activité OpenAI 22-25 mai (week-end)

- **Aucune annonce vidéo** dans le changelog API OpenAI ([`platform.openai.com/docs/changelog`](https://platform.openai.com/docs/changelog)) sur la fenêtre. Pas de mention Sora-2 ni de successeur.
- **OpenAI News** ([`openai.com/news/`](https://openai.com/news/)) : pas de post entre le 20/05 (provenance / SynthID multi-platform avec Google) et aujourd'hui. Week-end calme.
- **IPO/S-1** : OpenAI a déposé son S-1 confidentiel SEC le 22 mai (cf. rapport précédent). Fenêtre quiet period probable jusqu'à fin mai — explique l'absence de communication produit majeure.

### Posture de marché — narratif "Sora est mort" qui se consolide

Plusieurs gros articles d'analyse publiés ces 48h (cyberlink.com, ai.cc, atlascloud, kaopiz, sora2u.com) sur la **discontinuation Sora et les alternatives**. Trois consensus émergent :

1. **Veo 3 (et désormais Veo 3.1)** = "ce qui ressemble le plus à Sora-2 mature" pour la qualité cinématographique, l'audio natif et la physique.
2. **Runway** = remplacement naturel pour les workflows pro (multi-shot, characters consistency, intégration timeline d'édition — Act One = équivalent storyboard Sora).
3. **Kling 2.0** = ~60% qualité Veo 3 à 30% du prix, génération < 90s pour clip 5s.

**Implications bot** :
- Le narratif marché valide la décision de switch vers Veo 3 / 3.1.
- Aucune information indique qu'OpenAI prépare un retour vidéo. La position "OpenAI a quitté le marché vidéo consumer" se confirme.

### Verrou contenu Sora-2 sur Foundry (rappel critique)

- Sora-2 API Foundry impose : **uniquement contenu approprié <18 ans**, **rejet copyrighted characters/musique**, **rejet personnes réelles dont public figures**. Source : [learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation).
- Si le bot a des prompts qui passent côté OpenAI direct mais sont refusés côté Foundry, c'est cohérent avec la doc — pas un bug.

---

## 🔵 Azure AI Foundry

### Retirement Sora-2 v2025-10-06 — toujours bloqué au 2 juin, T-8

- **Aucune extension annoncée** sur la fenêtre 22-25 mai. La position MS reste : `learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements` → **"these dates are not extendable; exceptions are not granted"**.
- Le thread Microsoft Q&A ([learn.microsoft.com/en-in/answers/questions/5881436](https://learn.microsoft.com/en-in/answers/questions/5881436)) reste sans réponse officielle MS sur le fond. Le seul ack public reconnaît la discrepancy de dates (portal Foundry = 2 juin 2026 19h00 local time ; OpenAI = 24 septembre 2026) mais sans engagement d'extension.
- Le fil [community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475](https://community.openai.com/t/azure-openai-is-prematurely-cutting-off-support-for-sora-2-too-early/1380475) toujours sans escalade.
- **Aucun signal d'extension publié sur les dernières 72h.**

**Implications bot** : la fenêtre de migration **se referme à T-8**. Si pas d'annonce d'ici Build (2-3 juin), le bot devra impérativement basculer sur Veo 3.1 (Vertex AI) avant le 2 juin 19h00 local time du tenant Azure.

### Pas de modèle vidéo first-party Foundry annoncé

- Rappel : le digest **"What's New in Microsoft Foundry Labs – May 2026"** (publié le 21/05) **ne contient aucun modèle vidéo**. Les 4 nouveautés du mois (SocialReasoning-Bench, MagenticBrain, MAI-Image-2-Efficient, EO/OS Object Detection) sont toutes hors-scope vidéo. Source : [techcommunity.microsoft.com/blog/azure-ai-foundry-blog/whats-new-in-microsoft-foundry-labs-%E2%80%93-may-2026/4520310](https://techcommunity.microsoft.com/blog/azure-ai-foundry-blog/whats-new-in-microsoft-foundry-labs-%E2%80%93-may-2026/4520310).
- **MAI-Image-2** (Microsoft) reste **text-to-image only** — la roadmap mentionne "video generation comme future enhancement" mais **aucun calendrier officiel**. Pas de candidat first-party MS pour remplacer Sora-2 vidéo court-terme.
- Veo de Google **n'est pas listé dans le catalogue Foundry** (vérification : recherche ciblée "Veo Azure Foundry" — 0 résultat actionnable). Foundry restera donc **sans capacité vidéo à partir du 2 juin** jusqu'à nouvelle annonce.

### Doc Foundry — état des release notes

- `learn.microsoft.com/en-us/azure/ai-services/openai/whats-new` : pas de nouvelle annonce vidéo sur 22-25 mai.
- Page Sora-2 ([learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/video-generation)) inchangée.
- Page catalogue Foundry Sora-2 ([ai.azure.com/catalog/models/sora-2](https://ai.azure.com/catalog/models/sora-2)) : modèle toujours marqué en preview, gated access pour MCA-E/EA et 1000+CU.

### Build 2026 — T-8, J-J

- **Microsoft Build : 2-3 juin 2026** à San Francisco. **Day 1 = jour exact du retirement Sora-2 Foundry**. La concomitance est probablement intentionnelle : MS pourrait soit (a) prolonger en catimini, soit (b) annoncer un remplaçant à Build, soit (c) acter le retrait.
- Sessions Foundry au catalogue : **LTG419** + **Lab532** (rappel). **Aucune session vidéo explicite ajoutée** entre 22 et 25 mai.
- Tracks Day 2 inchangés : "AI Production", "Agentic Systems", "Cost & Efficiency". Pas de track vidéo.
- **Microsoft Build 2026 AI Startup Cohort** confirmé : focus Agents / Governance / Observability / Data — **pas vidéo**. Source : [windowsnews.ai/article/microsoft-build-2026-ai-startup-cohort](https://windowsnews.ai/article/microsoft-build-2026-ai-startup-cohort-agents-governance-observability-data.419425).

---

## 🟢 Alternatives / Concurrents

### Veo 3.1 — stabilisation post-update du 20 mai

Pas de nouvelle update Veo 3.1 entre le 22 et le 25 mai. Les ajouts du 20 mai (Vertical 9:16 natif, Upscaling 1080p/4K, audio sur "Ingredients to Video"/"Frames to Video"/"Extend") sont en cours de déploiement progressif sur Vertex AI.

**Statut famille Veo 3.1 sur Vertex AI (confirmation)** :

| Tier | Statut | Use case bot |
|------|--------|--------------|
| **Veo 3.1** | Paid preview Gemini API + Vertex AI | Qualité max, audio natif |
| **Veo 3.1 Fast** | Paid preview | Latence réduite, qualité ~équiv |
| **Veo 3.1 Lite** | Public preview Vertex AI (depuis 31/03) | **Choix actuel du bot** — coût < 50% Fast |
| **Veo Upscaling** | Private preview (public soon) sur Vertex AI | 1080p / 4K standalone, post-pipeline |

Sources : [cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai), [developers.googleblog.com/introducing-veo-3-1-and-new-creative-capabilities-in-the-gemini-api/](https://developers.googleblog.com/introducing-veo-3-1-and-new-creative-capabilities-in-the-gemini-api/).

**Implications bot** :
- Le fallback actuel (Veo 3.1 Lite) reste le bon choix coût/qualité pour la production. Pas de changement de stratégie nécessaire.
- L'upscaling natif (quand il passera en public preview) permettra de supprimer un éventuel post-pipeline ESRGAN/Topaz côté bot.

### Veo 4 — toujours pas d'annonce

- Teasers DeepMind du 28-30 mars 2026 **sans suite officielle** au 25 mai. Google I/O (19/05) a privilégié Gemini Omni Flash, pas de Veo 4.
- Sources tierces maintiennent "Veo 4 courant 2026" mais sans calendrier officiel.

### Autres alternatives — pas de news majeure 22-25 mai

- **Kling 2.0** : pas d'update. Reste pertinent pour use case "60% qualité Veo à 30% du prix" si le bot veut multi-fournisseurs.
- **Runway** : pas d'update sur la fenêtre. Reste recommandé pour workflows multi-shot pro.
- **Pika, Vidu, Synthesia, HeyGen** : pas de news significative.

---

## 📌 Actions recommandées

1. **🔴 PRIORITÉ 1 — Finaliser la bascule Veo 3.1 sur le bot avant le 2 juin** (T-8 jours). Si pas déjà fait, valider que tous les endpoints Sora-2 Foundry ont été remplacés par Veo 3.1 Lite via Vertex AI. Tester avec un set de prompts représentatifs.
2. **🔴 PRIORITÉ 2 — Activer Service Health alerts Azure** sur la deployment Sora-2 v2025-10-06 si pas déjà fait, pour capter toute extension *in extremis*. Doc : [learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements](https://learn.microsoft.com/en-us/azure/foundry/openai/concepts/model-retirements).
3. **🟡 PRIORITÉ 3 — Watch Build 2026 (2-3 juin)**. Surveiller Day 1 keynote pour : (a) extension Sora-2, (b) modèle vidéo first-party MS, (c) intégration Veo Foundry. La concomitance Build/retirement n'est pas un hasard.
4. **🟡 PRIORITÉ 4 — Watcher la transition Veo Upscaling en public preview** sur Vertex AI. Quand ça passe public, possibilité de supprimer le post-pipeline upscaling custom.
5. **🟢 PRIORITÉ 5 — Préparer un plan de contingence multi-fournisseurs**. Si Veo 3.1 Lite subit une panne/quota, avoir Kling 2.0 ou Runway prêts en backup (clés API, prompts adaptés). Le marché s'est diversifié, ce serait imprudent de tout miser sur Vertex AI.
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
- [Sora Is Shutting Down: The Best Alternatives — CyberLink](https://www.cyberlink.com/blog/trending-topics/5406/openai-sora-alternative)
- [Sora Discontinued: Why OpenAI is Killing Sora AI in 2026 — GLBGPT](https://www.glbgpt.com/hub/sora-discontinued/)
- [OpenAI Sora Shutdown 2026: AI Video API Alternatives & Migration — AI.cc](https://www.ai.cc/blogs/openai-sora-shutdown-best-ai-video-generation-api-alternatives-2026-migration-guide/)
- [Sora Shutdown Guide (2026) — Kaopiz](https://kaopiz.com/en/articles/sora-shutdown-guide/)

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

### Veo 3.1 / Google DeepMind
- [Veo 3.1 Lite and a new Veo upscaling capability on Vertex AI](https://cloud.google.com/blog/products/ai-machine-learning/veo-3-1-lite-and-a-new-veo-upscaling-capability-on-vertex-ai)
- [Veo 3.1 Ingredients to Video: New video generation model updates](https://blog.google/innovation-and-ai/technology/ai/veo-3-1-ingredients-to-video/)
- [Bringing new Veo 3.1 updates into Flow to edit AI video](https://blog.google/technology/ai/veo-updates-flow/)
- [Introducing Veo 3.1 and new creative capabilities in the Gemini API](https://developers.googleblog.com/introducing-veo-3-1-and-new-creative-capabilities-in-the-gemini-api/)
- [Veo 3.1 — Google DeepMind](https://deepmind.google/models/veo/)
- [Vertex AI release notes](https://docs.cloud.google.com/vertex-ai/docs/release-notes)

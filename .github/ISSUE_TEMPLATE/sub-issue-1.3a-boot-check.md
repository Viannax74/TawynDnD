---
name: "Sub-issue 1.3a — Correction Boot Check (Epic 1)"
about: "Remplacer le bloc Boot Check dans le template généré par la version qui vérifie explicitement C.stats.hp_max, C.stats.ac, C.stats.prof."
title: "Sub-issue 1.3a — Correction Boot Check dans le template généré"
labels: ["enhancement", "sub-issue", "size:S", "area:data-schema", "epic-1"]
assignees: []
---

## 🎯 Objectif (Context)
Remplacer le bloc Boot Check dans buildSheetScript pour vérifier explicitement la présence de C.stats.hp_max, C.stats.ac, C.stats.prof, en utilisant un template string (backticks).

📂 Fichiers concernés (Scope strict)
À modifier (Write) : character-builder.html

🛠️ Spécifications d'implémentation (Steps)
- Remplacer le bloc Boot Check dans buildSheetScript par la version qui vérifie C.stats.hp_max, C.stats.ac, C.stats.prof, avec un bloc backticks.

✅ Critères d'Acceptation (Definition of Done)
[ ] Le Boot Check ne fait plus référence à d’autres noms que ceux du schéma minimal.
[ ] Le bloc utilise des backticks pour éviter les conflits de guillemets.

🚫 Hors Périmètre (Guardrails / DO NOT)
NE PAS modifier la fonction validateSchema ici.

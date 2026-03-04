---
name: "Sub-issue 1.1a — Correction schéma minimal (Epic 1)"
about: "Corriger l’objet C_SCHEMA_REQUIRED pour n’inclure que les clés stats.hp_max, stats.ac, stats.prof."
title: "Sub-issue 1.1a — Correction schéma minimal dans le builder"
labels: ["enhancement", "sub-issue", "size:S", "area:data-schema", "epic-1"]
assignees: []
---

## 🎯 Objectif (Context)
Corriger l’objet C_SCHEMA_REQUIRED dans character-builder.html pour n’inclure que les clés strictes du schéma minimal : stats.hp_max, stats.ac, stats.prof.

📂 Fichiers concernés (Scope strict)
À modifier (Write) : character-builder.html

🛠️ Spécifications d'implémentation (Steps)
- Remplacer l’objet C_SCHEMA_REQUIRED pour ne garder que les clés stats.hp_max, stats.ac, stats.prof (plus de hit_points/armor_class).

✅ Critères d'Acceptation (Definition of Done)
[ ] Le schéma minimal ne contient plus aucune référence à hit_points ou armor_class.
[ ] Les clés sont exactement stats.hp_max, stats.ac, stats.prof.

🚫 Hors Périmètre (Guardrails / DO NOT)
NE PAS modifier la fonction validateSchema ici.

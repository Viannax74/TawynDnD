---
name: "Sub-issue 1.1b — Harmonisation validateSchema (Epic 1)"
about: "S’assurer que validateSchema ne fait plus référence à d’autres noms que ceux du schéma minimal."
title: "Sub-issue 1.1b — Harmonisation validateSchema avec le schéma minimal"
labels: ["enhancement", "sub-issue", "size:S", "area:data-schema", "epic-1"]
assignees: []
---

## 🎯 Objectif (Context)
S’assurer que la fonction validateSchema ne fait plus référence à d’autres noms que ceux du schéma minimal (stats.hp_max, stats.ac, stats.prof).

📂 Fichiers concernés (Scope strict)
À modifier (Write) : character-builder.html

🛠️ Spécifications d'implémentation (Steps)
- Supprimer toute trace de hit_points ou armor_class dans validateSchema.
- Harmoniser la logique de validation avec le schéma minimal.

✅ Critères d'Acceptation (Definition of Done)
[ ] validateSchema ne fait plus référence à hit_points ou armor_class.
[ ] La validation porte uniquement sur stats.hp_max, stats.ac, stats.prof.

🚫 Hors Périmètre (Guardrails / DO NOT)
NE PAS modifier C_SCHEMA_REQUIRED ici.

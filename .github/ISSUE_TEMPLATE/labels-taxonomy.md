# Taxonomie des labels (IA-friendly)

## 🎯 Objectifs
- Classer chaque ticket de façon uniforme et exploitable par humain + IA.
- Réduire l’ambiguïté de tri, priorisation et exécution.

## 🧱 Labels de type (1 obligatoire)
- `epic` : Initiative multi-issues, orientée résultat produit.
- `issue` : Unité de travail standard, potentiellement découpable.
- `sub-issue` : Unité minimale = 1 PR recommandée.

## 📏 Labels de taille (1 obligatoire)
- `size:S` : changement local, faible risque.
- `size:M` : changement modéré, plusieurs zones cohérentes.
- `size:L` : changement large, à découper si possible.

## 🧭 Labels de domaine (1 obligatoire)
- `area:builder`
- `area:character-sheet`
- `area:i18n`
- `area:data-schema`
- `area:docs`
- `area:tooling`

## ⚡ Priorité (1 obligatoire)
- `priority:P0` : bloquant
- `priority:P1` : important
- `priority:P2` : normal
- `priority:P3` : opportunité

## 🔄 Statut (1 recommandé)
- `status:ready`
- `status:in-progress`
- `status:blocked`
- `status:review`
- `status:done`

## 🔗 Dépendances (optionnel)
- `blocked-by`
- `blocks`

## ✅ Règles d’usage
- Toujours garder `enhancement` pour les évolutions fonctionnelles.
- Éviter plus d’un label par famille (ex: une seule taille, une seule priorité).
- Pour une sub-issue codable immédiatement, viser: `sub-issue`, `size:S|M`, `status:ready`, une `area:*`, une `priority:*`.

## 🧪 Exemple de combinaison
- `enhancement`, `sub-issue`, `size:M`, `area:builder`, `priority:P1`, `status:ready`

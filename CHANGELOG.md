# Changelog - TawynDnD

## [2026-02-15] - Documentation & Architecture Alignment

### Ajouté
- **DND_VOCABULARY.md** : Header version 3.0-20260215-1558 (contenu à compléter)
- **TECHNICAL_SPEC.md** : Sections complètes (Build, Migration, Hors Périmètre)
- **BACKLOG.md** : Document de suivi des évolutions futures (solo + Physical First)
- **Issue #6** : Phase 5 - Export & Import des personnages
- Principe "Fichier Local First" : Priorité absolue au usage hors-ligne
- Clarification du scope v3.0 : Exclusion explicite hébergement web, multi-joueur, dice rollers

### Changé
- **Phase 5 Roadmap** : Redéfinition de "Automatisation IA" vers "Export/Import System"
- **TECHNICAL_SPEC.md** : Ajout politiques de migration de schéma (v2→v3, v3.x→v3.y, v3→v4)
- **TECHNICAL_SPEC.md** : Workflow de release avec tags Git et attachements GitHub

### Documenté
- Stratégie de versioning : Patch (<200 chars), Minor (≥200 chars), Major (breaking)
- Script de migration localStorage v2 → v3
- Budget performance : <500 KB, <2s load 3G, Lighthouse >90
- Compatibilité navigateurs : Chrome 90+, Safari 14+, Firefox 88+, Samsung Internet 15+

### Principe Réaffirmé
- **Physical First** : AUCUN dice roller ne sera jamais implémenté (saisie manuelle uniquement)
- **Solo First** : Projet personnel, pas de fonctionnalités multi-joueur ou communauté
- **IA-Ready** : Séparation stricte `const C` (données) vs moteur de rendu

---

## [2026-02-15] - TawynDnD character sheet Roadmap
### Ajouté
- Définition de la Roadmap stratégique pour la version "Ultimate" (emballement de l'ia), une nouvelle itération qui sera appelée vX.X
- Mise à jour du `README.md` avec les 5 phases de développement.
- Intégration des principes "Physical First" (saisie manuelle des dés) et "Mobile First" (S23 Ultra).
- Préparation de l'architecture pour l'injection de données par IA.
- Préparation de la liste de données nécessaire pour app bilingue mais surtout en reprenant le meilleur des deux mondes https://www.dnd5eapi.co/ et https://www.aidedd.org/

### Changé
- Philosophie du moteur : Abandon des lancés de dés RNG au profit d'un système de saisie assistée.
- Priorisation de la "Master Sheet" comme vue par défaut.
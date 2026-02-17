# Changelog — TawynDnD
Toutes les modifications notables de ce projet sont documentées ici.  
Format : [Semantic Versioning](https://semver.org/) | [Keep a Changelog](https://keepachangelog.com/)

---
## [3.1.0] — 2026-02-17

### Internationalisation (i18n)
- Ajout du dossier /translations avec en.js, fr.js, index.js.
- Fonction t() + switch langue natif avec fallback EN, gestion localStorage.
- Mapping complet EN/FR pour labels UI, caractéristiques, compétences, classes principales.
- Documenté la convention d'intégration i18n pour toute nouvelle fiche ou contribution.
- Synchronisation avec la roadmap, README, COPILOT_GUIDE.

- Ajout de translations/en.js, fr.js, index.js : fonction t(), mapping, switch langue natif, fallback EN.
- Démarrage de la migration i18n sur les fiches, UI, moteurs.
- Documentation COPILOT_GUIDE.md & TECHNICAL_SPEC synchronisée sur ajout de traduction et normes multi-langue.


## [3.0.2] — 2026-02-17

### Documentation et Moteur
- Fiche Steiner Ferum : moteur de rendu complet finalisé, statut passé à “version stable” dans toute la documentation.
- Suppression des mentions “en cours”, “stub”, “à implémenter” pour Steiner dans README, BACKLOG, CHANGELOG.
- Rétrospective : migration/normalisation terminée pour les deux templates principaux (“Moros” et “Steiner”).

  
## [3.0.1] — 2026-02-17

### Documentation
- **README** — Ajout de la règle d'or "Single-File Architecture" pour GitHub Copilot
- **README** — Statut Steiner clarifié : stub `const C` complet, moteur de rendu à implémenter
- **TECHNICAL_SPEC** — Section anti-patterns Copilot ajoutée (ce que l'IA ne doit pas faire)
- **TECHNICAL_SPEC** — Distinction explicite Moros (lanceur de sorts) vs Steiner (martial, sans sorts)
- **TECHNICAL_SPEC** — Convention de nommage des fichiers documentée
- **BACKLOG** — Ajout ticket bloquant : Moteur de rendu Steiner

### Archivage
- `moros-v3.0-20260215-1558.html` → déplacé vers `/archive`
- README mis à jour pour pointer vers `moros-v3.0-20260217-1200.html` comme référence stable

### Clarifications (sans changement de code)
- `schemaVersion` de Steiner aligné sur `"3.0"` (suppression du timestamp dans la valeur)
- Justification documentée de l'absence de section sorts pour Steiner

---

## [3.0.0] — 2026-02-16

### Ajouté
- Schéma de données `const C` v3.0 universel (toutes classes)
- Design system Glassmorphism unifié avec variables CSS par classe
- Fiche Steiner Ferum v3.0 — `const C` complet (Guerrier Maître de Guerre niv. 8)
- Fiche Moros Gravewalker v3.0 — moteur complet (Occultiste Lame Maudite)
- `TECHNICAL_SPEC.md` — Spécification technique initiale
- `BACKLOG.md` — Backlog synchronisé avec GitHub Issues
- Dossier `/characters` pour isoler les fiches actives

### Modifié
- Migration de toutes les fiches depuis le format v2.x
- Thème Moros : Violet sombre (`--accent: #a855f7`, `--bg-primary: #0a0014`)
- Thème Steiner : Rouge sombre (`--accent: #ef4444`, `--bg-primary: #140a00`)

### Supprimé
- Anciens fichiers v2 à la racine du repo
- Dépendances externes (jQuery, Bootstrap) — passage à Vanilla JS pur

---

## [2.x] — Versions Antérieures

Voir `/archive` pour les fichiers v2. Non documentées dans ce changelog (format non standardisé).

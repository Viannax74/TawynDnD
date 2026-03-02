# TawynDnD ⚔️ — Ultimate Digital Character Sheet

**TawynDnD** est un système de fiches de personnage interactives pour **Dungeons & Dragons 5e (2014 & 2024)**, conçu avec un thème Glassmorphism, optimisé Galaxy S23 Ultra, et pensé pour la saisie manuelle de dés physiques.

> **⚠️ RÈGLE D'OR POUR COPILOT / IA :**
> Chaque fiche est un **fichier HTML unique et autosuffisant**. Le `const C` (données) ET le moteur de rendu (HTML/CSS/JS) coexistent dans le **même fichier `.html`**. Ne jamais séparer les deux. Ne jamais créer de `engine.js` externe. Ne jamais importer `const C` depuis l'extérieur.

---

## 🎯 Vision & Principes Directeurs

1. **Physical First** — Saisie manuelle des résultats de dés physiques. Aucun générateur de nombres aléatoires (RNG).
2. **Single-File Architecture** — Une fiche = un fichier `.html` complet, autonome, sans dépendances externes (sauf Google Fonts).
3. **IA-Ready Data Separation** — `const C` (données du personnage) est isolé en haut du `<script>`, séparé du moteur de rendu JS qui suit. L'IA peut modifier `const C` sans toucher au moteur.
4. **Mobile-First** — Optimisé pour Galaxy S23 Ultra (384px × 854px). Testé mobile avant desktop.
5. **Précision Technique** — Termes AideDD officiels en français pour sorts et capacités.

---

## 📁 Structure du Repository

```
TawynDnD/
|-- Audit
|   |-- AUDIT_TawynDnD_v2.md
|   |-- Opus4.6_20260218
|   |-- gitattributes
|   `-- gitignore
|-- BACKLOG.md
|-- CHANGELOG.md
|-- DND_VOCABULARY.md
|-- INTEGRATION_i18n.md
|-- README.md
|-- TECHNICAL_SPEC.md
|-- VISION.md
|-- archive/
|   |-- moros-v3.0-20260217-1200.html
|   |-- moros-v3.1-20260218-0330.html
|   `-- steiner-ferum-v3.0-20260217-1500.html
|-- characters/
|   |-- moros-v3_1-template.html
|   |-- moros-v3.1-20260218-0330-i18n.html
|   `-- steiner-ferum-v3.1-20260218-0020.html
|-- data/
|   `-- aidedd/
|-- translations/
|   |-- en.js
|   |-- fr.js
|   `-- index.js
```

### 🗄️ Fiches archivées
ℹ️ Le dossier `/archive` contient toutes les anciennes versions de fiches non migrées i18n, gardées pour l’historique ou le debug.
Seul le dossier `/characters` contient les fiches actives, complètement migrées (i18n, UI à jour).

---

## 🗂️ Fiches Actives

### Moros Gravewalker — Occultiste Lame Maudite (Référence)
- **Fichier :** `characters/moros-v3.1-20260218-0330-i18n.html`
- **Statut :** ✅ Version stable de référence — moteur complet avec gestion des sorts, i18n (FR/EN)
- **Accentuation CSS :** Violet (`--accent: #a855f7`)

### Steiner Ferum — Guerrier Maître de Guerre (Template Martial)
- **Fichier :** `characters/steiner-ferum-v3.1-20260218-0020.html`
- **Statut :** ✅ Version stable i18n (FR/EN) — moteur complet, ready pour usage & extension
- **Accentuation CSS :** Rouge (`--accent: #ef4444`)
- **⚠️ Pas de sorts** — Classe martiale.

---

## 🌍 Internationalisation (i18n)
Le projet dispose désormais d’un socle i18n complet (Phase 3 ✅) :
- Dossier `/translations` extensible.
- Fonction `t()` centrale, gestion du switch langue natif.
- Toute contribution doit passer par `t()` (aucun texte en dur).

---

## 🚀 Roadmap Actuelle
- ✅ **Phase 1** — Standardisation CSS/JS
- ✅ **Phase 2** — Moteur de rendu Steiner
- ✅ **Phase 3** — Internationalisation (i18n)
- 🔴 **Phase 4** — Inventaire interactif
- 🔴 **Phase 5** — Export/Import JSON + PWA

---
*Fait par et pour des joueurs passionnés. Optimisé pour le jeu sur table avec dés physiques.*
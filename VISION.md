# 🔭 Vision & Objectifs Long Terme — TawynDnD

**Dernière mise à jour :** 18 février 2026  
**Statut :** Document de référence pour éviter toute dérive

---

## 🎯 Objectif Final (North Star)

**Créer une fiche de personnage D&D 5e interactive en <5 minutes**, quelle que soit la classe, depuis :
- Un export XML d'AideDD.org (character builder)
- Un formulaire de création intégré
- Un fichier JSON structuré

**La fiche générée doit être :**
- ✅ Autosuffisante (un seul fichier HTML)
- ✅ Bilingue FR/EN (switch instantané)
- ✅ Mobile-first (Galaxy S23 Ultra optimisé)
- ✅ Physical First (saisie manuelle des dés)
- ✅100% offline (pas de serveur requis)

---

## 🗺️ Roadmap Stratégique

### ✅ Phase 1 — Fondations (Terminée)
**Objectif :** Standardiser l'architecture technique  
**Livrables :** Design system Glassmorphism, schéma `const C`, 2 templates (Moros, Steiner)

---

### 🟣 Phase 2 — Internationalisation (En cours)
**Objectif :** Support multilingue FR/EN complet  
**Livrables :** 
- Système i18n avec fallback automatique
- Dataset FR (sorts, classes, conditions) depuis API D&D 5e
- Switch langue UI opérationnel

**Milestone critique :** Au moins 1 fiche 100% traduite et fonctionnelle en FR/EN

---

### 🔵 Phase 3 — Générateur de Fiches (Planifiée)
**Objectif :** Créer une fiche depuis un formulaire  
**Livrables :**
- `character-builder.html` — UI de création
- Auto-fill des capacités de classe via API
- Export HTML prêt à jouer

**Inputs supportés :**
1. Formulaire manuel (nom, classe, niveau, stats)
2. Fichier JSON structuré (format `const C`)

---

### 🟢 Phase 4 — Import XML AideDD (Vision finale)
**Objectif :** Générer une fiche depuis un export AideDD.org  
**Workflow cible :**

```
1. Créer personnage sur AideDD.org → Export XML
2. Upload XML dans TawynDnD
3. Script convertit XML → const C
4. Fiche HTML générée automatiquement
5. Téléchargement instantané
```

**Exemple d'input :** `00_Steiner.xml` (character builder AideDD)

**Livrables :**
- Parser XML AideDD → `const C`
- Mapping des ID AideDD vers données i18n
- Validation des données importées
- Génération fiche complète (HTML + CSS inline)

**Priorité :** Après Phase 2 et 3 complètes

---

## 🚧 Garde-fous (Éviter les dérives)

### ❌ Hors périmètre (ne JAMAIS implémenter)
- Simulateur de dés (RNG) → Contre principe Physical First
- Backend serveur / base de données
- Fonctionnalités multijoueur
- Intégration Discord / réseaux sociaux
- Éditeur de règles homebrew
- Marketplace de contenu

### ⚠️ Arbitrages de scope
**Si une feature n'aide PAS directement à :**
1. Créer une fiche plus vite
2. Jouer en session (saisie dés, tracking ressources)
3. Supporter plus de classes/races

→ **C'est hors scope.**

### 🎯 Priorité absolue
**Toute phase doit servir l'objectif final :** Import XML AideDD → Fiche HTML en <5 min.

---

## 📊 Indicateurs de Succès

### MVP (Minimum Viable Product)
- [ ] Phase 2 complète (i18n FR/EN)
- [ ] Phase 3 complète (Character Builder)
- [ ] 5 templates de classes différentes (Guerrier, Occultiste, Paladin, Rôdeur, Magicien)
- [ ] 1 fiche créée depuis formulaire en <10 min

### Version 1.0 (Product/Market Fit)
- [ ] Phase 4 complète (Import XML AideDD)
- [ ] 13 classes supportées (toutes classes PHB)
- [ ] Dataset FR complet (300 sorts traduits)
- [ ] 1 fiche créée depuis XML en <5 min
- [ ] Documentation complète pour contributeurs

---

## 🔄 Process de Décision

**Avant d'ajouter une feature, poser ces 3 questions :**

1. **Est-ce que ça accélère la création de fiche ?**  
   → Si non, probablement hors scope

2. **Est-ce que ça améliore l'expérience en session de jeu ?**  
   → Si non, probablement hors scope

3. **Est-ce que ça bloque la Phase 4 (import XML) ?**  
   → Si oui, c'est prioritaire

**Exemple de décision :**
- ✅ "Ajouter support des sorts de Barde" → Oui (élargit classes supportées)
- ❌ "Ajouter un chat en temps réel" → Non (hors scope, multijoueur)
- ✅ "Parser les manœuvres de combat depuis l'API" → Oui (nécessaire pour Phase 4)

---

## 📁 Architecture Cible (Phase 4)

```
TawynDnD/
├── character-builder.html        ← UI de création
├── translations/                 ← i18n FR/EN/...
├── scripts/
│   ├── aidedd-xml-parser.js     ← Parser XML → const C
│   ├── fetch-dnd-api.js         ← Extraction API D&D 5e
│   └── generate-sheet.js        ← Générateur HTML final
├── templates/
│   ├── fighter.html             ← Template Guerrier
│   ├── warlock.html             ← Template Occultiste
│   └── base.html                ← Template générique
└── data/
    ├── mappings/
    │   ├── aidedd-to-api.json   ← Mapping ID AideDD → API
    │   └── spells-fr.json       ← Dataset FR
    └── schemas/
        └── const-c-schema.json  ← Validation schema
```

---

## 🎓 Références

- **API D&D 5e :** https://www.dnd5eapi.co/
- **AideDD Character Builder :** https://www.aidedd.org/dnd-builder/
- **Format XML AideDD :** Voir `00_Steiner.xml` (exemple de référence)

---

## 📝 Mise à jour de ce document

**Qui peut modifier :** Tawyn uniquement  
**Fréquence :** À chaque changement de phase ou arbitrage majeur  
**Changelog :** Documenté dans Git commit messages

---

**Ce document est la BOUSSOLE du projet. En cas de doute, revenir ici.**

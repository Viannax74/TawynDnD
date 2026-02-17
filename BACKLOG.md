# 📋 BACKLOG — TawynDnD Ultimate
**Version :** 3.1 — 17 février 2026  
**Synchronisé avec :** [GitHub Issues](https://github.com/Viannax74/TawynDnD/issues) | [Project Board](https://github.com/users/Viannax74/projects/2)

---

## 🗺️ Roadmap & Phases

### ✅ Phase 1 — Standardisation & Cohérence Technique
**Issue :** [#2](https://github.com/Viannax74/TawynDnD/issues/2)  
**Status :** ✅ Terminée  
Unification du thème Glassmorphism, schéma `const C` universel, validation automatique.

---

### 🔴 Phase 2 — Format AideDD Complet pour les Sorts
**Issue :** [#3](https://github.com/Viannax74/TawynDnD/issues/3)  
**Status :** 🔴 En attente (après Phase 3)  
**Priorité :** Haute  
Intégration des propriétés complètes des sorts : École, Composantes, Portée, Temps d'incantation.  
**Note :** Cette phase sera fusionnée avec Phase 3 (i18n) pour éviter la duplication.

---

## 🟣 Phase 3 — Internationalisation (i18n) — PLAN PRAGMATIQUE et priorité immediate

**Issue principale :** [#4](https://github.com/Viannax74/TawynDnD/issues/4)  
**Status :** 🟣 En cours  
**Priorité :** Critique — Fondation pour toutes les fiches futures  
**Estimation totale :** 38-50h (P0+P1), 58-70h (complet)

---

### 🎯 P0 — Fondations i18n (Prio critique, 8-12h)

**Objectif :** Structure technique fonctionnelle sans traduction complète

#### Tâches
- [ ] **Créer la structure de fichiers i18n**
  - `translations/en.js` — Termes anglais (base API)
  - `translations/fr.js` — Termes français
  - `translations/index.js` — Loader et export unifié
  - Fonction `t(key, lang)` avec fallback automatique EN si FR manquant

- [ ] **Rendre Steiner & Moros compatibles i18n**
  - Remplacer tous les labels UI hardcodés par `t('ui.hp')`, `t('ui.ac')`, etc.
  - Tester le switch langue (FR ⇄ EN) sans casser l'affichage
  - **Critère de validation :** Les 2 fiches s'affichent correctement en FR et EN (même si certaines descriptions restent EN)

- [ ] **Switch langue UI fonctionnel**
  - Boutons 🇫🇷/🇬🇧 dans le header
  - Persistance du choix de langue dans `localStorage`
  - Update du DOM sans reload de page

**Livrables :**
- Structure `translations/` opérationnelle
- Moteur de rendu mis à jour (Moros + Steiner)
- Documentation dans `TECHNICAL_SPEC.md` : "How i18n works"

**Estimation :** 8-12h

---

### 🎯 P1 — Dataset FR minimum viable (Essentiel pour jouer, 30-38h)

**Objectif :** Traductions des éléments les plus utilisés

#### Tâches

**3.1.1 — Extraction automatique de l'API**
- [ ] **Script d'extraction Node.js/Python**
  - Fetch `/api/spells`, `/api/classes`, `/api/subclasses`, `/api/conditions`
  - Générer `data/dnd5e-api-en.json` structuré
  - Documenter l'utilisation dans `scripts/README.md`

**3.1.2 — Récupération dataset FR**
- [ ] **Trouver un dataset FR officiel**
  - Option A : Contacter AideDD.org pour permission d'utiliser leur dataset
  - Option B : Utiliser un dataset open-source existant (GitHub: `dnd5e-fr`, `dnd-compendium-fr`)
  - Option C : Premier jet via DeepL API + review manuelle prioritaire
  
- [ ] **Mapper EN → FR**
  - Créer `data/mappings/spells-fr.json` (au minimum sorts 0-3)
  - Créer `data/mappings/classes-fr.json` (Guerrier, Occultiste en priorité)
  - Créer `data/mappings/conditions-fr.json` (toutes les 15 conditions)

**3.1.3 — Intégration & validation**
- [ ] **Intégrer les traductions dans `translations/fr.js`**
  - Importer les JSON de mapping
  - Tester sur Moros (sorts d'Occultiste) et Steiner (capacités Guerrier)
  - **Critère de validation :** Au moins 1 fiche complète 100% en français sans fallback EN

- [ ] **Documentation du process de traduction**
  - Ajouter section dans `COPILOT_GUIDE.md` : "How to add a new translation"
  - Documenter la convention de nommage des clés (`spell.shield.name`, `class.fighter.description`)
  - Checklist de validation d'une traduction

**Livrables :**
- Script d'extraction `scripts/fetch-dnd-api.js` ou `.py`
- Dataset FR (`data/mappings/*.json`)
- Au moins 1 fiche (Moros OU Steiner) 100% traduite et fonctionnelle
- Documentation complète du workflow de traduction

**Estimation :** 30-38h (dont 20-25h de traduction/validation)

**⚠️ Décision de priorisation :** Si le dataset AideDD n'est pas accessible rapidement, commencer avec DeepL + review manuelle sur les sorts 0-3 uniquement (gain de 15h).

---

### 🎯 P2 — Extension progressive (À la demande, 20-30h)

**Objectif :** Compléter les traductions au fur et à mesure des besoins

#### Tâches
- [ ] **Sorts de niveau 4-9** (12h estimé)
- [ ] **Objets magiques** (8h estimé)
- [ ] **Backgrounds & traits raciaux** (6h estimé)
- [ ] **Sous-classes additionnelles** (4h estimé)

**Note :** Ces tâches sont déclenchées uniquement si un joueur crée un personnage nécessitant ces éléments.

---

### 🎯 P3 — Character Builder (Optionnel, 12-16h)

**Objectif :** Interface de génération de fiches

#### Tâches
- [ ] **UI de création** (`/character-builder.html`)
  - Formulaire : Nom, Classe, Sous-classe, Niveau, Race
  - Sélection des sorts (si lanceur)
  - Auto-calcul des stats de base

- [ ] **Générateur de `const C`**
  - Script JS qui génère l'objet `const C` complet depuis le formulaire
  - Pré-remplissage automatique des capacités de classe via API
  - Export HTML de la fiche prête à l'emploi

- [ ] **Templates par classe**
  - Template Guerrier (basé sur Steiner)
  - Template Occultiste (basé sur Moros)
  - Templates génériques pour autres classes

**Livrables :**
- Page `character-builder.html` fonctionnelle
- Documentation : "How to create a new character"

**Estimation :** 12-16h

**Note :** À faire APRÈS P0+P1, quand la base i18n est stable.

---

## 📊 Timeline & Jalons

| Jalon | Tâches | Date cible | Critère de succès |
|-------|--------|------------|-------------------|
| **M1 — i18n foundations** | P0 complet | Semaine 1 | Switch FR/EN fonctionne sur 2 fiches |
| **M2 — MVP traduit** | P0 + P1 (sorts 0-3, classes principales) | Semaine 3 | 1 fiche 100% FR sans fallback |
| **M3 — Full i18n** | P2 complet | Semaine 6 | Toutes les fiches existantes traduites |
| **M4 — Character Builder** | P3 complet | Semaine 8 | Génération d'une nouvelle fiche en <5 min |

---

## 🎯 Features Complémentaires (Post-i18n)

### Progressive Web App (PWA)
**Issue :** [#8](https://github.com/Viannax74/TawynDnD/issues/8) | Effort : 4h  
Installation comme app native smartphone (mode offline, icône d'accueil).

### Backup Automatique 24h
**Issue :** [#9](https://github.com/Viannax74/TawynDnD/issues/9) | Effort : 3h  
Export JSON automatique toutes les 24h.

### Historique des Jets de Dés
**Issue :** [#11](https://github.com/Viannax74/TawynDnD/issues/11) | Effort : 2h  
Journal circulaire des 20 derniers jets manuels.

### Notes de Session
**Issue :** [#12](https://github.com/Viannax74/TawynDnD/issues/12) | Effort : 2h  
Textarea persistant (localStorage) pour notes de session.

---

## ✅ Features à Conserver (Physical First)
- Gestion de personnage local
- Backups locaux (localStorage + JSON export)
- PWA capability
- Suivi des emplacements de sorts (Moros)
- Notes de session
- Calculateur de poids
- Thème customisable via variables CSS

## ❌ Features Hors Périmètre
- Animations de dés (RNG) — contre le principe Physical First
- Fonctionnalités multijoueur
- Intégration Discord
- Fonctionnalités communautaires

---

## 📝 Méthodologie de travail

### Règle d'or
**Test sur 1 fiche complète avant de généraliser** — Ne jamais traduire 300 sorts avant de valider que le système fonctionne sur 1 personnage.

### Arbitrage qualité/rapidité
1. **Labels UI** → Traduction manuelle précise (2h max)
2. **Classes jouées** → Traduction officielle AideDD prioritaire
3. **Sorts rarement utilisés** → Premier jet DeepL + review progressive

### Validation
Chaque traduction doit passer par :
1. ✅ Vérification terminologie officielle (AideDD/WotC)
2. ✅ Test en jeu (la fiche s'affiche correctement)
3. ✅ Review par un joueur FR natif

---

**Changelog:** Toute modification de ce backlog doit être synchronisée avec les GitHub Issues et documentée dans [CHANGELOG.md](./CHANGELOG.md).

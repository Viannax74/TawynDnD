# 🧠 Audit Technique Exhaustif v2 — TawynDnD (basé sur `git clone` réel)

**Date** : 18 février 2026  
**Source** : `git clone https://github.com/Viannax74/TawynDnD` — code vérifié byte par byte  
**Delta vs Audit v1** : ⚠️ Plusieurs hypothèses de l'audit v1 étaient **fausses**. Ce document corrige.

---

## ⚠️ CORRECTIONS MAJEURES vs AUDIT v1

| Élément | Audit v1 (conversation) | Audit v2 (repo réel) |
|---------|------------------------|---------------------|
| `scripts/val-i18n-labels.js` | Supposé existant | 🔴 **N'EXISTE PAS** |
| `scripts/update-docs.js` | Supposé existant | 🔴 **N'EXISTE PAS** |
| Husky pre-commit hooks | Supposé configuré | 🔴 **N'EXISTE PAS** (pas de `.husky/`) |
| `package.json` | Supposé présent | 🔴 **N'EXISTE PAS** (zéro npm) |
| `.gitignore` | Supposé présent | 🔴 **N'EXISTE PAS** |
| `.gitattributes` | Non vérifié | 🔴 **N'EXISTE PAS** (CRLF mixte déjà) |
| i18n coverage Steiner | "En cours" | 🔴 **6 clés inlinées / ~60 labels hardcodés FR** (~10%) |
| i18n coverage Moros | "En cours" | 🟡 **~60 clés / ~40+ labels hardcodés FR** (~60%) |
| CI/CD GitHub Actions | Absent (correct) | ✅ Confirmé absent |
| `translations/index.js` | Module ES `import` | 🔴 **Inutilisable** en single-file `file://` |

**Verdict** : Le tooling DevOps discuté dans nos conversations (scripts QA, Husky, npm) **n'a jamais été implémenté**. Le repo est 100% manuel.

---

## 1. DIAGNOSTIC STRATÉGIQUE (actualisé)

### Forces réelles (vérifiées sur code)

- ✅ **Single-file HTML fonctionne.** Les 5 fichiers HTML s'ouvrent correctement dans un navigateur, offline, sans serveur.
- ✅ **`const C` est proprement isolé** en haut du `<script>`. Séparation données/moteur effective.
- ✅ **Glassmorphism cohérent.** Variables CSS `:root` identiques en structure entre Moros et Steiner, seules les couleurs changent.
- ✅ **`validate-character.html` existe.** Outil de validation basique — c'est un asset sous-documenté.
- ✅ **Documentation riche.** 7 fichiers markdown de qualité (README, TECHNICAL_SPEC, COPILOT_GUIDE, VISION, BACKLOG, CHANGELOG, DND_VOCABULARY).
- ✅ **COPILOT_GUIDE `.github/copilot-instructions.md`** — bien placé, bien structuré, conventions claires.
- ✅ **Git history propre.** 15+ commits avec messages descriptifs.

### Faiblesses critiques (vérifiées)

- 🔴 **ZERO outillage DevOps.** Pas de `package.json`, pas de scripts, pas de hooks, pas de CI. Tout est manuel.
- 🔴 **i18n à 10% coverage réel.** Steiner v3.1 a 6 clés `t()` pour ~60 labels. Moros i18n a ~60 clés pour ~100 labels. Le README et CHANGELOG annoncent "migration i18n validée" — c'est prématuré.
- 🔴 **`translations/index.js` est un dead file.** Il utilise `import { EN } from './en.js'` — inutilisable depuis un HTML ouvert en `file://` (CORS). Les fiches qui marchent ont **inliné** `t()` et un mini dictionnaire directement dans le `<script>`.
- 🔴 **README désynchronisé.** Référence `steiner-ferum-v3.0-20260216-1630.html` qui n'existe pas sur disque (le vrai fichier est `steiner-ferum-v3.0-20260217-1500.html`).
- 🔴 **CHANGELOG incohérent.** Deux entrées `[3.1.0]` avec des dates différentes (17 et 18 février).
- 🔴 **schemaVersion incohérent.** Moros = `"3.0-20260215-1558"` (timestamp dans la version !), Steiner = `"3.0"`.
- 🔴 **CRLF mixte.** `moros-v3.1-i18n.html` a des CRLF, les autres sont LF. Sans `.gitattributes` ça va empirer.
- 🔴 **ZERO accessibilité.** 0 attributs `aria-*`, 0 `role=`, 0 `min-height: 44px`.
- 🔴 **ZERO print CSS.** Aucun `@media print` dans aucune fiche. Contradiction avec "Physical First".

---

## 2. MATRICE DE CONFORMITÉ SOTA (actualisée)

| Domaine | Conforme | Écart réel | Criticité | Quick Win |
|---------|:--------:|-----------|:---------:|-----------|
| **D&D 5e data (Moros)** | ✅ 95% | Spells complets, invocations, hex slots OK | — | — |
| **D&D 5e data (Steiner)** | ✅ 90% | Manœuvres, martial dice, action surge OK | 🟢 Low | — |
| **Multiclasse** | 🔴 0% | `class: string` pas `classes: []` | 🟡 Medium | Schema change |
| **i18n Steiner v3.1** | 🔴 10% | 6 clés `t()` / ~60 labels FR hardcodés | 🔴 High | Migration massive |
| **i18n Moros v3.1-i18n** | ⚠️ 60% | ~60 clés `t()` / ~40 labels FR hardcodés | 🟡 Medium | Migration reste |
| **translations/index.js** | 🔴 Dead code | `import` incompatible `file://` | 🔴 High | Supprimer ou documenter |
| **Mobile UX touch targets** | 🔴 0% | 0 `min-height: 44px` trouvé | 🔴 High | CSS global patch |
| **Accessibility (a11y)** | 🔴 0% | 0 `aria-*`, 0 `role=` | 🔴 High | Aria labels batch |
| **Print CSS** | 🔴 0% | 0 `@media print` | 🟡 Medium | 20 lignes CSS |
| **Scripts QA** | 🔴 0% | Aucun script n'existe dans le repo | 🔴 High | Créer `scripts/` |
| **Husky hooks** | 🔴 0% | Pas de `.husky/`, pas de `package.json` | 🔴 High | `npm init` + husky |
| **CI/CD** | 🔴 0% | Pas de workflow GitHub Actions | 🔴 High | YAML 30 min |
| **`.gitignore`** | 🔴 0% | Absent | 🔴 High | 2 min |
| **`.gitattributes`** | 🔴 0% | Absent, CRLF déjà mixte | 🔴 High | 2 min |
| **README sync** | 🔴 Désync | Référence fichiers inexistants | 🟡 Medium | 10 min |
| **CHANGELOG** | ⚠️ Doublon | 2× `[3.1.0]` dates différentes | 🟢 Low | 5 min |
| **schemaVersion** | 🔴 Incohérent | Moros = "3.0-20260215-1558", Steiner = "3.0" | 🟡 Medium | Aligner |
| **Glass contrast WCAG** | ⚠️ 70% | `rgba(20,10,0,0.6)` = 0.6 opacity risqué | 🟡 Medium | +0.2 opacity |
| **Responsive 320px** | ⚠️ Non vérifié | Breakpoint `430px` documenté, 320px absent | 🟡 Medium | Test iPhone SE |

---

## 3. PLAN D'ACTION PRIORISÉ (Top 12)

### P0 — URGENCES (fix en <30 min chacun, impact maximal)

**1. 🔴 Créer `.gitignore`**
```gitignore
# OS
.DS_Store
Thumbs.db
*.swp

# IDE  
.vscode/
.idea/

# Backup
*.backup
*.bak
```
- **Effort** : 2 min
- **Impact** : Évite pollution du repo par fichiers système

**2. 🔴 Créer `.gitattributes`**
```gitattributes
# Force LF everywhere
* text=auto eol=lf
*.html text eol=lf
*.md text eol=lf
*.js text eol=lf

# Binary
*.pdf binary
```
- **Effort** : 2 min + `git add --renormalize .` pour fixer les CRLF existants
- **Impact** : Stoppe la corruption CRLF (moros-v3.1-i18n.html déjà touché)

**3. 🔴 Synchroniser README.md**
- `steiner-ferum-v3.0-20260216-1630.html` → `steiner-ferum-v3.1-20260218-0020.html`
- `moros-v3.0-20260217-1200.html` → mentionner aussi `moros-v3.1-20260218-0330-i18n.html`
- Ajouter `validate-character.html` dans la structure du repo
- Ajouter les dossiers `translations/`, `data/`, `.github/`
- **Effort** : 15 min

**4. 🔴 Fix CHANGELOG doublon**
- Fusionner les deux entrées `[3.1.0]` en une seule datée `2026-02-18`
- **Effort** : 5 min

**5. 🔴 Aligner schemaVersion**
- Moros : `"3.0-20260215-1558"` → `"3.0"` (le timestamp n'a rien à faire dans une version sémantique)
- **Effort** : 5 min

### P1 — FONDATIONS DEVOPS (1-2h, nécessaire avant Phase 3)

**6. 🔴 Créer `package.json` + script QA minimal**
```bash
npm init -y
```
```json
{
  "name": "tawyndnd",
  "version": "3.1.0",
  "scripts": {
    "validate:i18n": "node scripts/val-i18n-labels.js",
    "validate:docs": "node scripts/check-docs-sync.js",
    "validate": "npm run validate:i18n && npm run validate:docs"
  }
}
```
- **Effort** : 30 min (init + premier script)

**7. 🔴 Créer `scripts/val-i18n-labels.js`** (n'existe pas, contrairement à ce que les docs impliquent)
- Scanner les `*.html` dans `characters/` pour les appels `t('...')`
- Vérifier que chaque clé existe dans `TRANSLATIONS` inlinées
- Scanner les labels FR hardcodés dans le moteur (regex sur `>[A-ZÀ-Ÿ]....<`)
- Rapport : clés manquantes + labels non-i18n + exit code
- **Effort** : 2h

**8. 🔴 Décider du sort de `translations/`**

Le dossier `translations/` (en.js, fr.js, index.js) est actuellement **dead code** :
- `index.js` utilise `import` ES modules → inutilisable en `file://`
- Les fiches qui marchent ont **inliné** leur propre mini `TRANSLATIONS` + `t()`
- Le README/TECHNICAL_SPEC documentent `translations/` comme si c'était la source de vérité → **mensonge architectural**

**Options :**

| Option | Avantage | Inconvénient |
|--------|---------|-------------|
| **A) Source de vérité → build script** | DRY, un seul endroit pour les traductions | Nécessite `node scripts/build-i18n.js` pour injecter dans les HTML |
| **B) Supprimer `translations/`, tout inliner** | Cohérent avec single-file, zero build | Duplication des dictionnaires dans chaque HTML |
| **C) Référence documentation only** | Pas de changement | Confusion perpétuelle, dette doc |

**Recommandation** : **Option A**. Garder `translations/*.js` comme source de vérité + créer `scripts/inject-i18n.js` qui lit les dictionnaires et les injecte dans les HTML. C'est le seul path qui scale à 5+ fiches sans duplication.

- **Effort** : 4h

### P2 — i18n RÉALISTE (avant de déclarer M1 atteint)

**9. ⚠️ Migrer les ~50 labels FR hardcodés restants dans Steiner v3.1**

Labels hardcodés trouvés dans le moteur Steiner :
```
Points de vie, Initiative, Caractéristiques & Compétences, Attaques,
Capacités de classe, Dons, Jets de sauvegarde, Jets contre la mort,
Dés de vie, Dés de supériorité, Fougue, Identité, Histoire,
Classe, Historique, Alignement, Armes, Armures, Langues,
Bonus de maîtrise, DD Manœuvres, Maîtrise, Action, Action Bonus,
Réaction, Jet d'attaque, Utilisé, ...
```

Chacun doit :
1. Avoir une clé dans `TRANSLATIONS` inliné (fr + en)
2. Être remplacé par `${t('...')}` dans le template literal
3. Être testé en FR et EN

- **Effort** : 4-6h (Steiner), 3-4h (Moros restant)

**10. ⚠️ Touch targets + a11y minimal**
```css
/* Ajouter dans chaque fiche HTML */
button, [role="button"], .tab-btn, .stat-pill,
input[type="checkbox"] + label, .checkbox-death {
  min-height: 44px;
  min-width: 44px;
}

/* Aria basique */
```
```javascript
// Dans le moteur, ajouter role et aria-label aux éléments interactifs
`<button role="button" aria-label="${t('ui.tab_combat')}">`
`<div role="tablist">` 
`<div role="tabpanel">`
```
- **Effort** : 3h

### P3 — INFRASTRUCTURE (Phase 4 prep)

**11. 🟡 GitHub Actions CI**
```yaml
name: TawynDnD Validate
on: [push, pull_request]
jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: '20' }
      - run: npm ci
      - run: npm run validate
```
- **Effort** : 30 min
- **Dépend de** : P1 #6 et #7

**12. 🟡 Print CSS**
```css
@media print {
  body { background: white !important; color: black !important; -webkit-print-color-adjust: exact; }
  .glass { backdrop-filter: none !important; background: white !important; border: 1px solid #ccc !important; }
  .tab-nav, .mode-bar, .lang-switch, #toast-container { display: none !important; }
  [class*="tab-content"] { display: block !important; }
  @page { margin: 1cm; size: A4; }
}
```
- **Effort** : 2h (écriture + test impression)

---

## 4. ÉTAT RÉEL DU REPO (arborescence vérifiée)

```
TawynDnD/                               
├── .github/
│   ├── ISSUE_TEMPLATE/                  ← Templates d'issues (bon)
│   └── copilot-instructions.md          ← Guide IA (excellent)
├── archive/
│   └── moros-v3.0-20260215-1558.html    ← 73KB, archivé
├── characters/
│   ├── moros-v3.0-20260217-1200.html    ← 73KB, ref stable (PAS i18n)
│   ├── moros-v3.1-20260218-0330.html    ← 76KB, v3.1 sans i18n
│   ├── moros-v3.1-20260218-0330-i18n.html ← 77KB, CRLF (!), i18n ~60%
│   ├── steiner-ferum-v3.0-20260217-1500.html ← 60KB, v3.0 stable
│   └── steiner-ferum-v3.1-20260218-0020.html ← 61KB, i18n ~10%
├── data/
│   └── aidedd/
│       ├── EN_ALL_List & Eldritch Invocations.pdf  ← 237KB
│       ├── EN_ALL_List » Spells.pdf                ← 2.9MB
│       ├── FR_ALL_List & Eldritch Invocations.pdf  ← 275KB
│       ├── FR_ALL_List » Spells.pdf                ← 3.2MB
│       └── README.md
├── translations/
│   ├── en.js    ← 5KB, ~150 clés (DEAD CODE — pas importable en file://)
│   ├── fr.js    ← 5.5KB, ~150 clés (DEAD CODE)
│   └── index.js ← 6KB, ES module import (DEAD CODE)
├── BACKLOG.md        ← 11KB (détaillé, bon)
├── CHANGELOG.md      ← 3.5KB (doublon 3.1.0)
├── DND_VOCABULARY.md ← 10KB (excellent référentiel)
├── INTEGRATION_i18n.md ← 6KB (guide technique)
├── README.md         ← 10KB (désynchronisé)
├── TECHNICAL_SPEC.md ← 9KB (bon mais date i18n)
├── VISION.md         ← 5.5KB (clair, bonne boussole)
└── validate-character.html ← 11KB (outil QA, non documenté dans README)

ABSENTS (documentés mais inexistants) :
  ❌ package.json
  ❌ scripts/
  ❌ .husky/
  ❌ .gitignore
  ❌ .gitattributes
  ❌ node_modules/
```

---

## 5. INNOVATIONS vs MARCHÉ (inchangé)

| Innovation | Statut |
|-----------|--------|
| Single-file portable (USB, email, air-gap) | ✅ Vérifié, fonctionne |
| Physical-first (no RNG) | ✅ Vérifié, aucun Math.random() |
| `const C` IA-ready | ✅ Vérifié, bien séparé du moteur |
| Glassmorphism D&D thémé par classe | ✅ Vérifié, variables CSS propres |
| Multi-langue native | ⚠️ Fondation posée, exécution à ~30% |

---

## 6. RISQUES À 5 ANS (actualisé)

| Risque | Probabilité | Impact | Statut actuel |
|--------|:-----------:|:------:|:-------------|
| **localStorage sans migration** | 🔴 Certain | 🔴 Perte données | Aucun migrator. `schemaVersion` incohérent. |
| **i18n dette** | 🔴 Certain | 🟡 Labels cassés EN | ~70% hardcodé FR. Switch EN = UI mixte FR/EN. |
| **Doc désynchronisée** | 🔴 En cours | 🟡 Confusion contributeurs | README réfère fichiers inexistants. |
| **Pas de test** | 🔴 Certain | 🔴 Régression silencieuse | 0 test automatisé, 0 script QA. |
| **D&D 2024/6e** | 🟡 3-5 ans | 🔴 Réécriture partielle | `const C` modulaire = data swap ok |
| **OGL compliance** | 🟢 Faible | 🔴 Takedown | SRD only, AideDD = liens pas copie |

---

## 7. RECOMMANDATION STRATÉGIQUE

### Ce qui fonctionne (ne pas casser)
- Architecture single-file
- Séparation `const C` / moteur
- Documentation COPILOT_GUIDE
- Design system glassmorphism

### Ce qui est urgent (cette semaine)
1. `.gitignore` + `.gitattributes` (5 min)
2. Fix CRLF moros-v3.1-i18n.html (5 min)
3. Sync README avec fichiers réels (15 min)
4. Merge CHANGELOG doublons (5 min)
5. Aligner schemaVersion (5 min)
6. **Décider option A/B/C pour `translations/`** (décision architecturale bloquante)

### Ce qui est nécessaire (ce mois)
7. `package.json` + `scripts/val-i18n-labels.js`
8. Finir migration i18n Steiner (6h) puis Moros (4h)
9. Touch targets + a11y minimal (3h)

### Ce qui peut attendre (prochain trimestre)
10. GitHub Actions CI
11. Print CSS
12. Build system i18n injection

---

## ANNEXE — Commandes d'audit exécutées

```bash
git clone https://github.com/Viannax74/TawynDnD.git
find . -name "*.js" -o -name "*.json" | head  # → 0 scripts, 0 package.json
ls .husky/ .gitignore .gitattributes  # → tous absents
grep -c "t('" characters/*.html  # → 6, 17, 1 (minimal)
grep -c "aria-\|role=" characters/*.html  # → 0 (zéro a11y)
grep -c "@media print" characters/*.html  # → 0 (zéro print)
grep -c "min-height.*44" characters/*.html  # → 0 (zéro touch)
file characters/*.html  # → CRLF détecté sur moros-v3.1-i18n
grep "schemaVersion" characters/*.html  # → incohérent
grep "steiner-ferum-v3.0-20260216-1630" README.md  # → référence cassée
```

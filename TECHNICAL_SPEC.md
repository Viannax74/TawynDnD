# TawynDnD — Spécification Technique v3.0
**Last Updated:** 17 février 2026  
**Status:** ✅ Production Ready — Référence pour GitHub Copilot GPT-4.1

---

## ⚡ TL;DR pour GitHub Copilot

> Lis cette section EN PREMIER avant toute modification de code.

1. **Une fiche = un fichier HTML.** Tout est dans un seul `.html`. Ne pas créer de fichiers séparés JS ou CSS.
2. **`const C` = données seules.** Modifier uniquement ce bloc pour changer un personnage.
3. **Steiner ≠ Moros.** Steiner est un guerrier martial sans sorts. Ne pas lui ajouter de section sorts.
4. **`schemaVersion` ne change pas** à moins d'une migration de schéma explicitement demandée.
5. **Le moteur de rendu vient après `const C`** dans le même `<script>`. Ne pas déplacer, ne pas externaliser.

---

## 🏗️ Architecture Stack

### Technologies
- **Pure ES6+ Vanilla JavaScript** — Aucun framework, aucune dépendance npm
- **HTML5 Single-File Applications** — Chaque fiche est un `.html` autosuffisant
- **CSS3 Custom Properties** — Thème configurable via variables CSS dans `:root`
- **LocalStorage API** — Persistance côté client pour l'état volatile (PV, slots, ressources)
- **Google Fonts** — Seule dépendance externe (Inter, Space Grotesk, JetBrains Mono)

### Principes d'Architecture
1. **Local First** — Aucune dépendance serveur, fonctionne 100% offline
2. **Physical First** — Champs de saisie manuelle, pas de RNG
3. **Mobile-First Responsive** — Breakpoint prioritaire : 360–430px (Galaxy S23 Ultra)
4. **Glassmorphism UI** — Dark theme avec `backdrop-filter: blur()`
5. **IA-Ready Separation** — `const C` (données) physiquement séparé du moteur de rendu dans le même fichier

---

## 📐 Schéma de Données `const C`

### Version de Schéma
Le champ `schemaVersion` suit le format `"MAJOR.MINOR"` :
- `"3.0"` — Schéma actuel, stable
- Ne pas modifier ce champ lors d'une mise à jour de données personnage
- Ne modifier que lors d'une migration de schéma (breaking change)

### Structure Minimale Requise (toutes classes)
```javascript
const C = {
  "schemaVersion": "3.0",
  "id": "identifiant-unique",          // kebab-case
  "name": "Prénom Nom",
  "level": 8,
  "class": "fighter",                  // slug anglais
  "class_fr": "Guerrier",              // Nom français officiel
  "subclass": "battle_master",         // slug anglais
  "subclass_fr": "Maître de guerre",
  "background": "Soldat",
  "race": "mountain_dwarf",
  "race_fr": "Nain des montagnes",
  "alignment": "Loyal Bon",

  // Scores de caractéristiques (entiers bruts, pas les modificateurs)
  "str": 19, "dex": 12, "con": 16,
  "int": 8,  "wis": 13, "cha": 10,

  // Combat
  "ac": 19,
  "hp_max": 76,
  "speed": 25,

  // Bloc stats détaillé
  "stats": { ... },
  
  // Caracteristiques détaillées (scores + modifiers + labels)
  "abilities": { ... },

  // Compétences
  "skills": [ ... ],

  // Attaques
  "attacks": [ ... ],

  // Traits raciaux
  "racial_traits": [ ... ],

  // Dons
  "feats": [ ... ],

  // Équipement
  "equipment": [ ... ]
};
```

### Extensions par Classe

#### Guerrier Maître de Guerre (Steiner) — Champs supplémentaires
```javascript
// Ajouter dans const C :
"maneuvers": [
  {
    "name": "Riposte",
    "type": "reaction",          // "action" | "bonus" | "reaction"
    "type_fr": "Réaction",
    "desc": "Description de la manœuvre."
  }
],
"class_features": [
  {
    "name": "Action Surge",
    "desc": "1 action supplémentaire. 1×/repos court."
  }
],
// stats.martial_dice      = nombre de dés de supériorité (entier)
// stats.martial_dice_type = "d6" | "d8" | "d10" | "d12"
// stats.dc                = DD des manœuvres (8 + prof + STR ou DEX)
```

#### Occultiste (Moros) — Champs supplémentaires
```javascript
// Ajouter dans const C :
"spells": [
  {
    "name_fr": "Bourrasque des lames",
    "level": 1,
    "school": "Évocation",
    "time": "1 action",
    "range": "Contact",
    "components": "V, S",
    "duration": "Instantané",
    "description_fr": "Description complète..."
  }
],
"invocations": [ ... ],
"hex_slots": 1,        // Charges de Malédiction
"pact_slots": 2,       // Emplacements de sort du pacte
"pact_slot_level": 3   // Niveau des emplacements
```

---

## 🎨 CSS Architecture

### Variables Système (`:root`) — NE PAS MODIFIER via Copilot sans instruction explicite
```css
:root {
  /* Backgrounds — Spécifiques à la classe */
  --bg-primary:   #140a00;          /* Steiner: rouge sombre | Moros: #0a0014 violet */
  --bg-secondary: #2e1408;
  --bg-tertiary:  #4e2b1b;
  --bg-glass:     rgba(46, 20, 8, 0.72);

  /* Accent — UNE COULEUR PAR CLASSE */
  --accent:       #ef4444;          /* Rouge pour Guerrier */
  --accent-light: #f87171;
  --accent-pale:  #fecaca;
  --accent-rgb:   239, 68, 68;

  /* Texte — Identique pour toutes les classes */
  --text-1: #f8fafc;
  --text-2: #cbd5e1;
  --text-3: #94a3b8;

  /* Typographie */
  --font-body:    'Inter', system-ui, sans-serif;
  --font-display: 'Space Grotesk', 'Inter', sans-serif;
  --font-mono:    'JetBrains Mono', monospace;
}
```

### Responsive Breakpoints
```css
/* Mobile Priority (cible principale) */
@media (max-width: 430px) { }   /* Galaxy S23 Ultra: 384px × 854px */

/* Tablet */
@media (min-width: 768px) { }

/* Desktop */
@media (min-width: 1200px) { }
```

---

## 💾 État Volatile (localStorage)

Ces clés sont dynamiques et gérées par le moteur de rendu. L'IA ne les modifie PAS dans `const C`.

| Clé localStorage | Type | Description |
|-----------------|------|-------------|
| `[id]_hp_current` | number | PV actuels |
| `[id]_temp_hp` | number | PV temporaires |
| `[id]_spell_slots` | object | Emplacements restants par niveau |
| `[id]_martial_dice` | number | Dés de supériorité restants (Steiner) |
| `[id]_resources` | object | Ressources limitées (Second Souffle, etc.) |

`[id]` = valeur de `C.id` (ex: `steiner-ferum_hp_current`)

---

## 🔄 Instructions de Migration

### Mettre à jour un personnage (sans changer le schéma)
1. Ouvrir le fichier `.html` du personnage
2. Localiser le bloc `const C = { ... };` dans la balise `<script>`
3. Modifier UNIQUEMENT les valeurs dans ce bloc
4. Ne pas toucher au code après `const C`
5. Sauvegarder — le moteur de rendu applique automatiquement les nouvelles données

### Créer une nouvelle fiche (depuis un template)
1. Copier `characters/steiner-ferum-v3.0-20260216-1630.html` (template martial) OU `characters/moros-v3.0-20260217-1200.html` (template lanceur de sorts)
2. Renommer : `characters/[personnage]-v3.0-[YYYYMMDD]-[HHMM].html`
3. Modifier `const C` avec les nouvelles données
4. Ajuster `--accent` et `--bg-primary` dans `:root` pour la couleur de classe
5. Valider visuellement sur mobile

### Convention de nommage des fichiers
```
[nom-kebab]-v[MAJOR.MINOR]-[YYYYMMDD]-[HHMM].html

Exemples :
moros-v3.0-20260217-1200.html
steiner-ferum-v3.0-20260216-1630.html
```

---

## ❌ Anti-Patterns — Ce que Copilot NE DOIT PAS faire

```
❌ Créer un fichier engine.js ou render.js séparé
❌ Importer const C depuis un fichier externe
❌ Ajouter une section <spells> à la fiche Steiner (classe martiale sans sorts)
❌ Modifier le schemaVersion sans instruction explicite de migration
❌ Utiliser localStorage directement dans const C
❌ Créer des animations RNG ou simulateurs de dés
❌ Ajouter des dépendances npm ou CDN autres que Google Fonts
❌ Copier le moteur de Moros tel quel sur Steiner (architectures différentes)
```

---

## ✅ Patterns Corrects pour Copilot

```
✅ Modifier const C pour mettre à jour stats, attaques, manœuvres, équipement
✅ Ajouter des entrées dans C.maneuvers, C.attacks, C.equipment, C.feats
✅ Ajuster les variables CSS dans :root pour changer le thème
✅ Utiliser les clés localStorage avec le préfixe C.id
✅ Respecter la typographie française (termes AideDD officiels)
✅ Tester les modifications sur mobile (384px de large)
```

---

## 📋 Conformité

Toute modification de cette spécification doit être accompagnée d'une mise à jour du `schemaVersion` dans `DND_VOCABULARY.md` et d'une entrée dans `CHANGELOG.md`.

---

#### Integration i18n (norme)

- Toute UI, moteur ou fiche doit utiliser t() pour tous labels ou contenus dynamiques.
- Convention de nommage : dot notation (ex : ui.hp, skills.perception).
- Fallback automatique EN si non traduit

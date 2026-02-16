---
**TawynDnD Technical Specification v3.0**  
**Last Updated:** 15 février 2026 à 15:58  
**Status:** ✅ Production Ready  
---

## 🏗️ Architecture Stack

### Core Technologies
- **Pure ES6+ Vanilla JavaScript** — No frameworks, no dependencies
- **HTML5 Single-File Applications** — Each character sheet is a self-contained `.html` file
- **CSS3 Custom Properties** — Theme-able design system via CSS variables
- **LocalStorage API** — Client-side persistence for volatile state (HP, spell slots, resources)

### Design Principles
1. **Local First** — No server dependencies, works 100% offline
2. **Physical First** — Manual dice input fields, no random number generation
3. **Mobile-First Responsive** — Optimized for Galaxy S23 Ultra (360px–430px width)
4. **Glassmorphism UI** — Dark theme with backdrop-filter blur effects
5. **IA-Ready Separation** — `const C` (data) completely decoupled from rendering engine

---

## 📐 Data Schema

### Données Immuables (`const C`)
- Doit inclure un champ `schemaVersion: "3.0-20260215-1558"`
- Structure minimale requise:
```javascript
const C = {
  schemaVersion: "3.0-20260215-1558",
  name: "Nom du Personnage",
  level: 6,
  class_fr: "Classe",
  race_fr: "Race",
  // Caractéristiques (Abilities)
  str: 10, dex: 14, con: 12, int: 8, wis: 13, cha: 16,
  // Combat
  ac: 15,
  hp_max: 48,
  speed: 30,
  // Sorts (si applicable)
  spells: [
    { 
      name_fr: "Nom du Sort",
      level: 1,
      school: "Abjuration", // École de magie
      time: "1 action",
      range: "Contact",
      components: "V, S, M",
      duration: "Instantané",
      description_fr: "Description complète..."
    }
  ]
};
```

### État Volatil (localStorage)
Variables changeantes stockées via `localStorage.setItem()`:
- `hp_current` — Points de vie actuels
- `temp_hp` — Points de vie temporaires
- `spell_slots_remaining` — Emplacements de sorts disponibles
- `resources` — Capacités limitées (Second Souffle, Malédiction, etc.)

---

## 🎨 CSS Architecture

### Variables Système (`:root`)
```css
:root {
  /* Backgrounds */
  --bg-primary: #0a0014;
  --bg-glass: rgba(26, 10, 46, 0.72);
  
  /* Accent — Modifier par classe */
  --accent: #a855f7; /* Violet pour Occultiste */
  --accent-light: #c084fc;
  
  /* Text */
  --text-1: #f8fafc;
  --text-2: #cbd5e1;
  
  /* Fonts */
  --font-body: 'Inter', system-ui, sans-serif;
  --font-display: 'Space Grotesk', 'Inter', sans-serif;
  --font-mono: 'JetBrains Mono', monospace;
}
```

### Responsive Breakpoints
- **Mobile Priority**: 360px–430px (Galaxy S23 Ultra: 384px × 854px)
- **Tablet**: 768px–1024px
- **Desktop**: 1200px+

---

## 🔄 Migration v2.x → v3.0

### Script de Migration Automatique

```javascript
/**
 * Migration automatique d'un personnage v2.x vers v3.0
 * @param {Object} oldChar - Ancien objet personnage (v2.x)
 * @returns {Object} - Nouvel objet personnage (v3.0)
 */
function migrateToV3(oldChar) {
  const newChar = {
    schemaVersion: "3.0-20260215-1558",
    name: oldChar.name || "Unnamed Character",
    level: oldChar.level || 1,
    class_fr: oldChar.class || oldChar.class_fr || "Guerrier",
    race_fr: oldChar.race || oldChar.race_fr || "Humain",
    
    // Caractéristiques
    str: oldChar.str || oldChar.STR || 10,
    dex: oldChar.dex || oldChar.DEX || 10,
    con: oldChar.con || oldChar.CON || 10,
    int: oldChar.int || oldChar.INT || 10,
    wis: oldChar.wis || oldChar.WIS || 10,
    cha: oldChar.cha || oldChar.CHA || 10,
    
    // Combat
    ac: oldChar.ac || oldChar.AC || 10,
    hp_max: oldChar.hp_max || oldChar.hpMax || 20,
    speed: oldChar.speed || 30,
    
    // Sorts (normalisation format AideDD)
    spells: (oldChar.spells || []).map(spell => ({
      name_fr: spell.name || spell.name_fr || "Sort inconnu",
      level: spell.level || 0,
      school: spell.school || "Évocation",
      time: spell.castingTime || spell.time || "1 action",
      range: spell.range || "Contact",
      components: spell.components || "V, S",
      duration: spell.duration || "Instantané",
      description_fr: spell.description || spell.description_fr || ""
    }))
  };
  
  return newChar;
}

// Exemple d'utilisation
const oldMoros = { name: "Moros", class: "Warlock", level: 6, STR: 8, DEX: 14 };
const newMoros = migrateToV3(oldMoros);
console.log(newMoros.schemaVersion); // "3.0-20260215-1558"
```

### Étapes Manuelles Recommandées
1. **Backup** — Exporter l'ancien personnage en JSON avant migration
2. **Validation** — Utiliser `validate-character.html` pour vérifier la conformité
3. **Test** — Ouvrir la fiche migrée et vérifier toutes les sections (Stats, Combat, Sorts)
4. **localStorage** — Effacer les anciennes clés si changement de structure

---

## 🛠️ Outils de Développement

### `validate-character.html`
Validateur local autonome pour vérifier la conformité d'un objet `const C` au schéma v3.0.

**Usage:**
```javascript
// Dans la console du navigateur
const testChar = { schemaVersion: "3.0-20260215-1558", name: "Test" };
validateCharacter(testChar); // Retourne true ou false
```

### Ajout d'un Nouveau Personnage
1. Copier un fichier HTML existant (ex: `characters/moros-v3.0-20260215-1558.html`)
2. Modifier l'objet `const C` avec les nouvelles données
3. Ajuster les variables CSS `:root` pour l'accent de classe
4. Valider avec `validate-character.html`

---

## 🚀 Roadmap Technique

### Version Actuelle: v3.0
- ✅ Schéma de données standardisé
- ✅ Moteur de rendu glassmorphism
- ✅ Support mobile Galaxy S23 Ultra
- ✅ Validation automatique `schemaVersion`

### Prochaines Versions
- **v3.1** — Filtres de sorts avancés (École, Niveau, Type d'action)
- **v3.2** — Internationalisation (i18n) Français/Anglais
- **v3.3** — Inventaire interactif avec gestion du poids
- **v4.0** — Export/Import JSON + PWA (Progressive Web App)

---

**Conformité:** Toute modification de cette spécification doit être accompagnée d'une mise à jour du `schemaVersion` dans `DND_VOCABULARY.md`.

# 🤖 Instructions Copilot — TawynDnD

## ⚡ 5 Règles Absolues
1. **Single-File** — Une fiche = un `.html` (HTML + CSS + JS + `const C`). Jamais de fichier externe.
2. **Zone autorisée** — Ne modifier que `const C = {...};`. Ne pas toucher au CSS/HTML/moteur JS.
3. **Physical First** — Pas de RNG. Champs `<input>` pour saisie manuelle des dés.
4. **`schemaVersion`** — Ne change que sur demande explicite de migration.
5. **Vanilla JS** — Aucun framework, aucun npm. Seule dépendance : Google Fonts.

## 📁 Structure du Repo
```
TawynDnD/
├── .github/copilot-instructions.md  ← CE FICHIER (source de vérité IA)
├── README.md                        ← Intro humaine (10 lignes)
├── characters/
│   └── moros-v3.1-20260218-0330-i18n.html  ← SEULE fiche active
└── archive/                         ← Anciennes versions, NE PAS MODIFIER
```

## 🎯 Fiche Active : Moros (Occultiste Lame Maudite)
- **Fichier :** `characters/moros-v3.1-20260218-0330-i18n.html`
- **Thème CSS :** `--accent: #a855f7` (violet)
- **Spécificités :** Sorts, Invocations, Malédiction, Emplacements de pacte
- **i18n :** Traductions FR inlinées via fonction `t()` dans le même fichier

## 📐 Schéma `const C` (structure minimale)
```js
const C = {
  schemaVersion: string,       // "3.0-YYYYMMDD-HHMM" — ne changer que sur migration
  id: string,                  // "moros-gravewalker" — clé localStorage
  name: string, level: number, class: string, class_fr: string,
  subclass: string, subclass_fr: string,
  background: string, race: string, alignment: string,
  avatar: string,              // URL (dicebear ou personnalisée)
  stats: {
    ac: number, init: number, speed: string, prof: number,
    dc: number, spell_atk: number, hp_max: number, hit_dice: string,
    slots_level: number, slots_total: number   // emplacements de pacte
  },
  abilities: {                 // clés : cha dex con int wis str
    [key]: { score: number, mod: number, label: string, abbr: string }
  },
  abilities_order: string[],
  passive_perception: number,
  saving_throws: { [key]: { prof: boolean, bonus: number } },
  skills:       [{ name: string, ability: string, prof: boolean, bonus: number }],
  attacks:      [{ name: string, type: string, bonus: number, damage: string,
                   damage_alt?: string, type_dmg: string, tags: string[],
                   range: string, dice: string, flat: number, desc: string }],
  invocations:  [{ name: string, desc: string, tags?: string[], pre?: string }],
  class_features:      [{ name: string, desc: string }],
  background_features: [{ name: string, desc: string, tags?: string[] }],
  personality:  { trait: string, ideal: string, bond: string, flaw: string },
  backstory:    string,
  proficiencies: { armor: string, weapons: string, tools: string, languages: string },
  equipment:    [{ name: string, cat: string, qty: number, editable: boolean }]
};
```

## 💾 localStorage
| Clé | Type | Description |
|-----|------|-------------|
| `tawyndnd-language` | `string` | Langue active : `'fr'` ou `'en'` |
| `tawyndnd-${C.id}-v3` | `JSON` | État complet (objet ci-dessous) |
| ↳ `hp` | `number` | Points de vie actuels |
| ↳ `hp_temp` | `number` | PV temporaires (ex. Armure d'Agathys) |
| ↳ `slots_used` | `number` (0–`slots_total`) | Emplacements de pacte utilisés |
| ↳ `hex_curse` | `boolean` | Malédiction Hexblade dispo (1/repos court) |
| ↳ `specter` | `boolean` | Spectre maudit dispo (1/repos long) |
| ↳ `death_saves` | `{successes,failures}` | Jets de mort (0–3 chacun) |
| ↳ `inspiration` | `boolean` | Inspiration disponible |
| ↳ `inv_qty` | `{[name]:number}` | Quantités inventaire modifiées |

## ❌ Anti-Patterns (ne JAMAIS faire)
- Créer engine.js ou styles.css séparés
- Ajouter des sorts à un Guerrier
- Utiliser import/export ES6 (incompatible file://)
- Modifier schemaVersion sans demande explicite
- Ajouter React, Vue, npm, CDN (sauf Google Fonts)

## 🔭 Vision Long Terme (contexte, pas une tâche)
Phase actuelle : fiches manuelles Single-File.
Objectif final : Character Builder qui parse XML AideDD → génère HTML Single-File.
Quand le Builder sera développé, on créera : `scripts/`, `templates/`, `data/`.
D'ici là, ces dossiers N'EXISTENT PAS et ne doivent PAS être créés.

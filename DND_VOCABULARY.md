# 📜 Vocabulaire Technique & Mapping (AideDD ↔ D&D API)

Ce document sert de référence unique pour le moteur **TawynDnD**. Il assure la cohérence entre les données brutes (souvent en anglais ou issues d'APIs) et l'interface utilisateur (en français, style AideDD).

---

## 1. Caractéristiques (Abilities)

| Clé (API/Code) | Label FR (Interface) | Abréviation |
| :--- | :--- | :--- |
| `str` | Force | FOR |
| `dex` | Dextérité | DEX |
| `con` | Constitution | CON |
| `int` | Intelligence | INT |
| `wis` | Sagesse | SAG |
| `cha` | Charisme | CHA |

---

## 2. Types d'Actions & Temps d'Incantation

| Clé (dnd5eapi) | Valeur FR (AideDD) | Tag CSS |
| :--- | :--- | :--- |
| `action` | 1 action | `tag-action` |
| `bonus action` | 1 action bonus | `tag-bonus` |
| `reaction` | 1 réaction | `tag-reaction` |
| `1 minute` | 1 minute | `tag-utilitaire` |
| `10 minutes` | 10 minutes | `tag-utilitaire` |
| `1 hour` | 1 heure | `tag-utilitaire` |

---

## 3. Écoles de Magie (Magic Schools)

| Clé (Code) | Valeur FR |
| :--- | :--- |
| `abjuration` | Abjuration |
| `conjuration` | Invocation |
| `divination` | Divination |
| `enchantment` | Enchantement |
| `evocation` | Évocation |
| `illusion` | Illusion |
| `necromancy` | Nécromancie |
| `transmutation` | Transmutation |

---

## 4. Compétences (Skills)

| Clé Code (camelCase) | Nom FR | Caractéristique |
| :--- | :--- | :--- |
| `acrobatics` | Acrobaties | DEX |
| `animalHandling` | Dressage | SAG |
| `arcana` | Arcanes | INT |
| `athletics` | Athlétisme | FOR |
| `deception` | Tromperie | CHA |
| `history` | Histoire | INT |
| `insight` | Intuition | SAG |
| `intimidation` | Intimidation | CHA |
| `investigation` | Investigation | INT |
| `medicine` | Médecine | SAG |
| `nature` | Nature | INT |
| `perception` | Perception | SAG |
| `performance` | Représentation | CHA |
| `persuasion` | Persuasion | CHA |
| `religion` | Religion | INT |
| `sleightOfHand` | Escamotage | DEX |
| `stealth` | Discrétion | DEX |
| `survival` | Survie | SAG |

---

## 5. Composantes & Tags Speciaux

| Clé | Signification |
| :--- | :--- |
| `V` | Verbal |
| `S` | Somatique |
| `M` | Matériel |
| `C` | Concentration |
| `R` | Rituel |

---

## 6. Structure JSON "Universal C" (Spécification)

Toute IA générant un personnage pour TawynDnD doit suivre cette structure pour l'objet `const C` :

```javascript
const C = {
  id: "identifiant-unique",
  name: "Nom du Héros",
  level: 6,
  class_fr: "Classe en FR",
  subclass_fr: "Sous-classe en FR",
  stats: {
    ac: 18,
    init: 2,
    speed: "9 m",
    prof: 3,
    dc: 15,
    spell_atk: 7
  },
  abilities: {
    cha: { score: 18, mod: 4, label: "Charisme", abbr: "CHA" }
  },
  spells: [
    {
      name_fr: "Nom",
      level: 0,
      school: "école",
      time: "temps",
      range: "portée",
      comp: "V, S",
      conc: false,
      desc: "Description HTML supportée"
    }
  ],
  features: [
    { name: "Nom", tags: ["action", "offensif"], desc: "Détails" }
  ]
};
```
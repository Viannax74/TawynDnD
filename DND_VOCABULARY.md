---
**Version** : 3.0-20260215-1615  
**Dernière mise à jour** : 15 février 2026 à 16:15  
**Statut** : ✅ Stable (Production)  
**Changelog** : Voir [CHANGELOG.md](./CHANGELOG.md)

> ⚠️ **Règle de versioning :**  
> - **v3.0.x** (x+1) : Modification < 200 caractères  
> - **v3.x** (x+1) : Modification ≥ 200 caractères  
> - **v4.0** : Changements majeurs (breaking changes)
> 
> ⚠️ **Toute modification de ce document nécessite une mise à jour du `schemaVersion` dans `const C`**
---

# 📖 D&D 5e Vocabulary & Schema Definition

Ce document définit le vocabulaire technique officiel utilisé dans l'objet `const C` du projet TawynDnD, basé sur les références **AideDD** (français) et **D&D Beyond** (anglais).

## 1. Caractéristiques (Abilities)
Utiliser les abréviations de 3 lettres en majuscules pour les clés.

| Clé | Français | Anglais |
| :--- | :--- | :--- |
| `STR` | Force | Strength |
| `DEX` | Dextérité | Dexterity |
| `CON` | Constitution | Constitution |
| `INT` | Intelligence | Intelligence |
| `WIS` | Sagesse | Wisdom |
| `CHA` | Charisme | Charisma |

## 2. Compétences (Skills)
Le niveau de maîtrise est défini par un entier : `0` (Non-maîtrisé), `1` (Maîtrisé), `2` (Expertise).

| Clé (const C) | Français |
| :--- | :--- |
| `acrobatics` | Acrobaties |
| `animal_handling` | Dressage |
| `arcana` | Arcanes |
| `athletics` | Athlétisme |
| `deception` | Tromperie |
| `history` | Histoire |
| `insight` | Intuition |
| `intimidation` | Intimidation |
| `investigation` | Investigation |
| `medicine` | Médecine |
| `nature` | Nature |
| `perception` | Perception |
| `performance` | Représentation |
| `persuasion` | Persuasion |
| `religion` | Religion |
| `sleight_of_hand` | Escamotage |
| `stealth` | Discrétion |
| `survival` | Survie |

## 3. Écoles de Magie (Spell Schools)
| Clé | Français | Anglais |
| :--- | :--- | :--- |
| `abjuration` | Abjuration | Abjuration |
| `conjuration` | Invocation | Conjuration |
| `divination` | Divination | Divination |
| `enchantment` | Enchantement | Enchantment |
| `evocation` | Évocation | Evocation |
| `illusion` | Illusion | Illusion |
| `necromancy` | Nécromancie | Necromancy |
| `transmutation` | Transmutation | Transmutation |

## 4. Temps d'incantation (Casting Time)
| Valeur technique | Français |
| :--- | :--- |
| `action` | 1 action |
| `bonus_action` | 1 action bonus |
| `reaction` | 1 réaction |
| `minute` | X minute(s) |
| `hour` | X heure(s) |
| `ritual` | Rituel |

## 5. Composantes (Components)
Tableau de chaînes de caractères : `["V", "S", "M"]`.
Si `M`, préciser le coût ou la consommation dans un champ `material_description`.

## 6. Structure de l'objet `const C` (v3.0)

```javascript
const C = {
  // META
  schemaVersion: "3.0",
  characterId: "moros_2026",
  
  // IDENTITÉ
  name: "Moros Gravewalker",
  race_fr: "Humain",
  class_fr: "Occultiste",
  subclass_fr: "Lame Maudite",
  level: 6,
  xp: 14000,
  
  // CARACTÉRISTIQUES (Valeurs brutes)
  abilities: {
    STR: 10, DEX: 14, CON: 16, INT: 10, WIS: 12, CHA: 18
  },
  
  // MAÎTRISES
  proficiencies: {
    skills: { perception: 1, arcana: 1, intimidation: 2 },
    saving_throws: ["WIS", "CHA"],
    languages: ["Commun", "Profond"]
  },
  
  // COMBAT (Statique)
  ac_base: 15,
  speed: 9, // en mètres
  hit_dice_type: "d8",
  
  // SORTS (AideDD format)
  spells: [
    {
      name_fr: "Décharge occulte",
      name_en: "Eldritch Blast",
      level: 0,
      school: "evocation",
      time: "action",
      range: "36m",
      components: ["V", "S"],
      duration: "Instantanée",
      description_fr: "Un rayon d'énergie crépitante..."
    }
  ],
  
  // ÉQUIPEMENT
  inventory: [
    { name: "Potion de soin", qty: 2, weight: 0.25, rarity: "commune" }
  ]
};
```

## 7. Règles de Saisie "Physical First"
TawynDnD n'utilise pas de RNG. Les champs de l'interface doivent correspondre à :
- **Entrée** : Résultat du dé physique (ex: 17).
- **Calcul** : Entrée + Modificateur (ex: 17 + 4 = 21).
- **Log** : Historique des entrées pour vérification RP.
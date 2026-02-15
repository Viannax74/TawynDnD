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
| `bonus_action` | 1 action bonus | `tag-bonus` |
| `reaction` | 1 réaction | `tag-reaction` |
| `1 minute` | 1 minute | `tag-utilitaire` |
| `10 minutes` | 10 minutes | `tag-utilitaire` |
| `1 hour` | 1 heure | `tag-utilitaire` |
| `8 hours` | 8 heures | `tag-utilitaire` |
| `12 hours` | 12 heures | `tag-utilitaire` |
| `24 hours` | 24 heures | `tag-utilitaire` |

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

| Clé API (snake_case) | Clé Code (camelCase) | Nom FR | Caractéristique |
| :--- | :--- | :--- | :--- |
| `acrobatics` | `acrobatics` | Acrobaties | DEX |
| `animal_handling` | `animalHandling` | Dressage | SAG |
| `arcana` | `arcana` | Arcanes | INT |
| `athletics` | `athletics` | Athlétisme | FOR |
| `deception` | `deception` | Tromperie | CHA |
| `history` | `history` | Histoire | INT |
| `insight` | `insight` | Intuition | SAG |
| `intimidation` | `intimidation` | Intimidation | CHA |
| `investigation` | `investigation` | Investigation | INT |
| `medicine` | `medicine` | Médecine | SAG |
| `nature` | `nature` | Nature | INT |
| `perception` | `perception` | Perception | SAG |
| `performance` | `performance` | Représentation | CHA |
| `persuasion` | `persuasion` | Persuasion | CHA |
| `religion` | `religion` | Religion | INT |
| `sleight_of_hand` | `sleightOfHand` | Escamotage | DEX |
| `stealth` | `stealth` | Discrétion | DEX |
| `survival` | `survival` | Survie | SAG |

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
  id: \"identifiant-unique\",
  name: \"Nom du Héros\",
  level: 6,
  class_fr: \"Classe en FR\",
  subclass_fr: \"Sous-classe en FR\",
  
  stats: {
    ac: 18,
    init: 2,
    speed: \"9 m\",
    prof: 3,
    dc: 15,           // DD des sorts
    spell_atk: 7      // Bonus attaque magique
  },
  
  abilities: {
    str: { score: 10, mod: 0, label: \"Force\", abbr: \"FOR\" },
    dex: { score: 14, mod: 2, label: \"Dextérité\", abbr: \"DEX\" },
    con: { score: 14, mod: 2, label: \"Constitution\", abbr: \"CON\" },
    int: { score: 10, mod: 0, label: \"Intelligence\", abbr: \"INT\" },
    wis: { score: 12, mod: 1, label: \"Sagesse\", abbr: \"SAG\" },
    cha: { score: 18, mod: 4, label: \"Charisme\", abbr: \"CHA\" }
  },

  hp: {
    current: 45,
    max: 45,
    temp: 0
  },

  saves: {
    str: { proficient: false, mod: 0 },
    dex: { proficient: false, mod: 2 },
    con: { proficient: false, mod: 2 },
    int: { proficient: false, mod: 0 },
    wis: { proficient: true, mod: 4 },
    cha: { proficient: true, mod: 7 }
  },

  skills: {
    acrobatics: { proficient: false, expertise: false, mod: 2 },
    animalHandling: { proficient: false, expertise: false, mod: 1 },
    arcana: { proficient: true, expertise: false, mod: 3 },
    athletics: { proficient: false, expertise: false, mod: 0 },
    deception: { proficient: true, expertise: true, mod: 10 },
    history: { proficient: false, expertise: false, mod: 0 },
    insight: { proficient: false, expertise: false, mod: 1 },
    intimidation: { proficient: true, expertise: false, mod: 7 },
    investigation: { proficient: false, expertise: false, mod: 0 },
    medicine: { proficient: false, expertise: false, mod: 1 },
    nature: { proficient: false, expertise: false, mod: 0 },
    perception: { proficient: false, expertise: false, mod: 1 },
    performance: { proficient: false, expertise: false, mod: 4 },
    persuasion: { proficient: false, expertise: false, mod: 4 },
    religion: { proficient: false, expertise: false, mod: 0 },
    sleightOfHand: { proficient: false, expertise: false, mod: 2 },
    stealth: { proficient: false, expertise: false, mod: 2 },
    survival: { proficient: false, expertise: false, mod: 1 }
  },

  resources: [
    { 
      name: \"Emplacements niveau 1\", 
      current: 2, 
      max: 4, 
      recharge: \"long_rest\" 
    }
  ],

  spells: [
    {
      name_fr: \"Trait de feu\",
      name_en: \"Fire Bolt\",
      level: 0,
      school: \"evocation\",
      time: \"action\",
      range: \"36 m\",
      duration_fr: \"Instantanée\",
      comp: \"V, S\",
      conc: false,
      ritual: false,
      damage: \"1d10\",
      damage_type: \"fire\",
      desc: \"Vous lancez un trait de feu...\",
      higher_levels: \"+1d10 aux niveaux 5, 11 et 17\"
    }
  ],

  features: [
    { 
      name: \"Invocation Agonisante\", 
      tags: [\"passif\", \"offensif\"], 
      desc: \"Ajoutez votre modificateur de Charisme...\",
      uses: null
    },
    {
      name: \"Malédiction Hexagonale\",
      tags: [\"action-bonus\", \"offensif\", \"utilitaire\"],
      desc: \"Maudissez une créature...\",
      uses: { 
        current: 1, 
        max: 1, 
        recharge: \"short_rest\"
      }
    }
  ]
};
```

---

## 7. Types de Dégâts (Damage Types)

| Clé (API) | Nom FR | Catégorie |
|:---|:---|:---|
| `acid` | Acide | Élémentaire |
| `bludgeoning` | Contondant | Physique |
| `cold` | Froid | Élémentaire |
| `fire` | Feu | Élémentaire |
| `force` | Force | Arcanique |
| `lightning` | Foudre | Élémentaire |
| `necrotic` | Nécrotique | Sombre |
| `piercing` | Perforant | Physique |
| `poison` | Poison | Naturel |
| `psychic` | Psychique | Mental |
| `radiant` | Radiant | Sacré |
| `slashing` | Tranchant | Physique |
| `thunder` | Tonnerre | Élémentaire |

---

## 8. États (Conditions)

| Clé (API) | Nom FR | Description courte |
|:---|:---|:---|
| `blinded` | Aveuglé | Désavantage attaques, avantage contre |
| `charmed` | Charmé | Ne peut attaquer le charmeur |
| `deafened` | Assourdi | Échoue tests Perception (ouïe) |
| `exhaustion` | Épuisement | Malus cumulatifs (6 niveaux) |
| `frightened` | Effrayé | Désavantage si source visible |
| `grappled` | Agrippé | Vitesse 0 |
| `incapacitated` | Neutralisé | Aucune action/réaction |
| `invisible` | Invisible | Avantage attaques, désavantage contre |
| `paralyzed` | Paralysé | Neutralisé, auto-crit si touché |
| `petrified` | Pétrifié | Immunités multiples, poids x10 |
| `poisoned` | Empoisonné | Désavantage attaques/tests carac. |
| `prone` | À terre | Désavantage attaques, avantage contre |
| `restrained` | Entravé | Vitesse 0, désavantage attaques/DEX |
| `stunned` | Étourdi | Neutralisé, échoue JdS FOR/DEX |
| `unconscious` | Inconscient | À terre, auto-crit si touché |

---

## 9. Portées de Sorts (Ranges)

| Clé (API) | Valeur FR | Notes |
|:---|:---|:---|
| `self` | Personnelle | |
| `touch` | Contact | |
| `5 feet` | 1,5 m | |
| `10 feet` | 3 m | |
| `30 feet` | 9 m | |
| `60 feet` | 18 m | |
| `90 feet` | 27 m | |
| `100 feet` | 30 m | |
| `120 feet` | 36 m | |
| `150 feet` | 45 m | |
| `300 feet` | 90 m | |
| `500 feet` | 150 m | |
| `1 mile` | 1,6 km | |
| `sight` | À vue | |
| `unlimited` | Illimitée | |
| `Self (10-foot radius)` | Personnelle (rayon 3 m) | Parsing requis |
| `Self (15-foot cone)` | Personnelle (cône 4,5 m) | Parsing requis |
| `Special` | Spéciale | Voir description |

---

## 10. Zones d'Effet (Area of Effect)

| Type (API) | Nom FR | Exemple de valeur API | Résultat FR |
|:---|:---|:---|:---|
| `sphere` | Sphère | `{ type: \"sphere\", size: 20 }` | Sphère de 6 m de rayon |
| `cone` | Cône | `{ type: \"cone\", size: 15 }` | Cône de 4,5 m |
| `cube` | Cube | `{ type: \"cube\", size: 10 }` | Cube de 3 m d'arête |
| `cylinder` | Cylindre | `{ type: \"cylinder\", size: 20 }` | Cylindre de 6 m de rayon |
| `line` | Ligne | `{ type: \"line\", size: 60 }` | Ligne de 18 m |

**Note** : L'API retourne parfois `area_of_effect: { type: \"sphere\", size: 20 }` où `size` est en **pieds**. 
Appliquer la conversion × 0.3 pour obtenir les mètres.

---

## 11. Durées de Sorts (Spell Durations)

| Valeur API | Valeur FR | Type |
|:---|:---|:---|
| `Instantaneous` | Instantanée | Immédiate |
| `1 round` | 1 round | Combat |
| `1 minute` | 1 minute | Combat |
| `10 minutes` | 10 minutes | Exploration |
| `1 hour` | 1 heure | Exploration |
| `8 hours` | 8 heures | Repos |
| `24 hours` | 24 heures | Jour |
| `Until dispelled` | Jusqu'à dissipation | Permanent |
| `Until dispelled or triggered` | Jusqu'à dissipation/déclenchement | Conditionnel |
| `Special` | Spéciale | Voir description |
| `Concentration, up to 1 minute` | Concentration, jusqu'à 1 minute | Combat/Concentration |
| `Concentration, up to 10 minutes` | Concentration, jusqu'à 10 minutes | Exploration/Concentration |
| `Concentration, up to 1 hour` | Concentration, jusqu'à 1 heure | Exploration/Concentration |
| `7 days` | 7 jours | Long terme |
| `30 days` | 30 jours | Long terme |
| `1 year` | 1 an | Très long terme |

---

## 12. Niveaux de Sorts (Spell Levels)

| Level | Nom FR | Circle Display |
|:---|:---|:---|
| `0` | Tour de magie | `cantrip` |
| `1` | Niveau 1 | `circle-1` |
| `2` | Niveau 2 | `circle-2` |
| `3` | Niveau 3 | `circle-3` |
| `4` | Niveau 4 | `circle-4` |
| `5` | Niveau 5 | `circle-5` |
| `6` | Niveau 6 | `circle-6` |
| `7` | Niveau 7 | `circle-7` |
| `8` | Niveau 8 | `circle-8` |
| `9` | Niveau 9 | `circle-9` |

---

## 13. Conventions de Nommage (Code Style Guide)

### Transformation API → Code interne

1. **Compétences** : `snake_case` (API) → `camelCase` (JS)
   - `animal_handling` → `animalHandling`
   - `sleight_of_hand` → `sleightOfHand`
   - Autres compétences : pas de transformation (déjà en minuscules simples)

2. **Types d'actions** : Conservation des underscores
   - `bonus_action` reste `bonus_action` dans le code
   - ⚠️ Ne JAMAIS transformer en `bonusAction`

3. **Clés de sorts dans le JSON** : `snake_case`
   - `name_fr`, `name_en`, `damage_type`, `higher_levels`
   - Cohérent avec la structure JSON du moteur

4. **États et conditions** : Lowercase strict
   - `Blinded` (API) → `blinded` (code)
   - `Paralyzed` (API) → `paralyzed` (code)

5. **Conversion pieds → mètres**
   - Formule : `feet × 0.3 = mètres` (arrondir au 0.5 près)
   - 5 feet = 1,5 m
   - 10 feet = 3 m
   - 30 feet = 9 m
   - 60 feet = 18 m

### Règles générales
- **Clés d'objet JavaScript** : `camelCase` (sauf exceptions documentées)
- **Valeurs de l'API** : Conservation stricte de la casse originale
- **Labels utilisateur** : Capitalisation française standard
- **Classes CSS** : `kebab-case` (ex: `tag-action`, `circle-1`)

### Parsing des portées complexes
```javascript
// Exemple de parsing nécessaire pour certaines portées
\"Self (10-foot radius)\" → {
  base: \"Personnelle\",
  area: { type: \"sphere\", size: \"3 m\" }
}
```
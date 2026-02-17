# TawynDnD — Vocabulaire Technique Officiel (v3.0)

**Version** : 3.0-20260215-1558  
**Dernière mise à jour** : 15 février 2026 à 15:58  
**Statut** : ✅ Stable (Production)  
**Changelog** : Voir [CHANGELOG.md](./CHANGELOG.md)

> ⚠️ **Règle de versioning :**  
> - **v3.0.x** (x+1) : Modification < 200 caractères  
> - **v3.x** (x+1) : Modification ≥ 200 caractères  
> - **v4.0** : Changements majeurs (breaking changes)
>
> ⚠️ **Toute modification de ce document nécessite une mise à jour du `schemaVersion` dans `const C`**

---

> **Ce document définit le vocabulaire technique standardisé pour TawynDnD Ultimate (v3.0).**  
> Toute propriété de `const C` doit utiliser ces termes exacts pour garantir la compatibilité IA-Ready.

---

## 🎭 Caractéristiques (Abilities)

### Noms des Caractéristiques
| Code | Français | English |
|------|----------|---------|
| `str` | Force | Strength |
| `dex` | Dextérité | Dexterity |
| `con` | Constitution | Constitution |
| `int` | Intelligence | Intelligence |
| `wis` | Sagesse | Wisdom |
| `cha` | Charisme | Charisma |

### Modificateurs
- **Format:** `Math.floor((score - 10) / 2)`
- **Exemple:** Force 16 → Modificateur +3

---

## 🎯 Compétences (Skills)

### Liste Complète (FR/EN)
| Code | Français | English | Caractéristique |
|------|----------|---------|-----------------|
| `acrobatics` | Acrobaties | Acrobatics | Dextérité |
| `animal_handling` | Dressage | Animal Handling | Sagesse |
| `arcana` | Arcanes | Arcana | Intelligence |
| `athletics` | Athlétisme | Athletics | Force |
| `deception` | Tromperie | Deception | Charisme |
| `history` | Histoire | History | Intelligence |
| `insight` | Intuition | Insight | Sagesse |
| `intimidation` | Intimidation | Intimidation | Charisme |
| `investigation` | Investigation | Investigation | Intelligence |
| `medicine` | Médecine | Medicine | Sagesse |
| `nature` | Nature | Nature | Intelligence |
| `perception` | Perception | Perception | Sagesse |
| `performance` | Représentation | Performance | Charisme |
| `persuasion` | Persuasion | Persuasion | Charisme |
| `religion` | Religion | Religion | Intelligence |
| `sleight_of_hand` | Escamotage | Sleight of Hand | Dextérité |
| `stealth` | Discrétion | Stealth | Dextérité |
| `survival` | Survie | Survival | Sagesse |

---

## ✨ Écoles de Magie (Spell Schools)

| Code | Français | English |
|------|----------|---------|
| `abjuration` | Abjuration | Abjuration |
| `conjuration` | Invocation | Conjuration |
| `divination` | Divination | Divination |
| `enchantment` | Enchantement | Enchantment |
| `evocation` | Évocation | Evocation |
| `illusion` | Illusion | Illusion |
| `necromancy` | Nécromancie | Necromancy |
| `transmutation` | Transmutation | Transmutation |

---

## ⏱️ Temps d'Incantation (Casting Time)

### Types Standardisés
| Français | English | Type d'Action |
|----------|---------|---------------|
| `1 action` | 1 action | Action |
| `1 action bonus` | 1 bonus action | Bonus Action |
| `1 réaction` | 1 reaction | Reaction |
| `1 minute` | 1 minute | Rituel court |
| `10 minutes` | 10 minutes | Rituel moyen |
| `1 heure` | 1 hour | Rituel long |
| `8 heures` | 8 hours | Rituel très long |

### Propriété `ritual`
- `true` — Le sort peut être lancé en tant que rituel (+10 minutes)
- `false` — Sort classique uniquement

---

## 📏 Portée (Range)

| Français | English | Portée (ft) |
|----------|---------|-------------|
| `Contact` | Touch | 5 |
| `Personnelle` | Self | 0 |
| `9 mètres` | 30 feet | 30 |
| `18 mètres` | 60 feet | 60 |
| `36 mètres` | 120 feet | 120 |
| `150 mètres` | 500 feet | 500 |
| `1,5 kilomètre` | 1 mile | 5280 |
| `Illimitée` | Unlimited | ∞ |

### Portée avec Zone (AoE)
- **Cône (Cone):** `cone de X mètres` / `X-foot cone`
- **Sphère (Sphere):** `sphère de X mètres de rayon` / `X-foot-radius sphere`
- **Ligne (Line):** `ligne de X mètres` / `X-foot line`
- **Cube (Cube):** `cube de X mètres` / `X-foot cube`

---

## 🎨 Composantes (Components)

| Code | Français | English | Description |
|------|----------|---------|-------------|
| `V` | Verbale | Verbal | Incantation audible |
| `S` | Somatique | Somatic | Gestes précis (main libre) |
| `M` | Matérielle | Material | Objet ou composant |

### Format Complet
```javascript
components: "V, S, M (poudre de diamant d'une valeur de 100 po)"
```

---

## ⏳ Durée (Duration)

| Français | English | Type |
|----------|---------|------|
| `Instantané` | Instantaneous | Immédiat |
| `1 round` | 1 round | 6 secondes |
| `1 minute` | 1 minute | 10 rounds |
| `10 minutes` | 10 minutes | Combat court |
| `1 heure` | 1 hour | Exploration |
| `8 heures` | 8 hours | Repos long |
| `24 heures` | 24 hours | Jour complet |
| `Jusqu'à dissipation` | Until dispelled | Permanent |

### Concentration
- **Format:** `Concentration, jusqu'à X` / `Concentration, up to X`
- **Exemple:** `Concentration, jusqu'à 1 minute`

---

## ⚔️ Types d'Actions (Action Economy)

| Code | Français | English | Icône |
|------|----------|---------|-------|
| `action` | Action | Action | 🔵 |
| `bonus` | Action Bonus | Bonus Action | 🟠 |
| `reaction` | Réaction | Reaction | 🔴 |
| `free` | Action Gratuite | Free Action | ⚪ |

---

## 🎲 Jets de Sauvegarde (Saving Throws)

| Code | Français | English |
|------|----------|---------|
| `str_save` | Jet de Force | Strength save |
| `dex_save` | Jet de Dextérité | Dexterity save |
| `con_save` | Jet de Constitution | Constitution save |
| `int_save` | Jet d'Intelligence | Intelligence save |
| `wis_save` | Jet de Sagesse | Wisdom save |
| `cha_save` | Jet de Charisme | Charisma save |

---

## 🛡️ Classes & Archétypes

### Classes Principales
| Code | Français | English |
|------|----------|---------|
| `artificer` | Artilleur | Artificer |
| `barbarian` | Barbare | Barbarian |
| `bard` | Barde | Bard |
| `cleric` | Clerc | Cleric |
| `druid` | Druide | Druid |
| `fighter` | Guerrier | Fighter |
| `monk` | Moine | Monk |
| `paladin` | Paladin | Paladin |
| `ranger` | Rôdeur | Ranger |
| `rogue` | Roublard | Rogue |
| `sorcerer` | Ensorceleur | Sorcerer |
| `warlock` | Occultiste | Warlock |
| `wizard` | Magicien | Wizard |

### Sous-Classes (Exemples)
- **Guerrier:** `battle_master` (Maître de Guerre), `champion` (Champion), `eldritch_knight` (Chevalier Occulte)
- **Occultiste:** `hexblade` (Lame Maudite), `fiend` (Fiélon), `great_old_one` (Grand Ancien)

---

## 🏹 Types de Dégâts (Damage Types)

| Code | Français | English |
|------|----------|---------|
| `acid` | Acide | Acid |
| `bludgeoning` | Contondant | Bludgeoning |
| `cold` | Froid | Cold |
| `fire` | Feu | Fire |
| `force` | Force | Force |
| `lightning` | Foudre | Lightning |
| `necrotic` | Nécrotique | Necrotic |
| `piercing` | Perforant | Piercing |
| `poison` | Poison | Poison |
| `psychic` | Psychique | Psychic |
| `radiant` | Radiant | Radiant |
| `slashing` | Tranchant | Slashing |
| `thunder` | Tonnerre | Thunder |

---

## 🎒 Équipement & Poids

### Catégories d'Objets
| Code | Français | English |
|------|----------|---------|
| `weapon` | Arme | Weapon |
| `armor` | Armure | Armor |
| `consumable` | Consommable | Consumable |
| `tool` | Outil | Tool |
| `magic_item` | Objet Magique | Magic Item |
| `misc` | Divers | Miscellaneous |

### Poids (Encumbrance)
- **Unité:** livres (lbs) — `1 lb ≈ 0.45 kg`
- **Capacité de Transport:** `Force × 15 lbs`
- **Encombrement:** Au-delà de `Force × 5 lbs` → Vitesse -10 ft

---

## 📊 Conditions (Status Effects)

| Code | Français | English |
|------|----------|---------|
| `blinded` | Aveuglé | Blinded |
| `charmed` | Charmé | Charmed |
| `deafened` | Assourdi | Deafened |
| `exhaustion` | Épuisement | Exhaustion |
| `frightened` | Effrayé | Frightened |
| `grappled` | Agrippé | Grappled |
| `incapacitated` | Neutralisé | Incapacitated |
| `invisible` | Invisible | Invisible |
| `paralyzed` | Paralysé | Paralyzed |
| `petrified` | Pétrifié | Petrified |
| `poisoned` | Empoisonné | Poisoned |
| `prone` | À terre | Prone |
| `restrained` | Entravé | Restrained |
| `stunned` | Étourdi | Stunned |
| `unconscious` | Inconscient | Unconscious |

---

## 🔮 Exemple de Sort Complet (Format v3.0)

```javascript
{
  name_fr: "Bouclier",
  name_en: "Shield",
  level: 1,
  school: "abjuration",
  time: "1 réaction",
  range: "Personnelle",
  components: "V, S",
  duration: "1 round",
  concentration: false,
  ritual: false,
  description_fr: "Une barrière invisible de force magique apparaît et vous protège. Jusqu'au début de votre prochain tour, vous obtenez un bonus de +5 à votre CA.",
  description_en: "An invisible barrier of magical force appears and protects you. Until the start of your next turn, you have a +5 bonus to AC.",
  damage_type: null,
  save_type: null,
  source: "PHB"
}
```

---

## ✅ Règles de Nommage

### Propriétés de `const C`
- **Caractéristiques:** `str`, `dex`, `con`, `int`, `wis`, `cha` (minuscules, 3 lettres)
- **Niveaux de Sorts:** `spell_slots_1`, `spell_slots_2`, ..., `spell_slots_9`
- **HP:** `hp_max` (maximum), `hp_current` (actuel), `temp_hp` (temporaire)
- **CA:** `ac` (Armor Class)
- **Vitesse:** `speed` (en pieds, `30` par défaut)

### Propriétés de Sorts
- **Noms:** `name_fr` (français), `name_en` (anglais)
- **École:** `school` (minuscules, anglais: `abjuration`, `evocation`, etc.)
- **Temps:** `time` (format complet: `"1 action"`, `"1 réaction"`)
- **Composantes:** `components` (format: `"V, S, M (description)"`)

---

**Conformité:** Toute propriété ajoutée à `const C` doit être documentée ici et validée via `validate-character.html` avant intégration.

## 🗂️ Architecture du dépôt

```
TawynDnD/
├── character-builder.html          ← Outil principal : génère les fiches single-file
├── characters/
│   └── moros-v3.12-20260303-1200-i18n.html  ← Fiche active (Moros Gravewalker)
├── archive/
│   ├── moros-v3_1-template.html    ← Template de référence
│   ├── moros-v*.html               ← Anciennes versions de Moros
│   └── steiner-ferum-v*.html       ← Autres personnages archivés
├── .github/
│   └── copilot-instructions.md     ← Ce fichier — source de vérité pour l'IA
└── README.md
```

### Où trouver quoi
| Ressource | Emplacement |
|-----------|-------------|
| Outil de création | `character-builder.html` (racine) |
| Fiche active | `characters/moros-v3.12-20260303-1200-i18n.html` |
| Template de référence | `archive/moros-v3_1-template.html` |
| Archives | `archive/` |
| Schéma `const C` | Section ci-dessous + fiche active |
| Exports XML AideDD | À importer dans `character-builder.html` |

---

## 🛠️ Outil principal : `character-builder.html`

`character-builder.html` est le **générateur de fiches** single-file. Il produit des fichiers HTML autonomes (CSS + JS embarqués, zéro dépendance externe) destinés à être placés dans `characters/`.

### Flow builder → fiche
1. Ouvrir `character-builder.html` dans un navigateur (aucun serveur requis)
2. Remplir les champs du formulaire (ou importer un export XML AideDD.org)
3. Générer → télécharger la fiche HTML complète
4. Placer le fichier dans `characters/` avec la convention de nommage :
   `{perso}-v{version}-{YYYYMMDD}-{HHMM}-i18n.html`

---

## 📐 Schéma `const C` (structure minimale)

Chaque fiche contient un objet `const C` qui encode **toutes les données statiques** du personnage. Cet objet **ne doit pas** contenir d'état volatile (HP courant, slots utilisés, etc.).

```javascript
const C = {
  schemaVersion: "3.12",
  id: "moros-gravewalker",
  name: "Moros Gravewalker",
  level: 6,
  class: "warlock",
  subclass: "hexblade",
  stats: { ac: 17, hp_max: 47, prof: 3, dc: 15, spell_atk: 7, slots_total: 2 },
  abilities: { cha: { score: 18, mod: 4 }, dex: { score: 14, mod: 2 }, /* ... */ },
  defenses: { resistances: ["Nécrotique"], immunities: [], vulnerabilities: [] },
  equipment: [ { name: string, cat: string, qty: number, editable: boolean } ],
  // ... (Schéma complet visible dans characters/moros-v3.12-20260303-1200-i18n.html)
};
```

## 💾 localStorage (état volatile — NE PAS mettre dans `const C`)
| Clé | Type | Description |
|-----|------|-------------|
| `tawyndnd-${C.id}-v3` | object | Objet JSON contenant l'état actuel (hp, hp_temp, slots_used, inv_qty, concentration, conditions, etc.) |
| `tawyndnd-language` | string | Langue active ("fr" / "en") |

### État volatil — nouvelles clés (v3.12)
| Clé | Type | Description |
|-----|------|-------------|
| `concentration` | `string\|null` | Nom du sort actuellement en concentration, ou `null` |
| `conditions` | `object` | État des 14 conditions D&D 5e (aveugle, charme, empoisonne, a_terre, entrave, incapacite, invisible, paralyse, petrifie, peur, saisi, sourd, etourdi, inconscient) |

---

## 🥇 Règle d'or : Single-File

**Toute fiche est un fichier HTML autonome.** Aucune dépendance externe, aucun framework, aucun build. CSS et JS sont entièrement embarqués dans le fichier. La fiche fonctionne hors-ligne, directement dans le navigateur.

---

## ⚠️ Note d'alignement IA

Ce fichier est la **source de vérité** pour toute modification technique, génération de code ou assistance IA sur ce dépôt. La logique technique, les conventions de nommage, l'historique du repo et les réponses de l'IA doivent s'aligner sur ce document.
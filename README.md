# TawynDnD ⚔️ — Ultimate Digital Character Sheet

**TawynDnD** est un système de fiches de personnage interactives pour **Dungeons & Dragons 5e (2014 & 2024)**, conçu avec un thème Glassmorphism, optimisé Galaxy S23 Ultra, et pensé pour la saisie manuelle de dés physiques.

> **⚠️ RÈGLE D'OR POUR COPILOT / IA :**
> Chaque fiche est un **fichier HTML unique et autosuffisant**. Le `const C` (données) ET le moteur de rendu (HTML/CSS/JS) coexistent dans le **même fichier `.html`**. Ne jamais séparer les deux. Ne jamais créer de `engine.js` externe. Ne jamais importer `const C` depuis l'extérieur.

---

## 🎯 Vision & Principes Directeurs

1. **Physical First** — Saisie manuelle des résultats de dés physiques. Aucun générateur de nombres aléatoires (RNG).
2. **Single-File Architecture** — Une fiche = un fichier `.html` complet, autonome, sans dépendances externes (sauf Google Fonts).
3. **IA-Ready Data Separation** — `const C` (données du personnage) est isolé en haut du `<script>`, séparé du moteur de rendu JS qui suit. L'IA peut modifier `const C` sans toucher au moteur.
4. **Mobile-First** — Optimisé pour Galaxy S23 Ultra (384px × 854px). Testé mobile avant desktop.
5. **Précision Technique** — Termes AideDD officiels en français pour sorts et capacités.

---

## 📁 Structure du Repository

```
TawynDnD/
├── characters/
│   ├── moros-v3.1-20260218-0330-i18n.html       ← Fiche Moros (référence stable)
│   └── steiner-ferum-v3.1-20260218-0020.html ← Fiche Steiner (template martial)
├── archive/
│   └── moros-v3.0-20260215-1558.html       ← Archivé (remplacé)
├── README.md
├── BACKLOG.md
├── CHANGELOG.md
├── TECHNICAL_SPEC.md
└── DND_VOCABULARY.md
```

---

## 🗂️ Fiches Actives

### Moros Gravewalker — Occultiste Lame Maudite (Référence)
- **Fichier :** `characters/moros-v3.1-20260218-0330-i18n.html`
- **Statut :** ✅ Version stable de référence — moteur complet avec gestion des sorts, invocations, points de sorcellerie
- **Accentuation CSS :** Violet (`--accent: #a855f7`)
- **Spécificités moteur :** Sections Sorts, Invocations, Malédiction

### Steiner Ferum — Guerrier Maître de Guerre (Template Martial)
- **Fichier :** `characters/steiner-ferum-v3.1-20260218-0020.html`
- **Statut :** ✅ Version stable — moteur complet, ready pour usage & extension
- **Accentuation CSS :** Rouge (`--accent: #ef4444`)
- **Spécificités moteur :** Manœuvres de combat, Dés de supériorité (5d8), Action Surge, Serment du dernier rempart
- **⚠️ Pas de sorts** — Classe martiale. Ne pas implémenter de section sorts. Ne pas copier le moteur Moros tel quel.

---

## 🛠️ Guide : Modifier un Personnage (Instructions pour IA/Copilot)

### Règle absolue de modification
```
MODIFIER UNIQUEMENT : le bloc const C = { ... }; dans la balise <script>
NE PAS MODIFIER    : le CSS dans <style>, le HTML du body, le moteur JS après const C
```

### Structure interne d'un fichier fiche
```html
<!DOCTYPE html>
<html>
<head>
  <!-- CSS du design system — NE PAS MODIFIER -->
  <style> /* variables :root, layout, composants */ </style>
</head>
<body>
  <!-- HTML du moteur de rendu — NE PAS MODIFIER sauf instruction explicite -->
  
  <script>
    /* ═══════════════════════════════════════════════
       ZONE DE DONNÉES — MODIFIABLE PAR IA/COPILOT
       ═══════════════════════════════════════════════ */
    const C = {
      schemaVersion: "3.0",   // ← Ne pas changer
      name: "Nom du Personnage",
      // ... données du personnage
    };
    /* ═══════════════════════════════════════════════
       MOTEUR DE RENDU — NE PAS MODIFIER
       ═══════════════════════════════════════════════ */
    // ... fonctions JS de rendu
  </script>
</body>
</html>
```

### Modifier les stats de Steiner
```javascript
// Dans const C, modifier les valeurs directement :
"str": 20,           // Score de caractéristique
"hp_max": 80,        // PV maximum
"ac": 20,            // Classe d'armure
```

### Ajouter une manœuvre à Steiner
```javascript
// Dans le tableau C.maneuvers, ajouter un objet :
{ 
  "name": "Feinte",
  "type": "action",           // "action" | "bonus" | "reaction"
  "type_fr": "Action",
  "desc": "Dépense 1 dé de supériorité. Feinte une créature à portée CàC."
}
```

---

## 🎨 Système de Couleurs par Classe

| Classe | `--accent` | `--bg-primary` |
|--------|-----------|----------------|
| Occultiste (Moros) | `#a855f7` (violet) | `#0a0014` |
| Guerrier (Steiner) | `#ef4444` (rouge) | `#140a00` |
| Paladin | `#f59e0b` (or) | `#0a0800` |
| Rôdeur | `#10b981` (vert) | `#001a0a` |

---

## 🌍 Internationalisation (i18n) — Contribuer efficacement

### Pourquoi ?
Le projet TawynDnD est conçu pour être jouable et extensible en français/anglais (voire plus).  
Toute nouvelle fiche, fonctionnalité ou contribution doit être prête à accepter plusieurs langues pour maximiser l’utilité et faciliter l’évolution.

18/02/2026
“La fiche steiner-ferum v3.1 est la première version compatible i18n (FR/EN) avec switch de langue natif.”
“Voir /translations pour mapping, conventions.”
“Le moteur t() est désormais utilisé sur tous les labels/éléments principaux.”
“Tests technique et UI validés — voir CHANGELOG pour l’état complet.”

---

### Principes clés pour contributeurs (humains et IA/Copilot)

1. **Structure i18n obligatoire**
   - Toutes les chaînes de texte (UI, labels, descriptions, titles…) doivent passer par la fonction `t()` et les fichiers de mapping translations/en.js, fr.js, index.js (modèle : [voir structure dans `/translations/`]).
   - Ne jamais “hardcoder” de texte dans l’HTML, JS ou dans le bloc `const C` : tout doit être référencé par clé.

2. **Fallback automatique**
   - Si une clé n’est pas traduite dans la langue cible (ex. FR), le moteur affichera la version EN.
   - Jamais de clé “undefined” ou de texte manquant : la fonction t() garantit la continuité de l’interface.

3. **Switch de langue natif**
   - Toujours proposer dans la UI un bouton ou menu pour changer la langue (🇫🇷 / 🇬🇧…).
   - Toute nouvelle fiche doit être testée en FR et EN.

4. **Processus d’ajout/validation d’une traduction**
   - Pour chaque ajout de terme ou de contenu, documenter la clé, fournir l’équivalent EN et FR, respecter la terminologie officielle AideDD/WotC.
   - Suivre la checklist :
     1. Respect des termes D&D5 & AideDD ?
     2. Test technique : rendu correct dans la fiche.
     3. Avis ou validation par un joueur natif FR.

5. **Sprints et priorisation**
   - Toujours commencer par les éléments joués (classes, sorts utilisés, UI active).
   - N’ajouter/traduire les sorts, objets magiques, backgrounds qu’au fur et à mesure de leur utilisation réelle (approche agile).

6. **Documentation**
   - Documenter chaque ajout/traduction dans `COPILOT_GUIDE.md` pour faciliter la maintenance et le onboarding des nouveaux contributeurs IA ou humains.

---

### Exemple d’utilisation technique

```javascript
// Fichier translations/fr.js
export const FR = {
  ui: { hp: "Points de vie", ac: "Classe d'armure" },
  classes: { fighter: "Guerrier", warlock: "Occultiste" },
  abilities: { str: "Force", dex: "Dextérité" }
};
// Fonction centrale t()
function t(key, lang='fr') {
  // Recherche dans le mapping, fallback EN automatique
}
```
Dans le moteur, remplacer :
```html
<span>Classe d'armure</span>
```
par :
```html
<span>{t('ui.ac')}</span>
```

---

### En résumé :
- Propose chaque contribution (humaine ou IA) en multi-langue bien structurée.
- Rappelle-toi : **pas de texte en dur** !
- Respecte la validation par checklist et la priorisation sur l’usage réel.

### 🌍 Internationalisation (i18n)
Le projet dispose désormais d’un socle i18n :
- Dossier `/translations` avec en.js et fr.js, extensible.
- Fonction t() centrale, gestion du switch langue.
- Toute contribution doit passer par t() (aucun texte en dur).
- Ajout, extension et validation : voir COPILOT_GUIDE.md.
- Prioriser la traduction pour les éléments utilisés en session.
Exemple :
```js
import { t } from './translations/index.js';
span.innerText = t('ui.hp'); // Affiche "Points de vie" ou "Hit Points" selon la langue
```
---

Pour toute question de contribution i18n, voir aussi :
- [COPILOT_GUIDE.md](./COPILOT_GUIDE.md)
- [translations/en.js, fr.js, index.js](./translations/)

Pour toute contribution i18n, référence rapide : 
- [COPILOT_GUIDE.md](./COPILOT_GUIDE.md) (procédure d’ajout, validation, extension)
- [TECHNICAL_SPEC.md](./TECHNICAL_SPEC.md) (norme technique, conventions, anti-patterns)
- [CHANGELOG.md](./CHANGELOG.md) (suivi des évolutions i18n)

---

*Ce projet est optimisé pour l’apprentissage des IA et des humains — jouons ensemble, traduit, testé, validé !*

---

## 🚀 Roadmap Actuelle

Voir [BACKLOG.md](./BACKLOG.md) pour le détail complet.

- ✅ **Phase 1** — Standardisation CSS/JS, schéma `const C` universel
- ✅ **Terminé** — Moteur de rendu HTML pour Steiner (template martial)
- 🔴 **Phase 2** — Format AideDD complet pour les sorts (Moros)
- + **Phase 3** — Internationalisation (i18n) * en cours
- 🔴 **Phase 4** — Inventaire interactif
- 🔴 **Phase 5** — Export/Import JSON + PWA

---

*Fait par et pour des joueurs passionnés. Optimisé pour le jeu sur table avec dés physiques.*

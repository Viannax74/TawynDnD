# 🤖 Guide GitHub Copilot — TawynDnD
**Audience :** GitHub Copilot GPT-4.1, Claude, ou tout LLM assistant sur ce repo  
**Objectif :** Éviter les modifications destructrices sur les fiches de personnage

> Place ce fichier à la racine du repo. Copilot et les agents IA le lisent en priorité via `.github/copilot-instructions.md` (voir section Installation ci-dessous).

---

## ⚡ Règles Absolues — Lis ces 5 règles avant tout

### Règle 1 : Architecture Single-File
Chaque fiche est un **fichier HTML unique et autosuffisant**.  
`const C` (données) + CSS + HTML + moteur JS = **tout dans le même fichier `.html`**.  
**Ne jamais** créer `engine.js`, `styles.css`, ou importer `const C` depuis l'extérieur.

### Règle 2 : Zone de modification autorisée
```
✅ AUTORISÉ  → Modifier le bloc const C = { ... }; uniquement
❌ INTERDIT  → Modifier le CSS dans <style>, le HTML du body, le moteur JS après const C
```

### Règle 3 : Steiner n'a pas de sorts
`steiner-ferum-*.html` est un **Guerrier** (classe martiale).  
Ne pas ajouter de section sorts. Ne pas copier le moteur de Moros (occultiste).  
Les sections spécifiques à Steiner sont : Manœuvres, Dés de supériorité, Action Surge, Serment.

### Règle 4 : `schemaVersion` est une constante
La valeur `"schemaVersion": "3.0"` dans `const C` **ne change pas** lors d'une mise à jour de données.  
Elle ne change que lors d'une migration de schéma explicitement demandée dans l'issue.

### Règle 5 : Physical First — Pas de RNG
Ce projet n'implémente pas de simulateur de dés.  
Les dés sont lancés physiquement par le joueur. L'interface affiche des **champs de saisie** pour les résultats.

---

## 🗂️ Carte du Repository

```
TawynDnD/
├── characters/
│   ├── moros-v3.0-20260217-1200.html
│   │   └── [Moros] Occultiste — moteur COMPLET avec sorts, invocations, malédiction
│   │       ⚠️ Référence stable — ne pas modifier sans issue
│   │
│   └── steiner-ferum-v3.0-20260216-1630.html
│       └── [Steiner] Guerrier — const C COMPLET, moteur de rendu À IMPLÉMENTER
│           ⚠️ Pas de sorts — classe martiale uniquement
│
├── archive/                    ← Fichiers archivés, ne pas modifier
├── README.md                   ← Point d'entrée, lire en premier
├── TECHNICAL_SPEC.md           ← Architecture & schéma de données
├── BACKLOG.md                  ← Issues & roadmap
├── CHANGELOG.md                ← Historique des versions
└── .github/copilot-instructions.md  ← Ce fichier (copie)
```

---

## 🛠️ Tâche Principale : Implémenter le moteur de rendu Steiner

### Contexte
Le fichier `steiner-ferum-v3.0-20260216-1630.html` contient un `const C` complet mais pas de HTML visible. Il faut implémenter le moteur de rendu HTML/JS.

### Ce que le moteur doit afficher (sections dans l'ordre)
1. **Header** — Nom, classe, niveau, race, avatar
2. **Stats Combat** — CA, PV (avec tracker interactif), Vitesse, Initiative, Bonus de maîtrise
3. **Caractéristiques** — 6 scores avec modificateurs (FOR, DEX, CON, INT, SAG, CHA)
4. **Dés de Supériorité** — 5 cases à cocher d8 (cliquables, persistance localStorage)
5. **Manœuvres** — Liste des 5 manœuvres depuis `C.maneuvers` avec type et description
6. **Attaques** — Tableau depuis `C.attacks` : nom, bonus, dégâts, portée, tags
7. **Capacités de classe** — Liste depuis `C.class_features`
8. **Traits raciaux** — Liste depuis `C.racial_traits`
9. **Dons** — Liste depuis `C.feats`
10. **Équipement** — Liste depuis `C.equipment` avec quantités éditables
11. **Personnalité** — Trait, Idéal, Lien, Défaut depuis `C.personality`
12. **Serment du dernier rempart** — Bloc spécial depuis `C.serment` avec fond rouge et avertissement ⚠️
13. **Compétences & Jets de sauvegarde** — Tableau depuis `C.skills` et `C.saving_throws`

### Variables CSS à utiliser (thème Steiner)
```css
--accent: #ef4444;        /* Rouge principal */
--bg-primary: #140a00;    /* Fond très sombre */
--bg-glass: rgba(46, 20, 8, 0.72);
```

### Exemple de rendu d'une manœuvre
```html
<div class="maneuver-card">
  <div class="maneuver-header">
    <span class="maneuver-name">Riposte</span>
    <span class="maneuver-type reaction">Réaction</span>
  </div>
  <p class="maneuver-desc">Si raté au CàC → réaction + dé de supériorité → attaque CàC.</p>
</div>
```

### Tracker de dés de supériorité (localStorage)
```javascript
// Clé : "steiner-ferum_martial_dice"
// Valeur : entier entre 0 et C.stats.martial_dice (5)
function saveMartialDice(remaining) {
  localStorage.setItem(`${C.id}_martial_dice`, remaining);
}
function loadMartialDice() {
  return parseInt(localStorage.getItem(`${C.id}_martial_dice`) ?? C.stats.martial_dice);
}
```

---

## ❌ Anti-Patterns Documentés

Ces erreurs ont cassé des versions précédentes. Ne pas reproduire.

| Anti-pattern | Pourquoi c'est cassé | Correction |
|---|---|---|
| Créer `engine.js` séparé | Rompt l'architecture single-file | Tout dans le `.html` |
| Copier le moteur Moros sur Steiner | Moros a des sorts, Steiner non | Implémenter un moteur martial dédié |
| Modifier `schemaVersion` à chaque save | Ce n'est pas un timestamp de fichier | Laisser à `"3.0"` |
| Ajouter `<section id="spells">` à Steiner | Steiner est Guerrier (martial) | Ne pas implémenter |
| Générer des nombres aléatoires | Contre le principe Physical First | Utiliser des `<input>` de saisie |
| Utiliser des frameworks (React, Vue) | Dépendances interdites | Vanilla JS pur uniquement |

---

## 📝 Comment Documenter les Changements

Toute modification de code doit être accompagnée d'une entrée dans `CHANGELOG.md` :

```markdown
## [3.0.2] — 2026-XX-XX
### Ajouté
- Steiner : Moteur de rendu HTML complet (sections : Stats, Combat, Manœuvres, Équipement)

### Modifié  
- Steiner : Tracker dés de supériorité (localStorage key: steiner-ferum_martial_dice)
```

---

## 🚀 Installation dans le Repo

Pour que Copilot lise automatiquement ces instructions, créer :
```bash
mkdir -p .github
cp COPILOT_GUIDE.md .github/copilot-instructions.md
```
#### Procédure d'ajout de traduction i18n

1. Repérer la clé à ajouter ou étendre (ex : ui.hp ou spells.shield.name)
2. Ajouter dans en.js (EN) et fr.js (FR) dans /translations
3. Tester techniquement sur la fiche
4. Valider terminologie D&D5/AideDD
5. Faire review joueur FR

```
Copilot lit `.github/copilot-instructions.md` automatiquement sur chaque prompt.



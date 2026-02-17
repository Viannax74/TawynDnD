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
│   ├── moros-v3.0-20260217-1200.html       ← Fiche Moros (référence stable)
│   └── steiner-ferum-v3.0-20260216-1630.html ← Fiche Steiner (template martial)
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
- **Fichier :** `characters/moros-v3.0-20260217-1200.html`
- **Statut :** ✅ Version stable de référence — moteur complet avec gestion des sorts, invocations, points de sorcellerie
- **Accentuation CSS :** Violet (`--accent: #a855f7`)
- **Spécificités moteur :** Sections Sorts, Invocations, Malédiction

### Steiner Ferum — Guerrier Maître de Guerre (Template Martial)
- **Fichier :** `characters/steiner-ferum-v3.0-20260216-1630.html`
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

## 🚀 Roadmap Actuelle

Voir [BACKLOG.md](./BACKLOG.md) pour le détail complet.

- ✅ **Phase 1** — Standardisation CSS/JS, schéma `const C` universel
- ✅ **Terminé** — Moteur de rendu HTML pour Steiner (template martial)
- 🔴 **Phase 2** — Format AideDD complet pour les sorts (Moros)
- 🔴 **Phase 3** — Internationalisation (i18n)
- 🔴 **Phase 4** — Inventaire interactif
- 🔴 **Phase 5** — Export/Import JSON + PWA

---

*Fait par et pour des joueurs passionnés. Optimisé pour le jeu sur table avec dés physiques.*

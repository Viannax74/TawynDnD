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
[... garder la section de TECHNICAL_SPEC.md, 30 lignes max ...]

## 💾 localStorage
[... garder le tableau des clés, 10 lignes ...]

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

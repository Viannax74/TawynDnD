# 🌐 Guide d'intégration i18n — TawynDnD

**Version :** 1.0  
**Date :** 17 février 2026  
**Status :** P0 - Fondations complètes

---

## 📁 Structure des fichiers

```
TawynDnD/
├── translations/
│   ├── en.js        ← Termes anglais (base API D&D 5e)
│   ├── fr.js        ← Termes français (AideDD)
│   └── index.js     ← Fonction t() + switch langue
└── characters/
    ├── moros-*.html
    └── steiner-*.html
```

---

## 🚀 Installation dans le repo GitHub

### Étape 1 : Créer le dossier

Sur GitHub, va à la racine du repo → **Add file** → **Create new file**

Tape : `translations/en.js` → GitHub crée automatiquement le dossier

### Étape 2 : Copier les 3 fichiers

Copie le contenu de chaque fichier (en.js, fr.js, index.js) dans GitHub et commit.

---

## 🎯 Utilisation dans une fiche HTML

### Importation dans le `<script>`

```html
<script type="module">
// Import de la fonction de traduction
import { t, setLanguage, getCurrentLanguage } from '../translations/index.js';

// Utilisation
console.log(t('ui.hp'));              // "Points de vie" (si langue = FR)
console.log(t('ui.hp', 'en'));        // "Hit Points" (forcé EN)
console.log(t('classes.fighter'));    // "Guerrier"
</script>
```

---

## 📝 Exemple concret : Migrer le header de Steiner

### AVANT (hardcodé en français)

```javascript
function renderHeader() {
  return `
    <div class="stat-pill">
      <div class="stat-pill-lbl">PV</div>
      <div class="stat-pill-val">${state.hp}</div>
    </div>
    <div class="stat-pill">
      <div class="stat-pill-lbl">CA</div>
      <div class="stat-pill-val">${C.stats.ac}</div>
    </div>
  `;
}
```

### APRÈS (i18n avec t())

```javascript
function renderHeader() {
  return `
    <div class="stat-pill">
      <div class="stat-pill-lbl">${t('ui.hp')}</div>
      <div class="stat-pill-val">${state.hp}</div>
    </div>
    <div class="stat-pill">
      <div class="stat-pill-lbl">${t('ui.ac')}</div>
      <div class="stat-pill-val">${C.stats.ac}</div>
    </div>
  `;
}
```

---

## 🔄 Switch langue UI

### Ajouter les boutons dans le header

```javascript
function renderHeader() {
  const currentLang = getCurrentLanguage();
  return `
    <div class="mode-bar">
      <button class="mode-btn ${currentLang === 'fr' ? 'active' : ''}" data-lang="fr">🇫🇷 FR</button>
      <button class="mode-btn ${currentLang === 'en' ? 'active' : ''}" data-lang="en">🇬🇧 EN</button>
    </div>
  `;
}
```

### Event listener pour le switch

```javascript
function attachEvents() {
  // Switch langue
  document.querySelectorAll("[data-lang]").forEach(btn => {
    btn.addEventListener("click", () => {
      setLanguage(btn.dataset.lang);  // Change la langue
      render();                       // Re-render toute la fiche
    });
  });
}
```

---

## 🧪 Test rapide

### Dans la console du navigateur

```javascript
// Importer manuellement
import { t, setLanguage } from './translations/index.js';

// Tester
console.log(t('ui.hp'));           // "Points de vie" (défaut FR)
setLanguage('en');
console.log(t('ui.hp'));           // "Hit Points"
setLanguage('fr');
console.log(t('classes.fighter')); // "Guerrier"
```

---

## 📋 Checklist de migration d'une fiche

Pour migrer une fiche (Moros, Steiner...) vers i18n :

### Phase 1 : Labels UI (2-3h)
- [ ] Importer `t`, `setLanguage`, `getCurrentLanguage` depuis `../translations/index.js`
- [ ] Remplacer tous les labels hardcodés du header par `t('ui.xxx')`
- [ ] Ajouter les boutons 🇫🇷/🇬🇧 avec event listeners
- [ ] Tester le switch FR ⇄ EN

### Phase 2 : Onglets & sections (1-2h)
- [ ] Migrer les titres d'onglets : `t('ui.tab_combat')`, `t('ui.tab_spells')`, etc.
- [ ] Migrer les labels de stats : `t('abilities.str')`, `t('abilities.dex')`, etc.
- [ ] Migrer les compétences : `t('skills.athletics')`, etc.

### Phase 3 : Contenu métier (variable selon la classe)
- [ ] **Pour Guerrier (Steiner)** : Manœuvres → nécessite ajout dans `fr.js`
- [ ] **Pour Occultiste (Moros)** : Sorts → nécessite dataset sorts (P1)

---

## 🔧 Ajouter une nouvelle traduction

### Si tu as besoin d'un terme qui manque

1. **Ouvre `translations/en.js`** → ajoute dans la bonne section
```javascript
ui: {
  // ...
  new_term: 'My New Term'
}
```

2. **Ouvre `translations/fr.js`** → ajoute la traduction
```javascript
ui: {
  // ...
  new_term: 'Mon nouveau terme'
}
```

3. **Utilise-le dans ta fiche**
```javascript
t('ui.new_term')  // "Mon nouveau terme" (FR) ou "My New Term" (EN)
```

---

## ⚠️ Règles importantes

### 1. Toujours utiliser des clés hiérarchiques
✅ Bon : `t('ui.hp')`, `t('classes.fighter')`  
❌ Mauvais : `t('hp')`, `t('fighter')`

### 2. Ne jamais hardcoder de texte visible
✅ Bon : `<div>${t('ui.hp')}</div>`  
❌ Mauvais : `<div>Points de vie</div>`

### 3. Le fallback EN sauve toujours
Si une clé n'existe pas en FR, le système retourne automatiquement la version EN.  
**Jamais** de texte vide ou `undefined` affiché à l'utilisateur.

### 4. Tester les 2 langues avant de commit
Toujours vérifier que la fiche s'affiche correctement en FR ET EN.

---

## 🎯 Prochaines étapes (Roadmap i18n)

✅ **P0 — Fondations** (terminé)
- Structure `translations/` créée
- Fonction `t()` opérationnelle
- Switch langue UI prêt

🔴 **P1 — Dataset FR sorts/classes** (en cours)
- Extraction API D&D 5e
- Mapping EN → FR (AideDD)
- Intégration dans `fr.js`

🟡 **P2 — Extension complète**
- Sorts niveau 4-9
- Objets magiques
- Validation automatique

---

## 📞 Support

Si tu rencontres un problème :
1. Vérifie que la clé existe dans `en.js` ET `fr.js`
2. Vérifie la console navigateur pour les warnings `[i18n]`
3. Teste `t('ui.hp')` manuellement dans la console

---

**Fait par Tawyn avec ❤️ pour la communauté D&D**

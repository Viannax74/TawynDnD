# Spécifications Techniques : TawynDnD Ultimate

Ce document définit les standards techniques, les contraintes de performance et les stratégies de développement pour le moteur **TawynDnD Ultimate**.

---

## 🛠️ Stack Technique

- **Langages** : HTML5, CSS3, Vanilla JavaScript (ES6+).
- **Architecture** : Single-page application (SPA) statique. Aucun framework (React/Vue) n'est utilisé pour garantir une légèreté maximale et une portabilité totale (un seul fichier HTML).
- **Persistance** : Browser LocalStorage API.
- **Iconographie** : Emojis standard ou SVG inline (pas de dépendances externes type FontAwesome).
- **Polices** : Google Fonts (Inter, JetBrains Mono) avec fallback système.

---

## 📱 Cible & Responsivité

- **Cible Primaire** : Smartphones (viewport largeur 360px - 430px).
- **Device de Référence** : Samsung Galaxy S23 Ultra (utilisé pour les tests de rendu "Ultra" et captures).
- **Breakpoints CSS** :
  - `360px` : Petits smartphones (ex: iPhone SE, Galaxy A series).
  - `390px` : Standards modernes (ex: iPhone 14/15 Pro).
  - `430px` : Grands smartphones (ex: S23 Ultra, Pro Max).
  - `768px+` : Mode "Consultation" (Tablettes/Desktop).

---

## 💾 Stratégie de Persistance & Versioning

### Données Immuables (`const C`)
- Contient la structure fixe du personnage (Race, Classe, Sorts appris).
- Doit inclure un champ `schemaVersion: "3.0"`.

### Données Volatiles (`localStorage`)
- État actuel : PV, emplacements de sorts utilisés, inventaire dynamique.
- **Clé de stockage** : `tawyndnd_state_${characterId}_v3`.
- **Migration** : En cas de changement de `schemaVersion`, un script de migration doit répercuter les changements sur le `localStorage` sans perte de données utilisateur.

---

## 🤖 Rôles de l'IA

### 1. IA de Développement (Copilot/Claude)
- Doit impérativement respecter `DND_VOCABULARY.md`.
- Doit vérifier chaque proposition de code avec `validate-character.html`.
- Maintient la cohérence de l'objet `const C`.

### 2. IA de Génération de Contenu (Future)
- Produit des objets JSON conformes à la spec v3.0.
- Ne doit JAMAIS générer de résultats de dés (respect du principe *Physical First*).

---

## ⚡ Budgets de Performance & Compatibilité

- **Poids total** : < 500 KB (hors assets distants).
- **Temps de chargement** : < 2s en connexion 3G.
- **Lighthouse Score** : Objectif > 90 en Performance et Accessibilité.
- **Compatibilité** : 
  - Chrome 90+
  - Safari 14+
  - Firefox 88+
  - Samsung Internet 15+

---

## 🧪 Stratégie de Test

1. **Validation de Schéma** : Tout personnage doit passer 100% des tests de `validate-character.html`.
2. **Tests Manuels** : Vérification systématique sur les 3 breakpoints mobiles identifiés.
3. **Non-Régression** : Avant chaque itération, vérifier que le bouton "Repos Long" réinitialise correctement les ressources définies.

---

## 🚀 Build & Déploiement

- **Build** : Aucun processus de build requis (fichiers statiques).
- **Minification** : Optionnelle pour réduire la taille (HTML/CSS/JS inline).
- **Hosting** : 
  - **PRIORITÉ 1** : Fichier local (usage hors-ligne, aucune dépendance réseau)
  - ⚠️ **Hors scope v3.0** : GitHub Pages, Netlify, Vercel (voir [BACKLOG.md](./BACKLOG.md))
- **Versionning** : Tags Git pour chaque release (ex: `v3.0`, `v3.1-phase2`, `v4.0`).
- **Distribution** : Fichier HTML unique téléchargeable directement depuis le repository.

### Workflow de Release
1. Merge de la branche de développement vers `main`
2. Création du tag Git : `git tag v3.x -m "Release Phase X"`
3. Push du tag : `git push origin v3.x`
4. Release GitHub avec fichier HTML attaché

---

## ❌ Hors Périmètre v3.0

Ce qui n'est **PAS** inclus dans le scope actuel du projet :

### Backend & Infrastructure
- ❌ Serveur backend (Node.js, PHP, etc.)
- ❌ Base de données (SQL, MongoDB, etc.)
- ❌ Authentification utilisateur (comptes, login)
- ❌ Synchronisation cloud multi-device
- ❌ Hébergement web (GitHub Pages, Netlify, etc.)

### Fonctionnalités avancées
- ❌ Générateur de dés animés 3D (respect du principe Physical First)
- ❌ Mode multi-joueur / partage en temps réel
- ❌ Intégration Discord/Slack
- ❌ Support des règles homebrew ou Unearthed Arcana (UA)
- ❌ Génération automatique de personnages (tirage de stats)

### Contenus étendus
- ❌ Bestiaire complet (monstres, PNJ)
- ❌ Gestion de campagne (notes, quêtes, journal)
- ❌ Calculateur de rencontres (CR, XP)

**Note** : Ces fonctionnalités sont documentées dans [BACKLOG.md](./BACKLOG.md) pour évaluation future (v4.0+).

---

## 🔄 Migration de Schéma

### Politique de Versioning
Basée sur les règles définies dans `DND_VOCABULARY.md` :
- **v3.0.x** : Modifications < 200 caractères (patch)
- **v3.x** : Modifications ≥ 200 caractères (minor)
- **v4.0** : Breaking changes (major)

### Stratégie de Migration

#### v2.x → v3.0
**Changements requis** :
1. Ajout obligatoire du champ `schemaVersion: "3.0"` dans `const C`
2. Renommage des clés :
   - `class` → `class_fr`
   - `subclass` → `subclass_fr`
3. Ajout des champs bilingues :
   - `name_en` dans tous les sorts
   - `duration_fr` pour les sorts

**Script de migration** (à exécuter dans la console du navigateur) :
```javascript
// Exemple de migration localStorage v2 → v3
function migrateV2ToV3() {
  const keys = Object.keys(localStorage).filter(k => k.startsWith('tawyndnd_state_'));
  keys.forEach(key => {
    const data = JSON.parse(localStorage.getItem(key));
    if (!data.schemaVersion || data.schemaVersion < "3.0") {
      // Appliquer transformations
      data.schemaVersion = "3.0";
      if (data.class) { data.class_fr = data.class; delete data.class; }
      if (data.subclass) { data.subclass_fr = data.subclass; delete data.subclass; }
      localStorage.setItem(key, JSON.stringify(data));
      console.log(`Migrated: ${key}`);
    }
  });
}
```

#### v3.x → v3.y (Minor)
- **Rétrocompatibilité** : Garantie pour les champs existants
- **Nouveaux champs** : Optionnels avec valeurs par défaut
- **Migration automatique** : Le moteur détecte la version et applique les valeurs par défaut

#### v3.x → v4.0 (Major)
- **Breaking changes** : Possible modification de structure profonde
- **Migration manuelle** : Script de migration fourni avec documentation
- **Avertissement** : Alerte utilisateur avant migration (backup recommandé)

### Gestion des Conflits
Si le `schemaVersion` du personnage ne correspond pas à la version du moteur :
1. **Alerte** : Message d'avertissement à l'utilisateur
2. **Options** :
   - Migrer automatiquement (si v3.x → v3.y)
   - Télécharger une sauvegarde avant migration (recommandé)
   - Annuler et utiliser une version compatible du moteur

### Validation Post-Migration
- Tous les personnages migrés doivent passer `validate-character.html`
- Tests de non-régression sur 3 personnages types (Guerrier, Mage, Roublard)
- Vérification de l'intégrité des données volatiles (PV, slots, inventaire)
## 🚀 Build & Déploiement

- **Build** : Aucun processus de build requis (fichiers statiques).
- **Minification** : Optionnelle pour réduire la taille (HTML/CSS/JS inline).
- **Hosting** : 
  - GitHub Pages (recommandé pour simplicité)
  - Netlify / Vercel (alternatives)
  - Fichier local (usage hors-ligne possible)
- **Versionning** : Tags Git pour chaque release (ex: `v3.0`, `v3.1-phase2`, `v4.0`).
- **URL de production** : À définir (ex: `tawyndnd.github.io` ou domaine custom).

### Workflow de Release
1. Merge de la branche de développement vers `main`
2. Création du tag Git : `git tag v3.x -m "Release Phase X"`
3. Push du tag : `git push origin v3.x`
4. Déploiement automatique (GitHub Actions si configuré)

---

## ❌ Hors Périmètre v3.0

Ce qui n'est **PAS** inclus dans le scope actuel du projet :

### Backend & Infrastructure
- ❌ Serveur backend (Node.js, PHP, etc.)
- ❌ Base de données (SQL, MongoDB, etc.)
- ❌ Authentification utilisateur (comptes, login)
- ❌ Synchronisation cloud multi-device

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

**Note** : Ces fonctionnalités pourront être ajoutées en v4.0+ selon les besoins utilisateurs.

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
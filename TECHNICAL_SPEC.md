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
- **Device de Référence** : Samsung Galaxy S23 Ultra (utilisé pour les tests de rendu \"Ultra\" et captures).
- **Breakpoints CSS** :
  - `360px` : Petits smartphones (ex: iPhone SE, Galaxy A series).
  - `390px` : Standards modernes (ex: iPhone 14/15 Pro).
  - `430px` : Grands smartphones (ex: S23 Ultra, Pro Max).
  - `768px+` : Mode \"Consultation\" (Tablettes/Desktop).

---

## 💾 Stratégie de Persistance & Versioning

### Données Immuables (`const C`)
- Contient la structure fixe du personnage (Race, Classe, Sorts appris).
- Doit inclure un champ `schemaVersion: \"3.0\"`.

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
3. **Non-Régression** : Avant chaque itération, vérifier que le bouton \"Repos Long\" réinitialise correctement les ressources définies.
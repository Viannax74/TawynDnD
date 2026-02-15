# TawynDnD ⚔️

**TawynDnD** est un système de fiches de personnage digitales interactives pour **Dungeons & Dragons 5ème Édition 2014 core et extensions officielles**, conçu pour être utilisé directement dans un navigateur sans installation complexe.

Ce dépôt sert de base pour l'évolution de mes outils de jeu D&D, alliant esthétique moderne et fonctionnalités pratiques pour les joueurs.

## ✨ Fonctionnalités clés

- **Design "Glassmorphism" :** Une interface sombre et élégante optimisée pour la lisibilité en session de jeu sur smartphone, galaxy s ultra 23.
- **Interactivité Totale :** 
  - Suivi des points de vie (PV), points de vie temporaires et dés de vie.
  - Gestion des emplacements de sorts et des capacités limitées (repos courts/longs).
  - Inventaire interactif avec gestion des quantités.
- **Ne jamais coder des Lancers de Dés Intégrés mais afficher des champs pour que le joueur entre les résultats de ses dés phyiques:** Cliquez sur une compétence, une attaque ou un sort pour générer un unchamp éditable our metter le résultat du jet de dé avec affichage des résultats pour le jet, les dégâts, la sauvegarde....
- **Modes Contextuels :** Basculez entre les modes type **Social**, **Exploration** et **Combat** pour adapter l'affichage aux besoins du moment, cela évoluera pour une version plus simple.
- **Sauvegarde Automatique :** L'état de la fiche (PV restants, ressources utilisées) est conservé localement dans votre navigateur (`localStorage`).

## 🗺️ Roadmap : TawynDnD Ultimate

### Phase 1 : Architecture de Données & Schéma "IA-Ready"
- [ ] Définition des catégories d'actions (`actions`, `bonus_actions`, `reactions`, `special_features`).
- [ ] Standard i18n : Préparation de la structure pour la traduction technique.
- [ ] Moteur d'Économie : Structure pour stocker l'état "utilisé/disponible" de chaque ressource.

### Phase 2 : Le Moteur de Saisie "Physique" & Logs
- [ ] Composant Input : Champ de saisie numérique calculant le total en temps réel.
- [ ] Système de Log (Mémoire de 10+ entrées) : Historique circulaire des actions de session.
- [ ] Onglet Journal : Vue dédiée pour consulter l'historique.

### Phase 3 : La "Master Sheet" (Interface Principale)
- [ ] Layout Papier-Digital : Segmentation prioritaire (Stats -> Saves -> Skills -> Actions).
- [ ] Groupement par Type : Actions [A], Actions Bonus [AB], Réactions [R].
- [ ] Badges Interactifs : Marquage visuel des ressources consommées.

### Phase 4 : Grimoire Étendu & Inventaire en Cartes
- [ ] Import AideDD : Moteur de recherche filtrant le JSON complet des sorts.
- [ ] Système de Cartes (Expandable) : Descriptions détaillées pour l'équipement et les sorts.
- [ ] Cross-Tagging : Injection des sorts d'objets magiques dans le grimoire.

### Phase 5 : Optimisation Mobile & Finalisation IA
- [ ] S23 Ultra Polish : Ajustement des zones tactiles et de la densité visuelle.
- [ ] Documentation IA : Guide d'immutabilité du moteur pour les mises à jour de données par IA.

## 📁 Fiches disponibles

Actuellement, le dépôt contient les personnages et templates suivants :
- **Moros Gravewalker** (Occultiste / Lame maudite) :
  - `tawyndnd-moros-v3.html` (Version la plus récente, moteur optimisé)
  - `tawyndnd-moros-v2-best.html` (Version la plus riche, contenu très bon)
- **Steiner** :
  - `tawyndnd-steiner-v2.4.html` (autre personnage, autre unvivers, contenu très bon pour guerrier, sans sorts mais autre capacités)

## 🚀 Comment l'utiliser ?

1.  **Utilisation simple :** Téléchargez ou clonez le dépôt et ouvrez n'importe quel fichier `.html` dans votre navigateur préféré.
2.  **Création d'un nouveau personnage :**
    - Dupliquez l'un des fichiers HTML (par exemple `tawyndnd-moros-v3.html`).
    - Ouvrez le fichier avec un éditeur de texte.
    - Modifiez l'objet `const C` au début de la balise `<script>` avec les statistiques de votre personnage.
    - Modifiez la liste `const SPELLS` pour y ajouter vos sorts.
3.  Variable identité et contenu du personnage peut-être modifiable par n'importe quelle ia, sans casser le moteur

---
*Ce projet est en constante évolution pour offrir la meilleure expérience de jeu numérique possible.*
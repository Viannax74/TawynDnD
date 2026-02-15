# TawynDnD ⚔️

**TawynDnD** est un système de fiches de personnage digitales interactives pour **Dungeons & Dragons 5ème Édition**, conçu pour être utilisé directement dans un navigateur sans installation complexe.

Ce dépôt sert de base pour l'évolution de mes outils de jeu D&D, alliant esthétique moderne et fonctionnalités pratiques pour les joueurs.

## ✨ Fonctionnalités clés

- **Design "Glassmorphism" :** Une interface sombre et élégante optimisée pour la lisibilité en session de jeu.
- **Interactivité Totale :** 
  - Suivi des points de vie (PV), points de vie temporaires et dés de vie.
  - Gestion des emplacements de sorts et des capacités limitées (repos courts/longs).
  - Inventaire interactif avec gestion des quantités.
- **Lancé de Dés Intégré :** Cliquez sur une compétence, une attaque ou un sort pour générer un jet de dé instantané avec affichage des résultats.
- **Modes Contextuels :** Basculez entre les modes **Social**, **Exploration** et **Combat** pour adapter l'affichage aux besoins du moment.
- **Sauvegarde Automatique :** L'état de la fiche (PV restants, ressources utilisées) est conservé localement dans votre navigateur (`localStorage`).

## 📁 Fiches disponibles

Actuellement, le dépôt contient les personnages et templates suivants :
- **Moros Gravewalker** (Occultiste / Lame maudite) :
  - `tawyndnd-moros-v3.html` (Version la plus récente, optimisée)
  - `tawyndnd-moros-v2-best.html`
- **Steiner** :
  - `tawyndnd-steiner-v2.4.html`

## 🚀 Comment l'utiliser ?

1.  **Utilisation simple :** Téléchargez ou clonez le dépôt et ouvrez n'importe quel fichier `.html` dans votre navigateur préféré.
2.  **Création d'un nouveau personnage :**
    - Dupliquez l'un des fichiers HTML (par exemple `tawyndnd-moros-v3.html`).
    - Ouvrez le fichier avec un éditeur de texte.
    - Modifiez l'objet `const C` au début de la balise `<script>` avec les statistiques de votre personnage.
    - Modifiez la liste `const SPELLS` pour y ajouter vos sorts.

---
*Ce projet est en constante évolution pour offrir la meilleure expérience de jeu numérique possible.*
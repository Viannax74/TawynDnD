# TawynDnD ⚔️ — Ultimate Digital Character Sheet

**TawynDnD** est un système de fiches de personnage interactives pour **Dungeons & Dragons 5ème Édition (2014 & 2024)**, conçu pour offrir une expérience "Glassmorphism" moderne, optimisée pour le jeu sur smartphone (spécifiquement Galaxy S23 Ultra) et la saisie manuelle des résultats de dés physiques.

Ce dépôt sert de base technique et documentaire pour l'évolution vers une **Master Sheet** universelle, capable d'accueillir n'importe quelle classe avec une fidélité maximale aux règles officielles.

---

## 🎯 Vision & Principes Directeurs

1.  **Physical First :** Contrairement aux simulateurs RNG, TawynDnD privilégie l'immersion. Le moteur affiche des champs de saisie pour que le joueur entre ses résultats de dés réels, tout en calculant automatiquement les bonus et les effets.
2.  **Master Sheet Format :** Une vue centralisée regroupant tout (Stats, Combat, Sorts, Bio, Inventaire) sur une seule page fluide, sans temps de chargement.
3.  **Interaction par "Cochage" :** Utilisation de cases à cocher interactives pour les emplacements de sorts (slots), les capacités limitées (Second Souffle, Malédiction) et les munitions.
4.  **IA-Ready :** L'architecture sépare strictement les **Données du Personnage** (`const C`) du **Moteur de Rendu**. Cela permet à n'importe quelle IA de modifier le contenu du personnage sans casser les fonctionnalités.
5.  **Précision Technique (AideDD) :** Intégration des termes techniques français officiels (Écoles de magie, Composantes, Temps d'incantation) pour une clarté totale.

---

## 📁 Écosystème Actuel

-   **Moros Gravewalker** (Occultiste Lame Maudite) :
    -   `characters/moros-v3.0-20260215-1558.html` : Dernière version stable, moteur optimisé avec gestion des sorts et invocations.
-   **Steiner Ferum** (Guerrier Maître de Guerre) :
    -   `characters/steiner-ferum-v3.0-20260216-1630.html` : Modèle de fiche martiale avec gestion des manœuvres, dés de supériorité et tactiques de combat.

---

## 🗺️ Roadmap "TawynDnD Ultimate"

### Phase 1 : Standardisation (Terminée ✅)
- Unification du CSS pour un thème sombre "Glass" cohérent.
- Création d'un schéma d'objet `C` universel supportant toutes les classes.
- Mise en place de la structure "Checkable" pour les ressources (slots, points de sorcellerie, ki).

### Phase 2 : Richesse des Données Sorts
- Implémentation du format AideDD complet pour les sorts :
    - École (Abjuration, Évocation, etc.)
    - Temps d'incantation (Action, Action Bonus, Réaction, Rituel)
    - Portée et Composantes (V, S, M)
- Filtres de recherche par niveau, école et type d'action.

### Phase 3 : Localisation & i18n
- Séparation des textes dans des fichiers de langue dédiés.
- Support natif Français/Anglais pour les noms de sorts et capacités.

### Phase 4 : Inventaire & Magie Dynamique
- Gestion avancée du poids et des objets magiques avec "attunement".
- Liens vers les ressources externes (AideDD, D&D Beyond) pour consultation rapide.

### Phase 5 : Automatisation IA
- Scripting de mise à jour automatique des PV et ressources via prompt.
- Génération de backstory et de conseils RP basés sur les stats.

---

## 🛠️ Guide de Développement

### Modifier un personnage
Ouvrez le fichier HTML et modifiez la structure `const C`. Assurez-vous de respecter les types de données :
```javascript
const C = {
  name: "Nom",
  level: 6,
  class_fr: "Guerrier",
  // Les sorts utilisent le format complet AideDD
  spells: [
    { name_fr: "Bouclier", level: 1, school: "Abjuration", time: "1 réaction" }
  ]
};
```

### Contribuer
Les modifications doivent être testées sur mobile (S23 Ultra) pour garantir la réactivité. Utilisez exclusivement des variables CSS (`--accent`, `--bg-primary`) pour permettre un changement de thème rapide par classe.

---
*Fait par et pour des joueurs passionnés.*
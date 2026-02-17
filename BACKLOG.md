# 📋 BACKLOG — TawynDnD Ultimate
**Version :** 3.0.1 — 17 février 2026  
**Synchronisé avec :** [GitHub Issues](https://github.com/Viannax74/TawynDnD/issues) | [Project Board](https://github.com/users/Viannax74/projects/2)

---

## 🔥 Priorité Immédiate

### Moteur de rendu Steiner — Template Martial
**Issue :** À créer  
**Status :** 🔴 Bloquant  
**Description :**  
Le fichier `steiner-ferum-v3.0-20260216-1630.html` contient un `const C` complet mais **aucun moteur de rendu** (HTML/CSS/JS). La fiche est fonctionnellement vide côté affichage.

**Travail requis :**
- Implémenter le moteur HTML/JS pour les sections : Stats, Combat, Manœuvres, Équipement, Personnalité, Serment
- Adapter le design system glassmorphism en rouge (`--accent: #ef4444`)
- Afficher les dés de supériorité (5d8) avec cases à cocher interactives
- Afficher le bloc Serment du dernier rempart avec avertissement visuel
- **Ne pas implémenter de section Sorts** (classe martiale)

**Référence :** Utiliser `moros-v3.0-20260217-1200.html` comme inspiration de structure, adapter les sections spécifiques aux guerriers.

---

## 🗺️ Roadmap & Phases

### ✅ Phase 1 — Standardisation & Cohérence Technique
**Issue :** [#2](https://github.com/Viannax74/TawynDnD/issues/2)  
**Status :** ✅ Terminée  
Unification du thème Glassmorphism, schéma `const C` universel, validation automatique.

---

### 🔴 Phase 2 — Format AideDD Complet pour les Sorts
**Issue :** [#3](https://github.com/Viannax74/TawynDnD/issues/3)  
**Status :** 🔴 À faire — Concerne uniquement Moros  
**Priorité :** Haute  
Intégration des propriétés complètes des sorts : École, Composantes, Portée, Temps d'incantation.  
**Périmètre :** `moros-v3.0-*.html` uniquement. Steiner n'est pas concerné.

---

### 🔴 Phase 3 — Internationalisation (i18n)
**Issue :** [#4](https://github.com/Viannax74/TawynDnD/issues/4)  
**Status :** 🔴 À faire  
**Priorité :** Moyenne  
Support multilingue Français/Anglais pour l'interface et les sorts.

---

### 🔴 Phase 4 — Inventaire Interactif
**Issue :** [#5](https://github.com/Viannax74/TawynDnD/issues/5)  
**Status :** 🔴 À faire  
**Priorité :** Moyenne  
Gestion dynamique de l'inventaire : catégories, quantités, poids, objets magiques.

---

### 🔴 Phase 5 — Export & Import des Personnages
**Issue :** [#6](https://github.com/Viannax74/TawynDnD/issues/6)  
**Status :** 🔴 À faire  
**Priorité :** Haute  
Sauvegarde/chargement JSON, partage URL (base64), backup localStorage.

---

## 🎯 Features Complémentaires

### PWA — App Native
**Issue :** [#8](https://github.com/Viannax74/TawynDnD/issues/8) | Effort : 4h  
Installation comme app native smartphone (mode offline, icône d'accueil).

### Backup Automatique 24h
**Issue :** [#9](https://github.com/Viannax74/TawynDnD/issues/9) | Effort : 3h  
Export JSON automatique toutes les 24h.

### Historique des Jets de Dés
**Issue :** [#11](https://github.com/Viannax74/TawynDnD/issues/11) | Effort : 2h  
Journal circulaire des 20 derniers jets manuels.

### Notes de Session
**Issue :** [#12](https://github.com/Viannax74/TawynDnD/issues/12) | Effort : 2h  
Textarea persistant (localStorage) pour notes de session.

---

## ✅ Features à Conserver (Physical First)
- Gestion de personnage local
- Backups locaux (localStorage + JSON export)
- PWA capability
- Suivi des emplacements de sorts (Moros)
- Notes de session
- Calculateur de poids
- Thème customisable via variables CSS

## ❌ Features Hors Périmètre
- Animations de dés (RNG) — contre le principe Physical First
- Fonctionnalités multijoueur
- Intégration Discord
- Fonctionnalités communautaires

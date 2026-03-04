#!/usr/bin/env bash
set -euo pipefail

export LC_ALL=C.UTF-8

if ! command -v gh >/dev/null 2>&1; then
  echo "Erreur: gh CLI est introuvable. Installez GitHub CLI puis relancez." >&2
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "Erreur: gh n'est pas authentifié. Lancez: gh auth login" >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Création des sub-issues du backlog..."

issue_exists() {
  local title="$1"

  gh issue list --state all --limit 200 --search "${title} in:title" --json title --jq '.[].title' | grep -Fxq "$title"
}

create_sub_issue() {
  local title="$1"
  local size="$2"
  shift 2

  if issue_exists "$title"; then
    echo "SKIP (déjà existante): $title"
    return 0
  fi

  local body
  body="$(printf "Taille: %s\n\nCritères d'acceptation:\n" "$size")"
  local criterion
  for criterion in "$@"; do
    body+="$(printf -- "- %s\n" "$criterion")"
  done

  gh issue create \
    --title "$title" \
    --body "$body" \
    --label "enhancement"

  echo "OK: $title"
}

create_sub_issue "Sub-issue 0.1 — Template de PR standard" "S" \
  "Template PR inclut: objectif, scope, hors-scope, tests manuels, risques." \
  "Toute PR future l’utilise."

create_sub_issue "Sub-issue 0.2 — Convention de découpage (issue = PR)" "S" \
  "Règle écrite: 1 sub-issue = 1 PR." \
  "Taille cible indiquée (S/M/L) et max “scope logique” défini."

create_sub_issue "Sub-issue 1.1 — Définir le schéma minimal C" "S" \
  "Liste des champs obligatoires + types." \
  "Liste des champs optionnels + valeurs par défaut documentées."

create_sub_issue "Sub-issue 1.2 — Implémenter validateSchema(C) dans le builder" "M" \
  "Validation bloquante avant génération." \
  "Message d’erreur lisible (champ manquant/type invalide)." \
  "Pas de génération si invalide."

create_sub_issue "Sub-issue 1.3 — Validation au boot dans la fiche" "M" \
  "Si C invalide: écran d’erreur explicite + pas de crash JS." \
  "Journal minimal d’erreurs dans console."

create_sub_issue "Sub-issue 1.4 — Valeurs par défaut robustes" "S" \
  "Champs optionnels absents ne cassent pas le rendu." \
  "Fallbacks testés sur 2 personnages différents."

create_sub_issue "Sub-issue 2.1 — Bandeau “tour de jeu” (Action / Bonus / Réaction)" "M" \
  "Toggles rapides visibles en mode combat." \
  "Reset 1 clic (nouveau tour)."

create_sub_issue "Sub-issue 2.2 — Actions rapides HP / Temp HP / slots / ressources" "M" \
  "Opérations courantes en ≤2 interactions." \
  "Aucune saisie clavier obligatoire pour les cas courants."

create_sub_issue "Sub-issue 2.3 — Concentration + conditions compactes" "M" \
  "État concentration toujours visible." \
  "Conditions actives lisibles d’un coup d’œil."

create_sub_issue "Sub-issue 2.4 — Journal léger d’événements" "M" \
  "Enregistre les 20 derniers événements (jets, dégâts, toggles)." \
  "Effaçable rapidement, persisté localement."

create_sub_issue "Sub-issue 2.5 — Mode lisibilité table (haut contraste / gros chiffres)" "S" \
  "Toggle accessibilité." \
  "Lisibilité améliorée sur mobile et en faible luminosité."

create_sub_issue "Sub-issue 3.1 — Créer repo annexe content-pipeline" "S" \
  "Structure minimale: ingest / normalize / export." \
  "README pipeline clair."

create_sub_issue "Sub-issue 3.2 — Schéma canonique de contenu" "M" \
  "IDs stables (spellId, ruleId, etc.)." \
  "Champs obligatoires: lang, source, version, updatedAt."

create_sub_issue "Sub-issue 3.3 — Ingestion dnd5eapi (SRD)" "M" \
  "Import automatisé de base (spells/conditions/classes SRD)." \
  "Mapping vers schéma canonique."

create_sub_issue "Sub-issue 3.4 — Compléments FR/EN (AideDD + curation manuelle)" "L" \
  "Pipeline de compléments sans écraser la source canonique." \
  "Traçabilité de provenance par entrée."

create_sub_issue "Sub-issue 3.5 — Politique licence/provenance" "S" \
  "Règles d’usage documentées par source." \
  "Aucune entrée “sans source”."

create_sub_issue "Sub-issue 3.6 — Export packs versionnés" "M" \
  "rules.fr.json + rules.en.json + index." \
  "Versionnement explicite et changelog minimal."

create_sub_issue "Sub-issue 4.1 — Loader de pack local" "M" \
  "Le builder lit un pack local unique." \
  "Aucun fetch réseau requis en runtime."

create_sub_issue "Sub-issue 4.2 — Résolution des clés + fallback FR↔EN" "M" \
  "Fallback déterministe si traduction absente." \
  "Affichage non cassé si clé manquante."

create_sub_issue "Sub-issue 4.3 — Remplacer les chaînes hardcodées de règles" "L" \
  "Les textes de règles principaux viennent du pack." \
  "Régression visuelle/fonctionnelle nulle."

create_sub_issue "Sub-issue 5.1 — Contrat “sections conditionnelles”" "S" \
  "Règles claires: quand afficher/masquer sorts, invocations, etc."

create_sub_issue "Sub-issue 5.2 — DEFAULT_STATE piloté par données" "M" \
  "Pas de champs spécifiques classe hardcodés." \
  "Initialisation basée sur C.resources et capacités."

create_sub_issue "Sub-issue 5.3 — Matrice de tests manuels multi-classes" "M" \
  "Cas minimum: Fighter, Cleric, Warlock." \
  "Chaque cas passe la checklist génération + session."

create_sub_issue "Sub-issue 6.1 — Smoke tests de génération" "M" \
  "Génération HTML valide pour 3 profils." \
  "Vérification présence des blocs critiques."

create_sub_issue "Sub-issue 6.2 — Checklist offline stricte" "S" \
  "Procédure “mode avion” documentée." \
  "Aucun asset externe requis."

create_sub_issue "Sub-issue 6.3 — Guide contribution IA-friendly" "S" \
  "Prompt template standard." \
  "Règles de découpage S/M/L et définition de done."

create_sub_issue "Sub-issue 6.4 — Documentation schéma C + exemples" "M" \
  "Exemple minimal + exemple complet." \
  "Champ par champ: type + rôle + fallback."

echo "Terminé: création des sub-issues demandées."
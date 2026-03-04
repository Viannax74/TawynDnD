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

label_exists() {
  local name="$1"
  gh label list --limit 500 --json name --jq '.[].name' | grep -Fxq "$name"
}

upsert_label() {
  local name="$1"
  local color="$2"
  local description="$3"

  if label_exists "$name"; then
    gh label edit "$name" --color "$color" --description "$description" >/dev/null
    echo "UPDATE: $name"
  else
    gh label create "$name" --color "$color" --description "$description" >/dev/null
    echo "CREATE: $name"
  fi
}

echo "Application de la taxonomie de labels..."

upsert_label "enhancement" "a2eeef" "Évolution fonctionnelle"

upsert_label "epic" "5319e7" "Initiative multi-issues orientée résultat produit"
upsert_label "issue" "0e8a16" "Unité de travail standard"
upsert_label "sub-issue" "1d76db" "Unité minimale recommandée: 1 PR"

upsert_label "size:S" "c2e0c6" "Petit changement local, faible risque"
upsert_label "size:M" "fef2c0" "Changement modéré sur zones cohérentes"
upsert_label "size:L" "f9d0c4" "Changement large, à découper si possible"

upsert_label "area:builder" "0052cc" "Concerne character-builder"
upsert_label "area:character-sheet" "0366d6" "Concerne fiches générées"
upsert_label "area:i18n" "5319e7" "Concerne internationalisation"
upsert_label "area:data-schema" "006b75" "Concerne schémas de données"
upsert_label "area:docs" "1d76db" "Concerne documentation"
upsert_label "area:tooling" "fbca04" "Concerne scripts et outillage"

upsert_label "priority:P0" "b60205" "Bloquant"
upsert_label "priority:P1" "d93f0b" "Important"
upsert_label "priority:P2" "fbca04" "Normal"
upsert_label "priority:P3" "0e8a16" "Opportunité"

upsert_label "status:ready" "0e8a16" "Prêt à être pris"
upsert_label "status:in-progress" "fbca04" "Travail en cours"
upsert_label "status:blocked" "b60205" "Bloqué par dépendance ou contexte"
upsert_label "status:review" "1d76db" "En revue"
upsert_label "status:done" "5319e7" "Terminé"

upsert_label "blocked-by" "d4c5f9" "Dépend d'une autre issue"
upsert_label "blocks" "bfd4f2" "Bloque d'autres issues"

echo "Terminé: taxonomie de labels appliquée."
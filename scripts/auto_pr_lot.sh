#!/bin/bash
# filepath: scripts/auto_pr_lot.sh

set -e

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <branch-name> <issue_number_1> [<issue_number_2> ...]"
  exit 1
fi

BRANCH="$1"
shift
ISSUES=("$@")
REPO="Viannax74/TawynDnD"

# Récupère les titres des issues pour le titre de la PR
PR_TITLE="Lot: "
for ISSUE in "${ISSUES[@]}"; do
  TITLE=$(gh issue view "$ISSUE" --repo "$REPO" --json title -q ".title")
  PR_TITLE+="#${ISSUE} ${TITLE}; "
done

# Crée et bascule sur la branche si elle n'existe pas déjà
git checkout -b "$BRANCH" 2>/dev/null || git checkout "$BRANCH"

echo "Branche de travail: $BRANCH"

# À ce stade, tu fais tes modifs, commits, etc.
git push -u origin "$BRANCH"

# Prépare le body de la PR avec tous les Closes
PR_BODY=""
for ISSUE in "${ISSUES[@]}"; do
  PR_BODY+="Closes #$ISSUE"$'\n'
done

# Crée la PR si elle n'existe pas
if ! gh pr view "$BRANCH" --repo "$REPO" &>/dev/null; then
  gh pr create --repo "$REPO" --base main --head "$BRANCH" --title "$PR_TITLE" --body "$PR_BODY"
else
  echo "PR déjà existante pour $BRANCH"
fi

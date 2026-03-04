# 🪓 Convention de découpage : Issue = PR

## Règle de base
- **Chaque issue correspond à une PR unique.**
- Les sous-issues (sub-issues) sont créées pour chaque étape atomique ou patch isolable.
- Une PR ne doit jamais traiter plusieurs sub-issues majeures à la fois.

## Workflow recommandé
1. **Créer une issue** pour chaque tâche ou patch atomique (sub-issue).
2. **Créer une branche** dédiée pour chaque sub-issue.
3. **Ouvrir une PR** qui ne traite que l’issue correspondante.
4. **Clôturer l’issue** automatiquement via la PR (`Closes #num`).

## Avantages
- Traçabilité maximale (1 patch = 1 issue = 1 PR)
- Revue facilitée, historique propre
- Rollback et cherry-pick simplifiés

## Exceptions
- Les corrections de typo ou docs mineures peuvent être groupées si elles ne touchent pas au code métier.

---
> _Cette convention garantit la robustesse et la lisibilité de l’historique du projet._

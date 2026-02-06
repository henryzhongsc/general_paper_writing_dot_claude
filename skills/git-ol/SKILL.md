---
description: Commit and push to Overleaf
---
Commit and push to Overleaf, excluding `.claude` submodule.

**CRITICAL: Exclude, Never Delete**
- The `.claude/` folder must NEVER be deleted or `git rm`'d — only excluded from the `overleaf` branch.
- If merge conflicts occur involving `.claude`, do NOT attempt to delete it. Instead, abort the merge and use the checkout-specific-files approach below.

**Steps:**

1. On `main`: check for untracked files (ask user if any), then commit all changes.
2. Sync to overleaf branch by checking out specific files (NOT merging):
   ```bash
   git checkout overleaf
   # Checkout only the changed files from main (explicitly list them, excluding .claude)
   git checkout main -- <list-of-changed-files>  # Never include .claude or .gitmodules
   git add <those-files>
   git commit -m "<message>" && git push overleaf overleaf:master
   git checkout main
   ```

**Note:** Never use `git merge` for the overleaf branch — it causes conflicts with .claude. Always use `git checkout main -- <files>` to selectively bring changes.

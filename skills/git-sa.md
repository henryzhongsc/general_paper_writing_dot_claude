---
description: Sync all — full push to GitHub and Overleaf
---

Sync all changes to GitHub (both `.claude` submodule and parent repo) and Overleaf.

**CRITICAL: Exclude, Never Delete**
- When syncing to Overleaf, the `.claude/` folder must NEVER be deleted — only excluded from the `overleaf` branch.
- See `/git-ol` for the correct approach.

**Steps:**

1. Check for untracked files that are NOT ignored. If any exist, list them and ask the user whether each should be tracked (added to the commit) or left untracked.

2. Execute `/git-fp`: Commit and push both the `.claude` submodule and parent repo to GitHub.

3. Execute `/git-cp`: Commit and push any remaining changes to GitHub.

4. Execute `/git-ol`: Sync to the `overleaf` branch and push to the Overleaf remote.

**Output:** Report what was committed and pushed at each step, or indicate if there were no changes.

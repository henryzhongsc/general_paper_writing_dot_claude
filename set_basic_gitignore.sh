#!/usr/bin/env bash
# Creates a basic .gitignore at the parent project root.
# This script lives at .claude/set_basic_gitignore.sh when used as a submodule.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET="$PROJECT_ROOT/.gitignore"

GITIGNORE_CONTENT='# LaTeX auxiliary files
main.*
!main.pdf
!main.tex

# macOS
.DS_Store'

if [[ -f "$TARGET" ]]; then
    echo "Warning: $TARGET already exists."
    read -rp "Overwrite? [y/N] " answer
    if [[ "$answer" != [yY] ]]; then
        echo "Aborted."
        exit 0
    fi
fi

echo "$GITIGNORE_CONTENT" > "$TARGET"
echo "Created $TARGET"

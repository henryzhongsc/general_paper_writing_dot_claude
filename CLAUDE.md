# ML Paper Writing Assistant

## Available Slash Commands

- `/fl` — Fix language and writing issues. Polishes text while preserving the author's style, fixing grammar, spelling, and improving clarity.
- `/writing-review` — Review selected text against ML paper writing principles. Provides suggestions for clarity, precision, and flow.
- `/git-cp` — Commit and push all changes with a concise commit message.
- `/git-fp` — Full push — commit and push both .claude submodule and parent repo.
- `/git-pin` — Create an empty commit as a version pin with a 📌 prefix, then push.
- `/git-ol` — Commit and push to Overleaf, excluding `.claude` submodule.
- `/git-sa` — Sync all — full push to GitHub and Overleaf.
- `/git-fuse-pc` — Amend all changes into the previous commit and force push.

## Git Guidelines

- **CRITICAL:** Before running any git command, verify you are in the parent paper repo, not inside the `.claude` submodule. The `.claude` folder has its own git history — running commands there targets the wrong repository.
- When making commits, do NOT add a Co-Authored-By line.
- Write concise commit message prefixed by a task category, e.g., "Chore: ", "New Feature: ", etc.

## LaTeX Editing Guidelines

When editing LaTeX content:
- Preserve existing formatting, line breaks, and section structure
- Keep spaces around em dashes ( — )
- Maintain semicolon usage as-is
- Do not add escape characters unless already present
- Keep citations and references intact (e.g., `~\ref{}`, `~\cite{}`)


---


## Project Structure

- `main.tex` — Main document entry point
- `content/sec/` — Paper sections (abstract, intro, background, threat model, method, experiments, conclusion)
- `content/app/` — Appendix content
- `statement/` — Acknowledgments and ethics statement
- `asset/fig/raw/` — Raw image files (png, pdf, jpg)
- `asset/fig/render/` — LaTeX figure wrapper files
- `asset/tab/` — Tables
- `utils/` — User packages and utility vault
- `ref.bib` — Bibliography
- `*.sty` and `*.bst` — Style files defined by the conference, should never modify these files.

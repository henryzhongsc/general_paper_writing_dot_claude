# ML Paper Writing Config for Claude Code

Shared Claude Code configuration for ML paper writing projects. Use as a git submodule to sync across multiple paper repos.

---

## Why This Setup Might Be For You

Overleaf is the default standard for collaborative LaTeX writing. This makes sense because the majority of your team members might not want to deal with the LaTeX environment or the history management of edits (which are handled server-side by Overleaf); yet, they may still want to offer paper writing feedback via UI features like track changes, comments, etc. In any case, it would be a major hassle to convince *all* of your coauthors to hop onto another collaborative workflow.

However, you cannot easily access powerful AI assistants like Claude Code via Overleaf’s web UI. This setup provides a 3-way, bidirectional sync between Overleaf, a GitHub repo, and your local machine, so you can engage in paper writing in your favourite IDE and AI buddy, while staying easily in sync. We want to emphasize that having bidirectional sync — where any edits from Overleaf can be pulled, and anything you push can be automatically reflected on the Overleaf end — is important for obvious reasons; this is something that the default Overleaf–GitHub integration does not support.

Additionally, most paper-writing projects share repetitive operations, which makes it reasonable to turn them into Claude Code skills (or something similar) that can be shared across multiple paper writing project repos. We enable this by making your `.claude` folder — which is this repo — a Git submodule. This adds some complexity with Overleaf, as Overleaf is essentially a restrictive Git upstream that does not natively support Git submodules. But we figured it out and turned them into skills that are already supplied here.


---

## Setup Guide for New Project

### 1. Create a project on Overleaf.com

### 2. Click `Integrations` (a button looks like `< >` in a box from the left sidebar) —> `GitHub Sync`, then clone the `<paper_project>` repo

It is recommended to avoid whitespace in the repo name.

### 3. Clone `paper_writing_dot_claude` repo as a submodule for a shared paper writing `.claude/` folder

```bash
cd <paper_project>
git submodule add https://github.com/henryzhongsc/paper_writing_dot_claude.git .claude
```

It is recommended that you fork this repo so that you can make customized updates to it.

### 4. Add a project-specific `CLAUDE.md`

Add a `CLAUDE.md` at your `<paper_project>` root for project-specific instructions (e.g., paper structure, venue details) and keep the `.claude/CLAUDE.md` generic for general paper writing purposes. Claude Code reads both files.


### 5. Optionally, add a git upstream for Overleaf

If we only do GitHub Sync Integration as Step 2, our updates to the GitHub repo will not be automatically reflected on Overleaf. Rather, we need to manually pull from the GitHub repo from the same Overleaf integration interface.

One way to resolve this is to add Overleaf as a git upstream for this project, by clicking the same `Integrations` button, then go for clone with git. This shall provide you the following command:

```bash
git clone https://git@git.overleaf.com/<your_project_identifier_number>
```

Add it as an upstream to this project via:

```bash
git remote add overleaf https://git.overleaf.com/<your_project_identifier_number>
```

Which can be committed and pushed via:

```bash
git push origin main    # to the GitHub upstream
git push overleaf main:master   # to the Overleaf upstream
```

**Note:** Overleaf's git integration does not support submodules — pushing a repository with submodules will fail or result in empty submodule directories. To work around this, the `/git-ol` skill maintains a separate `overleaf` branch that excludes the `.claude` submodule and `.gitmodules` file using git's `:(exclude)` pathspec. This branch is automatically kept in sync with `main` and pushed to the Overleaf remote. It is quite a long workflow to execute manually on a frequent basis, so I'd recommend just calling `/git-ol`.


### 6. Optionally, add a `.gitignore` under your paper project’s root.

Because you now need to locally compile LaTeX, you will have many intermediate files that you don’t necessarily want to live in your paper’s GitHub repo or on Overleaf. If so, you can run the following to set up a basic `.gitignore` to ignore these files.

```
cd .claude/
bash set_basic_gitignore.sh
```

You can also check options like the `Explorer: Exclude Git Ignore` VSCode setting (or something similar), so that such ignored intermediate files won’t clog up your editor.



---

## Setup Guide for Existing Project

This is for cloning a project repo that already has submodules.

### Option 1: Fresh clone from scratch

Use this when cloning a project for the first time. The `--recurse-submodules` flag fetches all submodule contents automatically.

```bash
git clone --recurse-submodules https://github.com/<your_github_id>/<paper_project>.git
```

Note: a direct `git clone` without `--recurse-submodules` will leave the `.claude/` folder empty — use Option 2 below to fix this.

### Option 2: Already cloned without submodules

Use this if you already cloned the project (without `--recurse-submodules`) and the `.claude/` folder is empty.

```bash
git submodule update --init
```

This command will initialize the submodule configuration and fetch the `.claude/` contents from the remote.

> Remember to add a project-specific `CLAUDE.md` if the cloned repo does not have one.

---

## Syncing the `.claude/` Folder

### Updating to latest `.claude/` configurations

```bash
cd .claude
git pull
```

### Sync updated `.claude/` to both `paper_writing_dot_claude` repo and your `<paper_project>` repo

Use the `/git-fp` slash command in Claude Code. This commits and pushes changes to the `.claude` submodule first, then commits and pushes the updated submodule reference to your paper project repo.

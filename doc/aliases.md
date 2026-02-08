# Setup reference — aliases, commands, keybinds, important configs

## Shell aliases (from config/.zshrc and ~/.zshrc)
- Navigation
  - `..` → `cd ..`
  - `...` → `cd ../..`
  - `....` → `cd ../../../`
- Shortcuts
  - `ls` → `ls --color=auto`
  - `ll` → `ls -asl`
  - `clc` → `clear`
  - `seek` → `ssh ant@host`
- Misc
  - `path` → prints PATH line-by-line
  - `serve` (in one zshrc) → `python -m http.server`
  - `de` / `us` (keyboard layouts via setxkbmap)
  - `lnks` → `~/.bookmarks/lnks.sh` (bookmark helper)

## PATH / env helpers
- `path_add <dir>` used to prepend directories to PATH.
- Typical additions:
  - Homebrew Python: `/opt/homebrew/opt/python@3.13/libexec/bin`
  - Node: `/opt/homebrew/opt/node@22/bin` or `node@24` in brew list
  - Java: `JAVA_HOME` set via `/usr/libexec/java_home -v21` when available

## fzf
- `FZF_DEFAULT_COMMAND` uses `fd --hidden --strip-cwd-prefix --exclude .git`
- Custom `FZF_DEFAULT_OPTS` colors are set and `eval "$(fzf --zsh)"` is used.

## Git aliases (from config/.gitconfig)
- `git c` → `commit -v`
- `git ca` → add all + commit (`!git add -A && git commit -av`)
- `git co` → `checkout`
- `git s` → `status`
- `git br` → `branch`
- `git l` → `log --oneline --graph`
- `git lg` → pretty graph log with author and relative time
- `git go <name>` → checkout or create branch helper
- `git undo` → `reset HEAD~1 --mixed`
- `git reset-hard` → `reset --hard HEAD`
- `git aliases` → list configured aliases

Global settings: `credential.helper = osxkeychain`, `init.defaultBranch = main`, `core.excludesfile = ~/.gitignore_global`

## tmux — custom keybinds & plugins (from config/.tmux.conf and ~/.tmux.conf)
Keybinds
- Prefix remapped: `C-s` (Ctrl-s).
- Reload config: Prefix then `r` (bind `r` → `source-file ~/.tmux.conf`)
- Split panes:
  - Horizontal: Prefix + `|`
  - Vertical: Prefix + `-`

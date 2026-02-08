# tmux Configuration Documentation

## Key Bindings
The following key bindings are configured in the `.tmux.conf` file:

- **Prefix Key**: The default prefix key has been changed from `C-b` to `C-s`.
- **Reload config**: `C-s` then `r` (bind `r` → `source-file ~/.tmux.conf`)
- **Split Panes**:
  - Horizontal split: `C-s` then `|`
  - Vertical split: `C-s` then `-`

## Mouse Support
Mouse support is enabled, allowing you to resize panes and select windows using the mouse.

## Status Bar Customization
The status bar is positioned at the top of the terminal and displays the current session information, including the directory and date/time.

## Plugins
The configuration includes several plugins managed by the tmux Plugin Manager (TPM):

- **tmux-resurrect**: Persists tmux sessions after a computer restart.
- **tmux-continuum**: Automatically saves sessions every 15 minutes.
- **tmux-prefix-highlight**: Highlights the prefix key in the status bar.
- **catppuccin/tmux**: Provides a theme for the tmux interface.
- **tmux-menus**: Adds menu functionality to tmux.
- TPM initialized (run `~/.tmux/plugins/tpm`)

## Common Commands
- Start a session: `tmux`
- List sessions: `tmux ls`
- Attach to session: `tmux attach-session -t <name>` (or `tmux a -t <name>`)
- Kill session: `tmux kill-session -t <name>`
- Reload config from outside tmux: `C-s r`
- Install plugins (TPM): press the TPM install binding `C-s I`
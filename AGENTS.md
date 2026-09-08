## Repository Purpose

Personal dotfiles for a CachyOS (Arch-based) Linux system running Sway. The files in this directory are the source of truth; they get symlinked into their expected locations on the host (see README).

## Layout

- `sway` — Sway window manager config; symlinked to `~/.config/sway/config`. Mod key is `Mod4` (Super), terminal is `kitty`, launcher is `rofi -show run`.
- `vim` — Vimrc; symlinked to `~/.vimrc`. Uses vim-plug (auto-bootstraps on first launch) with `vim-surround`, `vim-commentary`, `rose-pine/vim`. Leader is space; `jj` exits insert mode.
- `nvim.lua` — Neovim init; symlinked to `~/.config/nvim/init.lua`. Standalone Lua port of the vimrc using vim-plug (auto-bootstraps) with the same plugins (rose-pine swapped for `rose-pine/neovim`). Same options, highlights, and keymaps as `vim` — keep them in sync by hand when changing either file.
- `resetpacman.sh` — Clears the pacman package cache, re-rates CachyOS mirrors, and runs a full system upgrade. Requires sudo.

## Editing workflow

Edits to `vim`, `nvim.lua`, and `sway` take effect on the live system through the symlinks — no build step. After changing `sway`, reload with `Mod4+Shift+c` (or `swaymsg reload`). After changing `vim` or `nvim.lua`, `:source $MYVIMRC` in a running editor, or restart.

When adding a new config file, also update the README symlink list so the install steps stay complete.

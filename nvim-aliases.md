# Neovim VelocityNvim Aliases

Aliases for using VelocityNvim configuration with terminal Neovim and Neovide GUI.

## Zsh

Add to your `~/.zshrc`:

```bash
# VelocityNvim - Terminal
alias nvim-velocity="NVIM_APPNAME=VelocityNvim nvim"

# VelocityNvim - GUI (Neovide with X11 for better Fcitx5 support)
alias neovide-velocity="WINIT_UNIX_BACKEND=x11 NVIM_APPNAME=VelocityNvim neovide"
```

## Fish

Add to your `~/.config/fish/config.fish`:

```fish
# VelocityNvim - Terminal
alias nvim-velocity="env NVIM_APPNAME=VelocityNvim nvim"

# VelocityNvim - GUI (Neovide with X11 for better Fcitx5 support)
alias neovide-velocity="env WINIT_UNIX_BACKEND=x11 NVIM_APPNAME=VelocityNvim neovide"
```

## Usage

After adding the aliases and reloading your shell:

- `nvim-velocity` - Opens Neovim in terminal with VelocityNvim config
- `neovide-velocity` - Opens Neovide GUI with VelocityNvim config

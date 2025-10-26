# My Terminal Configurations

Personal configuration files for terminal tools and applications.

## Included Configurations

### WezTerm Terminal Emulator
- Custom key bindings
- Theme configuration
- Font settings
- Window appearance customization

### Kitty Terminal Emulator
- MesloLGS Nerd Font configuration
- Custom window settings with transparency
- Fcitx5 Input Method support (X11 backend for compatibility)
- Split window management
- Remote control enabled

### Neovide GUI for Neovim
- MesloLGS Nerd Font configuration
- Font rendering with full hinting and antialiasing
- Optimized for VelocityNvim setup

### Yazi File Manager
- Tokyo Night theme
- VelocityNvim editor integration
- Custom file type associations

## Installation

1. Clone this repository:
```bash
git clone https://github.com/Maik-0000FF/my-configs.git
```

### WezTerm Setup
2. Copy the WezTerm configuration:
```bash
cp .wezterm.lua ~/.wezterm.lua
```

### Kitty Setup
3. Copy the Kitty configuration:
```bash
cp kitty/kitty.conf ~/.config/kitty/
```

### Neovide Setup
4. Copy the Neovide configuration:
```bash
mkdir -p ~/.config/neovide
cp neovide/config.toml ~/.config/neovide/
```

### Yazi Setup
5. Copy the yazi configuration:
```bash
cp -r yazi/ ~/.config/yazi/
```

6. Restart your applications to apply the configurations.

## VelocityNvim Aliases

For easier access to VelocityNvim, add these aliases to your shell configuration.

### Zsh

Add to your `~/.zshrc`:

```bash
# VelocityNvim - Terminal
alias nvim-velocity="NVIM_APPNAME=VelocityNvim nvim"

# VelocityNvim - GUI (Neovide with X11 for better Fcitx5 support)
alias neovide-velocity="WINIT_UNIX_BACKEND=x11 NVIM_APPNAME=VelocityNvim neovide"
```

### Fish

Add to your `~/.config/fish/config.fish`:

```fish
# VelocityNvim - Terminal
alias nvim-velocity="env NVIM_APPNAME=VelocityNvim nvim"

# VelocityNvim - GUI (Neovide with X11 for better Fcitx5 support)
alias neovide-velocity="env WINIT_UNIX_BACKEND=x11 NVIM_APPNAME=VelocityNvim neovide"
```

**Usage:**
- `nvim-velocity` - Opens Neovim in terminal with VelocityNvim config
- `neovide-velocity` - Opens Neovide GUI with VelocityNvim config

See [nvim-aliases.md](nvim-aliases.md) for more details.

## Features

### WezTerm
- Custom key bindings
- Theme configuration
- Font settings
- Window appearance customization

### Kitty
- MesloLGS Nerd Font with proper fallback
- 80% background opacity for transparency
- X11 backend for better Fcitx5 compatibility
- Split window navigation (Ctrl+Shift+hjkl)
- Dynamic window resizing
- Cursor trail animation support

### Neovide
- MesloLGS Nerd Font (size 12) for all font variants
- Full hinting with antialiasing for sharp text rendering
- Consistent font family across normal, bold, italic, and bold-italic styles
- Integrated with VelocityNvim configuration

### Yazi
- Tokyo Night theme with comprehensive color scheme
- Integrated with VelocityNvim for file editing
- xdg-open fallback for file types
- Scrolloff settings for better navigation

## Requirements

- [WezTerm](https://wezfurlong.org/wezterm/) terminal emulator
- [Kitty](https://sw.kovidgoyal.net/kitty/) terminal emulator
- [Neovide](https://neovide.dev/) - GUI for Neovim
- [Yazi](https://yazi-rs.github.io/) file manager
- [Neovim](https://neovim.io/) with VelocityNvim configuration
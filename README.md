# My Configurations

Personal configuration files for terminal tools, applications and peripherals.

## Included Configurations

### Ghostty Terminal Emulator
- Tokyo Night Night color scheme
- MesloLGS Nerd Font, size 12
- Block cursor with inverted colors and custom thickness
- Vim-like split navigation (Ctrl+Shift+hjkl)
- Disabled click-to-move cursor (prevents unwanted zsh autosuggestion completion)
- Fcitx5/IME support via GTK

### WezTerm Terminal Emulator
- Custom key bindings
- Theme configuration
- Font settings
- Window appearance customization

### Kitty Terminal Emulator
- Tokyo Night color scheme with matching border colors
- MesloLGS Nerd Font configuration
- Block cursor with reverse video
- Custom window settings with 85% transparency
- Fcitx5 Input Method support (X11 backend for compatibility)
- Split window management with vim-like navigation
- Powerline tab bar
- Remote control enabled

### Neovide GUI for Neovim
- MesloLGS Nerd Font configuration
- Font rendering with full hinting and antialiasing
- Optimized for VelocityNvim setup

### tmux Terminal Multiplexer
- Tokyo Night Night color scheme (via `janoamaral/tokyo-night-tmux`)
- Vim-like pane navigation (Prefix + hjkl)
- Split creation: `|` (rechts), `-` (unten) mit CWD-Vererbung
- Pane-Resize: Prefix + HJKL (wiederholbar)
- Maus-Support aktiviert
- True Color Support für korrekte Theme-Darstellung
- TPM (tmux Plugin Manager) als Plugin-Verwaltung

### Yazi File Manager
- Tokyo Night theme
- VelocityNvim editor integration
- Custom file type associations

### Logitech MX Master 3S
- Button-Mapping (Zurück/Vorwärts, Gesture-Button mit Fensterverwaltung)
- Thumbwheel als Lautstärkeregler (1%-Schritte)
- SmartShift und Hi-Res Scroll
- DPI: 1200
- udev-Regel für automatischen Reconnect
- Automatisches Setup-Script für Arch Linux + KDE Plasma

## Installation

1. Clone this repository:
```bash
git clone https://github.com/Maik-0000FF/my-configs.git
```

### Ghostty Setup
2. Copy the Ghostty configuration:
```bash
mkdir -p ~/.config/ghostty
cp ghostty/config ~/.config/ghostty/config
```

### WezTerm Setup
3. Copy the WezTerm configuration:
```bash
cp .wezterm.lua ~/.wezterm.lua
```

### Kitty Setup
4. Copy the Kitty configuration:
```bash
cp kitty/kitty.conf ~/.config/kitty/
```

### Neovide Setup
5. Copy the Neovide configuration:
```bash
mkdir -p ~/.config/neovide
cp neovide/config.toml ~/.config/neovide/
```

### tmux Setup
6. TPM installieren und Config kopieren:
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mkdir -p ~/.config/tmux
cp tmux/tmux.conf ~/.config/tmux/tmux.conf
```
tmux starten, dann `Ctrl+b I` um Plugins zu installieren.

### Yazi Setup
7. Copy the yazi configuration:
```bash
cp -r yazi/ ~/.config/yazi/
```

### MX Master 3S Setup
8. Run the setup script (Arch Linux + KDE Plasma):
```bash
cd mx-master-3s
./setup.sh
```

9. Restart your applications to apply the configurations.

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

### Ghostty
- Tokyo Night Night color scheme
- MesloLGS Nerd Font (size 12) with inverted block cursor
- Split navigation with Ctrl+Shift+hjkl (vim-like)
- Split creation: Ctrl+Shift+\ (horizontal), Ctrl+Shift+- (vertical)
- Split resizing with Ctrl+Shift+Arrow keys
- `cursor-click-to-move = false` to prevent mouse clicks from accepting zsh autosuggestions
- Shell integration with prompt marking and title sync
- Shift+Enter sends ESC+CR for Neovim compatibility

### WezTerm
- Custom key bindings
- Theme configuration
- Font settings
- Window appearance customization

### Kitty
- Tokyo Night color scheme
- MesloLGS Nerd Font with proper fallback
- 85% background opacity for transparency
- Block cursor with reverse video colors
- X11 backend for better Fcitx5 compatibility
- Split window navigation (Ctrl+Shift+hjkl)
- Dynamic window resizing
- Powerline tab bar
- Cursor trail animation support

### Neovide
- MesloLGS Nerd Font (size 12) for all font variants
- Full hinting with antialiasing for sharp text rendering
- Consistent font family across normal, bold, italic, and bold-italic styles
- Integrated with VelocityNvim configuration

### tmux
- Tokyo Night Night color scheme via tokyo-night-tmux Plugin
- Prefix + `|` / `-` für Splits (rechts / unten), CWD wird übernommen
- Prefix + `hjkl` für Pane-Navigation, `HJKL` für Resize
- Prefix + `Tab` wechselt zum letzten Fenster
- Prefix + `<` / `>` verschiebt Fenster
- True Color und Focus-Events für Neovim-Kompatibilität

### Yazi
- Tokyo Night theme with comprehensive color scheme
- Integrated with VelocityNvim for file editing
- xdg-open fallback for file types
- Scrolloff settings for better navigation

## Requirements

- [Ghostty](https://ghostty.org/) terminal emulator
- [WezTerm](https://wezfurlong.org/wezterm/) terminal emulator
- [Kitty](https://sw.kovidgoyal.net/kitty/) terminal emulator
- [Neovide](https://neovide.dev/) - GUI for Neovim
- [Yazi](https://yazi-rs.github.io/) file manager
- [Neovim](https://neovim.io/) with VelocityNvim configuration
- [logiops](https://github.com/PixlOne/logiops) - Logitech MX Master 3S Konfiguration (AUR: `logiops-git`)
- [tmux](https://github.com/tmux/tmux) terminal multiplexer
- [TPM](https://github.com/tmux-plugins/tpm) - tmux Plugin Manager
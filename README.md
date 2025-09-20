# My Terminal Configurations

Personal configuration files for terminal tools and applications.

## Included Configurations

### WezTerm Terminal Emulator
- Custom key bindings
- Theme configuration
- Font settings
- Window appearance customization

### Yazi File Manager
- Tokyo Night theme
- VelocityNvim editor integration
- MPV media player support
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

### Yazi Setup
3. Copy the yazi configuration:
```bash
cp -r yazi/ ~/.config/yazi/
```

4. Restart your applications to apply the configurations.

## Features

### WezTerm
- Custom key bindings
- Theme configuration
- Font settings
- Window appearance customization

### Yazi
- Tokyo Night theme with comprehensive color scheme
- Integrated with VelocityNvim for file editing
- MPV for media file playback
- xdg-open fallback for other file types
- Scrolloff settings for better navigation

## Requirements

- [WezTerm](https://wezfurlong.org/wezterm/) terminal emulator
- [Yazi](https://yazi-rs.github.io/) file manager
- [Neovim](https://neovim.io/) with VelocityNvim configuration
- [MPV](https://mpv.io/) media player
# Yazi Configuration

Diese Konfiguration für den [Yazi](https://github.com/sxyazi/yazi) Terminal File Manager.

## SVG Preview Support

Yazi unterstützt ab Version 0.3.3 SVG-Vorschau nativ über die `resvg`-Bibliothek. Für optimale SVG-Darstellung sollte `resvg` installiert werden.

### Installation von resvg

#### Arch Linux

Auf Arch Linux ist `resvg` über das AUR (Arch User Repository) verfügbar:

```bash
# Mit yay
yay -S resvg

# Mit paru
paru -S resvg

# Oder manuell
git clone https://aur.archlinux.org/resvg.git
cd resvg
makepkg -si
```

**Alternative:** Falls es Build-Probleme gibt, kann `librsvg` aus den offiziellen Repositories verwendet werden:

```bash
sudo pacman -S librsvg
```

#### macOS

Auf macOS kann `resvg` einfach über Homebrew installiert werden:

```bash
brew install resvg
```

**Voraussetzung:** Homebrew muss installiert sein. Falls noch nicht vorhanden:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Theme

**Tokyo Night Night** - Clean dark theme
- Aktives Theme: `~/.config/yazi/theme.toml`

## Konfigurationsdateien

- `yazi.toml` - Hauptkonfiguration
- `keymaps.toml` - Tastenkombinationen
- `theme.toml` - Farbschema (Tokyo Night Night)

## Verwendung

Nach der Installation von `resvg` sollten SVG-Dateien automatisch in Yazi als Vorschau angezeigt werden. Keine weitere Konfiguration notwendig.

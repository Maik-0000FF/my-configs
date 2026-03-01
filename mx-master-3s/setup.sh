#!/usr/bin/env bash
# ============================================================================
# Logitech MX Master 3S - Automatisches Setup für Arch Linux + KDE Plasma
# ============================================================================
#
# Was macht dieses Script?
#   1. Installiert logiops (Maus-Konfigurationsdaemon)
#   2. Kopiert die Maus-Konfiguration nach /etc/logid.cfg
#   3. Installiert eine udev-Regel (damit die Maus auch nach Neustart funktioniert)
#   4. Setzt die Lautstärke-Schrittweite auf 1% (für Thumbwheel-Steuerung)
#   5. Aktiviert und startet den logid-Dienst
#
# Verwendung:
#   chmod +x setup.sh
#   ./setup.sh
#
# ============================================================================

set -euo pipefail

# --- Farben für Ausgabe ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Hilfsfunktionen ---
info()    { echo -e "${BLUE}[INFO]${NC} $*"; }
success() { echo -e "${GREEN}[OK]${NC}   $*"; }
warn()    { echo -e "${YELLOW}[WARN]${NC} $*"; }
error()   { echo -e "${RED}[FEHLER]${NC} $*"; exit 1; }

# --- Voraussetzungen prüfen ---
echo ""
echo "============================================"
echo "  Logitech MX Master 3S - Setup"
echo "============================================"
echo ""

# Arch Linux?
if [[ ! -f /etc/arch-release ]]; then
    error "Dieses Script ist nur für Arch Linux gedacht."
fi

# KDE Plasma?
if ! command -v kwriteconfig6 &>/dev/null; then
    warn "kwriteconfig6 nicht gefunden. KDE Plasma 6 wird erwartet."
    warn "Die Lautstärke-Schrittweite wird nicht gesetzt."
fi

# Konfigurationsdateien vorhanden?
if [[ ! -f "$SCRIPT_DIR/logid.cfg" ]]; then
    error "logid.cfg nicht gefunden in $SCRIPT_DIR"
fi
if [[ ! -f "$SCRIPT_DIR/99-logitech-logid.rules" ]]; then
    error "99-logitech-logid.rules nicht gefunden in $SCRIPT_DIR"
fi

# --- Schritt 1: Pakete installieren ---
echo "--- Schritt 1/5: Pakete installieren ---"

if pacman -Qi logiops-git &>/dev/null || pacman -Qi logiops &>/dev/null; then
    success "logiops ist bereits installiert."
else
    info "logiops wird installiert..."
    if command -v yay &>/dev/null; then
        yay -S --needed --noconfirm logiops-git
    elif command -v paru &>/dev/null; then
        paru -S --needed --noconfirm logiops-git
    else
        error "Kein AUR-Helper gefunden (yay oder paru nötig). Bitte installiere einen:\n       sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si"
    fi
    success "logiops installiert."
fi

if pacman -Qi solaar &>/dev/null; then
    success "solaar ist bereits installiert."
else
    info "solaar wird installiert (GUI-Tool für Batteriestatus etc.)..."
    sudo pacman -S --needed --noconfirm solaar
    success "solaar installiert."
fi
echo ""

# --- Schritt 2: Maus-Konfiguration kopieren ---
echo "--- Schritt 2/5: Maus-Konfiguration installieren ---"

sudo cp "$SCRIPT_DIR/logid.cfg" /etc/logid.cfg
sudo chmod 644 /etc/logid.cfg
success "logid.cfg nach /etc/logid.cfg kopiert."
echo ""

# --- Schritt 3: udev-Regel installieren ---
echo "--- Schritt 3/5: udev-Regel installieren ---"

sudo cp "$SCRIPT_DIR/99-logitech-logid.rules" /etc/udev/rules.d/99-logitech-logid.rules
sudo chmod 644 /etc/udev/rules.d/99-logitech-logid.rules
sudo udevadm control --reload-rules
success "udev-Regel installiert und geladen."
success "logid wird jetzt automatisch neugestartet wenn die Maus verbunden wird."
echo ""

# --- Schritt 4: KDE Lautstärke-Schrittweite ---
echo "--- Schritt 4/5: Lautstärke-Schrittweite setzen ---"

if command -v kwriteconfig6 &>/dev/null; then
    kwriteconfig6 --file kmixrc --group Global --key volumePercentageStep 1
    success "Lautstärke-Schrittweite auf 1% gesetzt (für feines Thumbwheel-Tuning)."
else
    warn "Übersprungen (kein KDE Plasma 6 erkannt)."
fi
echo ""

# --- Schritt 5: Dienst aktivieren und starten ---
echo "--- Schritt 5/5: logid-Dienst starten ---"

sudo systemctl enable logid.service
sudo systemctl restart logid.service

# Kurz warten und Status prüfen
sleep 2
if systemctl is-active --quiet logid.service; then
    success "logid läuft!"
else
    warn "logid scheint nicht zu laufen. Prüfe mit: journalctl -u logid -n 20"
fi

# Prüfen ob die Maus erkannt wurde
if journalctl -u logid -n 5 --no-pager 2>/dev/null | grep -q "Device found"; then
    success "Maus erkannt: MX Master 3S"
else
    warn "Maus wurde noch nicht erkannt. Ist sie eingeschaltet und per Bluetooth verbunden?"
    warn "Nach dem Verbinden wird logid automatisch neugestartet (udev-Regel)."
fi
echo ""

# --- Zusammenfassung ---
echo "============================================"
echo "  Setup abgeschlossen!"
echo "============================================"
echo ""
echo "  Installierte Konfiguration:"
echo "    - DPI: 1200"
echo "    - SmartShift: Ein (Schwelle: 15)"
echo "    - Thumbwheel: Lautstärke (1%-Schritte)"
echo "    - Zurück-Taste: Alt+Links (Browser zurück)"
echo "    - Vorwärts-Taste: Alt+Rechts (Browser vorwärts)"
echo "    - Gesture-Button: Mittelklick / Fenster-Gesten"
echo "    - Scrollrad-Taste: SmartShift umschalten"
echo ""
echo "  Nützliche Befehle:"
echo "    systemctl status logid        # Status prüfen"
echo "    journalctl -u logid -n 20     # Logs ansehen"
echo "    sudo systemctl restart logid  # Neu starten"
echo ""

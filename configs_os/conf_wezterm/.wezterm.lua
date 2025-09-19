local wezterm = require("wezterm")

-- Diese Funktion hält die Konfiguration
local config = wezterm.config_builder()

-- Nur die grundlegendsten Cursor-Einstellungen
config.cursor_thickness = 2

-- Farben für den Cursor
-- config.colors = {
--   cursor_bg = "#00FFFF",
--   cursor_border = "#FF00FF",
-- }

config.force_reverse_video_cursor = true

-- Deaktiviere die Wayland-Technologie
config.enable_wayland = false
-- config.window_decorations = "RESIZE"
config.enable_tab_bar = true
config.window_background_opacity = 0.75

-- Farbschema
-- config.color_scheme = "GJM (terminal.sexy)"

config.color_scheme = "tokyonight_night"

-- Schriftart
config.font = wezterm.font("MesloLGS Nerd Font")
config.font_size = 12.0

config.warn_about_missing_glyphs = false

-- Fensterabstände
config.window_padding = {
  left = 4,
  right = 0,
  top = 4,
  bottom = 0,
}

-- Tastenkombinationen
config.keys = {
  -- Wechseln zwischen den Splits
  {
    key = "h",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "j",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "l",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  -- Horizontale Teilung
  {
    key = "|",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  -- Vertikale Teilung
  {
    key = "_",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  -- Größe der Splits anpassen
  {
    key = "LeftArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize({ "Left", 1 }),
  },
  {
    key = "RightArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize({ "Right", 1 }),
  },
  {
    key = "UpArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize({ "Up", 1 }),
  },
  {
    key = "DownArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize({ "Down", 1 }),
  },
}

return config

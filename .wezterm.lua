local wezterm = require("wezterm")

-- Initialize configuration builder
local config = wezterm.config_builder()

-- Cursor appearance settings
config.cursor_thickness = 2

-- Make cursor stand out by inverting colors underneath
config.force_reverse_video_cursor = true

-- Display and window settings
config.enable_wayland = false
config.enable_tab_bar = true
config.window_background_opacity = 0.85

-- Focus settings (fix for multi-window focus issues)
config.swallow_mouse_click_on_window_focus = false  -- Don't eat first click when focusing
config.swallow_mouse_click_on_pane_focus = false    -- Same for panes

-- Color scheme configuration
config.color_scheme = "tokyonight_night"

-- Font configuration
config.font = wezterm.font("MesloLGS Nerd Font")
config.font_size = 12.0
config.warn_about_missing_glyphs = false

-- Window padding configuration
config.window_padding = {
  left = 4,
  right = 0,
  top = 4,
  bottom = 0,
}

-- Custom key bindings
config.keys = {
  -- Pane navigation using vim-like hjkl keys
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
  -- Shift+Enter binding
  {
    key = "Enter",
    mods = "SHIFT",
    action = wezterm.action.SendString("\x1b\r"),
  },
  -- Pane splitting
  {
    key = "|",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "_",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  -- Pane resizing using arrow keys
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

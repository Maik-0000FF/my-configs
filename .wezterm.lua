local wezterm = require("wezterm")

-- Initialize configuration builder
local config = wezterm.config_builder()

-- Cursor appearance settings
config.cursor_thickness = 2 -- Set cursor thickness to 2 pixels

-- Cursor color configuration (currently disabled)
-- config.colors = {
--   cursor_bg = "#00FFFF",
--   cursor_border = "#FF00FF",
-- }

-- Make cursor stand out by inverting colors underneath
config.force_reverse_video_cursor = true

-- Display and window settings
config.enable_wayland = false -- Disable Wayland support for better compatibility
config.enable_tab_bar = true -- Enable tab bar for multiple tabs
config.window_background_opacity = 0.75 -- Set window transparency to 75%

-- Color scheme configuration
config.color_scheme = "tokyonight_night" -- Use Tokyo Night dark theme

-- Font configuration
config.font = wezterm.font("MesloLGS Nerd Font") -- Nerd Font for icons support
config.font_size = 12.0 -- Set font size to 12pt
config.warn_about_missing_glyphs = false -- Suppress glyph warnings

-- Window padding configuration
config.window_padding = {
  left = 4,   -- 4px padding on the left
  right = 0,  -- No padding on the right
  top = 4,    -- 4px padding on the top
  bottom = 0, -- No padding on the bottom
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
  -- Pane splitting
  {
    key = "|", -- Split window horizontally (side by side)
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "_", -- Split window vertically (top and bottom)
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

#!/bin/bash
# macOS launcher for VelocityNvim with Neovide
# Make executable: chmod +x neovide-velocity-macos.command
# Then double-click to run, or add to Dock

export NVIM_APPNAME=VelocityNvim
/Applications/Neovide.app/Contents/MacOS/neovide "$@"

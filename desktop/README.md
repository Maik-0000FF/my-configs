# Desktop Launchers for VelocityNvim + Neovide

## Linux

Copy the `.desktop` file to your applications folder:

```bash
cp neovide-velocity.desktop ~/.local/share/applications/
update-desktop-database ~/.local/share/applications
```

Then search for "VelocityNvim" in your app launcher.

## macOS

### Option 1: Command file (simple)

```bash
chmod +x neovide-velocity-macos.command
```

Double-click to run, or drag to Dock.

### Option 2: Automator App (better integration)

1. Open **Automator** → New → **Application**
2. Add "Run Shell Script" action
3. Paste:
   ```bash
   export NVIM_APPNAME=VelocityNvim
   /Applications/Neovide.app/Contents/MacOS/neovide "$@"
   ```
4. Save as "VelocityNvim.app" in Applications
5. Optional: Change icon via Get Info → drag .icns file

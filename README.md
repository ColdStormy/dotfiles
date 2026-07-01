# dotfiles

My personal Windows dev environment setup — PowerShell, Windows Terminal, and AutoHotkey configs.

## What's in here

| | |
|---|---|
| **PowerShell** | Custom profile + modules for git nav, prompt rendering, quick-jump favorites, and Autodesk project shortcuts. *(git-ignored — work-specific paths)* |
| **Windows Terminal** | Settings for PowerShell Core default, One Half Dark theme, FiraMono Nerd Font. |
| **AutoHotkey** | Virtual desktop navigation shortcuts (Win+Ctrl/Alt+Arrow) and middle-mouse-button remap. |

## Prerequisites

- **PowerShell 7+** — [powershell.com/download](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows)
- **zoxide** — smarter `cd` replacement ([ajeetdsouza/zoxide](https://github.com/ajeetdsouza/zoxide))
- **FiraMono Nerd Font** — [nerd-fonts.com](https://www.nerdfonts.com/) (required for prompt glyphs)
- **AutoHotkey v2** — for `.ahk` scripts ([autohotkey.com](https://www.autohotkey.com/))

## Setup

### PowerShell

1. Copy or symlink `powershell/profile.ps1` to your `$PROFILE` location:
   ```powershell
   echo $PROFILE  # shows your profile path
   ```
   Or dot-source it in your existing profile:
   ```powershell
   . "path/to/dotfiles/powershell/profile.ps1"
   ```

2. The `powershell/modules/` directory is auto-added to `$PSModulePath` on profile load.

### Windows Terminal

1. Copy `WindowsTerminal/settings.json` to:
   ```
   %LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
   ```
   Or use `Ctrl+Shift+,` in Terminal → **Open JSON file**.

2. Restart Terminal to apply.

### AutoHotkey

1. **middleMouseButton.ahk** (v1):
   - Right Ctrl → middle mouse button
   - Run once, it stays resident

2. **MoveToDesktop.ahk** (v2):
   - `Win+Ctrl+Left/Right` — switch virtual desktops
   - `Win+Alt+Left/Right` — move active window to next/prev desktop
   - Requires `VD.ah2` (included)

## PowerShell Modules Quick Ref

### `Pwsh-Prompt`
Custom multi-segment prompt: chevron prefix `❯❯` + path + time + git branch + exit code indicator.

### `Pwsh-Utils`
- `Diff-Files <file1> <file2>` — quick file diff
- `Set-Title <name>` — set terminal title
- `Print-Colors` — display all ConsoleColor values

## License

[The Unlicense](LICENSE) — public domain.

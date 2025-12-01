# My Personal Neovim Configuration for Windows + VSCode

A complete Neovim configuration that works seamlessly in both native Neovim and VSCode with the VSCode Neovim extension to customize to your liking.

**If you want to use my config in just native neovim without vs code switch git branch to `main` and use that config instead**

## 🎯 Quick Start

### For Native Neovim

Just use `nvim` in your terminal - everything works automatically!

## 📚 Documentation

- **[vscode-settings.json](vscode-settings.json)** - Reference VSCode settings
- **[vscode-keybindings.json](vscode-keybindings.json)** - Reference VSCode Keybingings

## ✨ Features

- ✅ Works in both VSCode and native Neovim
- ✅ All native Vim motions and text objects
- ✅ Code formatting
- ✅ Leader key: `Space`
- ✅ Keybindings only active in editor (no conflicts with VSCode UI)

## 🔑 Key Bindings (Leader = Space)

**Note**: All keybindings only work when focused in the editor. Outside the editor, normal VSCode shortcuts should work.

## 🔧 Configuration

The configuration automatically detects whether it's running in VSCode or native Neovim:

- **VSCode**: Loads `vscode-init.lua` with VSCode-specific mappings
- **Native**: Loads full plugin suite with lazy.nvim

## 🚀 Plugins

### Native Neovim Plugins

- lazy.nvim - Plugin manager
- telescope.nvim - Fuzzy finder
- neo-tree.nvim - File explorer
- nvim-lspconfig - LSP configuration
- nvim-treesitter - Syntax highlighting
- nvim-cmp - Auto-completion
- conform.nvim - Formatting
- gitsigns.nvim - Git decorations
- barbar.nvim - Buffer line
- And more...

### VSCode Integration

All plugins are intelligently replaced by native VSCode features when running in VSCode.

## 📦 Installation

1. Clone this repo to `%LOCALAPPDATA%\nvim` (typically `C:\Users\YourName\AppData\Local\nvim`)
2. Install [Neovim](https://github.com/neovim/neovim/releases) for Windows
3. For native Neovim: Just run `nvim` - plugins auto-install on first run

### VSCode Specifics

1. Install VSCode

2. Install VSCode Neovim extension:

   ```powershell
   code --install-extension asvetliakov.vscode-neovim
   ```

3. Install recommended extensions:

   ```powershell
   .\install-vscode-extensions.ps1
   ```

4. Copy keybindings from `vscode-keybindings.json` to your VSCode keybindings.json

5. Copy settings from `vscode-settings.json` to you VSCode settings.json **(be sure to make sure the paths are correct for your machine)**

6. Reload VSCode window

## 📋 Important Files

- **`vscode-settings.json`** - Recommended VSCode settings (copy to your settings.json)
- **`vscode-keybindings.json`** - Keybindings to copy to your keybindings.json
- **`install-vscode-extensions.ps1`** - Automated extension installer

## 🤝 Contributing

Feel free to fork and adapt this configuration for your needs!

## 📄 License

MIT License - Use freely!

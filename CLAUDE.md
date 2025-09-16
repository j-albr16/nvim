# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration using Lazy.nvim as the plugin manager. The configuration is modular, with plugins organized by category and individual configurations in separate files.

## Architecture

- **Entry Point**: `init.lua` - Sets up autocmds and requires core modules
- **Core Modules**: 
  - `lua/options.lua` - Vim options and settings
  - `lua/keymaps.lua` - Key mappings and which-key configurations
  - `lua/colorscheme.lua` - Color scheme configuration
  - `lua/lsp.lua` - Language server setup and configuration

- **Plugin Management**: 
  - `lua/config/lazy.lua` - Lazy.nvim bootstrap and setup
  - `lua/plugins/` - Plugin specifications organized by category:
    - `base.lua` - Core functionality plugins
    - `lsp.lua` - Language server and completion plugins
    - `ai.lua` - AI-related plugins (claude-code.nvim)
    - `visuals.lua` - UI and visual plugins
    - `debug.lua` - Debugging plugins

- **Plugin Configurations**: `lua/config/` - Individual plugin configurations

## Key Features

### Language Support
- **LSP Servers**: Python (pyright), Lua (lua_ls), Rust (rust_analyzer), TypeScript (ts_ls), HTML, YAML, Tailwind CSS, Markdown, XML, JSON, ESLint, LaTeX (ltex), C/C++ (clangd)
- **Formatters**: stylua (Lua), black/isort/ruff_format (Python), rustfmt (Rust), prettier/prettierd (JavaScript)
- **Debugging**: DAP setup for Python and C/C++

### Core Tools
- **File Navigation**: Telescope with custom keybindings, Harpoon for file bookmarking, Oil for file management
- **Git Integration**: Neogit for Git operations, built-in diff support
- **Terminal**: Toggleterm for integrated terminal management
- **AI Integration**: claude-code.nvim with `<C-x>` toggle binding

### Key Bindings (Space as leader)
- `<leader>ff` - Find files (Telescope)
- `<leader>fs` - Live grep search
- `<leader>fg` - Git files
- `<leader>a` - Add file to Harpoon
- `<C-e>` - Toggle Harpoon menu
- `<C-x>` - Toggle Claude Code
- `<leader>f` - Format current buffer
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol

## Setup and Installation

### Prerequisites
Install the required external dependencies:
```bash
npm i -g tree-sitter-cli
sudo apt install latexmk ripgrep
pip install jupynium
brew install stylua
rustup component add rustfmt
```

### Plugin Installation
Lazy.nvim will automatically install plugins on first launch. The configuration ensures all LSP servers are installed via Mason.

## Development Workflow

### Plugin Management
- Lazy.nvim manages all plugins with lockfile versioning
- Plugin configurations are modular and organized by functionality
- Use `:Lazy` to manage plugins interactively

### LSP and Formatting
- LSP servers are auto-installed via Mason
- Formatting is handled by conform.nvim with language-specific formatters
- Use `<leader>f` to format current buffer

### File Navigation
- Primary navigation via Telescope with dropdown themes
- Harpoon for quick file switching between frequently used files
- Oil for directory browsing and file operations

## Configuration Notes

- Uses space as leader key
- 4-space indentation with tabs expanded to spaces
- System clipboard integration enabled
- Relative line numbers enabled
- Auto-reload on focus gained
- Monokai Pro color scheme
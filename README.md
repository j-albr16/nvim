# Neovim Configuration

## Overview

This is a modular Neovim configuration designed for an efficient and feature-rich development environment. Utilizing Lazy.nvim as the plugin manager, this configuration provides comprehensive support for multiple programming languages, enhanced editing capabilities, and powerful development tools.

## Features

### Language Support
- **Supported Languages**: 
  - Python (pyright)
  - Lua (lua_ls)
  - Rust (rust_analyzer)
  - TypeScript (ts_ls)
  - HTML
  - YAML
  - Tailwind CSS
  - Markdown
  - XML
  - JSON
  - ESLint
  - LaTeX (ltex)
  - C/C++ (clangd)

### Key Capabilities
- Advanced Language Server Protocol (LSP) integration
- Intelligent code completion
- Debugging support for Python and C/C++
- Git integration
- AI-assisted coding
- Powerful file navigation
- Comprehensive formatting

## Prerequisites

Before installation, ensure you have the following dependencies:

```bash
# Node.js dependencies
npm i -g tree-sitter-cli

# System dependencies
sudo apt install latexmk ripgrep

# Python dependencies
pip install jupynium

# Rust and formatting tools
brew install stylua
rustup component add rustfmt
```

## Installation

1. Clone this repository to `~/.config/nvim`:
   ```bash
   git clone https://github.com/yourusername/nvim-config.git ~/.config/nvim
   ```

2. Open Neovim. Lazy.nvim will automatically:
   - Install all plugins
   - Set up LSP servers via Mason
   - Configure language-specific tools

## Key Bindings

### Navigation
- `<leader>ff`: Find files (Telescope)
- `<leader>fs`: Live grep search
- `<leader>fg`: Git files
- `<leader>a`: Add file to Harpoon
- `<C-e>`: Toggle Harpoon menu
- `<C-x>`: Toggle Claude Code (AI integration)

### Editing & Productivity
- `<leader>f`: Format current buffer
- `<leader>ca`: Code actions
- `<leader>rn`: Rename symbol

## Configuration Details

### Plugin Management
- Uses Lazy.nvim for plugin management
- Modular plugin configurations
- Interactive plugin management with `:Lazy`

### LSP & Formatting
- Automatic LSP server installation via Mason
- Conform.nvim handles language-specific formatting
- Supports multiple formatters:
  - Lua: stylua
  - Python: black, isort, ruff_format
  - Rust: rustfmt
  - JavaScript: prettier/prettierd

### Editor Preferences
- Leader key: Space
- Indentation: 4 spaces
- System clipboard integration
- Relative line numbers
- Auto-reload on focus
- Color scheme: Monokai Pro

## Troubleshooting

### LSP Not Working
- Ensure all prerequisites are installed
- Run `:Mason` to verify LSP server installation
- Check `:LspInfo` for specific language server status

### Plugin Issues
- Run `:Lazy sync` to update and reinstall plugins
- Check `:Lazy log` for any installation errors

## Contributing

Contributions are welcome! Please follow these steps:
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a pull request

## License

[Insert your license here]

## Acknowledgments

- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- All plugin authors and the Neovim community
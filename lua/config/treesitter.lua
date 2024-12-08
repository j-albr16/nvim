require 'nvim-treesitter.configs'.setup {
    indent = {
        enable = true,
        disable = {},
    },
    highlight = {
        enable = true,
    },
    ensure_installed = { "html", "yaml", "rust", "c", "lua", "vim", "vimdoc", "query", "python", "markdown", "markdown_inline" },
    inore_install = { 'javascript', 'typescript', 'tsx' }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

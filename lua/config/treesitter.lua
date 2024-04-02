require 'nvim-treesitter.configs'.setup {
    indent = {
        enable = true,
        disable = {},
    },
    autotag = {
        enable = true,
    },
    ensure_installed = { "tsx", "html", "c", "lua", "vim", "vimdoc", "query", "python" },
    inore_install= {'javascript'}
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

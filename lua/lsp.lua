local lspconfig = require('lspconfig')
local lsp_servers = {
    'pylsp',
    'lua_ls',
    'rust_analyzer',
    'clangd',
    'ts_ls',
    'html',
    'yamlls',
    'tailwindcss',
    'rust_analyzer',
    'lemminx',
    'jsonls',
    'eslint',
}



local mason = require('mason')
local mason_lsp = require('mason-lspconfig')

local registries = {
    "github:nvim-java/mason-registry",
    "github:mason-org/mason-registry"
}

mason.setup({
    registries = registries,
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

mason_lsp.setup({
    ensure_installed = lsp_servers,
})


-- Customized on_attach function
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>rf', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>f', function()
        print("formatting")
        vim.lsp.buf.format { async = true }
    end, opts)
end

lspconfig.html.setup {
    on_attach = on_attach,
}

lspconfig.pylsp.setup({
    on_attach = on_attach,
    init_options = {
        formatting = true
    },
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { 'W391' },
                    maxLineLength = 100
                }
            }
        }
    }
})

lspconfig.jsonls.setup {
    on_attach = on_attach,
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
            end
        }
    }
}

lspconfig.clangd.setup {}

lspconfig.ts_ls.setup {
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
    cmd = { "typescript-language-server", "--stdio" }
}

lspconfig.tailwindcss.setup {}

lspconfig.lua_ls.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

lspconfig.lemminx.setup {
    on_attach = on_attach,
}

lspconfig.eslint.setup({
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
        })
    end,
})

lspconfig.ltex.setup {
    -- on_attach = on_attach,
    -- ltex = {
    --     language = "en-GB",
    -- },
}


-- rust
local mason_dap = require('mason-nvim-dap')

mason_dap.setup({
    ensure_installed = {
        'codelldp',
        "cpptools",
    },
})

lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy"
            }
        }
    }
}

-- require('java').setup({})
-- lspconfig.jdtls.setup {}

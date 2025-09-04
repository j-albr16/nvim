return {
    'neovim/nvim-lspconfig',
    {
        'hrsh7th/nvim-cmp',
        config = function ()
            require('config.nvim-cmp')
        end
    },
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "isort", "black" , "ruff_format"},
                    rust = { "rustfmt", lsp_format = "fallback" },
                    javascript = { "prettierd", "prettier", stop_after_first = true },
                },
            })
        end,
    },
    { 'hrsh7th/cmp-nvim-lsp', dependencies = { 'nvim-cmp' } },
    { 'hrsh7th/cmp-buffer', dependencies = { 'nvim-cmp' } },
    { 'hrsh7th/cmp-path', dependencies = { 'nvim-cmp' } },
    { 'hrsh7th/cmp-cmdline', dependencies = { 'nvim-cmp' } },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
}

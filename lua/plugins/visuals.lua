return {
    'nvim-tree/nvim-web-devicons',
    'echasnovski/mini.icons',
    'tanvirtin/monokai.nvim',
    {
        "terrortylor/nvim-comment",
        config = function ()
            require('nvim_comment').setup()
        end
    },
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    }
}

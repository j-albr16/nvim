return {
    "nvim-lua/plenary.nvim",
    {
        'nvim-treesitter/nvim-treesitter',
        config = function ()
            require('config.treesitter')
        end
    },
    {
        'SirVer/ultisnips',
        config = function ()
            vim.cmd[[
                let g:UltiSnipsSnippetDirectories = ["~/.config/nvim/UltiSnips"]
                let g:UltiSnipsExpandTrigger = "<a-cr>"
            ]]
        end
    },
    'quangnguyen30192/cmp-nvim-ultisnips',
    {
        'folke/which-key.nvim',
        config = function ()
            require('which-key').setup()
        end
    },
    'BurntSushi/ripgrep',
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
        config = function ()
            require('config.telescope')
        end
    },
    { 'ThePrimeagen/harpoon',
            config = function ()
                require('config.harpoon')
            end,
            branch = 'harpoon2',
            dependencies = { { "nvim-lua/plenary.nvim" } } 
    },
    {
        'mbbill/undotree',
        config = function ()
            vim.keymap.set('n', '<leader>i', ':UndotreeToggle<CR>', { noremap = true, silent = true })
        end
   },
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
        config = function ()
           require('config.neogit') 
        end
    },
    {
        "akinsho/toggleterm.nvim",
        -- tag = '*',
        config = function ()
        require('config.terminal')
        end
    },
    {
        'stevearc/oil.nvim',
        config = function ()
            require('config.oil')
        end
    },
    {
        'rcarriga/nvim-notify',
        config = function()
            vim.notify = require('notify')
            vim.keymap.set('n', '<leader>n', vim.notify.dismiss, {desc = 'dismiss notifications'})
        end
    },
    {
        'mikesmithgh/kitty-scrollback.nvim',
        enable = true,
        lazy = true,
        cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth', 'KittyScrollbackGenerateCommandLineEditing' },
        event = { 'User KittyScrollbackLaunch' },
        config = function()
            require('kitty-scrollback').setup({
                {
                    paste_window = {
                        yank_register = '"',
                    }
                }
            })
        end,
    }
}

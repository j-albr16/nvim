-- Install Packer automatically if it's not installed(Bootstraping)
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- pip modules
-- pylsp-rope

-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies".
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup(function(use)
    -- Packer can manage itself
    use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
    use { "nvim-neotest/nvim-nio" }
    use { 'SirVer/ultisnips', config = [[require('config.ultisnips')]] }
    use 'honza/vim-snippets'
    use 'quangnguyen30192/cmp-nvim-ultisnips'
    use 'wbthomason/packer.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use 'echasnovski/mini.icons'
    use { 'folke/which-key.nvim', config = [[require('config.which-key')]] }
    use 'BurntSushi/ripgrep'
    use 'tanvirtin/monokai.nvim'
    use { "terrortylor/nvim-comment", config = [[require('config.nvim_comment')]] }
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = [[require('config.telescope')]]
    }
    use { 'ThePrimeagen/harpoon',
        config = [[require('config.harpoon')]],
        branch = 'harpoon2',
        -- branch = 'master',
        requires = { { "nvim-lua/plenary.nvim" } } }
    use { 'mbbill/undotree', config = [[require('config.undotree')]] }
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]] }
    use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }
    use { "jay-babu/mason-nvim-dap.nvim" }
    use { 'L3MON4D3/LuaSnip' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'tpope/vim-fugitive', config = [[require('config.vim-fugitive')]] }
    use { "NeogitOrg/neogit",
        requires = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
        config = [[require('config.neogit')]]
    }
    use 'junegunn/gv.vim'
    use { "akinsho/toggleterm.nvim", tag = '*', config = [[require('config.terminal')]] }
    use 'folke/neodev.nvim'
    use { 'nvim-treesitter/nvim-treesitter', config = [[require('config.treesitter')]] }
    use 'simrat39/rust-tools.nvim'
    use { 'mfussenegger/nvim-dap', config = [[require('config.dap')]],
        requires = {
            'mfussenegger/nvim-dap-python',
            'rcarriga/nvim-dap-ui',
            'simrat39/rust-tools.nvim',
            'ldelossa/nvim-dap-projects'
        }
    }

    use { 'MunifTanjim/prettier.nvim',
        -- run = 'yarn install',
        config = [[require('config.prettier')]]
    }
    use { "folke/zen-mode.nvim", config = [[require('config.zen-mode')]] }
    use { "windwp/nvim-ts-autotag", config = [[require('config.ts-autotags')]] }
    use { 'lervag/vimtex', config = [[require('config.vimtex')]] }
    use { 'stevearc/oil.nvim', config = [[require('config.oil')]] }
    use({
        'MeanderingProgrammer/render-markdown.nvim',
        after = { 'nvim-treesitter' },
        requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
        -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
        -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
        config = function()
            require('render-markdown').setup({
            })
        end,
    })
    use {
        "epwalsh/obsidian.nvim",
        tag = "*",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = [[require('config.obsidian')]],
    }
    use { 'rcarriga/nvim-notify',
        config = function()
            vim.notify = require('notify')
        end
    }
    -- use 'nvim-java/lua-async-await'
    -- use 'nvim-java/nvim-java-refactor'
    -- use 'nvim-java/nvim-java-core'
    -- use 'nvim-java/nvim-java-test'
    -- use 'nvim-java/nvim-java-dap'
    -- use 'MunifTanjim/nui.nvim'
    -- use 'nvim-java/nvim-java'
    -- use 'JavaHello/spring-boot.nvim'

    use({
        'mikesmithgh/kitty-scrollback.nvim',
        disable = false,
        opt = true,
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
    })
    use({
        "folke/trouble.nvim",
        config = [[require('config.trouble')]],
    })
    use({ "kiyoon/jupynium.nvim",
        config = [[require('config.jupynium')]]
    })
    use {
        'chomosuke/typst-preview.nvim',
        tag = 'v1.*',
        config = function()
            require 'typst-preview'.setup {}
        end,
    }
    use({
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

    })
    -- use ({ 'github/copilot.vim'})
    use "vhyrro/luarocks.nvim"
    use({"CopilotC-Nvim/CopilotChat.nvim", 
        config = [[require('config.copilot')]],
    })
    use({'3rd/image.nvim', config = [[require('config.image')]]})

    -- Automatically set up your configuration\ after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

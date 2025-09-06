return {
    "jay-babu/mason-nvim-dap.nvim",
    'simrat39/rust-tools.nvim',
    {
        'mfussenegger/nvim-dap',
        config = function ()
            require('config.dap')
        end,
        dependencies = {
            'mfussenegger/nvim-dap-python',
            "nvim-neotest/nvim-nio",
            'rcarriga/nvim-dap-ui',
            'simrat39/rust-tools.nvim',
            'ldelossa/nvim-dap-projects'
        }
    },
    {
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
      keys = {
        {
          "<leader>xx",
          "<cmd>Trouble diagnostics toggle<cr>",
          desc = "Diagnostics (Trouble)",
        },
        {
          "<leader>xX",
          "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
          desc = "Buffer Diagnostics (Trouble)",
        },
        {
          "<leader>cs",
          "<cmd>Trouble symbols toggle focus=false<cr>",
          desc = "Symbols (Trouble)",
        },
        {
          "<leader>xL",
          "<cmd>Trouble loclist toggle<cr>",
          desc = "Location List (Trouble)",
        },
        {
          "<leader>xQ",
          "<cmd>Trouble qflist toggle<cr>",
          desc = "Quickfix List (Trouble)",
        },
      },
    }
}

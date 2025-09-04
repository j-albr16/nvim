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
}

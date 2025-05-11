local dap = require('dap')
local dap_python = require('dap-python')
local dap_project = require('nvim-dap-projects')
local wk = require('which-key')
local dapui = require "dapui"
local widgets = require('dap.ui.widgets')

local widget_view = widgets.centered_float(widgets.scopes)
widget_view.close()


dap_project.config_paths = { './nvim-dap.lua' }
dap_project.search_project_config()

dap_python.setup('~/.config/nvim/.virtualenvs/debugpy/bin/python')
dap_python.test_runner = 'pytest'


local debug_method = function()
    dap_python.test_method()
    dapui.open()
end

local debug_class = function()
    dap_python.test_class()
    dapui.open()
end

local mapping = {
    {
        desc = 'Debug',
        mode = 'n',
        { '<leader>db', dap.toggle_breakpoint, desc = 'Toggle Breakpoint' },
        { '<leader>do', dap.step_out,          desc = 'Step Out' },
        { '<leader>di', dap.step_into,         desc = 'Step Into' },
        {
            '<leader>df',
            function()
                widget_view.toggle()
            end,
            desc = 'Open Floating Scopes'
        },
        { '<leader>du', dapui.toggle,               desc = 'Toggle Dap Ui' },
        { '<leader>dq', dapui.close,                desc = 'Terminate Dap Ui' },
        { '<leader>dc', debug_class,                desc = 'Test Class' },
        { '<leader>dm', debug_method,               desc = 'Debug Method' },
        { '<leader>ds', dap_python.debug_selection, desc = 'Debug Selection' },
        { '<leader>dl', dap.run_last,               desc = 'Debug Last' },
        { '<leader>dk', vim.diagnostic.goto_next,   desc = 'Next Diagnostic' },
        { '<leader>dj', vim.diagnostic.goto_prev,   desc = 'Previous Diagnostic' },
    },
    { '<leader>r', dap.repl.toggle, desc = 'Open Repl' },
    { '<leader>c', dap.continue,    desc = 'Continue' },
    { '<leader>O', dap.step_over,   desc = 'Step Over' },
}

local opts = { noremap = true, silent = true }
wk.add(mapping, opts)


-- short keymaps
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, opts)

-- ui
dapui.setup {
    layouts = { {
        elements = {
            {
                id = "breakpoints",
                size = 0.25
            },
            {
                id = "console",
                size = 0.75
            }
        },
        position = "left",
        size = 60
    }, {
        elements = { {
            id = "repl",
            size = 1.
        } },
        position = "bottom",
        size = 13
    } },
}

-- rust

-- local mason_registry = require('mason-registry')
--
-- local codelldb = mason_registry.get_package('codelldb')
-- local extension_path = codelldb:get_install_path() .. '/extension/'
-- local codelldb_path = extension_path .. 'adapter/codelldb'
--
-- dap.adapters.codelldb = {
--     type = 'server',
--     command = codelldb_path,
--     port = "${port}",
--     executable = {
--         command = codelldb_path,
--         args = { '--port', '${port}' }
--     },
-- }

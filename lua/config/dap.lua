local dap = require('dap')
local dap_python = require('dap-python')
local dap_project = require('nvim-dap-projects')
local wk = require('which-key')
local dapui = require "dapui"

dap_project.config_paths = { './nvim-dap.lua' }
dap_project.search_project_config()

dap_python.setup('~/.config/nvim/.virtualenvs/debugpy/bin/python')
dap_python.test_runner = 'pytest'


local opts = { noremap = true, silent = true, prefix = '<leader>', mode = { 'n', 'v' } }

local debug_method = function()
    dap_python.test_method()
    dapui.open()
end

local debug_class = function()
    dap_python.test_class()
    dapui.open()
end

local mapping = {
    d = {
        name = 'Debug',
        b = { dap.toggle_breakpoint, 'Toggle Breakpoint' },
        o = { dap.step_over, 'Step Out' },
        i = { dap.step_into, 'Step Into' },
        u = { dapui.toggle, 'Toggle Dap Ui' },
        q = { dapui.close, 'Terminate Dap Ui' },
        c = { debug_class, 'Test Class' },
        m = { debug_method, 'Debug Method' },
        s = { dap_python.debug_selection, 'Debug Selection' },
        l = { dap.run_last, 'Debug Last' },
        k = { vim.diagnostic.goto_next, 'Next Diagnostic' },
        j = { vim.diagnostic.goto_prev, 'Previous Diagnostic' },
    },
    ["r"] = { dap.repl.toggle, 'Open Repl' },
    ["c"] = { dap.continue, 'Continue' },
    ["o"] = { dap.step_over, 'Step Over' },
}
wk.register(mapping, opts)

opts = { noremap = true, silent = true }

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

-- dapui.setup {
--     layouts = { {
--         elements = { {
--             id = "scopes",
--             size = 0.25
--           }, {
--             id = "breakpoints",
--             size = 0.25
--           }, {
--             id = "stacks",
--             size = 0.25
--           }, {
--             id = "watches",
--             size = 0.25
--           } },
--         position = "left",
--         size = 40
--       }, {
--         elements = { {
--             id = "console",
--             size = 1.
--           } },
--         position = "bottom",
--         size = 13
--       } },
-- }
--

-- use default
-- dap.listeners.after.event_initialized["dapui_config"] = function()
--     dapui.open()
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end

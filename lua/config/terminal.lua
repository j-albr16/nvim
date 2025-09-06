local term = require("toggleterm")

local config = {
    direction = 'horizontal',
    size = 20,
    persist_size = true,
    start_in_insert = true,
    shading_factor = 2,
}


term.setup(config)

local Terminal = require('toggleterm.terminal').Terminal

local python = Terminal:new({ cmd = 'python3', hidden = true, direction = 'float' })

function _PYTHON_TOGGLE()
    python:toggle()
end


local function on_create(t)
    local venv_path = vim.fn.getcwd() .. '/venv'
    local has_virtualenv = io.open(venv_path)
    if has_virtualenv ~= nil then
        t:send(". venv/bin/activate && clear")
    end
end

Horizontal1 = Terminal:new({ cmd = vim.o.shell, on_create = on_create, hidden = true, direction = 'horizontal' })



vim.keymap.set('t', '<C-e>', '<C-\\><C-n>', { silent = true })
vim.keymap.set({ "n", 't' }, '<C-n>', '<cmd>lua Horizontal1:toggle()<CR>', { silent = true })

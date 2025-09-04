-- define common options
local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

------------------
-- Terminal mode -
------------------
--
-----------------
-- Normal mode --
-----------------
-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- vertical movement
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)

vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- smart pasting
vim.keymap.set('x', '<leader>p', '\"_dP', opts)

-----------------
-- Visual mode --
-----------------
-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

vim.keymap.set('v', "J", ":m '>+1<CR>gv'", opts)
vim.keymap.set('v', "K", ":m '<-2<CR>gv'", opts)

local search_and_replace = function()
    local first = vim.fn.input('First: ')
    local second = vim.fn.input('Second: ')
    local cmd = ":'<,'>s/" .. first .. "/" .. second .. "/gc"
    vim.cmd(cmd)
end

vim.keymap.set('v', '<leader>s', search_and_replace, opts)

-- search
local wk = require('which-key')
local mapping = {
    desc = "Search",
    {
        { '<leader>sr', ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>", desc = "Search and Replace Word" },
        { '<leader>sa', ":cdo! %s///gc<left><left><left><left>",                desc = "Search and Replace all" },
    }
}

local tab_mappings = {
    desc = "Tabs",
    {
        { '<leader>tn', ":tabnew<CR>", desc = "New Tab" },
        { '<leader>tc', ":tabclose<CR>", desc = "Close Tab" },
        { '<leader>to', ":tabonly<CR>", desc = "Close all other tabs" },
        { '<leader>tl', ":tabnext<CR>", desc = "Next Tab" },
        { '<leader>th', ":tabprevious<CR>", desc = "Previous Tab" },
        { '<leader>te', ":tabedit<CR>", desc = "Edit Tab" },
        { '<leader>ts', ":tab split<CR>", desc = "Split Tab" },
    }
}

wk.add(mapping)
wk.add(tab_mappings)

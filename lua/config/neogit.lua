local neogit = require('neogit')
neogit.setup {}

-- Keybindings
vim.keymap.set("n", '<leader>gg', neogit.open, { desc = "Open Neogit" })

local neogit = require('neogit')
neogit.setup {}

-- Keybindings
vim.keymap.set("n", '<leader>gg',function ()
    return neogit.open({ kind = "split_below" })
end , { desc = "Open Neogit" })

local harpoon = require('harpoon')

local global_settings = {
    save_on_toggle = true,
    save_on_change = true,
}

-- REQUIRED
harpoon:setup({
    global_settings = global_settings
})
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>h", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>j", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>k", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>l", function() harpoon:list():select(4) end)

--
-- require('harpoon').setup({
--     global_settings = global_settings
-- })
--
--
--
-- local ui = require("harpoon.ui")
-- local mark = require("harpoon.mark")
--
-- vim.keymap.set('n', "<leader>a", mark.add_file)
-- vim.keymap.set('n', "<leader>e", ui.toggle_quick_menu)
--
-- vim.keymap.set('n', "<leader>h", function() ui.nav_file(1) end)
-- vim.keymap.set('n', "<leader>j", function() ui.nav_file(2) end)
-- vim.keymap.set('n', "<leader>k", function() ui.nav_file(3) end)
-- vim.keymap.set('n', "<leader>l", function() ui.nav_file(4) end)

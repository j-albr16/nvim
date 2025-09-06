local harpoon = require("harpoon")

local settings = {
	save_on_toggle = true,
	sync_on_ui_close = true,
}

-- REQUIRED
harpoon:setup({
	settings = settings,
})
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end, {desc = 'add file to harpoon list'})
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>h", function()
	harpoon:list():select(1)
end, { desc = "open first file in harpoon list" })
vim.keymap.set("n", "<leader>j", function()
	harpoon:list():select(2)
end, { desc = "open first file in harpoon list" })
vim.keymap.set("n", "<leader>k", function()
	harpoon:list():select(3)
end, { desc = "open first file in harpoon list" })
vim.keymap.set("n", "<leader>l", function()
	harpoon:list():select(4)
end, { desc = "open first file in harpoon list" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<A-p>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<A-n>", function()
	harpoon:list():next()
end)


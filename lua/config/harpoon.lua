local harpoon = require('harpoon')

local settings = {
    save_on_toggle = true,
    sync_on_ui_close = true,
}

-- REQUIRED
harpoon:setup({
    settings = settings
})
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>h", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>j", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>k", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>l", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<A-p>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<A-n>", function() harpoon:list():next() end)


-- basic telescope configuration
-- local conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
--     local file_paths = {}
--     for _, item in ipairs(harpoon_files.items) do
--         table.insert(file_paths, item.value)
--     end
--
--     require("telescope.pickers").new({}, {
--         prompt_title = "Harpoon",
--         finder = require("telescope.finders").new_table({
--             results = file_paths,
--         }),
--         previewer = conf.file_previewer({}),
--         sorter = conf.generic_sorter({}),
--     }):find()
-- end
--
-- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
--     { desc = "Open harpoon window" })
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

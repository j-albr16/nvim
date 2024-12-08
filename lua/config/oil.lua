
require("oil").setup()

vim.keymap.set("n", "<C-p>", "<CMD>Oil<CR>", { desc = "Open parent directory" })

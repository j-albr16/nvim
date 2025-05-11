vim.api.nvim_create_autocmd("FocusGained", {
  pattern = "*",
  command = "redraw!"
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "redraw!"
})


require('plugins')
require('options')
require('keymaps')
require('colorscheme')
require('lsp')



local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

local opts = {
    noremap = true,
    silent = true,
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fg', builtin.git_files, opts)
vim.keymap.set('n', '<leader>fs', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fh', builtin.commands, opts)
vim.keymap.set('n', '<C-f>', function ()
        builtin.grep_string({ search = vim.fn.input("Grep String > ") })
end, opts)


require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ["<C-c>"] = { "<esc>", type = "command" },
                ["<C-e>"] = "close",
                ["<C-f>"] = "preview_scrolling_up",
                ["<C-b>"] = "preview_scrolling_down",
            },
            n = {
                ["<C-d>"] = "delete_buffer",
                ["<C-c>"] = "close",
                q = "close",
                ["<C-f>"] = "preview_scrolling_up",
                ["<C-b>"] = "preview_scrolling_down",
                ["<C-j>"] = actions.toggle_selection + actions.move_selection_next,
                ["<C-k>"] = actions.toggle_selection + actions.move_selection_previous,
            }
        }
    },
    pickers = {
        find_files = {
            theme = "dropdown",
        },
        buffers = {
            theme = "dropdown",
            initial_mode = "normal",
        },
        git_files = {
            theme = "dropdown",
        },
        live_grep = {
            theme = "dropdown",
        },
        grep_string = {
            initial_mode = "normal",
            theme = "dropdown",
        },
    },
})

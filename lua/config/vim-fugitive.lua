local wk = require('which-key')


local mappings = {
    {
        desc = 'Git',
        mode = 'n',
        { '<leader>gp', '<cmd>:Git push<CR>', desc = 'Push' },
        { '<leader>gu', '<cmd>:Git pull<CR>', desc = 'Pull' },
        {
            '<leader>gc',
            function()
                local branch = vim.fn.input('Checkout Branch: ')
                vim.cmd('Git checkout ' .. branch)
            end,
            desc = 'Checkout Branch'
        },
        { '<leader>gw', '<cmd>:Git write<CR>',     desc = 'Write' },
        { '<leader>gm', '<cmd>:Git mergetool<CR>', desc = 'Merge' },
        { '<leader>gb', '<cmd>:Git blame<CR>',     desc = 'Blame' },
        { '<leader>gd', '<cmd>:Gvdiffsplit!<CR>',  desc = 'Diff Split' },
        -- { '<leader>gg', '<cmd>:Git <CR>',          desc = 'Open Git' },
        { '<leader>gv', '<cmd>:GV <CR>',           desc = 'Open Git Graph' },
        { '<leader>gr', '<cmd>:GRemove<CR>',       desc = 'Git Remove' },
        { '<leader>gh', '<cmd>:diffget //2<CR>',   desc = 'Diff Get Left' },
        { '<leader>gl', '<cmd>:diffget //3<CR>',   desc = 'Diff Get Right' },
    },
}

wk.add(mappings)

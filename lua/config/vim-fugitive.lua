local wk = require('which-key')

local  opts = {
    mode = 'n',
    prefix = '<leader>',
}

local mappings = {
    g = {
        name = 'Git',
        p = { '<cmd>:Git push<CR>', 'Push' },
        u = { '<cmd>:Git pull<CR>', 'Pull' },
        c = { function ()
            local branch = vim.fn.input('Checkout Branch: ')
            vim.cmd('Git checkout ' .. branch)
        end, 'Checkout Branch' },
        w = { '<cmd>:Git write<CR>', 'Write' },
        m = { '<cmd>:Git mergetool<CR>', 'Merge' },
        b = { '<cmd>:Git blame<CR>', 'Blame' },
        d = { '<cmd>:Gvdiffsplit!<CR>', 'Diff Split' },
        g = { '<cmd>:Git <CR>', 'Open Git' },
        v = { '<cmd>:GV <CR>', 'Open Git Graph' },
        r = { '<cmd>:GRemove<CR>', 'Git Remove' },
        h = { '<cmd>:diffget //2<CR>', 'Diff Get Left' },
        l = { '<cmd>:diffget //3<CR>', 'Diff Get Right' },
    },
}

wk.register(mappings, opts)


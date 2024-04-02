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
        w = { '<cmd>:Git write<CR>', 'Write' },
        m = { '<cmd>:Git mergetool<CR>', 'Write' },
        b = { '<cmd>:Git blame<CR>', 'Blame' },
        d = { '<cmd>:Gvdiffsplit!<CR>', 'Write' },
        g = { '<cmd>:Git <CR>', 'Open Git' },
        r = { '<cmd>:GRemove<CR>', 'Git Remove' },
        h = { '<cmd>:diffget //2<CR>', 'Diff Get Left' },
        l = { '<cmd>:diffget //3<CR>', 'Diff Get Right' },
    },
}

wk.register(mappings, opts)


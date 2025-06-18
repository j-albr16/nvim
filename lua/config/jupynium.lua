

local wk = require('which-key')

local mapping = {
    {
        desc = 'Jupynium',
        mode = 'n',
        { '<leader>jr', '<cmd>JupyniumStartAndAttachToServer<CR>', desc = 'Start Jupynium Server'},
        { '<leader>jc', '<cmd>JupyniumStartSync<CR>', desc = 'Start Sync'},
        { '<leader>je', '<cmd>JupyniumStopSync<CR>', desc = 'Stop Syn'}
    }
}

local opts = { noremap = false, silent = false}
wk.add(mapping, opts)


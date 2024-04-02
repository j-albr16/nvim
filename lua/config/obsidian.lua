local obsidian = require('obsidian')
local wk = require('which-key')

obsidian.setup({
    workspaces = {
        {
            name = 'personal',
            path = '~/notes/personal'
        },
        {
            name = 'uni',
            path = '~/notes/uni'
        },
    }
})

local opts = { noremap = true, silent = true, prefix = '<leader>', mode = 'n' }
local mappings = {
    o = {
        name = 'Obsidian',
        o = { ':ObsidianOpen', 'Open Obsidian' },
        n = { ':ObsidianNew', 'New Note' },
        s = { ':ObsidianQuickSqitch', 'Quick Switch' },
        f = { ':ObsidianFollowLink<CR>', 'Follow Link' },
        t = { ':ObsidianToday<CR>', 'Today' },
        y = { ':ObsidianYesterday<CR>', 'Today' },
        m = { ':ObsidianTomorrow<CR>', 'Today' },
    }
}

wk.register(mappings, opts)

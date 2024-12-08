local obsidian = require("obsidian")
local wk = require('which-key')

obsidian.setup({
    workspaces = {
        {
            name = "personal",
            path = "~/notes/personal",
        },
        {
            name = "work",
            path = "~/notes/work",
        },
        {
            name = "uni",
            path = "~/notes/uni",
        },
    },
    ui = {
        enable = false,
    },
    templates = {
        {
            name = "default",
            path = "~/vaults/templates",
        },
    },
})


local mapping = {
    {
        desc = "Obsidian",
        mode = { "n", 'v' },
        { '<leader>oo', '<cmd>:ObsidianOpen<CR>',              desc = 'Open Obsidian' },
        { '<leader>oa', '<cmd>:ObsidianTags<CR>',              desc = 'Search for Tags' },
        {
            '<leader>on', ':ObsidianNew<CR>', desc = 'New Note'
        },
        { '<leader>os', '<cmd>:ObsidianSearch<CR>',            desc = 'Search' },
        { '<leader>of', '<cmd>:ObsidianFollowLink vsplit<CR>', desc = 'Follow a Link' },
        { '<leader>ol', '<cmd>:ObsidianBacklinks<CR>',         desc = 'List Backlinks' },
        {
            '<leader>od',
            ':ObsidianDailies<CR>',
            desc =
            'to open a picker list of daily notes. For example, :ObsidianDailies -2 1'
        },
        { '<leader>ot',  '<cmd>:ObsidianTemplate<CR>',    desc = 'Insert Template' },
        { '<leader>oln', '<cmd>:ObsidianLinkNew<CR>',     desc = 'to create a new note and link it to an inline visual selection of text.' },
        { '<leader>oe',  '<cmd>:ObsidianExtractNote<CR>', desc = 'to extract the visually selected text into a new note and link to it.' },
        { '<leader>ow',  '<cmd>:ObsidianWorkspace<CR>',   desc = 'Change Workspace' },
        { '<leader>oi',  '<cmd>:ObsidianPasteImg<CR>',    desc = 'Paste Image' },
        {
            '<leader>or',
            '<cmd>:ObsidianRename<CR>',
            desc = 'Rename Note'
        },
        {
            '<leader>oN',
            '<cmd>:ObsidianNewFromTemplate<CR>',
            desc =
            'to create a new note from a template in the templates folder. Selecting from a list using your preferred picker.'
        },
        { '<leader>ob', '<cmd>ObsidianToggleCheckbox<CR>', desc = "Toggle Checkbox" },
    }
}

wk.add(mapping, { noremap = true, silent = false })

return {
	"nvim-tree/nvim-web-devicons",
	"echasnovski/mini.icons",
	"tanvirtin/monokai.nvim",
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup()
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"folke/zen-mode.nvim",
		opts = {},
		config = function()
			vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { noremap = true, silent = true })
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
		config = function()
			require("render-markdown").setup({
				completions = { lsp = { enabled = true } },
				latex = { enabled = true },
			})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
}

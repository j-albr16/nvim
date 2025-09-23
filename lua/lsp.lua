-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	local conform = require("conform")

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local opts = { buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>f", function()
		print("formatting")
		-- vim.lsp.buf.format { async = true }
		conform.format({ bufnr = bufnr })
	end, opts)
end


vim.lsp.config('pyright', {
	on_attach = on_attach,
	python = {
		analysis = {
			typeCheckingMode = "basic",
			reportAttributeAccess = false,
		},
	},
	init_options = {
		formatting = true,
	},
})
vim.lsp.enable('pyright')



vim.lsp.config("lua_ls", {
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
vim.lsp.enable('lua_ls')

vim.lsp.config("rust_analyzer", {
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = false,
			},
		},
	},
})
vim.lsp.enable('rust_analyzer')




local lspconfig = require("lspconfig")
local lsp_servers = {
	-- 'pylsp',
	"pyright",
	"lua_ls",
	"ltex",
	"rust_analyzer",
	"clangd",
	"ts_ls",
	"html",
	"yamlls",
	"tailwindcss",
	"marksman",
	"lemminx",
	"jsonls",
	"eslint",
}

local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

local registries = {
	"github:nvim-java/mason-registry",
	"github:mason-org/mason-registry",
}

mason.setup({
	registries = registries,
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lsp.setup({
	ensure_installed = lsp_servers,
})

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

lspconfig.html.setup({
	on_attach = on_attach,
})

-- lspconfig.pylsp.setup({
--     on_attach = on_attach,
--     init_options = {
--         formatting = true
--     },
--     settings = {
--         pylsp = {
--             plugins = {
--                 pycodestyle = {
--                     ignore = { 'W391' },
--                     maxLineLength = 100
--                 }
--             }
--         }
--     }
-- })
-- lspconfig.pylsp.setup({
--     on_attach = on_attach,
--     init_options = {
--         formatiing = true,
--     },
--   settings = {
--     pylsp = {
--       configurationSources = { "pyright" }, -- Tell pylsp to use pyright for config if available
--       plugins = {
--         mypy = {
--           enabled = true,
--           report_progress = true,
--           args = { "--check-untyped-defs", "--follow-imports=normal" }, -- Common mypy args
--           executable = "pyright", -- Point to the pyright executable
--         },
--         pyflakes = { enabled = false },
--         flake8 = { enabled = false },
--         mccabe = { enabled = false },
--         pylint = { enabled = false },
--       },
--     },
--   },
-- })

lspconfig.pyright.setup({
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

lspconfig.jsonls.setup({
	on_attach = on_attach,
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
			end,
		},
	},
})

lspconfig.clangd.setup({})

lspconfig.ts_ls.setup({
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
	cmd = { "typescript-language-server", "--stdio" },
})

lspconfig.tailwindcss.setup({})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lspconfig.lemminx.setup({
	on_attach = on_attach,
})

lspconfig.eslint.setup({
	on_attach = function(_, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
})

lspconfig.ltex.setup({})

-- rust
local mason_dap = require("mason-nvim-dap")

mason_dap.setup({
	ensure_installed = {
		"codelldp",
		"cpptools",
	},
})

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
		},
	},
})

-- require('java').setup({})
-- lspconfig.jdtls.setup {}

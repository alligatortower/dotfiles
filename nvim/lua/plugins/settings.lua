require("utils")
require("plugins.cmp")
require("plugins.nvim-tree")
require("plugins.tabby")
------------------
-- PLUGIN SETUP --
------------------
require("nvim-web-devicons").setup()
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = { "python", "typescriptreact" },
	},
})
require("treesitter-context").setup({
	enable = true,
	patterns = {
		default = {
			"class",
			"function",
			"method",
		},
	},
})
require("leap").add_default_mappings()
require("flit").setup({
	keys = { f = "f", F = "F", t = "t", T = "T" },
	-- A string like "nv", "nvo", "o", etc.
	labeled_modes = "v",
	multiline = true,
	-- Like `leap`s similar argument (call-specific overrides).
	-- E.g.: opts = { equivalence_classes = {} }
	opts = {},
})
require("which-key").setup({})
require("gitsigns").setup({
	numhl = true,
	signcolumn = false,
})

require("mason").setup({
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

vim.g.UltiSnipsSnippetDirectories = { HOME .. "/dotfiles/nvim/ultisnips" }
vim.g["pad#dir"] = HOME .. "/dotfiles/notes"

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

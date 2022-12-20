require("utils")
require("plugins.cmp")
require("plugins.nvim-tree")
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

require("nvim-lsp-installer").setup({
	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

require("tabby.tabline").use_preset("active_wins_at_tail", {
	theme = {
		-- 	fill = "TabLineFill", -- tabline background
		-- 	head = "TabLine", -- head element highlight
		current_tab = "IncSearch", -- current tab label highlight
		-- 	tab = "TabLine", -- other tab label highlight
		-- 	win = "TabLine", -- window highlight
		-- 	tail = "TabLine", -- tail element highlight
	},
	nerdfont = true, -- whether use nerdfont
	-- tab_name = {
	-- 	name_fallback = "function({tabid}), return a string",
	-- },
	-- buf_name = {
	-- 	mode = "'unique'|'relative'|'tail'|'shorten'",
	-- },
})

vim.g.UltiSnipsSnippetDirectories = { HOME .. "/dotfiles/ultisnips" }
vim.g["pad#dir"] = HOME .. "/dotfiles/notes"

---------------------
-- NvimTree Colors --
---------------------
-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

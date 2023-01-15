require("utils")
require("plugins.cmp")
require("plugins.nvim-tree")
require("plugins.tabby")
require("plugins.leap")
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
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = treesitter_text_object_mappings,
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
		},
	},
})

require("gitsigns").setup({
	numhl = true,
	signcolumn = false,
})

local map = require("mini.map")
map.setup({
	integrations = {
		map.gen_integration.builtin_search(),
		map.gen_integration.gitsigns(),
		map.gen_integration.diagnostic(),
	},
	window = {
		show_integration_count = false,
	},
})
require("mini.cursorword").setup()
require("mini.comment").setup()
require("mini.surround").setup()

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

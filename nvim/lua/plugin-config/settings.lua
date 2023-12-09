require("utils")
require("plugin-config.cmp")
require("plugin-config.nvim-tree")
require("plugin-config.tabby")
require("plugin-config.leap")

------------------
-- PLUGIN SETUP --
------------------

require("nvim-web-devicons").setup()

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	-- indent = {
	-- 	enable = true,
	-- 	disable = { "python", "typescriptreact" },
	-- },
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
require("mini.surround").setup({
	mappings = {
		replace = "sc", -- Replace surrounding
	},
})

require("flit").setup({
	keys = { f = "f", F = "F", t = "t", T = "T" },
	-- A string like "nv", "nvo", "o", etc.
	labeled_modes = "v",
	multiline = true,
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
require("mason-lspconfig").setup()

require("floating-input").setup()

vim.g.UltiSnipsSnippetDirectories = { HOME .. "/dotfiles/nvim/ultisnips" }
vim.g["pad#dir"] = HOME .. "/dotfiles/notes"

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lsp-file-operations").setup()

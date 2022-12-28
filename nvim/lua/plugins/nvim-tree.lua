-- local nvim_tree_mappings = require("keybindings").nvim_tree_mappings

require("nvim-tree").setup({
	hijack_netrw = true,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	view = {
		mappings = {
			list = nvim_tree_mappings,
		},
	},
	filters = {
		dotfiles = true,
	},
	renderer = {
		icons = {
			git_placement = "after",
		},
	},
})

vim.cmd([[
  highlight link NvimTreeOpenedFolderName Number
]])

require("nvim-tree").setup({
	hijack_netrw = true,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	view = {
		mappings = {
			list = {
				{ key = { "<C-c>" }, action = "copy", mode = "n" },
				{ key = { "<C-x>" }, action = "cut", mode = "n" },
				{ key = { "<C-p>" }, action = "paste", mode = "n" },
				{ key = { "<C-v>" }, action = "paste", mode = "n" },
				{ key = { "D" }, action = "remove", mode = "n" },
				{ key = { "A" }, action = "create", mode = "n" },
				{ key = { "v" }, action = "vsplit", mode = "n" },
				{ key = { "x" }, action = "split", mode = "n" },
				{ key = { "t" }, action = "tabnew", mode = "n" },
				{ key = { "cd" }, action = "cd", mode = "n" },
				{ key = { "d" }, action = "", mode = "n" },
			},
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

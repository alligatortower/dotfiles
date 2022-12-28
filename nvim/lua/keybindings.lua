-------------
-- KEYMAPS --
-------------
vim.g.mapleader = " "
-- fastsave
vim.keymap.set("n", "<Esc><Esc>", ":w<CR>")
-- fastsavequit
vim.keymap.set("n", "<Esc><BS>", ":wq<CR>")
-- qwerty timesave
vim.keymap.set("i", "jk", "<ESC>")
-- Y yanks to end of line (consistency with D)
vim.keymap.set("n", "Y", "y$")
-- remove highlighting
vim.keymap.set("n", "<leader>h", ":noh<CR>")
-- map buffer kill
-- vim.keymap.set("n", "Q" ":bd<CR>")
-- window navigation
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
-- window resizing
vim.keymap.set("n", "<S-C-h>", "<C-w><")
vim.keymap.set("n", "<S-C-l>", "<C-w>>")

vim.keymap.set("n", "<S-C-j>", "<C-w>+")
vim.keymap.set("n", "<S-C-k>", "<C-w>-")
-- line numbers
vim.keymap.set("n", "<F3>", ":set nu<CR>")
vim.keymap.set("n", "<F4>", ":set nonu<CR>")
-- autocmd
vim.keymap.set("n", "<leader>x", toggle_follow_cursor)
-- move lines
vim.keymap.set("x", "<Up>", ":m -2<CR>gv=gv")
vim.keymap.set("x", "<Down>", ":m'>+<CR>gv=gv")
-- move buffers
vim.keymap.set("n", "<Right>", ":bnext<CR>")
vim.keymap.set("n", "<Left>", ":bprevious<CR>")

-- lsp
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

--------------------
-- PLUGIN KEYMAPS --
--------------------
-- open dir
vim.keymap.set("n", "<leader>d", ":NvimTreeToggle<CR>")

-- telescope
require("telescope").load_extension("ui-select")
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = "close",
				["<C-z>"] = "delete_buffer",
				["<C-h>"] = "move_to_top",
				["<C-k>"] = "move_selection_previous",
				["<C-j>"] = "move_selection_next",
				["<C-l>"] = "move_to_bottom",
			},
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})
telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>t", telescope.find_files)
vim.keymap.set("n", "<leader><leader>t", telescope.buffers)
vim.keymap.set("n", "<leader>f", telescope.live_grep)
vim.keymap.set("n", "<leader><leader>f", telescope.grep_string)
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
vim.keymap.set("n", "<leader>o", telescope.oldfiles)

vim.keymap.set("n", "<F6>", ":UltiSnipsEdit<CR>", opts)

-- harpoon

local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>h", function()
	harpoon_ui.toggle_quick_menu()
end)
vim.keymap.set("n", "<leader>H", function()
	harpoon_mark.add_file()
end)
vim.keymap.set("n", "<leader>1", function()
	harpoon_ui.nav_file(1)
end)
vim.keymap.set("n", "<leader>2", function()
	harpoon_ui.nav_file(2)
end)
vim.keymap.set("n", "<leader>3", function()
	harpoon_ui.nav_file(3)
end)

-- cmp mappings
local cmp = require("cmp")

cmp_mappings = {
	["<Tab>"] = function(fallback)
		print("wtf")
		if cmp.visible() then
			cmp.select_next_item()
		else
			fallback()
		end
	end,
	["<S-Tab>"] = function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		else
			fallback()
		end
	end,
	["<C-b>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	["<C-Space>"] = cmp.mapping.complete(),
	["<C-e>"] = cmp.mapping.abort(),
	["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}

-- nvim-tree mappings
nvim_tree_mappings = {
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
}

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

vim.keymap.set("n", "<F6>", ":UltiSnipsEdit<CR>", opts)

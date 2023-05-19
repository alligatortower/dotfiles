-------------
-- KEYMAPS --
-------------
-- [mapleader is set in basic-settings]
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
vim.keymap.set("n", "<leader>*", telescope.grep_string)
vim.keymap.set("n", "<leader>f", telescope.live_grep)
vim.keymap.set("n", "<leader><leader>f", function()
	telescope.grep_string({ shorten_path = true, word_match = "-w", only_sort_text = true, search = "" })
end)
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

-- local has_words_before = function()
-- 	-- from https://github.com/zbirenbaum/copilot-cmp#tab-completion-configuration-highly-recommended
-- 	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
-- 		return false
-- 	end
-- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
-- 	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
-- end

cmp_mappings = {
	["<Tab>"] = function(fallback)
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
set_custom_nvim_tree_mappings = function(opts)
	local api = require("nvim-tree.api")
	vim.keymap.set("n", "<C-c>", api.fs.copy.node, opts("Copy"))
	vim.keymap.set("n", "<C-x>", api.fs.cut, opts("Cut"))
	vim.keymap.set("n", "<C-p>", api.fs.paste, opts("Paste"))
	vim.keymap.set("n", "<C-v>", api.fs.paste, opts("Paste"))
	vim.keymap.set("n", "D", api.fs.remove, opts("Delete"))
	vim.keymap.set("n", "A", api.fs.create, opts("Create"))
	vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
	vim.keymap.set("n", "x", api.node.open.horizontal, opts("Open: Horizontal Split"))
	vim.keymap.set("n", "t", api.node.open.tab, opts("Open: New Tab"))
	vim.keymap.set("n", "cd", api.tree.change_root_to_node, opts("CD"))
end

treesitter_text_object_mappings = {
	["af"] = "@function.outer",
	["if"] = "@function.inner",
	["ac"] = "@class.outer",
	["ic"] = "@class.inner",
}

-- leap
local leap = require("leap")
local function leap_in_win()
	leap.leap({ target_windows = { vim.fn.win_getid() } })
end
local function leap_anywhere()
	leap.leap({
		target_windows = vim.tbl_filter(function(win)
			return vim.api.nvim_win_get_config(win).focusable
		end, vim.api.nvim_tabpage_list_wins(0)),
	})
end

do_global_leap = { ["g<cr>"] = { leap_anywhere, "Leap to letter pair" } }
function get_local_leap_n(opts)
	return { ["<cr>"] = { leap_in_win, "Leap to letter pair within window" }, mode = "n", buffer = opts.buf }
end
function get_local_leap_o(opts)
	return { ["<cr>"] = { leap_in_win, "Leap to letter pair within window" }, mode = "o", buffer = opts.buf }
end
function get_local_leap_x(opts)
	return {
		["<cr>"] = { leap_in_win, "Leap to letter pair within window", mode = "x", buffer = opts.buf },
	}
end

-- mini.map
local map = require("mini.map")
vim.keymap.set("n", "<Leader>mc", map.close)
vim.keymap.set("n", "<Leader>mf", map.toggle_focus)
vim.keymap.set("n", "<Leader>mo", map.open)
vim.keymap.set("n", "<Leader>mr", map.refresh)
vim.keymap.set("n", "<Leader>ms", map.toggle_side)
vim.keymap.set("n", "<Leader>mt", map.toggle)

for _, key in ipairs({ "n", "N", "*", "#" }) do
	vim.keymap.set("n", key, key .. "<Cmd>lua MiniMap.refresh({}, {lines = false, scrollbar = false})<CR>")
end

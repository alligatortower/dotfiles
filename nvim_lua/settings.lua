-------------
-- DISPLAY --
-------------
vim.opt.termguicolors = true
vim.g.tokyonight_style = "night"
vim.cmd([[colorscheme tokyonight]])
-- make comments bright
vim.cmd("hi Comment guifg=#FFA500")
-- remove -- insert -- now redundent thanks to lightline
vim.opt.showmode = false
vim.opt.laststatus = 2
require("lualine").setup({
	options = {
		theme = "tokyonight",
	},
})
-- whitespace highlighting
vim.cmd("hi ExtraWhitespace guibg=#990000 ctermbg=red")

-------------------
-- MISC SETTINGS --
-------------------
-- use system clipboard
vim.opt.clipboard = "unnamedplus"
-- only search case senstivie if uppercase letter used
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- window title = file (path)
vim.opt.title = true
-- minimal line number gutter
vim.opt.numberwidth = 1
-- hide buffers when :e-ing out
vim.opt.hidden = true
-- quicker updates
vim.opt.updatetime = 250
-- start scroll when one line from top or bottom
vim.opt.scrolloff = 2
-- linenumbers on by default
vim.opt.nu = true
-- time to wait for next key in sequence
vim.opt.timeoutlen = 500
-- error signs in number gutter
vim.opt.signcolumn = "number"

vim.g.python3_host_prog = "/usr/bin/python3"

---------------------------------
-- SPACING / FILETYPE SETTINGS --
---------------------------------
vim.cmd("filetype plugin indent on")
vim.opt.shiftround = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	command = "setlocal tabstop=2 shiftwidth=2",
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	command = "setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4",
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	command = "setlocal tabstop=2 shiftwidth=2 expandtab softtabstop=2",
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "htmldjango", "jinja" },
	command = "setlocal tabstop=2 shiftwidth=2 expandtab",
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	command = "setlocal tabstop=2 shiftwidth=2 expandtab",
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "sass", "scss", "css" },
	command = "setlocal tabstop=2 shiftwidth=2 expandtab",
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "yaml" },
	command = "setlocal tabstop=2 shiftwidth=2 expandtab",
})
vim.g.jsx_ext_required = 0

-------------------
-- AUTO COMMANDS --
-------------------
vim.g.followCursor = false

local function toggle_follow_cursor()
	-- Switch the toggle variable
	vim.g.followCursor = not vim.g.followCursor

	-- Enable if toggled on
	if vim.g.followCursor then
		vim.cmd([[
            augroup FollowCursor
            au!
            au VimEnter,WinEnter,BufWinEnter * setlocal cursorline | setlocal cursorcolumn
            au WinLeave * setlocal nocursorline | setlocal nocursorcolumn
            augroup END
            setlocal cursorline | setlocal cursorcolumn
        ]])
		-- reset and disable options
	else
		vim.cmd([[
            augroup FollowCursor
                autocmd!
            augroup END
            setlocal nocursorline | setlocal nocursorcolumn
        ]])
	end
end

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

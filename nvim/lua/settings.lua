-------------
-- DISPLAY --
-------------
vim.opt.termguicolors = true
vim.cmd([[colorscheme kanagawa]])
-- make comments bright
vim.cmd("hi Comment guifg=#FFA500")
-- remove -- insert -- now redundent thanks to lightline
vim.opt.showmode = false
vim.opt.laststatus = 2
require("lualine").setup({
	options = {
		theme = "kanagawa",
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
-- tab name display
vim.g.guitablabel = "%t"
vim.opt.guitablabel = "%t"

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

function toggle_follow_cursor()
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

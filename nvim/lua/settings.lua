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
vim.opt.scrolloff = 3
-- linenumbers on by default
vim.opt.nu = true
-- time to wait for next key in sequence
vim.opt.timeoutlen = 500
-- error signs in number gutter
vim.opt.signcolumn = "number"
-- always show tabline
vim.o.showtabline = 2

vim.g.python3_host_prog = "/usr/bin/python3"

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

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
